
# Load libraries
library(partykit)
library(caret)
library(rpart.plot)

# Load the dataset
head(read.csv("~/Milan_S6DS/cars.csv"))

data <- read.csv("~/Milan_S6DS/cars.csv")

# Convert categorical variables to factors
data$buying <- as.factor(data$buying)
data$maint <- as.factor(data$maint)
data$doors <- as.factor(data$doors)
data$persons <- as.factor(data$persons)
data$lug_boot <- as.factor(data$lug_boot)
data$safety <- as.factor(data$safety)
data$class <- as.factor(data$class)

# Split into training and test sets (80% training, 20% testing)
set.seed(42)
trainIndex <- createDataPartition(data$class, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Build the decision tree model using ctree from partykit
model <- ctree(class ~ buying + maint + doors + persons + lug_boot + safety, data = trainData)

# Print the tree structure
print(model)

# Plot the decision tree
plot(model, main = "Decision Tree using ctree (partykit)")

# Evaluate the model's performance
predictions <- predict(model, newdata = testData)

# Create a confusion matrix
confMatrix <- confusionMatrix(predictions, testData$class)
print(confMatrix)

# Calculate accuracy
accuracy <- confMatrix$overall['Accuracy']
cat("\nModel Accuracy: ", accuracy, "\n")

# Function to predict the class based on user input
predict_car_class <- function() {
  cat("\nEnter car evaluation details for prediction:\n")
  
  # User inputs for prediction
  buying <- as.factor(readline(prompt = "Buying Price (vhigh, high, med, low): "))
  maint <- as.factor(readline(prompt = "Maintenance Price (vhigh, high, med, low): "))
  doors <- as.factor(readline(prompt = "Number of Doors (2, 3, 4, 5more): "))
  persons <- as.factor(readline(prompt = "Capacity (2, 4, more): "))
  lug_boot <- as.factor(readline(prompt = "Luggage Boot Size (small, med, big): "))
  safety <- as.factor(readline(prompt = "Safety (low, med, high): "))
  
  # Create a new data frame for user input
  user_input <- data.frame(
    buying = buying, 
    maint = maint, 
    doors = doors, 
    persons = persons, 
    lug_boot = lug_boot, 
    safety = safety
  )
  
  # Predict the class using the trained model
  user_prediction <- predict(model, newdata = user_input)
  
  cat("\nPredicted Car Evaluation Class: ", user_prediction, "\n")
}

# Call the function to predict based on user input
predict_car_class()
