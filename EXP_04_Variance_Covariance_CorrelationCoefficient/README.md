# Statistical Analysis of Multi-type Data Variables

## Aim
To perform comprehensive statistical analysis on different types of data variables (numeric, binary, ordinal, nominal) by computing and interpreting various statistical measures including variance, covariance, correlation coefficient, and chi-squared tests using R.

## Algorithm

### 1. Data Preparation and Import
- Import required libraries (if any)
- Load dataset containing multiple variable types
```R
data <- read.csv("dataset.csv")
```

### 2. Data Type Conversion and Preprocessing
a) **Ordinal Data Conversion**
   - Convert ordinal variables to ordered factors
   - Specify levels in correct order
```R
data$ord_dat1 <- factor(data$ord_dat1, 
                        levels = c("Low", "Medium", "High"), 
                        ordered = TRUE)
data$ord_dat2 <- factor(data$ord_dat2, 
                        levels = c("Low", "Medium", "High"), 
                        ordered = TRUE)
```

b) **Nominal Data Conversion**
   - Convert nominal variables to unordered factors
```R
data$nom_dat1 <- factor(data$nom_dat1)
data$nom_dat2 <- factor(data$nom_dat2)
```

### 3. Statistical Analysis

#### 3.1 Numeric Data Analysis
- Calculate variance for each numeric variable
- Compute covariance between numeric variables
- Determine correlation coefficient
```R
# Variance calculation
num_variance1 <- var(data$num_dat1)
num_variance2 <- var(data$num_dat2)

# Covariance calculation
num_covariance <- cov(data$num_dat1, data$num_dat2)

# Correlation calculation
num_correlation <- cor(data$num_dat1, data$num_dat2)
```

#### 3.2 Binary Data Analysis
- Calculate variance for binary variables
- Compute covariance between binary variables
- Determine correlation coefficient
```R
binary_variance1 <- var(data$bin_dat1)
binary_variance2 <- var(data$bin_dat2)
binary_covariance <- cov(data$bin_dat1, data$bin_dat2)
binary_correlation <- cor(data$bin_dat1, data$bin_dat2)
```

#### 3.3 Categorical Data Analysis
- Perform chi-squared tests for independence
```R
# Nominal data analysis
nominal_chisq_test <- chisq.test(table(data$nom_dat1, data$nom_dat2))

# Ordinal data analysis
ordinal_chisq_test <- chisq.test(table(data$ord_dat1, data$ord_dat2))
```

### 4. Data Visualization

#### 4.1 Plot Setup
```R
# Create 2x2 plot layout
par(mfrow = c(2, 2))
```

#### 4.2 Create Various Plots
a) **Nominal Data Visualization**
```R
nominal_table <- table(data$nom_dat1, data$nom_dat2)
barplot(nominal_table, 
        beside = TRUE, 
        col = c("lightblue", "lightgreen", "lightcoral"),
        legend = TRUE, 
        args.legend = list(title = "Nominal Data", x = "topright"),
        main = "Nominal Data vs Nominal Data", 
        xlab = "Nominal Data Categories", 
        ylab = "Frequency")
```

b) **Ordinal Data Visualization**
```R
ordinal_table <- table(data$ord_dat1, data$ord_dat2)
barplot(ordinal_table, 
        beside = TRUE,
        col = c("lightblue", "lightgreen", "lightcoral"),
        legend = TRUE)
```

c) **Numeric Data Visualization**
```R
plot(data$num_dat1, data$num_dat2, 
     main = "Numeric Data vs Numeric Data", 
     xlab = "Numeric Data 1", 
     ylab = "Numeric Data 2", 
     col = "blue", 
     pch = 16)
```

d) **Binary Data Visualization**
```R
plot(data$bin_dat1, data$bin_dat2, 
     main = "Binary Data vs Binary Data", 
     xlab = "Binary Data 1", 
     ylab = "Binary Data 2", 
     col = "red", 
     pch = 16)
```

## Mathematical Formulas

1. **Variance (σ²)**
   ```
   σ² = (1/n) * Σ(xᵢ - μ)²
   ```

2. **Covariance (σxy)**
   ```
   σxy = (1/n) * Σ((xᵢ - μx)(yᵢ - μy))
   ```

3. **Correlation Coefficient (ρ)**
   ```
   ρ = σxy / (σx * σy)
   ```

4. **Chi-squared Test Statistic (χ²)**
   ```
   χ² = Σ((O - E)²/E)
   ```
   Where O = Observed frequency, E = Expected frequency

## Expected Output

1. Numeric Data Statistics:
   - Variance values
   - Covariance
   - Correlation coefficient

2. Binary Data Statistics:
   - Variance values
   - Covariance
   - Correlation coefficient

3. Categorical Data Analysis:
   - Chi-squared test statistics
   - p-values
   - Contingency tables

4. Visual Output:
   - Bar plots for categorical data
   - Scatter plots for numeric and binary data
   - 2x2 plot layout showing all relationships