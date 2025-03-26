# K-Means Clustering Implementation

## Aim
To implement the K-means clustering algorithm from scratch in R, including distance calculation, centroid assignment, and visualization of clusters.

## Algorithm

### 1. Data Preparation
1. Define Euclidean distance function
```R
euclidean_distance <- function(a, b) {
    sqrt(sum((a - b)^2))
}
```
2. Load dataset from CSV file
```R
data_points <- read.csv("dataset.csv", header = FALSE)
```

### 2. Initialization
1. Get number of clusters (k) from user
2. Initialize k centroids with user input coordinates
```R
centroids <- data.frame(v1 = numeric(k), v2 = numeric(k))
```

### 3. Clustering Process
1. **Assignment Step**
   - For each data point:
     * Calculate distance to each centroid
     * Assign point to nearest centroid
   ```R
   distances <- sapply(1:k, function(j) 
                      euclidean_distance(data_points[i, ], centroids[j, ]))
   cluster_assignment[i] <- which.min(distances)
   ```

2. **Update Step**
   - For each cluster:
     * Calculate mean of all points in cluster
     * Update centroid to new mean position
   ```R
   new_centroids[i, ] <- colMeans(data_points[cluster_assignment == i, ])
   ```

3. **Convergence Check**
   - Compare new and old centroids
   - If no change, algorithm has converged
   ```R
   if (all(new_centroids == centroids)) break
   ```

### 4. Visualization
1. Plot data points with cluster colors
2. Mark centroids with black crosses
```R
plot(data_points[, 1], data_points[, 2], 
     col = cluster_assignment,
     pch = 19,
     main = "K-means Clustering")
points(new_centroids[, 1], new_centroids[, 2], 
       col = "black", pch = 4, cex = 2)
```

## Mathematical Background

1. **Euclidean Distance**
   ```
   d(p,q) = √((p₁-q₁)² + (p₂-q₂)²)
   ```

2. **Centroid Calculation**
   ```
   centroid = (Σxᵢ/n, Σyᵢ/n)
   ```
   where n is number of points in cluster

3. **Objective Function**
   ```
   J = Σᵢ₌₁ᵏ Σₓ∈Cᵢ ||x - μᵢ||²
   ```
   where μᵢ is the centroid of cluster Cᵢ