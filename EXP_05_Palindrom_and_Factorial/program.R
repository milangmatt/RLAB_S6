menu_driven_program <- function() {
  while (TRUE) {
    cat("\n---- MENU ----\n")
    cat("1. Merge Datasets\n")
    cat("2. Find palindrome and write to file\n")
    cat("3. Min and Max of row and column\n")
    cat("4. Factorial of Fibonacci\n")
    cat("5. Exit\n")
    choice <- as.integer(readline("Enter your choice: "))
    
    if (choice == 1) {
      df1 <- data.frame(ID = c(1, 2, 3), Value1 = c("A", "B", "C"))
      df2 <- data.frame(ID = c(1, 2, 4), Value2 = c("X", "Y", "Z"))
      merged_df <- merge(df1, df2, by = "ID", all = TRUE)
      print("Merged DataFrame:")
      print(merged_df)
      
    } else if (choice == 2) {
      df <- data.frame(Names = c("madam", "hello", "world", "level","malayalam"))
      is_palindrome <- function(x) x == paste(rev(strsplit(x, NULL)[[1]]), collapse = "")
      palindromes <- df$Names[sapply(df$Names, is_palindrome)]
      print("Palindromes Found:")
      print(palindromes)
      write.csv(data.frame(Palindromes = palindromes), "D:\\Projects\\LAB\\RLAB_S6\\EXP_05_Palindrom_and_Factorial\\palindrome.csv", row.names = FALSE)
      cat("Palindromes written to 'palindrome.csv'\n")
      
    } else if (choice == 3) {
      df <- data.frame(A = c(1, 5, 9), B = c(4, 7, 2), C = c(3, 6, 8))
      cat("Max of each row:\n")
      print(apply(df, 1, max))
      cat("Min of each row:\n")
      print(apply(df, 1, min))
      cat("Max of each column:\n")
      print(apply(df, 2, max))
      cat("Min of each column:\n")
      print(apply(df, 2, min))
      
    } else if (choice == 4) {
      df <- data.frame(Values = c(1, 2, 3, 4, 5))
      fibonacci_series <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)  
      factorial_fn <- function(x) ifelse(x == 0, 1, prod(1:x))
      matching_fib <- df$Values[df$Values %in% fibonacci_series]
      factorial_values <- sapply(matching_fib, factorial_fn)
      result_df <- data.frame(Fibonacci = matching_fib, Factorial = factorial_values)
      print("Factorials of Fibonacci Elements in DataFrame:")
      print(result_df)
      
    } else if (choice == 5) {
      cat("Exiting program.\n")
      break
      
    } else {
      cat("Invalid choice. Please try again.\n")
    }
  }
}

menu_driven_program()
