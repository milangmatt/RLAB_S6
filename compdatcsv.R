# Load the dataset
data <- read.csv("/home/cs-da-08/Milan_S6DS/compdat.csv")

# Convert Ordinal Data to Numeric (based on levels)
data$ord_dat1_numeric <- as.numeric(factor(data$ord_dat1, levels = c("Low", "Medium", "High"), ordered = TRUE))
data$ord_dat2_numeric <- as.numeric(factor(data$ord_dat2, levels = c("Low", "Medium", "High"), ordered = TRUE))

# Convert Nominal Data to Numeric (arbitrary coding)
data$nom_dat1_numeric <- as.numeric(factor(data$nom_dat1))
data$nom_dat2_numeric <- as.numeric(factor(data$nom_dat2))

# Numeric vs Numeric
num_variance1 <- var(data$num_dat1)
num_variance2 <- var(data$num_dat2)
num_covariance <- cov(data$num_dat1, data$num_dat2)
num_correlation <- cor(data$num_dat1, data$num_dat2)

cat("Numeric vs Numeric - Variance 1:", num_variance1, "\n")
cat("Numeric vs Numeric - Variance 2:", num_variance2, "\n")
cat("Numeric vs Numeric - Covariance:", num_covariance, "\n")
cat("Numeric vs Numeric - Correlation:", num_correlation, "\n")

# Ordinal vs Ordinal
ordinal_covariance <- cov(data$ord_dat1_numeric, data$ord_dat2_numeric)
ordinal_correlation <- cor(data$ord_dat1_numeric, data$ord_dat2_numeric)

cat("Ordinal vs Ordinal - Covariance:", ordinal_covariance, "\n")
cat("Ordinal vs Ordinal - Correlation:", ordinal_correlation, "\n")

# Nominal vs Nominal
nominal_covariance <- cov(data$nom_dat1_numeric, data$nom_dat2_numeric)
nominal_correlation <- cor(data$nom_dat1_numeric, data$nom_dat2_numeric)

cat("Nominal vs Nominal - Covariance:", nominal_covariance, "\n")
cat("Nominal vs Nominal - Correlation:", nominal_correlation, "\n")

# Binary vs Binary
binary_covariance <- cov(data$bin_dat1, data$bin_dat2)
binary_correlation <- cor(data$bin_dat1, data$bin_dat2)

cat("Binary vs Binary - Covariance:", binary_covariance, "\n")
cat("Binary vs Binary - Correlation:", binary_correlation, "\n")
