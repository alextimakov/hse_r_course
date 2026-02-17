# Скрипт для инсталляции пакетов, необходимых для курса
# Includes packages for seminars 1-6 (Rmd) and general course use.

required_packages <- c(
  "arules",        # Seminar 6: Association Rules
  "apollo",        # Seminar 6: Choice Modeling
  "arulesViz",     # Seminar 6: Association Rules visualization
  "BayesFactor",   # Seminar 3: Bayesian ANOVA
  "car",           # Seminars 3-4: Levene, etc.
  "caret",         # Seminars 4-6: createDataPartition, confusionMatrix
  "cluster",       # General
  "corrplot",      # General
  "data.table",    # General
  "dplyr",         # Seminars 1-6
  "gdata",         # General
  "ggplot2",       # Seminars 1-2, 4-6
  "knitr",         # Rmd knitting
  "lavaan",        # Seminar 6: SEM
  "sem",           # Seminar 6: SEM
  "OpenMx",        # Seminar 6: SEM
  "lme4",          # Seminar 4: mixed effects
  "MASS",          # Seminar 4: stepAIC
  "parallel",      # General
  "psych",         # Seminars 4-5: EFA, etc.
  "randomForest",  # Seminars 4-6
  "rmarkdown",     # Rmd to HTML/PDF
  "ROSE",          # Seminar 6: imbalanced data
  "mlogit",        # Seminar 6: Choice Modeling
  "stringr",       # Seminar 4: str_to_sentence, str_detect
  "tidyr",         # Seminar 3: pivot_longer, etc.
  "tidyverse"      # General (includes dplyr, tidyr, ggplot2, ...)
)

existing_packages <- installed.packages()[, "Package"]
to_install <- required_packages[!required_packages %in% existing_packages]

if (length(to_install) > 0) {
  for (i in to_install) {
    install.packages(i, repos = "http://cran.us.r-project.org")
  }
}
