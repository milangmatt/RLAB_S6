library(C50)
library(rpart.plot)

# Load the dataset
lenses_data <- read.csv("~/Milan_S6DS/lenses.csv")

# Convert categorical columns to factors
lenses_data$age <- factor(lenses_data$age, levels = c("young", "pre-presbyopic", "presbyopic"))
lenses_data$prescription <- factor(lenses_data$prescription, levels = c("myope", "hypermetrope"))
lenses_data$astigmatic <- factor(lenses_data$astigmatic, levels = c("no", "yes"))
lenses_data$tear_rate <- factor(lenses_data$tear_rate, levels = c("reduced", "normal"))
lenses_data$class <- factor(lenses_data$class, levels = c("no contact lenses", "soft contact lenses", "hard contact lenses"))

# Train a C5.0 decision tree model
model <- C5.0(class ~ age + prescription + astigmatic + tear_rate, data = lenses_data)

# Print the model summary
summary(model)

# Visualize the decision tree using C5.0's built-in plot function
plot(model)

# Test the model with new data (user input or custom values)
test_data <- data.frame(
  age = factor("young", levels = c("young", "pre-presbyopic", "presbyopic")),
  prescription = factor("myope", levels = c("myope", "hypermetrope")),
  astigmatic = factor("yes", levels = c("no", "yes")),
  tear_rate = factor("normal", levels = c("reduced", "normal"))
)

# Make prediction using the trained model
prediction <- predict(model, test_data)
print(paste("Predicted Class:", prediction))