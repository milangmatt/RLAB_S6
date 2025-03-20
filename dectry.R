library(C50)

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

# Function for custom user input
get_user_input <- function() {
  cat("Enter the following options:\n")
  cat("1. Age (1: young, 2: pre-presbyopic, 3: presbyopic): ")
  age <- as.integer(readline())
  age <- c("young", "pre-presbyopic", "presbyopic")[age]
  
  cat("2. Prescription (1: myope, 2: hypermetrope): ")
  prescription <- as.integer(readline())
  prescription <- c("myope", "hypermetrope")[prescription]
  
  cat("3. Astigmatic (1: no, 2: yes): ")
  astigmatic <- as.integer(readline())
  astigmatic <- c("no", "yes")[astigmatic]
  
  cat("4. Tear rate (1: reduced, 2: normal): ")
  tear_rate <- as.integer(readline())
  tear_rate <- c("reduced", "normal")[tear_rate]
  
  return(data.frame(
    age = factor(age, levels = c("young", "pre-presbyopic", "presbyopic")),
    prescription = factor(prescription, levels = c("myope", "hypermetrope")),
    astigmatic = factor(astigmatic, levels = c("no", "yes")),
    tear_rate = factor(tear_rate, levels = c("reduced", "normal"))
  ))
}

# Visualize the decision tree using C5.0's built-in plot function
plot(model, main = "Decision Tree Visualization", type = "simple")

# Get user input and make a prediction
cat("Provide input values for prediction:\n")
test_data <- get_user_input()
prediction <- predict(model, test_data)
cat(paste("Predicted Class:", prediction, "\n"))
