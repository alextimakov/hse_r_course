## Seminar 5

### 1. Motivation for Complexity Reduction
- Curse of dimensionality (more variables don't always mean better models), multicollinearity (high correlation between variables), low interpretability of results, etc.
- **Benefits**: reduce noise, improve model performance, enhance interpretability, visualize data more clearly, select only relevant features, remove multicollinearity, compress data (in terms of computing), etc.

### 2. Scaling and Normalisation
- Many reduction and distance-based methods are scale-sensitive: variables on larger scales dominate PCA loadings, distances, and clustering
- **Common approaches**: centering, min-max normalisation, z-score standardisation (`scale()` in R)
- **When to apply**: before PCA, MDS (when using Euclidean distances on mixed-scale features), and distance-based clustering
- **Caveat**: choose scaling that matches the method and interpretability needs; do not blindly scale binary or already-normalized indicators

### 3. Motivation for Segmentation
- Segmentation groups customers into homogeneous groups based on characteristics, behaviors, preferences, etc. (typically via unsupervised clustering; Seminar 4 regression explains outcomes, it does not replace segmentation)
- **Benefits**: clearer customer profiles, targeted offers, more interpretable segments (e.g. cost-sensitive shoppers, high-income bulk buyers, niche product enthusiasts)
- **Evaluation** (after clustering): Silhouette Score, within-cluster sum of squares, business interpretability

### 4. Principal Component Analysis (PCA)
- Dimensionality reduction: transforms correlated variables into fewer uncorrelated components
- **Principal components**: linear combinations of original variables, ordered by variance explained (first few components typically capture most information)
- **Applications**: customer segmentation (combined with clustering), feature selection, noise reduction
- **Interpretation**: examine component loadings to understand what each component represents
- **R functions**: `stats::prcomp()`, `FactoMineR::PCA()`

### 5. Exploratory Factor Analysis (EFA)
- Identifies underlying dimensions (latent variables) that explain correlations among measured variables
- **Purpose**: scale development, theory building, data reduction
- **Process**: extract factors → determine number of factors (eigenvalues, scree plot) → rotate factors (varimax (orthogonal) or oblimin (oblique)) → interpret
- **Applications**: brand perception measurement, customer attitude scales, brand resonance constructs
- **Extras**: Factor extraction with PCA or ML, KMO test (>0.6 acceptable), Bartlett's test of Sphericity (should be significant), often precedes CFA (Seminar 6) to validate measurement models
- **R functions**: `stats::factanal()`, `psych::fa()`

### 6. Multidimensional Scaling (MDS)
- Transforms similarity/dissimilarity judgments into spatial coordinates
- **Proximity = similarity**: points close together are perceived as similar
- **Types**: metric MDS (interval data) vs non-metric MDS (ordinal data)
- **Applications**: brand positioning, competitive analysis, market gap identification, product design, perceptual maps (showing how brands/products relate in consumers' minds), etc.
- **Extras**: Adaptive MDS customizes to individual customer awareness sets
- **R functions**: `stats::cmdscale()`, `MASS::isoMDS()`

### 7. Unsupervised Methods: Clustering
- Assigning observations to groups without predefined labels (primary tool for customer segmentation)
- **Types**: model-based (Gaussian Mixture Model, Latent Dirichlet Allocation) and distance-based (k-means, hierarchical clustering, DBSCAN)
- **K-means**: partitions customers into k distinct groups based on shared characteristics
- **Hierarchical**: creates dendrogram showing relationships between customer groups
- **DBSCAN**: density-based clustering, identifies clusters with varying densities
- **Applications**: customer segmentation, market segmentation, identifying customer personas
- **Evaluation**: Silhouette Score, within-cluster sum of squares, interpretability
- **R functions**: `stats::kmeans()`, `stats::hclust()`, `dbscan::dbscan()`

### 8. Supervised Methods: Classification
- Assigning observations to predefined categories (labels known in training data); not the same as unsupervised segmentation
- **Methods**: Naive Bayes, Random Forest, and other ML-based classifiers
- **Applications**: customer type classification, product categorization, behavior pattern identification
- **Extras**: watch for class imbalance; use oversampling / balancing techniques (e.g. SMOTE, ROSE)
- **R functions**: `e1071::naiveBayes()`, `randomForest::randomForest()`
