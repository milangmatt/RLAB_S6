# VIVA Questions and Answers

### Q1: What is the difference between linear and logistic regression?
**A:**
- **Linear Regression**
  - Predicts continuous values
  - Output range: (-∞, +∞)
  - Uses least squares method
  
- **Logistic Regression**
  - Predicts probability of classes
  - Output range: [0, 1]
  - Uses maximum likelihood estimation

### Q2: Explain the sigmoid function in logistic regression
**A:**
- **Formula**: σ(z) = 1 / (1 + e^(-z))
- **Properties**:
  - Output range: [0, 1]
  - S-shaped curve
  - Differentiable
- **Implementation**:
```R
sigmoid <- function(z) {
    1 / (1 + exp(-z))
}
```

### Q3: What is the difference between binomial and multinomial logistic regression?
**A:**
1. **Binomial**
   - Two possible outcomes
   - Single decision boundary
   - Example: Diabetes (Yes/No)

2. **Multinomial**
   - Multiple possible outcomes
   - Multiple decision boundaries
   - Example: Cylinder count (4/6/8)

### Q4: How do you handle feature scaling in logistic regression?
**A:**
```R
# Standardization
scale_features <- function(x) {
    (x - mean(x)) / sd(x)
}

# Min-Max Scaling
min_max_scale <- function(x) {
    (x - min(x)) / (max(x) - min(x))
}
```

### Q5: How do you interpret the coefficients in logistic regression?
**A:**
- **Odds Ratio**: exp(coefficient)
- **Interpretation**:
  ```R
  summary(model)$coefficients
  exp(coef(model))  # Odds ratios
  ```
- **Example**: A coefficient of 1.5 means:
  - For one unit increase in X
  - Odds increase by exp(1.5)

### Q6: What metrics are used to evaluate logistic regression models?
**A:**
1. **Accuracy**
```R
accuracy <- mean(predicted == actual)
```

2. **Confusion Matrix**
```R
table(predicted, actual)
```

3. **ROC Curve**
```R
library(ROCR)
pred <- prediction(probabilities, actual)
perf <- performance(pred, "tpr", "fpr")
```

### Q7: How do you handle class imbalance in logistic regression?
**A:**
1. **Sampling Methods**
```R
# Oversampling
library(ROSE)
balanced_data <- ovun.sample(formula, data, method="over")

# Undersampling
balanced_data <- ovun.sample(formula, data, method="under")
```

2. **Class Weights**
```R
weights <- ifelse(y == 1, 
                 nrow(data)/sum(y == 1), 
                 nrow(data)/sum(y == 0))
```

### Q8: What are the assumptions of logistic regression?
**A:**
1. **Independence** of observations
2. **No multicollinearity**
```R
library(car)
vif(model)  # Check multicollinearity
```
3. **Linear relationship** between logit and predictors
4. **Large sample size** (at least 10 cases per predictor)

### Q9: How do you handle missing values in logistic regression?
**A:**
```R
# Complete case analysis
complete_data <- na.omit(data)

# Imputation
library(mice)
imputed_data <- mice(data, m=5)
```

### Q10: What is the role of the threshold in binary classification?
**A:**
- Default threshold: 0.5
- Adjusting threshold affects:
  - Sensitivity
  - Specificity
```R
# Custom threshold
predicted <- ifelse(probabilities > threshold, 1, 0)

# ROC curve to find optimal threshold
optimal_threshold <- optimalCutoff(actuals, probabilities)
```