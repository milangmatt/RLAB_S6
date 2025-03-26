# Statistical Description Analysis

## Aim
To perform statistical description analysis on a dataset using R, including measures of central tendency, dispersion, and visualization.

## Algorithm
1. **Data Import and Preparation**
   - Import required libraries (ggplot2)
   ```R
   library(ggplot2)
   ```
   - Load the dataset or create sample data
   
2. **Basic Statistical Measures**
   - Calculate mean, median, and mode
   - Compute standard deviation and variance
   - Find quartiles and range

3. **Data Visualization**
   - Create histogram to visualize distribution
   - Generate box plot for outlier detection
   - Plot density curve for distribution shape

4. **Result Summary**
   - Display all statistical measures
   - Save visualizations
   - Generate comprehensive summary statistics

## Complete Code
```R
# Load required libraries
library(ggplot2)

# Generate sample data
data <- c(23, 45, 67, 34, 89, 56, 78, 90, 45, 23, 67, 89)

# Calculate basic statistics
mean_val <- mean(data)
median_val <- median(data)
sd_val <- sd(data)
var_val <- var(data)
summary_stats <- summary(data)

# Create visualizations
png("plot.jpeg")
par(mfrow=c(2,2))

# Histogram
hist(data, main="Histogram", col="lightblue")

# Boxplot
boxplot(data, main="Boxplot", col="lightgreen")

# Density plot
plot(density(data), main="Density Plot")

# Q-Q plot
qqnorm(data)
qqline(data)

dev.off()

# Display results
print(paste("Mean:", mean_val))
print(paste("Median:", median_val))
print(paste("Standard Deviation:", sd_val))
print(paste("Variance:", var_val))
print("Summary Statistics:")
print(summary_stats)
```
