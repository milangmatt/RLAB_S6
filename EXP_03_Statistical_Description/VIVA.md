# VIVA Questions and Answers

## Q1: What is the difference between population mean and sample mean?
**A:** 
- Population mean (μ) includes all possible observations
- Sample mean (x̄) is calculated from a subset of the population
- Formula for population mean: μ = Σx/N
- Formula for sample mean: x̄ = Σx/n
where N is population size and n is sample size

## Q2: What is the relationship between variance and standard deviation?
**A:**
- Standard deviation is the square root of variance
- Variance (σ²) = Σ(x - μ)²/N
- Standard deviation (σ) = √(σ²)
- Used to measure spread of data around the mean

## Q3: Why do we need both boxplots and histograms?
**A:**
- Boxplots show:
  - Median
  - Quartiles
  - Outliers
  - Data spread
- Histograms show:
  - Distribution shape
  - Frequency of values
  - Data patterns
  - Modality

## Q4: What are the measures of central tendency?
**A:**
1. Mean: arithmetic average
2. Median: middle value
3. Mode: most frequent value
Each has specific use cases depending on data distribution.

## Q5: How does R handle missing values in statistical calculations?
**A:**
- R uses NA for missing values
- Functions like mean(), sd() have na.rm parameter
- Example: mean(data, na.rm=TRUE)
- Important to handle missing values appropriately to avoid bias

## Q6: What is the importance of Q-Q plots?
**A:**
- Tests for normality
- Plots theoretical vs sample quantiles
- Straight line indicates normal distribution
- Deviations suggest non-normality