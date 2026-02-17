## Seminar 5

### 1. Motivation for Complexity Reduction
- Curse of dimensionality (more variables don't always mean better models), multicollinearity (high correlation between variables), low interpretability of results, etc.
- **Benefits**: reduce noise, improve model performance, enhance interpretability, visualize data more clearly, select only relevant features, remove multicollinearity, compress data (in terms of computing), etc.

### 2. Motivation for Segmentation
- Segmentation is a way to group customers into homogeneous groups based on their characteristics, behaviors, preferences, etc.
- **Benefits**: clearer customer profiles, better Silhouette Scores, more interpretable segments (e.g. cost-sensitive shoppers, high-income bulk buyers, niche product enthusiasts)

### 3. Principal Component Analysis (PCA)
- Dimensionality reduction: transforms correlated variables into fewer uncorrelated components
- **Principal components**: linear combinations of original variables, ordered by variance explained (first few components typically capture most information)
- **Applications**: customer segmentation (combined with clustering), feature selection, noise reduction
- **Interpretation**: examine component loadings to understand what each component represents
- **R functions**: `stats::prcomp()`, `FactoMineR::PCA()`

### 4. Exploratory Factor Analysis (EFA)
- Identifies underlying dimensions (latent variables) that explain correlations among measured variables
- **Purpose**: scale development, theory building, data reduction
- **Process**: extract factors → determine number of factors (eigenvalues, scree plot) → rotate factors (varimax (orthogonal) or oblimin (oblique)) → interpret
- **Applications**: brand perception measurement, customer attitude scales, brand resonance constructs
- **Extras**: Factor extraction with PCA or ML, KMO test (>0.6 acceptable), Bartlett's test of Sphericity (should be significant), often precedes CFA to validate measurement models
- **R functions**: `psych::factanal()`, `psych::fa()`

### 5. Multidimensional Scaling (MDS)
- Transforms similarity/dissimilarity judgments into spatial coordinates
- **Proximity = similarity**: points close together are perceived as similar
- **Types**: metric MDS (interval data) vs non-metric MDS (ordinal data)
- **Applications**: brand positioning, competitive analysis, market gap identification, product design, perceptual maps (showing how brands/products relate in consumers' minds), etc.
- **Extras**: Adaptive MDS customizes to individual customer awareness sets
- **R functions**: `stats::cmdscale()`, `MASS::isoMDS()`

### 6. Unsupervised Methods: Clustering
- Assigning observations to groups without predefined labels
- **Types**: model-based (Gaussian Mixture Model, Latent Dirichlet Allocation) and distance-based (k-means, hierarchical clustering, DBSCAN)
- **K-means**: partitions customers into k distinct groups based on shared characteristics
- **Hierarchical**: creates dendrogram showing relationships between customer groups
- **DBSCAN**: density-based clustering, identifies clusters with varying densities
- **Applications**: customer segmentation, market segmentation, identifying customer personas
- **Evaluation**: Silhouette Score, within-cluster sum of squares, interpretability
- **R functions**: `stats::kmeans()`, `stats::hclust()`, `dbscan::dbscan()`, 


### 7. Supervised Methods: Classification
- Assigning observations to groups in predefined categories
- **Methods**: can use Naive Bayes and Random Forest (as well as a bunch of other ML-based methods)
- **Applications**: customer type classification, product categorization, behavior pattern identification
- **Extras**: watch for class balance, use SMOTE to balance the classes, etc.
- **R functions**: `e1071::naiveBayes()`, `randomForest::randomForest()`