# VIVA Questions and Answers

### Q1: What is the difference between simple and multiple linear regression?
**A:**
1. **Simple Linear Regression**
   - One independent variable
   - Formula: Y = β₀ + β₁X + ε
   - Example: Salary ~ Years of Experience

2. **Multiple Linear Regression**
   - Multiple independent variables
   - Formula: Y = β₀ + β₁X₁ + β₂X₂ + ... + βₙXₙ + ε
   - Example: Performance ~ Hours + Scores + Activities

### Q2: How do you evaluate the goodness of fit in regression models?
**A:**
1. **R-squared (R²)**
   ```R
   summary(model)$r.squared
   ```
   - Range: 0 to 1
   - Higher values indicate better fit

2. **Adjusted R-squared**
   ```R
   summary(model)$adj.r.squared
   ```
   - Accounts for number of predictors

3. **Mean Squared Error (MSE)**
   ```R
   mean((actual - predicted)^2)
   ```

### Q3: What assumptions should be checked in linear regression?
**A:**
1. **Linearity**
   ```R
   plot(model, which = 1)  # Residuals vs Fitted
   ```

2. **Normality of Residuals**
   ```R
   plot(model, which = 2)  # Q-Q Plot
   ```

3. **Homoscedasticity**
   ```R
   plot(model, which = 3)  # Scale-Location
   ```

4. **Independence**
   ```R
   dwtest(model)  # Durbin-Watson test
   ```

### Q4: How do you handle categorical variables in regression?
**A:**
1. **Factor Conversion**
   ```R
   data$category <- as.factor(data$category)
   ```

2. **Dummy Variables**
   ```R
   model.matrix(~category - 1, data)
   ```

3. **Reference Levels**
   ```R
   relevel(data$category, ref = "baseline")
   ```

### Q5: What is multicollinearity and how do you detect it?
**A:**
1. **Definition**: High correlation between independent variables

2. **Detection Methods**:
   ```R
   # Correlation matrix
   cor(numerical_variables)
   
   # VIF (Variance Inflation Factor)
   library(car)
   vif(model)
   ```

3. **Solutions**:
   - Remove highly correlated variables
   - Principal Component Analysis
   - Ridge Regression

### Q6: How do you interpret regression coefficients?
**A:**
1. **Numeric Variables**
   - Unit change interpretation
   - Example: "For each year of experience, salary increases by $X"

2. **Categorical Variables**
   - Difference from reference level
   - Example: "Having extracurricular activities increases performance by Y points"

3. **Statistical Significance**
   ```R
   summary(model)  # p-values for coefficients
   ```

### Q7: What is the purpose of prediction intervals vs confidence intervals?
**A:**
1. **Confidence Intervals**
   ```R
   # For mean response
   predict(model, newdata, interval="confidence")
   ```
   - Uncertainty in population mean

2. **Prediction Intervals**
   ```R
   # For individual predictions
   predict(model, newdata, interval="prediction")
   ```
   - Uncertainty in individual predictions