## Seminar 3

### 1. Hypothesis Testing Basics in R
_ Motivation for business to run a statistical test (e.g. A/B testing, comparing customer segments, etc.)
- Hypothesis testing workflow: state hypotheses (H0 and H1) -> choose test -> check assumptions -> run test -> interpret results
- Null hypothesis (H0): default assumption, typically "no effect" or "no difference"
- Alternative hypothesis (H1): what we want to prove, directional or non-directional
- Test statistics: calculated from sample data, compared to critical values or used to compute p-values
- P-value interpretation: probability of observing data as extreme or more extreme if H0 is true

### 2. Assumptions About Data: Normality
- Many parametric tests assume normal distribution of data (or residuals)
- **Checking normality**: visual (histograms, Q-Q plots) and statistical tests (Shapiro-Wilk, Kolmogorov-Smirnov)
- **Solutions if violated**: transform data (log, sqrt) or use non-parametric alternatives
- Marketing data is often non-normal: customer spending, website visits, conversion rates

### 3. Assumptions About Data: Independence
- Observations should be independent (one observation doesn't influence another)
- Violations: repeated measures, clustered data, time series
- **Checking**: examine data collection method, look for patterns in residuals
- **Solutions**: use appropriate tests (paired tests, mixed models, time series methods)

### 4. Assumptions About Data: Homoscedasticity
- Equal variances across groups (for group comparison tests)
- **Checking**: Levene's test, Bartlett's test, visual inspection of residuals
- **Solutions if violated**: Welch's t-test (unequal variances), non-parametric tests, transformations

### 5. Parametric Tests: 2 categorical variables
- **Chi-square test of independence**: test association between two categorical variables
- **Chi-square goodness-of-fit**: test if observed frequencies match expected frequencies
- **Fisher's exact test**: test for association between two categorical variables when sample size is small
- No normality assumption (works with frequency tables)
- Marketing application: testing relationships between customer demographics and preferences, brand association

### 6. Parametric Tests: 1-2 samples (numeric dependent variable)
- **One-sample T-test**: compare sample mean to known population mean
- **Independent samples T-test**: compare means between two independent groups (e.g., control vs treatment)
- **Paired T-test**: compare means for same subjects under two conditions (before/after campaign)
- Assumptions: normality, independence, equal variances (for independent samples)
- Marketing application: A/B testing, comparing customer segments

### 7. Non-Parametric Tests: 2 samples (numeric dependent variable)
- **Mann-Whitney U Test (a.k.a Wilcoxon rank-sum test)**: alternative to independent samples t-test when normality assumption violated
- **Wilcoxon signed-rank test**: non-parametric alternative to paired t-test
- Alternative to independent samples T-tests when normality assumption violated
- Tests whether two independent groups differ in their distributions

### 8. (Non-)Parametric Tests: 3+ samples
- **One-way ANOVA**: compare means across three or more groups
- **Two-way ANOVA**: examine effects of two factors and their interaction
- **Repeated measures ANOVA**: multiple measurements on same subjects
- **Kruskal-Wallis test**: alternative to one-way ANOVA when normality assumption violated
- Assumptions: normality, independence, homoscedasticity
- Marketing application: comparing multiple marketing channels, campaign variations

### 9. Test Selection Guide
- **Parametric tests**: more powerful when assumptions met, require interval/ratio data
- **Non-parametric tests**: robust to violations, work with ordinal data, less powerful
- Choose based on: data type, sample size, distribution shape, research question
- When in doubt with small samples or non-normal data: prefer non-parametric
