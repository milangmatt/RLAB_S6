# Logistic Regression

## Aim
To implement and analyze both binomial and multinomial logistic regression models for classification problems using R, including diabetes prediction and vehicle cylinder classification.

## Algorithm

### 1. Binomial Logistic Regression (Diabetes Prediction)

1. **Data Preparation**
   ```R
   # Load and split data
   data <- read.csv('dataset.csv')
   set.seed(42)
   train_indices <- sample(1:nrow(data), size = 0.8 * nrow(data))
   ```

2. **Model Building**
   ```R
   # Fit logistic regression model
   model <- glm(Outcome ~ ., 
                data = train_data, 
                family = binomial())
   ```

3. **Prediction**
   ```R
   # Make predictions
   predicted_probabilities <- predict(model, 
                                    newdata = test_data, 
                                    type = "response")
   predicted_outcomes <- ifelse(predicted_probabilities >= 0.5, 1, 0)
   ```

### 2. Multinomial Logistic Regression (Cylinder Prediction)

1. **Data Processing**
   ```R
   # Load and prepare data
   data(mtcars)
   mtcars$cyl <- as.factor(mtcars$cyl)
   ```

2. **Model Creation**
   ```R
   # Fit multinomial model
   model <- multinom(cyl ~ mpg + hp + wt + qsec + drat + disp, 
                    data = mtcars)
   ```

3. **Prediction System**
   ```R
   # Predict class
   prediction <- predict(model, newdata = new_data)
   ```

## Mathematical Background

1. **Binomial Logistic Regression**
   ```
   P(Y=1) = 1 / (1 + e^(-z))
   where z = β₀ + β₁x₁ + β₂x₂ + ... + βₙxₙ
   ```

2. **Multinomial Logistic Regression**
   ```
   P(Y=k) = e^(zₖ) / Σⱼ e^(zⱼ)
   where zₖ = β₀ₖ + β₁ₖx₁ + β₂ₖx₂ + ... + βₙₖxₙ
   ```

3. **Model Evaluation**
   ```
   Accuracy = (True Positives + True Negatives) / Total Cases
   ```

## Complete Code
[See program.R for implementation details]