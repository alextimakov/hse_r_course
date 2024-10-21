# Скрипт для инсталляции пакетов, необходимых для курса
required_packages <- c("car",
                       "corrplot",
                       "cluster",
                       "data.table",
                       "devtools",
                       "dplyr",
                       "gdata",
                       "ggplot2",
                       "knitr",
                       "lavaan",
                       "parallel",
                       "psych",
                       "tidyverse")

existing_packages <- installed.packages()[,"Package"]

to_install <- required_packages[!required_packages %in% existing_packages]

if (length(to_install) > 0) {for (i in to_install) {
  install.packages(i)}
}