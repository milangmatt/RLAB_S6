x <- c(10,15,20,25,30,35,40,45,50)
y <- c(64,54,87,32,45,42,28,93,32)


cat("\nMean of X: ",mean(x))
cat("\nMedian of X: ",median(x))

quartiles<-quantile(x)
cat("\n1st quartile of X: ",quartiles[2])
cat("\n3rd quartile of X: ",quartiles[4])
cat("\nMinimum of X: ",min(x))
cat("\nMaximum of X: ",max(x))
boxplot(x,main="Boxplot of X")
cat("\nVariance of X and Y: ",var(x))
cat("\nCovariance of X and Y: ",cov(x,y))
cat("\nCorrelation of X and Y: ",cor(x,y))
cat("\n")