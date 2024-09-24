# The knapsack solver R package

The package contains two different functions for solving what is called the knapsack problem. 

The knapsack problem is a discrete optimization problem where we have a knapsack that can take a limited weight W and we want to fill this knapsack with a number of items i = 1, ..., n, each with a weight w_i and a value v_i. The goal is to find the knapsack with the largest value of the elements added to the knapsack.

In this package a brute force search algorithm, and a greedy approximation algorithm is implemented.

![Knapsack](https://upload.wikimedia.org/wikipedia/commons/e/ec/19th_century_knowledge_hiking_and_camping_sheepskin_knapsack_sleeping_bag_rolled_up.jpg)

## Installation

run > `devtools::install_github("https://github.com/naz-h/knapsackR")` in R console.
