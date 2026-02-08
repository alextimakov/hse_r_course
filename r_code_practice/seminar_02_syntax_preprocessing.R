# Seminar 2: Introduction to R Syntax and Data Preprocessing --------------
# Purpose: Functions for dice roll, NA fill, factors, group means, plots
# Dataset: datasets/october_orders.csv
# Requires: dplyr, ggplot2
# Style: http://adv-r.had.co.nz/Style.html

library(dplyr)
library(ggplot2)

# Load data ---------------------------

orders <- read.csv("datasets/october_orders.csv", stringsAsFactors = FALSE)

# 1. Dice roll (1/6 probability per side) ---------------------------

dice_roll <- function(size) {
  sample(1:6, size = size, replace = TRUE, prob <- rep(1/6, 6))
}
dice_roll(10)

# 2. Fill NA with column means (numeric cols only) ---------------------------

fill_na_mean <- function(dataframe) {
  out <- dataframe
  for (col in names(out)) {
    if (is.numeric(out[[col]])) {
      m <- mean(out[[col]], na.rm = TRUE)
      out[[col]][is.na(out[[col]])] <- m
    }
  }
  return(out)
}

# double check
orders %>% filter(!is.na(assignment_min)) %>% count()
orders_filled <- fill_na_mean(orders)
orders_filled %>% filter(is.na(assignment_min)) %>% count()

# 3. Convert categorical columns to factor ---------------------------

cat_to_factor <- function(dataframe) {
  out <- dataframe
  for (col in names(out)) {
    if (is.character(out[[col]]) || is.logical(out[[col]])) {
      out[[col]] <- as.factor(out[[col]])
    }
  }
  return(out)
}

# double check
sapply(orders, class)
orders_filled <- cat_to_factor(orders)
sapply(orders_filled, class)

# 4. Mean of each numeric column by tariff and status (using dplyr) ----------

find_means <- function(dataframe) {
  dataframe %>%
    group_by(tariff, status) %>%
    summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)), .groups = "drop")
}
find_means(orders)

# 5. Scatterplot order_fare vs arrival_min ---------------------------

draw_scatter <- function(dataframe) {
  ggplot(dataframe, aes(x = order_fare, y = arrival_min)) +
    geom_point(alpha = 0.3) +
    labs(title = "Order Fare vs Arrival Min", x = "Order Fare", y = "Arrival Min") +
    theme_minimal()
}
draw_scatter(orders)

# 6. Outliers in assignment_min (value > mean + 2*sd) ---------------------------

find_outliers <- function(dataframe, col) {
  x <- dataframe[[col]]
  x <- x[!is.na(x)]
  threshold <- mean(x) + 2 * sd(x)
  dataframe[!is.na(dataframe[[col]]) & dataframe[[col]] > threshold, ]
}
find_outliers(orders, "assignment_min")

# 7. Density of order_fare by tariff (using ggplot2) ---------------------------

distrib_dens <- function(dataframe) {
  df_plot <- dataframe[!is.na(dataframe$order_fare) & dataframe$order_fare > 0, ]
  ggplot(df_plot, aes(x = order_fare, fill = tariff)) +
    geom_density(alpha = 0.3) +
    labs(title = "Density of order_fare by tariff", x = "Order Fare", y = "Density") +
    theme_minimal()
}
distrib_dens(orders)

# let's also remove outliers to make distributions more clear
orders_cleaned_fare <- orders[-as.numeric(rownames(find_outliers(orders, "order_fare"))), ]
distrib_dens(orders_cleaned_fare)
