# Create a solution to the knapsack problem.
# df should have columns id, weight and value.
create_solution <- function(df, capacity)
{
  solution = c()
  knapsack_full = F
  while(!knapsack_full)
  {
    new = c(solution,sample(df$id[!df$id %in% solution],1))
    if(sum(df$weight[df$id %in% solution])>capacity)
      knapsack_full=T
    else
      solution = new
  }
  return(solution)
}

# Calculate the score of a solution.
score <- function(df, solution)
{
  return(sum(df$value[df$id %in% solution]))
}