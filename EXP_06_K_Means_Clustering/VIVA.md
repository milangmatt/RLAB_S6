# VIVA Questions and Answers

### Q1: What is K-means clustering and why is it used?
**A:**
- Unsupervised machine learning algorithm
- Groups similar data points into k clusters
- Uses:
  1. Customer segmentation
  2. Pattern recognition
  3. Image compression
  4. Data preprocessing

### Q2: Explain the importance of choosing initial centroids
**A:**
- Impact on convergence speed
- Can affect final clustering result
- Methods for selection:
  1. Random initialization
  2. K-means++
  3. Strategic placement
- Multiple runs with different initializations recommended

### Q3: What is the time complexity of K-means?
**A:**
- Overall complexity: O(tknd)
  * t = number of iterations
  * k = number of clusters
  * n = number of points
  * d = number of dimensions
- Steps:
  1. Assignment: O(knd)
  2. Update: O(nd)

### Q4: How do you determine the optimal number of clusters?
**A:**
Methods:
1. **Elbow Method**
```R
wcss <- vector()
for(i in 1:10) {
    wcss[i] <- sum(kmeans(data, i)$withinss)
}
plot(1:10, wcss, type="b")
```

2. **Silhouette Analysis**
```R
library(cluster)
silhouette_score <- silhouette(clusters, dist(data))
```

### Q5: What are the limitations of K-means clustering?
**A:**
1. **Algorithm Limitations**
   - Requires pre-specified k
   - Sensitive to outliers
   - May converge to local optima

2. **Data Limitations**
   - Assumes spherical clusters
   - Struggles with:
     * Different cluster sizes
     * Non-globular shapes
     * Varying densities

### Q6: How does the Euclidean distance function work in clustering?
**A:**
1. **Formula**:
   ```
   d = √(Σ(xᵢ - yᵢ)²)
   ```

2. **Implementation**:
```R
euclidean_distance <- function(a, b) {
    sqrt(sum((a - b)^2))
}
```

### Q7: Explain the convergence criteria in K-means
**A:**
1. **Stopping Conditions**:
   - No change in centroids
   - Maximum iterations reached
   - Error threshold achieved

2. **Implementation**:
```R
if (all(new_centroids == centroids)) {
    break
}
```

### Q8: What are alternative clustering algorithms?
**A:**
1. **Hierarchical Clustering**
```R
hclust(dist(data))
```

2. **DBSCAN**
```R
library(dbscan)
dbscan(data, eps=0.5, minPts=5)
```

3. **Mean Shift**
4. **Spectral Clustering**

### Q9: How do you handle categorical variables in K-means?
**A:**
Methods:
1. **One-hot encoding**
```R
model.matrix(~factor_variable-1)
```

2. **Distance measures**:
   - Gower distance
   - Hamming distance
   
3. **K-modes algorithm** for categorical data

### Q10: Explain cluster validation techniques
**A:**
1. **Internal Validation**:
   - Silhouette coefficient
   - Davies-Bouldin index
   - Calinski-Harabasz index

2. **External Validation**:
   - Rand index
   - Adjusted Rand index
   
3. **Implementation**:
```R
library(clValid)
validate <- clValid(data, 2:6, clMethods="kmeans")
```