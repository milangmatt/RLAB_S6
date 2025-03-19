# Euclidean distance function
euclidean_distance <- function(a, b) {
  sqrt(sum((a - b)^2))  # Correct formula for Euclidean distance
}

# Load the data
data_points <- read.csv("~/Milan_S6DS/KMeans.csv", header = FALSE)

# Set the number of clusters (k)
k <- as.numeric(readline(prompt = "Enter the number of centroids (k): "))

# Initialize centroids dataframe with k centroids
centroids <- data.frame(v1 = numeric(k), v2 = numeric(k))

# Manually input initial centroids
for(i in 1:k) {
  cat("Enter coordinates for centroid", i, ":\n")
  centroids$v1[i] <- as.numeric(readline(prompt = paste("v1 for centroid", i, ": ")))
  centroids$v2[i] <- as.numeric(readline(prompt = paste("v2 for centroid", i, ": ")))
}

# Initialize cluster assignments
cluster_assignment <- rep(0, nrow(data_points))

# Start the iteration process
iteration <- 1
while (TRUE) {
  # Assign each point to the nearest centroid
  for (i in 1:nrow(data_points)) {
    distances <- sapply(1:k, function(j) euclidean_distance(data_points[i, ], centroids[j, ]))
    cluster_assignment[i] <- which.min(distances)  # Assign to closest centroid
  }
  
  # Calculate new centroids
  new_centroids <- centroids
  for (i in 1:k) {
    if (any(cluster_assignment == i)) {
      new_centroids[i, ] <- colMeans(data_points[cluster_assignment == i, , drop = FALSE])
    }
  }
  
  # Display current iteration and centroid values
  cat("\nIteration:", iteration, "\n")
  
  for (i in 1:k) {
    cat("Cluster", i, "points:\n")
    print(data_points[cluster_assignment == i, , drop = FALSE])
    cat("\n")
  }
  
  cat("Centroids:\n")
  print(new_centroids)
  
  # If centroids haven't changed, stop the algorithm
  if (all(new_centroids == centroids)) {
    cat("\nFinal centroids:\n")
    print(new_centroids)
    break
  }
  
  # Update centroids and iterate
  centroids <- new_centroids
  iteration <- iteration + 1
}

# Plot the final clusters
plot(data_points[, 1], data_points[, 2], col = cluster_assignment, pch = 19, xlab = "x", ylab = "y", main = paste("K-means Clustering"))
points(new_centroids[, 1], new_centroids[, 2], col = "black", pch = 4, cex = 2)  # Plot centroids as black crosses
