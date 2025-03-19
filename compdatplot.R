# Load the dataset from the given file path
data <- read.csv("/home/cs-da-08/Milan_S6DS/compdat.csv")

# Convert Ordinal Data to Factor (Ordinal Data treated as categorical with order)
data$ord_dat1 <- factor(data$ord_dat1, levels = c("Low", "Medium", "High"), ordered = TRUE)
data$ord_dat2 <- factor(data$ord_dat2, levels = c("Low", "Medium", "High"), ordered = TRUE)

# Convert Nominal Data to Factor (Nominal data is treated as categorical without order)
data$nom_dat1 <- factor(data$nom_dat1)
data$nom_dat2 <- factor(data$nom_dat2)

# Numeric vs Numeric (Variance, Covariance, Correlation)
num_variance1 <- var(data$num_dat1)
num_variance2 <- var(data$num_dat2)
num_covariance <- cov(data$num_dat1, data$num_dat2)
num_correlation <- cor(data$num_dat1, data$num_dat2)

cat("\nNumeric vs Numeric Statistics:\n")
cat("Variance of num_dat1:", num_variance1, "\n")
cat("Variance of num_dat2:", num_variance2, "\n")
cat("Covariance between num_dat1 and num_dat2:", num_covariance, "\n")
cat("Correlation coefficient between num_dat1 and num_dat2:", num_correlation, "\n")

# Binary vs Binary (Variance, Covariance, Correlation)
binary_variance1 <- var(data$bin_dat1)
binary_variance2 <- var(data$bin_dat2)
binary_covariance <- cov(data$bin_dat1, data$bin_dat2)
binary_correlation <- cor(data$bin_dat1, data$bin_dat2)

cat("\nBinary vs Binary Statistics:\n")
cat("Variance of bin_dat1:", binary_variance1, "\n")
cat("Variance of bin_dat2:", binary_variance2, "\n")
cat("Covariance between bin_dat1 and bin_dat2:", binary_covariance, "\n")
cat("Correlation coefficient between bin_dat1 and bin_dat2:", binary_correlation, "\n")

# Chi-squared Test for Nominal vs Nominal
nominal_chisq_test <- chisq.test(table(data$nom_dat1, data$nom_dat2))
cat("\nChi-squared Test for Nominal vs Nominal:\n")
cat("Chi-squared Statistic:", nominal_chisq_test$statistic, "\n")
cat("p-value:", nominal_chisq_test$p.value, "\n")

# Chi-squared Test for Ordinal vs Ordinal
ordinal_chisq_test <- chisq.test(table(data$ord_dat1, data$ord_dat2))
cat("\nChi-squared Test for Ordinal vs Ordinal:\n")
cat("Chi-squared Statistic:", ordinal_chisq_test$statistic, "\n")
cat("p-value:", ordinal_chisq_test$p.value, "\n")

# Set up a 2x2 plot layout to show all plots in one window
par(mfrow = c(2, 2))

# Bar Plot for Nominal Data vs Nominal Data
nominal_table <- table(data$nom_dat1, data$nom_dat2)
barplot(nominal_table, beside = TRUE, col = c("lightblue", "lightgreen", "lightcoral"),
        legend = TRUE, args.legend = list(title = "Nominal Data", x = "topright"),
        main = "Nominal Data vs Nominal Data", xlab = "Nominal Data Categories", ylab = "Frequency")

# Bar Plot for Ordinal Data vs Ordinal Data
ordinal_table <- table(data$ord_dat1, data$ord_dat2)
barplot(ordinal_table, beside = TRUE, col = c("lightblue", "lightgreen", "lightcoral"),
        legend = TRUE, args.legend = list(title = "Ordinal Data", x = "topright"),
        main = "Ordinal Data vs Ordinal Data", xlab = "Ordinal Data Categories", ylab = "Frequency")

# Scatter Plot for Numeric vs Numeric
plot(data$num_dat1, data$num_dat2, 
     main = "Numeric Data vs Numeric Data", 
     xlab = "Numeric Data 1", ylab = "Numeric Data 2", 
     col = "blue", pch = 16)

# Scatter Plot for Binary vs Binary
plot(data$bin_dat1, data$bin_dat2, 
     main = "Binary Data vs Binary Data", 
     xlab = "Binary Data 1", ylab = "Binary Data 2", 
     col = "red", pch = 16)

# Reset the plotting layout to default
par(mfrow = c(1, 1))
