#' Greedy Heuristic algorithm
#'
#' The idea behind a greedy algorithm is that in each step you choose the best item. The best item is here defined as the item with the highest value/weight ratio, chosen from the items not already packed. (One item can only be packed once.) You will add items one at a time until the allowed total weight is reached. If the total allowed weight is 1000 and the first item you pack has a weight of 400, the next item needs to have a weight of 600 or less to be allowed in the knapsack, etc.
#'
#' @param x data frame with two numeric variables v and w (i.e the value and weight for each item).
#' @param W numeric variable indicating the knapsack size.
#'
#' @return A list of the maximum knapsack value and the positions of the elements, i.e. items.
#' @export
#'
#' @examples
#' set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w = sample(1:4000, size = n, replace = TRUE), v = runif(n = n, 0, 10000))
#'
#' greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)
#' greedy_knapsack(x = knapsack_objects[1:1200,], W = 2000)
#'
greedy_knapsack <- function(x, W){
  stopifnot(is.data.frame(x) && all(x > 0))
  # Calculate ratio
  ratio <- x$v/x$w
  # Sort the items
  x <- x[order(ratio, decreasing = TRUE), ]
  item_i <- 1
  # Begin while loop
  while(sum(x$w[1:item_i]) <= W) {
    item_i = item_i + 1
  }
  # total value
  tot <- sum(x$v[1:(item_i-1)])
  # items packed
  elements <- as.numeric(rownames(x[1:(item_i-1),]))
  # Save result in list
  res <- list(value = tot, elements = elements)
  return(res)
}
