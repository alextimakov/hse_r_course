## Seminar 4

### 1. Linear Models Applications in Marketing
- Predicting continuous outcomes: customer lifetime value, sales revenue, website traffic, retention rates, etc.
- Understanding relationships: how marketing spend affects sales, price elasticity, customers' satisfaction
- Forecasting: future sales, customer acquisition, market trends
- Marketing Mix Modeling: quantifying impact of different marketing channels (classic regression use case; choice-based approaches appear in Seminar 6)

### 2. Correlation: Meaning and Types
- Correlation measures association between two variables; assumptions depend on the coefficient used
- **Pearson correlation**: linear relationship between two continuous variables; assumes linearity and approximately normal continuous variables
- **Spearman correlation**: monotonic relationship, rank-based, no normality assumption
- **Kendall correlation**: similar to Spearman, more robust to outliers, uses concordant/discordant pairs
- Correlation coefficient (r): ranges from -1 to +1, strength and direction of relationship
- Correlation ≠ causation

### 3. Correlation: Interpretation and Multicollinearity
- **Interpretation**: |r| < 0.3 weak, 0.3-0.7 moderate, >0.7 strong relationship
- **Multicollinearity**: high correlation between predictor variables in regression models
- **Problems**: unstable coefficient estimates, inflated standard errors, difficulty interpreting individual predictors
- **Detection**: correlation matrix, Variance Inflation Factor (VIF > 5 indicates problem)
- **Solutions**: remove highly correlated variables, combine variables, use regularization (Ridge/Lasso) or PCA-EFA-MDS (Seminar 5) to reduce dimensionality

### 4. Types of Regression: Linear Regression
- Models continuous outcome variable as linear function of predictors
- **Assumptions**: linearity, independence, homoscedasticity, normality of residuals
- **Interpretation**: coefficients show change in outcome per unit change in predictor (slope)
- **Marketing applications**: predicting sales from marketing spend, customer lifetime value modeling
- **R functions**: `lm()`, `summary()`, `predict()`
- **Extras**: Cook's distance, residuals, adjusted R², overfitting, etc.

### 5. Types of Regression: Logistic Regression
- Models binary outcomes (0/1, yes/no, purchase/no purchase, churn)
- Uses logit link function to map linear predictor to probability (0-1 range)
- **Assumptions**: linearity in logit, independence, no multicollinearity
- **Interpretation**: odds ratios, probability predictions
- **Marketing applications**: conversion prediction, churn prediction, customer response modeling
- **R functions**: `glm(family = binomial)`, `predict(type = "response")`
- **Extras**: confidence intervals, coefficients, etc.

### 6. Types of Regression: Hierarchical Linear Models
- Accounts for nested or grouped data structures (customers within segments, regions, time periods); also called multilevel / mixed-effects models
- **Random effects**: account for group-level variation (individual data)
- **Fixed effects**: overall relationships across all groups
- **Marketing applications**: customers nested in regions, repeated measurements over time, panel data
- **R functions**: `lme4::lmer()`, `nlme::lme()` for mixed-effects models
- **Extras**: for categorical / non-normal outcomes use GLMMs (e.g. `lme4::glmer()`), not plain LMM

### 7. Types of Regression: Generalized Linear Models (GLM)
- Extends linear regression via a link function and exponential-family distribution for the outcome
- **Examples**: logistic (binomial / logit — covered above), Poisson / negative binomial (counts), Gamma (positive continuous, skewed)
- **When useful**: count data (purchases, visits), rates, other non-normal outcomes where OLS assumptions fail
- **Marketing applications**: modeling number of purchases, website visits, claims, or other skewed positive outcomes
- **R functions**: `glm()`, `summary()`, `predict()`
- **Extras**: choose family and link to match the outcome; check residual diagnostics appropriate to the family

### 8. Types of Regression: Bayes LM
- Incorporates prior knowledge into analysis through prior distributions
- Provides probabilistic predictions and proper uncertainty quantification
- **Advantages**: incorporate domain expertise, handle small samples better, natural uncertainty quantification
- **Workflow**: specify priors, draw from posterior via MCMC, evaluate model fit, generate predictions
- **Marketing applications**: when prior knowledge exists (industry benchmarks, previous campaigns)
- **R functions**: `MCMCpack::MCMChregress()`, `rstanarm`
- **Extras**: prior sensitivity, posterior predictive checks

### 9. When to Use Each Regression Type
- **Linear**: continuous outcome, normal residuals, linear relationships
- **Logistic**: binary outcome (conversion, purchase, churn)
- **Hierarchical / mixed-effects**: nested/grouped data, repeated measures, panel data
- **GLM (other families)**: counts, skewed positive outcomes, other exponential-family responses
- **Bayesian**: prior knowledge available, small samples, need for uncertainty quantification
- Choose based on outcome variable type, data structure, and research objectives
- Also check Random Forest (as a more robust predictive method; classification details in Seminar 5) and time-series tools (additive and autoregressive models) for specific use cases
