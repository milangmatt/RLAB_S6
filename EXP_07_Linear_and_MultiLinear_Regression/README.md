# Linear and Multiple Linear Regression Analysis

## Aim
To implement and analyze both simple linear regression and multiple linear regression models using R, including data visualization and prediction capabilities.

## Algorithm

### 1. Simple Linear Regression
1. **Data Preparation**
   ```R
   # Read salary data
   data <- read.csv("dataset_linear.csv")
   ```

2. **Model Building**
   ```R
   # Fit linear model
   model <- lm(salary ~ years, data = data)
   ```

3. **Visualization**
   ```R
   # Plot data points and regression line
   plot(data$years, data$salary,
        main = "Linear Regression: Salary vs Years of Experience",
        xlab = "Years of Experience",
        ylab = "Salary ($)")
   abline(model, col = "purple", lwd = 2)
   ```

### 2. Multiple Linear Regression
1. **Data Collection**
   ```R
   # Read student performance data
   student_data <- read.csv("dataset_multilinear.csv")
   ```

2. **Feature Processing**
   ```R
   # Convert categorical variables to factors
   student_data$ExtracurricularActivities <- as.factor(student_data$ExtracurricularActivities)
   ```

3. **Model Building**
   ```R
   # Fit multiple linear regression model
   model <- lm(PerformanceIndex ~ HoursStudied + PreviousScores + 
               ExtracurricularActivities + SleepHours + 
               SamplePapersAttempted, data = student_data)
   ```

### 3. Prediction and Evaluation
1. **Simple Linear Regression**
   - Input years of experience
   - Predict salary
   - Visualize prediction point

2. **Multiple Linear Regression**
   - Collect multiple input features
   - Predict performance index
   - Calculate Mean Squared Error

## Mathematical Background

1. **Simple Linear Regression**
   ```
   Y = β₀ + β₁X + ε
   ```
   where:
   - Y = Dependent variable (Salary)
   - X = Independent variable (Years)
   - β₀ = Intercept
   - β₁ = Slope
   - ε = Error term

2. **Multiple Linear Regression**
   ```
   Y = β₀ + β₁X₁ + β₂X₂ + ... + βₙXₙ + ε
   ```
   where:
   - Y = Performance Index
   - X₁...Xₙ = Independent variables
   - β₀...βₙ = Coefficients
   - ε = Error term

3. **Mean Squared Error**
   ```
   MSE = (1/n) * Σ(yᵢ - ŷᵢ)²
   ```
   where:
   - yᵢ = Actual value
   - ŷᵢ = Predicted value
   - n = Number of observations