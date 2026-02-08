## Seminar 1: Basics
Dataset: october_orders.csv
Questions:
1. What measure of central tendency is the most accurate in describing distribution of parameter ‘assignment_min’?
2. What is standard deviation value of parameter ‘arrival_min’? And specifically for tariff == ‘faster’?
3. May parameter ‘order_fare’ be described as normally distributed? And for status == ”cancel”?
4. What is IQR for parameter ‘arrival_min’?
5. Write down H0 for checking difference in ’order_fare’ for different statuses
6. Write down Type I and Type II errors for H0 = ‘There is no difference in assignment_min between last 2 weeks’
7. What is mode for parameter ‘order_fare’?

## Seminar 2: Introduction to R Syntax and Data Preprocessing
Dataset: october_orders.csv
Questions:
1. Emulate dice rolling (1/6 probability for each side, not related to the dataset) | `dice_roll <- function(size){}`
2. Fill all NA values with their means in numeric columns `fill_na_mean <- function(dataframe){}`
3.Transform all categorical parameters in data frame into factors | `cat_to_factor <- function(dataframe){}`
4. Find average value of each numerical column wo NAs and grouped by ‘tariff’ and ‘status’ (‘october_orders’ dataset) | `find_means <- function(dataframe){}` (use dplyr)
5. Draw scatterplot of ‘order_fare’ / ‘arrival_min’ (‘october_orders’ dataset) | `draw_scatter <- function(dataframe){}`
6. (*) Find outliers in ‘assignment_min’ parameter (‘october_orders’ dataset; outlier > mean + 2*sd) | `find_outliers <- function(dataframe){}`
7. (*) Visualise distribution density of ‘order_fare’ for each tariff | `distrib_dens <- function(dataframe){}` (use ggplot2)

## Seminar 3: Statistics Fundamentals
Dataset: ifood_df.csv
Questions:
1. [FUNC] Check for normality and homoscedasticity tests for all columns about number of purchases | `norm_homosced_test <- function(dataframe) {return(True if p-value < 0.05)}`
2. [FUNC] Compare factual group mean vs given mean with T-test | `compare_group_stat <- function(dataframe, column, given_mean) {return(p-value)}`
3. [FUNC] Merge all columns starting with ’education_’ into 1 factor column | `gather_factor <- function(dataframe) {return(dataframe)}`
4. Test H0 hypothesis on no difference in Kidhome between groups with different Education | `test_h0_kidhome <- function(dataframe) {return(p-value)}`
5. Test H0 hypothesis on no difference in NumWebPurchases between groups with different Kidhome | `test_h0_numwebpurchases <- function(dataframe) {return(p-value)}`
6. [FUNC] (*) Run ANOVA if all test assumptions are met (p < 0.05), otherwise run Kruskal-Wallis test | `smart_var_test <- function(dataframe) {return(test_result)}`
7. [FUNC] (*) Run Bayesian ANOVA on given numeric column | `bayes_anova <- function(dataframe, col) {return(test_result)}`

## Seminar 4: Correlation and Regression
Dataset: ifood_df.csv
Questions (Midterm Exam):
1. Are variables ‘Income’ and ‘MntWines’ distributed normally and have homogeneity of variance? 
2. Is there any difference in ‘Income’ between groups by ‘Response’?
3. Is there any difference in ‘NumDealsPurchases’ between different ‘Education’?
4. Build a model to predict ‘Income’ based on all factor variables
5. Build a model to find top-3 factors which influence ‘Response’
6. Estimate fixed & random effects of ‘Education’ and ‘Marital’ (w interactions) on ‘MntTotal’
7. Find an optimal (in terms of adjusted R^2) model to predict numerical ‘NumStorePurchases’
8. (*) Find an optimal (in terms of adjusted R^2) model to predict numerical ‘Income’
9. (*) Build a Random Forest model to predict ‘AcceptedCmp1’

## Seminar 5: Complexity Reduction, Dimensionality Reduction, EFA, MDS, Clustering, Classification
Dataset: ifood_df.csv
Questions:
1. Use both PCA and MDS to reduce dimensionality of given dataset and give comment about efficiency / relevance of each method
2. Run Exploratory Factor Analysis on all numerical variables in dataset and interpret results
3. Find an optimal (in your vision) way to cluster all clients into groups so to predict client’s ‘Income’ (and explain why you find it to be optimal)
4. Build a classifier to predict whether client will respond to marketing campaign (‘Response’ == 1) and display model performance’ metrics (Accuracy / F1)

## Seminar 6: Choice Modeling
Datasets: ecommerce_data.csv, customer_behavior.csv
Questions (Final Exam):
1. Find whether there are any significant differences:
   - In number of customers between different countries (dataset ‘ecommerce_data’)
   - In # of returns between different payment methods (dataset ’customer_behavior’)
2. Write a model to predict Customer ‘Churn’ (dataset ’customer_behavior’)
3. Write 2 models (dataset ‘ecommerce_data'): 
   - 1st will cluster users into categories by total amount of money spent 
   - 2nd will be able to classify new users by cluster # from p.1