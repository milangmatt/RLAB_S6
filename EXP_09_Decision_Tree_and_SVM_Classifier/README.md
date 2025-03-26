# Decision Tree and SVM Classification

## Aim
To implement and compare Decision Tree (C5.0) and Support Vector Machine (SVM) classifiers for different classification problems: lens type prediction and currency forgery detection.

## Algorithm

### 1. Decision Tree Implementation
1. **Data Preparation**
   ```R
   # Load and preprocess data
   lenses_data <- read.csv("dataset_desicion_tree.csv")
   
   # Convert categories to factors
   lenses_data$age <- factor(lenses_data$age, 
                            levels = c("young", "pre-presbyopic", "presbyopic"))
   ```

2. **Model Building**
   ```R
   # Train C5.0 model
   model <- C5.0(class ~ age + prescription + astigmatic + tear_rate, 
                 data = lenses_data)
   ```

3. **Visualization and Prediction**
   ```R
   # Plot decision tree
   plot(model, main = "Decision Tree Visualization", type = "simple")
   
   # Make predictions
   prediction <- predict(model, test_data)
   ```

### 2. SVM Classification
1. **Data Processing**
   ```R
   # Load and prepare data
   banknote_data <- read.csv("dataset_svm.csv")
   
   # Split training/testing
   set.seed(123)
   train_indices <- sample(1:nrow(banknote_data), 
                          0.8 * nrow(banknote_data))
   ```

2. **Model Creation**
   ```R
   # Train SVM with RBF kernel
   svm_model <- svm(class ~ variance + skewness, 
                    data = train_data, 
                    kernel = "radial")
   ```

3. **Visualization**
   ```R
   # Plot decision boundary
   ggplot() +
     geom_tile(data = grid, aes(x = variance, y = skewness, 
               fill = class), alpha = 0.3) +
     geom_contour(data = grid, 
                  aes(x = variance, y = skewness, 
                      z = as.numeric(class)))
   ```

## Mathematical Background

### Decision Tree
1. **Information Gain**
   ```
   IG(T,a) = H(T) - H(T|a)
   ```
   where:
   - H(T) = Entropy of target
   - H(T|a) = Conditional entropy

2. **Entropy**
   ```
   H(X) = -Σ p(x) log₂(p(x))
   ```

### Support Vector Machine
1. **Kernel Function (RBF)**
   ```
   K(x,y) = exp(-γ||x-y||²)
   ```

2. **Decision Boundary**
   ```
   f(x) = Σᵢ αᵢyᵢK(xᵢ,x) + b
   ```
   where:
   - αᵢ = Lagrange multipliers
   - yᵢ = Class labels
   - b = Bias term