# Load necessary libraries
library(nnet) # For multinomial logistic regression

# Function for Binomial Logistic Regression
binomial_logistic_regression <- function() {
  # Read data from CSV file
  data <- read.csv('D:\\Projects\\LAB\\RLAB_S6\\EXP_08_Logistic_Regression\\dataset.csv')
  
  # Check if the required columns are present
  required_columns <- c("Pregnancies", "Glucose", "BloodPressure", "SkinThickness", 
                        "Insulin", "BMI", "DiabetesPedigreeFunction", "Age", "Outcome")
  if (!all(required_columns %in% colnames(data))) {
    cat("Error: Required Columns not found, Required Columns: \n")
    cat(paste(required_columns, collapse = ", "), "\n")
    return()
  }
  
  # Split the data into training and testing sets (80% training, 20% testing)
  set.seed(42)  # For reproducibility
  train_indices <- sample(1:nrow(data), size = 0.8 * nrow(data))
  train_data <- data[train_indices, ]
  test_data <- data[-train_indices, ]
  
  # Fit binomial logistic regression model using the training data
  model <- glm(Outcome ~ ., data = train_data, family = binomial())
  
  # Make predictions on the test data
  predicted_probabilities <- predict(model, newdata = test_data, type = "response")
  
  # Convert probabilities to binary outcomes (0 or 1)
  predicted_outcomes <- ifelse(predicted_probabilities >= 0.5, 1, 0)
  
  # Calculate accuracy on the test set
  accuracy <- mean(predicted_outcomes == test_data$Outcome)
  
  # Print model summary
  cat("\nBinomial Logistic Regression Model (Diabetes Prediction):\n")

  
  # Prompt user to add new data for prediction
  cat("\nEnter test data for prediction:\n")
  new_data <- data.frame(
    Pregnancies = as.numeric(readline(prompt = "Pregnancies: ")),
    Glucose = as.numeric(readline(prompt = "Glucose: ")),
    BloodPressure = as.numeric(readline(prompt = "BloodPressure: ")),
    SkinThickness = as.numeric(readline(prompt = "SkinThickness: ")),
    Insulin = as.numeric(readline(prompt = "Insulin: ")),
    BMI = as.numeric(readline(prompt = "BMI: ")),
    DiabetesPedigreeFunction = as.numeric(readline(prompt = "DiabetesPedigreeFunction: ")),
    Age = as.numeric(readline(prompt = "Age: "))
  )
  
  # Predict probability for new data
  predicted_probability <- predict(model, newdata = new_data, type = "response")
  
  # Convert probability to binary outcome (0 or 1)
  predicted_outcome <- ifelse(predicted_probability >= 0.5, 1, 0)
  
  # Display the result with "Diabetic" or "Not Diabetic"
  cat("\nPredicted Probability:", predicted_probability, "\n")
  if (predicted_outcome == 1) {
    cat("Predicted Outcome: Diabetic\n")
  } else {
    cat("Predicted Outcome: Not Diabetic\n")
  }
  cat('Accuracy for Binomial Logistic Regression: ', round(accuracy, 4))
}

multinomial_logistic_regression <- function() {
  # Load mtcars dataset
  data(mtcars)
  
  # Convert the 'cyl' variable (number of cylinders) to a factor
  mtcars$cyl <- as.factor(mtcars$cyl)
  
  # Fit multinomial logistic regression model
  model <- multinom(cyl ~ mpg + hp + wt + qsec + drat + disp, data = mtcars)
  
  # Print model summary
  cat("\nMultinomial Logistic Regression Model ( Number of cylinders ):\n")

  # Function to safely read numeric input with error handling
  safe_input <- function(prompt) {
    repeat {
      input <- readline(prompt)
      num_input <- as.numeric(input)
      if (!is.na(num_input)) {
        return(num_input)
      } else {
        cat("Invalid input. Please enter a numeric value.\n")
      }
    }
  }
  
  # Prompt user to add new data for prediction
  cat("\nEnter new data for prediction:\n")
  mpg <- safe_input("Miles per Gallon (mpg): ")
  hp <- safe_input("Horsepower (hp): ")
  wt <- safe_input("Weight (wt): ")
  qsec <- safe_input("Quarter Mile Time (qsec): ")
  drat <- safe_input("Rear Axle Ratio (drat): ")
  disp <- safe_input("Displacement (disp): ")
  
  # Prepare new data frame for prediction
  new_data <- data.frame(
    mpg = mpg,
    hp = hp,
    wt = wt,
    qsec = qsec,
    drat = drat,
    disp = disp
  )
  
  # Predict cylinders for new data
  prediction <- predict(model, newdata = new_data)
  cat("\nPredicted Number of Cylinders:", as.character(prediction), "\n")
  
  # Calculate accuracy on the training data
  predicted_train <- predict(model, newdata = mtcars)
  accuracy <- mean(predicted_train == mtcars$cyl)
  cat('Accuracy for Multinomial Logistic Regression: ', round(accuracy, 4), "\n")
}




# Menu-driven program
while (TRUE) {
  cat("\nMenu:\n")
  cat("1. Binomial Logistic Regression ( Diabetes Prediction )\n")
  cat("2. Multinomial Logistic Regression ( Cylinder Number Prediction )\n")
  cat("3. Exit\n")
  choice <- as.numeric(readline(prompt = "Enter your choice (1/2/3): "))
  
  if (choice == 1) {
    binomial_logistic_regression()
  } else if (choice == 2) {
    multinomial_logistic_regression()
  } else if (choice == 3) {
    cat("Exiting the program. Goodbye!\n")
    break
  } else {
    cat("Invalid choice. Please try again.\n")
  }
}


