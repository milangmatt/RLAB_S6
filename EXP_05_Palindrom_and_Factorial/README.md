# Menu-Driven Program for Data Operations

## Aim
To implement a menu-driven program in R that performs various data operations including dataset merging, palindrome detection, matrix operations, and factorial calculations of Fibonacci numbers.

## Algorithm

### 1. Main Menu Implementation
```R
# Create infinite loop with menu options
while (TRUE) {
    # Display menu options
    # Read user choice
    # Execute corresponding operation
}
```

### 2. Dataset Merging (Option 1)
1. Create two sample dataframes with common ID column
```R
df1 <- data.frame(ID = c(1, 2, 3), Value1 = c("A", "B", "C"))
df2 <- data.frame(ID = c(1, 2, 4), Value2 = c("X", "Y", "Z"))
```
2. Merge dataframes using common ID
```R
merged_df <- merge(df1, df2, by = "ID", all = TRUE)
```

### 3. Palindrome Detection (Option 2)
1. Create dataframe with sample strings
2. Define palindrome checking function:
```R
is_palindrome <- function(x) {
    x == paste(rev(strsplit(x, NULL)[[1]]), collapse = "")
}
```
3. Apply function to find palindromes
4. Write results to CSV file

### 4. Matrix Operations (Option 3)
1. Create sample dataframe with numeric values
2. Calculate row-wise statistics:
   - Maximum using `apply(df, 1, max)`
   - Minimum using `apply(df, 1, min)`
3. Calculate column-wise statistics:
   - Maximum using `apply(df, 2, max)`
   - Minimum using `apply(df, 2, min)`

### 5. Fibonacci Factorial (Option 4)
1. Define Fibonacci series
```R
fibonacci_series <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
```
2. Create factorial function:
```R
factorial_fn <- function(x) {
    ifelse(x == 0, 1, prod(1:x))
}
```
3. Find matching Fibonacci numbers
4. Calculate their factorials

## Mathematical Background

1. **Palindrome Check**
   - String reversal and comparison
   - `string == reverse(string)`

2. **Matrix Operations**
   - Row-wise operations: R₁, R₂, ..., Rₙ
   - Column-wise operations: C₁, C₂, ..., Cₙ
   - Min(Rᵢ) = minimum element in row i
   - Max(Cⱼ) = maximum element in column j

3. **Factorial Calculation**
   - n! = n × (n-1) × (n-2) × ... × 2 × 1
   - Special case: 0! = 1

4. **Fibonacci Series**
   - F₍ₙ₎ = F₍ₙ₋₁₎ + F₍ₙ₋₂₎
   - First few terms: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34

## Complete Code
[See program.R for the complete implementation]