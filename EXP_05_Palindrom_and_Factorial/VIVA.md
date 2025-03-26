# VIVA Questions and Answers

## R Programming Concepts

### Q1: What is the difference between merge() and rbind() in R?
**A:**
- `merge()`:
  - Combines data frames by matching values in specified columns
  - Similar to SQL JOIN operations
  - Syntax: `merge(x, y, by="column_name")`
- `rbind()`:
  - Combines data frames by stacking rows
  - Requires identical column names
  - Syntax: `rbind(df1, df2)`

### Q2: Explain the apply() function in R
**A:**
- Purpose: Applies function over array margins
- Syntax: `apply(X, MARGIN, FUN)`
- MARGIN:
  - 1 = row-wise
  - 2 = column-wise
```R
# Example
matrix <- matrix(1:9, nrow=3)
row_sums <- apply(matrix, 1, sum)  # Row-wise
col_means <- apply(matrix, 2, mean) # Column-wise
```

## Data Structures and Algorithms

### Q3: How does the palindrome checking algorithm work?
**A:**
1. String splitting: `strsplit(x, NULL)[[1]]`
2. Reversal: `rev()`
3. Recombining: `paste(., collapse="")`
4. Comparison: `original == reversed`

### Q4: Explain the time complexity of factorial calculation
**A:**
- Time Complexity: O(n)
- Space Complexity: O(1)
- Mathematical relation:
  ```
  T(n) = n * T(n-1)
  Base case: T(0) = 1
  ```

## Mathematical Concepts

### Q5: What is the relationship between Fibonacci numbers and factorial?
**A:**
- Fibonacci Growth Rate:
  - φ = (1 + √5)/2 ≈ 1.618
  - F(n) ≈ φⁿ/√5
- Factorial Growth Rate:
  - n! ≈ √(2πn)(n/e)ⁿ (Stirling's approximation)

### Q6: How do you handle matrix operations efficiently in R?
**A:**
1. Built-in Functions:
```R
# Element-wise operations
matrix1 * matrix2  # Hadamard product
matrix1 %*% matrix2  # Matrix multiplication
```
2. Performance Considerations:
   - Pre-allocate memory
   - Use vectorized operations
   - Avoid loops when possible

## File Operations

### Q7: Explain the CSV file handling in the program
**A:**
- Writing CSV:
```R
write.csv(data, file="path/to/file.csv", row.names=FALSE)
```
- Reading CSV:
```R
read.csv("path/to/file.csv")
```
- Parameters:
  - `row.names`: Include/exclude row numbers
  - `header`: Treat first row as headers
  - `sep`: Column separator

### Q8: What are the different ways to handle file paths in R?
**A:**
1. Absolute paths:
   - Windows: `"D:\\folder\\file.csv"`
   - Use forward slashes: `"D:/folder/file.csv"`
2. Relative paths:
   - `./` Current directory
   - `../` Parent directory
3. File.path():
```R
file.path("folder", "subfolder", "file.csv")
```

## Program Design

### Q9: Why use a menu-driven approach?
**A:**
1. Advantages:
   - User-friendly interface
   - Modular code structure
   - Easy to extend functionality
2. Implementation:
```R
while(TRUE) {
    choice <- menu(choices)
    switch(choice,
           "1"=function1(),
           "2"=function2(),
           ...
    )
}
```

### Q10: How would you improve the program's error handling?
**A:**
1. Input Validation:
```R
tryCatch({
    choice <- as.integer(readline())
    if(is.na(choice)) stop("Invalid input")
}, error=function(e) {
    message("Please enter a number")
})
```
2. File Operations:
```R
if(!file.exists(filepath)) {
    warning("File not found")
    return(NULL)
}
```