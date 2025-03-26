# VIVA Questions and Answers

### Q1: What are the key differences between Decision Trees and SVMs?
**A:**
1. **Decision Trees**
   - Hierarchical split-based decisions
   - Easy to interpret
   - Handle both numerical and categorical data
   
2. **SVM**
   - Hyperplane-based separation
   - Better for high-dimensional data
   - Requires feature scaling

### Q2: Explain the concept of kernel trick in SVM
**A:**
- **Purpose**: Transform non-linear data to linear-separable space
- **Common Kernels**:
  ```R
  # Linear
  svm(data, kernel = "linear")
  
  # RBF (Gaussian)
  svm(data, kernel = "radial")
  
  # Polynomial
  svm(data, kernel = "polynomial")
  ```

### Q3: How does C5.0 differ from other decision tree algorithms?
**A:**
1. **Improvements over C4.5**:
   - Faster execution
   - Memory efficiency
   - Smaller decision trees
   
2. **Features**:
   - Boosting capability
   - Variable misclassification costs
   - Winnowing attributes

### Q4: What are the pruning techniques in decision trees?
**A:**
1. **Pre-pruning**
   ```R
   # Control tree growth
   C5.0(data, minCases = 5)
   ```

2. **Post-pruning**
   ```R
   # Confidence factor (lower = more pruning)
   C5.0(data, cf = 0.25)
   ```

### Q5: How do you handle imbalanced datasets in both algorithms?
**A:**
1. **Decision Trees**
   ```R
   # Using weights
   C5.0(data, weights = case_weights)
   ```

2. **SVM**
   ```R
   # Class weights
   svm(data, class.weights = c("0"=2, "1"=1))
   ```

### Q6: Explain the concept of support vectors
**A:**
- **Definition**: Points closest to decision boundary
- **Importance**:
  - Define margin
  - Determine decision boundary
  - Impact model complexity
```R
# Get support vectors
model$SV  # Access support vectors
```

### Q7: How do you evaluate model performance?
**A:**
1. **Metrics**
   ```R
   # Confusion Matrix
   table(predicted, actual)
   
   # Accuracy
   mean(predicted == actual)
   
   # ROC Curve
   library(ROCR)
   prediction(probabilities, labels)
   ```

2. **Cross-validation**
   ```R
   library(caret)
   train_control <- trainControl(method = "cv", number = 10)
   ```

### Q8: What are the hyperparameters in SVM and how do you tune them?
**A:**
1. **Key Parameters**:
   - Cost (C)
   - Gamma (γ)
   - Kernel type

2. **Tuning**:
   ```R
   # Grid search
   tune.svm(formula, data, 
           gamma = 2^(-1:1),
           cost = 2^(2:4))
   ```

### Q9: How do you handle missing values?
**A:**
1. **Decision Trees**
   ```R
   # C5.0 handles missing values internally
   model <- C5.0(data_with_NA)
   ```

2. **SVM**
   ```R
   # Imputation required
   library(mice)
   imputed_data <- mice(data)
   ```

### Q10: Explain complexity vs performance tradeoff
**A:**
1. **Decision Trees**
   - Deeper trees → Higher complexity
   - Risk of overfitting
   ```R
   # Control depth
   C5.0(data, maxdepth = 5)
   ```

2. **SVM**
   - Higher C → More complex boundary
   - Risk of overfitting
   ```R
   # Balance complexity
   svm(data, cost = 1, kernel = "radial")
   ```