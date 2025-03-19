# Numeric Data
numeric_data1 <- c(2.5, 3.6, 7.1, 9.0, 10.5)
numeric_data2 <- c(1.2, 3.4, 6.5, 8.2, 9.7)

# Ordinal Data
ordinal_data1 <- factor(c("Low", "Medium", "High", "High", "Low"), levels = c("Low", "Medium", "High"), ordered = TRUE)
ordinal_data2 <- factor(c("Low", "High", "Medium", "Medium", "Low"), levels = c("Low", "Medium", "High"), ordered = TRUE)

# Nominal Data
nominal_data1 <- factor(c("Red", "Blue", "Green", "Red", "Blue"))
nominal_data2 <- factor(c("Circle", "Square", "Circle", "Triangle", "Square"))

# Binary Data
binary_data1 <- c(1, 0, 1, 0, 1)
binary_data2 <- c(0, 1, 0, 1, 0)

# Numeric vs Numeric
numeric_variance1 <- var(numeric_data1)
numeric_variance2 <- var(numeric_data2)
numeric_covariance <- cov(numeric_data1, numeric_data2)
numeric_correlation <- cor(numeric_data1, numeric_data2)

cat("Numeric vs Numeric - Variance 1:", numeric_variance1, "\n")
cat("Numeric vs Numeric - Variance 2:", numeric_variance2, "\n")
cat("Numeric vs Numeric - Covariance:", numeric_covariance, "\n")
cat("Numeric vs Numeric - Correlation:", numeric_correlation, "\n")

# Nominal vs Nominal
nominal_covariance <- cov(as.numeric(nominal_data1), as.numeric(nominal_data2))
nominal_correlation <- cor(as.numeric(nominal_data1), as.numeric(nominal_data2))

cat("Nominal vs Nominal - Covariance:", nominal_covariance, "\n")
cat("Nominal vs Nominal - Correlation:", nominal_correlation, "\n")

# Ordinal vs Ordinal
ordinal_covariance <- cov(as.numeric(ordinal_data1), as.numeric(ordinal_data2))
ordinal_correlation <- cor(as.numeric(ordinal_data1), as.numeric(ordinal_data2))

cat("Ordinal vs Ordinal - Covariance:", ordinal_covariance, "\n")
cat("Ordinal vs Ordinal - Correlation:", ordinal_correlation, "\n")

# Binary vs Binary
binary_covariance <- cov(binary_data1, binary_data2)
binary_correlation <- cor(binary_data1, binary_data2)

cat("Binary vs Binary - Covariance:", binary_covariance, "\n")
cat("Binary vs Binary - Correlation:", binary_correlation, "\n")
