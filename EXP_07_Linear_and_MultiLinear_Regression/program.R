# Load necessary libraries
library(ggplot2)
library(lattice)

# Function for Simple Linear Regression
simple_linear_regression <- function() {
  # Read data from CSV file
  data <- read.csv("D:\\Projects\\LAB\\RLAB_S6\\EXP_07_Linear_and_MultiLinear_Regression\\dataset_linear.csv")
  
  # Check if the required columns exist
  if (!all(c("years", "salary") %in% colnames(data))) {
    stop("Error: The dataset must contain 'years' and 'salary' columns.")
  }
  
  # Check for missing values
  if (any(is.na(data$years)) | any(is.na(data$salary))) {
    cat("Warning: Missing values detected in the dataset. Removing NA values...\n")
    data <- na.omit(data)
  }
  
  # Check if data is empty after removing NAs
  if (nrow(data) == 0) {
    cat("Error: No valid data available for regression.\n")
    return()
  }
  
  # Get user input for prediction
  experience_years <- as.numeric(readline(prompt = "Enter years of experience for prediction: "))
  
  # Fit the simple linear regression model
  model <- lm(salary ~ years, data = data)

  
  # Plot the data and the regression line
  plot(data$years, data$salary, main = "Linear Regression: Salary vs Years of Experience",
       xlab = "Years of Experience", ylab = "Salary ($)",
       pch = 16, col = "darkgreen")
  abline(model, col = "purple", lwd = 2)
  
  # Predict salary for the input years of experience
  predicted_salary <- predict(model, newdata = data.frame(years = experience_years))
  
  # Print the predicted salary
  print(paste("Predicted Salary for", experience_years, "years of experience:", round(predicted_salary, 2)))
  
  # Plot the predicted point
  points(experience_years, predicted_salary, col = "orange", pch = 19, cex = 2)
  text(experience_years, predicted_salary, labels = round(predicted_salary, 2), pos = 4, col = "orange")
  
  print(xyplot(salary ~ years, data = data, type = c("p", "r"), col = "darkgreen", pch = 16, cex = 1.5, lwd = 2))
  
  
}

multiple_linear_regression <- function() {
  # Function to get user input
  collect_user_data <- function() {
    study_hours <- as.numeric(readline(prompt = "Enter Hours Studied: "))
    prior_scores <- as.numeric(readline(prompt = "Enter Previous Scores: "))
    
    activities_participated <- readline(prompt = "Extracurricular Activities (Yes/No): ")
    
    sleep_duration <- as.numeric(readline(prompt = "Enter Sleep Hours: "))
    question_papers_attempted <- as.numeric(readline(prompt = "Enter Sample Question Papers Attempted: "))
    
    return(data.frame(
      HoursStudied = study_hours,
      PreviousScores = prior_scores,
      ExtracurricularActivities = activities_participated,
      SleepHours = sleep_duration,
      SamplePapersAttempted = question_papers_attempted
    ))
  }
  
  # Get user input
  new_data <- collect_user_data()
  
  # Read the dataset from CSV
  student_data <- read.csv("D:\\Projects\\LAB\\RLAB_S6\\EXP_07_Linear_and_MultiLinear_Regression\\dataset_multilinear.csv")
  
  # Convert ExtracurricularActivities to factor
  student_data$ExtracurricularActivities <- as.factor(student_data$ExtracurricularActivities)
  
  # Check if the required columns exist
  required_columns <- c("PerformanceIndex", "HoursStudied", "PreviousScores", "ExtracurricularActivities", "SleepHours", "SamplePapersAttempted")
  if (!all(required_columns %in% colnames(student_data))) {
    stop("Error: The dataset must contain the required columns: ", paste(required_columns, collapse = ", "))
  }
  
  # Check for missing values
  if (any(is.na(student_data))) {
    cat("Warning: Missing values detected in the dataset. Removing NA values...\n")
    student_data <- na.omit(student_data)
  }
  
  # Check if data is empty after removing NAs
  if (nrow(student_data) == 0) {
    cat("Error: No valid data available for regression.\n")
    return()
  }
  
  # Fit the multiple linear regression model
  model <- lm(PerformanceIndex ~ HoursStudied + PreviousScores + ExtracurricularActivities + SleepHours + SamplePapersAttempted, data = student_data)
  
  
  # Add predicted values to the data frame
  student_data$predicted_values <- predict(model, student_data)
  
  # Predict the performance index for the new data
  predicted_performance <- predict(model, newdata = new_data)
  print(paste("Predicted Performance Index for new data:", round(predicted_performance, 2)))
  
  # Calculate and print MSE
  mse <- mean((student_data$PerformanceIndex - student_data$predicted_values)^2)
  print(paste("Mean Squared Error (MSE):", round(mse, 2)))
  
  
  # Print the plot
  print(plot)
}

# Main Menu
main_menu <- function() {
  cat("Menu:\n")
  cat("1. Simple Linear Regression (Salary Prediction)\n")
  cat("2. Multiple Linear Regression (Performance Index Prediction)\n")
  cat("3. Exit\n")
  
  choice <- as.numeric(readline(prompt = "Enter your choice (1/2/3): "))
  
  if (choice == 1) {
    simple_linear_regression()
  } else if (choice == 2) {
    multiple_linear_regression()
  } else if (choice == 3) {
    cat("Exiting the program. Goodbye!\n")
    return()
  } else {
    cat("Invalid choice. Please try again.\n")
  }
  
  # Loop to show the menu again
  main_menu()
}

# Run the main menu
main_menu()