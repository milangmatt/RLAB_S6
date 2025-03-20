# Load required libraries
library(e1071)  # For SVM
library(ggplot2)  # For visualization
library(dplyr)  # For data manipulation

# Load the dataset
dataset_path <- "~/Milan_S6DS/banknote.csv"
banknote_data <- read.csv(dataset_path)

# Rename columns if necessary (ensure headers match)
colnames(banknote_data) <- c("variance", "skewness", "kurtosis", "entropy", "class")

# Ensure the class column is a factor
banknote_data$class <- factor(banknote_data$class, levels = c(0, 1), labels = c("Authentic", "Forged"))

# Split the data into training and testing sets (80/20 split)
set.seed(123)  # For reproducibility
train_indices <- sample(1:nrow(banknote_data), 0.8 * nrow(banknote_data))
train_data <- banknote_data[train_indices, ]
test_data <- banknote_data[-train_indices, ]

# Train the SVM classifier with an RBF kernel
svm_model <- svm(class ~ variance + skewness, data = train_data, kernel = "radial")

# Test the model on the test data
test_predictions <- predict(svm_model, test_data)
accuracy <- mean(test_predictions == test_data$class) * 100
cat("Model Accuracy on Test Data:", accuracy, "%\n")

# Function for user input
get_user_input <- function() {
  cat("Enter values for the features:\n")
  variance <- as.numeric(readline(prompt = "Variance: "))
  skewness <- as.numeric(readline(prompt = "Skewness: "))
  kurtosis <- as.numeric(readline(prompt = "Kurtosis: "))
  entropy <- as.numeric(readline(prompt = "Entropy: "))
  
  # Create a data frame for the input
  user_input <- data.frame(
    variance = variance,
    skewness = skewness,
    kurtosis = kurtosis,
    entropy = entropy
  )
  return(user_input)
}

# Predict using user input
cat("Provide input values for prediction:\n")
user_input <- get_user_input()
prediction <- predict(svm_model, user_input)
cat("Predicted Class:", as.character(prediction), "\n")

# Plotting the decision boundary with contours
# Generate a grid of points to visualize the decision boundary
x_range <- seq(min(train_data$variance) - 1, max(train_data$variance) + 1, length.out = 200)
y_range <- seq(min(train_data$skewness) - 1, max(train_data$skewness) + 1, length.out = 200)
grid <- expand.grid(variance = x_range, skewness = y_range)
grid_predictions <- predict(svm_model, grid)

# Create a plot with contouring
grid$class <- grid_predictions  # Add predictions to the grid for visualization
print(ggplot() +
  geom_tile(data = grid, aes(x = variance, y = skewness, fill = class), alpha = 0.3) +
  geom_contour(data = grid, aes(x = variance, y = skewness, z = as.numeric(class)), color = "black", binwidth = 0.5) +
  geom_point(data = train_data, aes(x = variance, y = skewness, color = class), size = 2) +
  scale_fill_manual(values = c("lightblue", "pink")) +
  scale_color_manual(values = c("blue", "red")) +
  labs(
    title = "SVM Decision Boundary ",
    x = "Variance",
    y = "Skewness",
    fill = "Class",
    color = "Class"
  ) +
  theme_minimal())
