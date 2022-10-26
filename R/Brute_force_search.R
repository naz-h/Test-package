#' Brute force search
#'
#' The brute-force search goes through all possible alternatives and return the maximum value found. This approach is of complexity O(2^n) since all possible combinations 2^n needs to be evaluated.
#'
#' @param x data frame with two numeric variables v and w (i.e the value and weight for each item).
#' @param W numeric variable indicating the knapsack size.
#' @param parallel logical condition for parallel computing.
#'
#' @return A list of the maximum knapsack value and the positions of the elements, i.e. items.
#' @export
#'
#' @examples
#' library(parallel)
#' set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w = sample(1:4000, size = n, replace = TRUE), v = runif(n = n, 0, 10000))
#'
#' brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
#' brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500)
#' brute_force_knapsack(x = knapsack_objects[1:8,], W = 2000)
#' brute_force_knapsack(x = knapsack_objects[1:12,], W = 2000)
#'
#'
brute_force_knapsack <- function(x, W, parallel = FALSE){
  stopifnot(is.data.frame(x) && all(x > 0))
  elements <- vector()
  values <- 0
  # paralell computing
  if(parallel == FALSE){
    for(i in 1:(2^nrow(x)-1)){
      obj <- which(intToBits(i) == 1)

      if(sum(x$w[obj]) <= W && sum(x$v[obj]) > values){
        values <- sum(x$v[obj])
        elements <- obj
      }
    }
  } else {
    clust <- makeCluster(4) # Initiate cluster
    registerDoParallel(clust)
    foreach(i = 1:(2^nrow(x)-1)) %do% {
      obj <- which(intToBits(i) == 1)
      if(sum(x$w[obj]) <= W && sum(x$v[obj]) > values){
        values <- sum(x$v[obj])
        elements <- obj
      }
    }
    stopCluster(clust) # End cluster
  }
  # Save result in list
  lst <- list(value = values, elements = elements)
  return(lst)
}
