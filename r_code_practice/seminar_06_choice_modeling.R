# Seminar 6: Choice Modeling (Final) -----------------------------------------
# Purpose: Country/returns tests, churn model, cluster by spend + classifier.
# Datasets: datasets/ecommerce_data.csv, datasets/customer_behaviour.csv
# Requires: dplyr, randomForest (or stats for glm/kmeans)
# Style: http://adv-r.had.co.nz/Style.html
# Note: File is customer_behaviour.csv (British spelling).

library(dplyr)
library(ROSE)
library(randomForest)

ecom <- read.csv("datasets/ecommerce_data.csv", stringsAsFactors = FALSE)
cust <- read.csv("datasets/customer_behaviour.csv", stringsAsFactors = FALSE)
set.seed(42)

# Q1a: Significant difference in number of customers between countries --------

# Aggregate unique CustomerID per Country at first
ecom$Amount <- ecom$Quantity * ecom$UnitPrice
customers_per_country <- ecom %>%
  group_by(Country) %>%
  summarise(n_customers = n_distinct(CustomerID), .groups = "drop") %>%
  arrange(desc(n_customers))
customers_per_country

# Chi-square: test if customer counts differ across countries (equal as H0)
# Works good for frequencies with large enough sample sizes
# p < 0.05 suggests significant difference in customer counts across countries
# we could also see that UK has way more customers
obs <- customers_per_country$n_customers
expected <- rep(sum(obs) / length(obs), length(obs))
chi_customers <- chisq.test(obs, p = expected / sum(expected))
chi_customers

# Q1b: Significant difference in number of returns by payment method ----------

# Aggregate: sum of Returns per customer (or per row) by Payment Method
cust_returns <- cust %>%
  filter(!is.na(Returns)) %>%
  group_by(Payment.Method) %>%
  summarise(total_returns = sum(Returns, na.rm = TRUE), n = n(), .groups = "drop") %>%
  arrange(desc(total_returns))

# If we have counts of returns per method, chi-square on counts
# This one seems more reliable
obs_ret <- cust_returns$total_returns
if (sum(obs_ret) > 0 && length(obs_ret) > 1) {
  exp_ret <- rep(sum(obs_ret) / length(obs_ret), length(obs_ret))
  chi_returns <- chisq.test(obs_ret, p = exp_ret / sum(exp_ret))
  chi_returns
}

# Alternatively: Kruskal-Wallis on Returns (continuous) by Payment Method
cust$Payment_Method <- cust$Payment.Method
kruskal.test(Returns ~ Payment_Method, data = cust)

# Q2: Model to predict Churn (customer_behaviour) ---------------------------

# One row per customer: aggregate features, Churn as target
cust_one <- cust %>%
  group_by(Customer.ID) %>%
  summarise(
    Churn = first(Churn),
    Age = first(Age),
    Gender = first(Gender),
    n_purchases = n(),
    total_amount = sum(Total.Purchase.Amount, na.rm = TRUE),
    total_returns = sum(Returns, na.rm = TRUE),
    Payment_Method = first(Payment.Method),
    .groups = "drop"
  ) %>%
  na.omit() %>%
  mutate(across(c("Churn", "Gender", "Payment_Method"), as.factor))
cust_one <- cust_one[complete.cases(cust_one[, c("Churn", "Age", "n_purchases")]), ]


# Train-test split
train_indices <- createDataPartition(cust_one$Churn, p = 0.8, list = FALSE)
train_data <- cust_one[train_indices, ]
test_data <- cust_one[-train_indices, ]

# function to calc results
# Function to check the final results
show_results <- function(test_dataframe, pred_test_data, param) {
  confusionMatrix <- confusionMatrix(pred_test_data, test_dataframe[[param]])
  accuracy <- confusionMatrix$overall['Accuracy']
  tp <- confusionMatrix$table[1, 1]
  fp <- confusionMatrix$table[2, 1]
  fn <- confusionMatrix$table[1, 2]
  precision_1 <- tp / (tp + fp)
  recall_1 <- tp / (tp + fn)
  f1_1 <- 2 * precision_1 * recall_1 / (precision_1 + recall_1)
  cat("Accuracy:", accuracy, "\n")
  cat("F1 (Response=1):", f1_1, "\n")
  print(confusionMatrix)
}

# Tried GLM - poor results, huge issues with Specificity due to class imbalance
glm_churn <- glm(
  Churn ~ Age + n_purchases + total_amount + total_returns + Gender + Payment_Method,
  data = train_data,
  family = binomial
)
summary(glm_churn)
pred_churn <- predict(glm_churn, test_data, type = "response")
pred_class <- factor(ifelse(pred_churn > 0.5, 1, 0), levels = c(0, 1))
table(test_data$Churn, pred_class)

pred_churn_glm <- factor(ifelse(pred_churn > 0.5, 1, 0), levels = c(0, 1))
show_results(test_data, pred_churn_glm, "Churn")

# Let's try resample a bit with ROSE
# Much better specificity with a huge loss to accuracy and F1
train_data_balanced <- ROSE(Churn ~ ., data = train_data, seed = 42)$data
glm_churn_balanced <- glm(
  Churn ~ Age + n_purchases + total_amount + total_returns + Gender + Payment_Method,
  data = train_data_balanced,
  family = binomial
)
pred_churn_balanced <- predict(glm_churn_balanced, test_data, type = "response")
pred_churn_glm_balanced <- factor(ifelse(pred_churn_balanced > 0.5, 1, 0), levels = c(0, 1))
show_results(test_data, pred_churn_glm_balanced, "Churn")

# Let's try RF + ROSE
# Slightly better results, adequate F1 and Specificity
rf_model <- randomForest(Churn ~ ., data = train_data_balanced, ntree = 100)
predictions_rf_balanced <- predict(rf_model, newdata = test_data)
show_results(test_data, predictions_rf_balanced, "Churn")

# Q3a: Cluster users by total amount spent (ecommerce_data) -----------------

# Prepare data
ecom_by_customer <- ecom %>%
  filter(!is.na(CustomerID), CustomerID != "") %>%
  group_by(CustomerID) %>%
  summarise(total_spent = sum(Amount, na.rm = TRUE), .groups = "drop")
ecom_by_customer <- ecom_by_customer[complete.cases(ecom_by_customer), ]
ecom_scaled <- as.matrix(scale(ecom_by_customer$total_spent))

# run kmeans - got more or less well differentiated groups
k <- 4
km_ecom <- kmeans(ecom_scaled, centers = k, nstart = 25)
ecom_by_customer$cluster <- km_ecom$cluster

# double check with a chart
ggplot(ecom_by_customer, aes(x = total_spent, y = cluster)) +
  geom_point(aes(color = factor(cluster))) +
  labs(title = "Customer clusters", x = "Scaled Total Spend", y = "Cluster")

# Q3b: Classifier to assign new users to cluster ---------------------------

# Use total_spent to predict cluster, train-test split

ecom_by_customer$cluster <- factor(ecom_by_customer$cluster)
train_indices <- createDataPartition(ecom_by_customer$cluster, p = 0.8, list = FALSE)
train_data <- ecom_by_customer[train_indices, ]
test_data <- ecom_by_customer[-train_indices, ]

# will just go with RF as the likely best tool
# worked very good (maybe even too good)
rf_cluster <- randomForest(
  cluster ~ total_spent,
  data = train_data,
  ntree = 100
)
pred_rf_cluster <- predict(rf_cluster, test_data)
show_results(test_data, pred_rf_cluster, "cluster")
