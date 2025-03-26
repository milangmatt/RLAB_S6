# VIVA Questions and Answers

## Statistical Concepts

### Q1: Explain the mathematical relationships between variance, covariance, and correlation.
**A:**
- **Variance (σ²):**
  ```
  σ² = (1/n) * Σ(xᵢ - μ)²
  ```
  Where:
  - n = sample size
  - xᵢ = individual values
  - μ = mean
  
- **Covariance (σxy):**
  ```
  σxy = (1/n) * Σ((xᵢ - μx)(yᵢ - μy))
  ```
  
- **Correlation (ρ):**
  ```
  ρ = σxy / (σx * σy)
  ```
  Where σx and σy are standard deviations

### Q2: What are the different types of correlations and when to use them?
**A:**
1. **Pearson Correlation:**
   - For linear relationships
   - Requires continuous variables
   - Sensitive to outliers
   
2. **Spearman Correlation:**
   - For monotonic relationships
   - Works with ordinal data
   - Less sensitive to outliers
   
3. **Kendall's Tau:**
   - Non-parametric measure
   - Good for small sample sizes
   - Robust against outliers

## R Programming Implementation

### Q3: How would you handle missing values in correlation analysis using R?
**A:**
```R
# Method 1: Remove missing values
cor(x, y, use="complete.obs")

# Method 2: Pairwise deletion
cor(x, y, use="pairwise.complete.obs")

# Method 3: Imputation
library(mice)
imputed_data <- mice(data)
```

### Q4: Explain the difference between cov() and cor() functions in R.
**A:**
- **cov():**
  ```R
  # Returns covariance matrix
  cov(data)
  # Scale-dependent
  # Units: product of variables' units
  ```

- **cor():**
  ```R
  # Returns correlation matrix
  cor(data)
  # Scale-independent
  # Units: dimensionless [-1, 1]
  ```

## Advanced Concepts

### Q5: How do you test for statistical significance of correlation in R?
**A:**
```R
# Perform correlation test
cor.test(x, y)

# Components returned:
# - t-statistic
# - p-value
# - confidence intervals
# - correlation coefficient
```

### Q6: What are the methods to visualize correlation matrices in R?
**A:**
```R
# Basic correlation plot
library(corrplot)
corrplot(cor(data))

# Enhanced heatmap
library(ggcorrplot)
ggcorrplot(cor(data))
```

### Q7: How do you detect and handle multicollinearity?
**A:**
1. **Detection:**
   ```R
   # Variance Inflation Factor
   library(car)
   vif(model)
   
   # Correlation matrix
   cor(data) > 0.8  # High correlation threshold
   ```

2. **Handling:**
   - Remove one of highly correlated variables
   - Principal Component Analysis (PCA)
   - Ridge Regression

### Q8: Explain the concept of partial correlation with R implementation.
**A:**
```R
library(ppcor)
pcor.test(x, y, z)  # z is the control variable

# Formula:
# ρxy.z = (ρxy - ρxz*ρyz)/sqrt((1-ρxz²)(1-ρyz²))
```

### Q9: How do you perform and interpret canonical correlation analysis in R?
**A:**
```R
library(CCA)
cc <- cancor(X, Y)  # X and Y are matrices

# Interprets:
# - Canonical correlations
# - Canonical weights
# - Structure coefficients
```

### Q10: What are robust correlation methods and when to use them?
**A:**
1. **Winsorized Correlation:**
   ```R
   library(robust)
   corHuber(x, y)
   ```

2. **Percentage Bend Correlation:**
   ```R
   library(WRS2)
   pbcor(x, y)
   ```

Use cases:
- Data with outliers
- Non-normal distributions
- Heavy-tailed distributions