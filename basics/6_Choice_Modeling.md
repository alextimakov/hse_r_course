## Seminar 6

### 1. Structural Equation Modeling (SEM)
- Comprehensive statistical technique combining factor analysis and regression - models relationships between manifest (observed) and latent (conceived) variables simultaneously
- **Components**: measurement model (latent variables) + structural model (relationships)
- **Advantages**: handles measurement error, tests complex theoretical models, estimates indirect effects
- **Applications**: brand equity models, customer satisfaction models, attitude-behavior relationships
- **R functions**: `lavaan::sem()`, `sem::sem()`, `OpenMx::mxRun()`

### 2. Confirmatory Factor Analysis (CFA)
- Validates measurement models developed through EFA - estimates whether observed variables load on hypothesized latent factors (precedes SEM)
- **Purpose**: confirm factor structure, assess construct validity, evaluate measurement model fit
- **Fit indices**: χ², CFI, TLI, RMSEA, SRMR (multiple indices needed for comprehensive evaluation)
- **Applications**: validating brand perception scales, customer attitude measures, brand resonance constructs
- **R functions**: `lavaan::cfa()`, `sem::sem()`, `OpenMx::mxRun()`

### 3. Association Rules (Market Basket Analysis)
- Discovers relationships between items frequently purchased together (a.k.a. transactions)
- **Key metrics**: Support (frequency of rule, proportion of transactions containing the rule), Confidence (conditional probability), Lift (strength of association)
- **Applications**: product recommendations, store layout optimization, cross-selling strategies, promotional bundling, etc.
- **Algorithms**: Apriori, FP-Growth
- **Interpretation**: "Customers who buy X also buy Y" with confidence and lift measures
- **R functions**: `arules::apriori()`, `arules::FP-Growth()`

### 4. Choice Modeling (Discrete Choice Models)
- Models how consumers choose among discrete alternatives (products, brands, options)
- **Multinomial Logit (MNL)**: basic choice model, assumes independence of irrelevant alternatives (IIA)
- **Nested Logit**: relaxes IIA assumption, groups similar alternatives
- **Mixed Logit**: incorporates preference heterogeneity across consumers
- **Applications**: product design, pricing strategy, market share prediction, new product forecasting, policy analysis, conjoint analysis, marketing mix modeling, etc.
- **R functions**: `mlogit::mlogit()`, `apollo::apollo_estimate()` (for advanced choice models)

### 5. Recap: Statistical Tests and Group Comparisons
- **Parametric**: t-test, ANOVA (when assumptions met)
- **Non-parametric**: Mann-Whitney U, Wilcoxon, Kruskal-Wallis (when assumptions violated)
- **Categorical**: Chi-square test of independence
- **Key principle**: check assumptions first, choose test accordingly

### 6. Recap: Regression Models
- **Linear**: continuous outcomes (sales, revenue, customer lifetime value)
- **Logistic**: binary outcomes (conversion, purchase, churn)
- **Hierarchical**: nested data (customers in regions, repeated measures)
- **GLM**: count data, other non-normal distributions
- **Bayesian**: when prior knowledge exists, small samples

### 7. Recap: Complexity Reduction
- **PCA**: dimensionality reduction, customer segmentation preparation
- **EFA**: scale development, latent construct identification
- **MDS**: perceptual mapping, brand positioning
- **Clustering**: customer segmentation (k-means, hierarchical, DBSCAN)
- **Classification**: customer segmentation (Naive Bayes, Random Forest)
