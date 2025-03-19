x <- c(10,15,20,25,30,35,40,45,50)
y <- c(64,54,87,32,45,42,28,93,32)


cat("Mean of X: ",mean(x))
cat("Median of X: ",median(x))

quartiles<-quantile(x)
cat("1st quartile of X: ",quartiles[2])
cat("3rd quartile of X: ",quartiles[4])
cat("Minimum of X: ",min(x))
cat("Maximum of X: ",max(x))
boxplot(x,main="Boxplot of X")
cat("Variance of X and Y: ",var(x))
cat("Covariance of X and Y: ",cov(x,y))
cat("Correlation of X and Y: ",cor(x,y))