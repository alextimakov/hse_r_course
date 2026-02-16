## Seminar 2

### 1. R Base Syntax - Objects and Variables
- R objects: everything in R is an object
- Variables & Operators: `<-` vs `=` (prefer `<-` for clarity), basic operators
- Basic data types: numeric, character, logical, factor
- Functions & Namespaces: built-in and user-defined, function syntax `function_name <- function(arguments)`, namespaces of different scopes
- Navigation & Packages: `library()`, `require()`, `search()`, `attach()`, `detach()`, `help()`
- Vectors & Lists: as well as manipulation techniques
- Control Structures: `if`, `else`, `ifelse()`, `for`, `while` - essential for data preprocessing and conditional logic
- Data Frames & Tables: most common structure for any kind of data (rows = observations, columns = variables)
- Visualization: types of basic plots and their usage

### 2. Useful External Libraries Overview
- **dplyr**: data manipulation (filter, select, mutate, summarize, arrange): essential for data wrangling (also here - about apply family: `apply()`, `lapply()`, `sapply()`, `mapply()`)
- **tidyr**: data tidying (pivot_longer, pivot_wider, separate, unite): reshaping datasets into more informative formats
- **ggplot2**: grammar of graphics for data visualization: creating all types of plots

### 3. Data Preprocessing Principles
- Workflow of data preprocessing: Import data correctly -> Handle duplicated values and NAs systematically -> Ensure consistent formatting and casing -> Merge datasets appropriately -> Transform data structure as needed (wide to long, aggregations) -> Validate data quality before further analysis
- Missing Values (NULLs/NA): diagnose and visualize missing data patterns before imputation -> choose appropriate handling method based on data type and missing pattern (deletion (if MCAR and <5%), imputation (mean/median/mode), or model-based imputation)
- Outliers: can indicate data quality issues or genuine extreme values (IQR method, Z-score, modified Z-score)
