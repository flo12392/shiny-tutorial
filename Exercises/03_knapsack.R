# A team of office employees decides that they do not like their office, called the fusionweg.
# Therefore, they decide to secretly move a lot of the furniture to another office (moleculeweg)
# overnight. However, they can not move everything in such a brief time period, so they decide
# to move only the most valuable items. They model this as a knapsack problem; each item has a
# weight and value, and they want to maximize the value of goods moved, within the capacity constraint.

# Let's help them solve this with a very naive approach; We create a random solution when a button 
# is clicked, and plot it's score.

# Note that the file '05_knapsack_helpers.R' has to either be in your working directory, or run this 
# app by clicking the 'Run App' button in RStudio.

# libraries
library(shiny)
library(shinydashboard)
library(DT)
source('05_knapsack_helpers.R')

# parameters
set.seed(1)
df  = data.frame(id = LETTERS[1:10], 
                 weight = sample(1:10,10,replace=T), 
                 value = sample(1:10,10,replace=T),
                 stringsAsFactors = F)
capacity=20

ui <- dashboardPage(
  dashboardHeader(title='Knapsack'),
  dashboardSidebar(
    sidebarMenu(
      menuItem('Knapsack',tabName = 'knapsack',icon=icon('bag'))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "knapsack",
              fluidRow(
                box(width=12,
                    actionButton('run','Run!')
                )
              ),
              fluidRow(
                box(width=6,
                    ### TODO: Output the my_table object
                ),
                box(width=6,
                    ### TODO: Output the plot.
                    ### TODO: Output the raw_data object
                )
              )
      )
    )
  )
)
server <- function(input,output) 
{
  scores = reactiveVal(c())
  solutions = reactiveVal(list())
  
  observeEvent(input$run,
               {
                 ### TODO: Create a new solution called new_solution using the helper function
                 ### TODO: Calculate its score, and call that new_score
                 scores(c(scores(),new_score)) # we append the score to the reactiveVal
                 solutions(c(solutions(),list(new_solution)))
               })
  
  output$my_table <- DT::renderDataTable({
    # Create a dataframe with two columns.
    df2 <- data.frame(solution = sapply(solutions(), function(x) { paste(x,collapse=', ')}),
                      score = scores())
    
    DT::datatable(df2) # Add parameter selection = single, so onyl one row can be selected.
  })
  
  output$my_plot <- renderPlot({
    plot(1:length(scores()),scores(),xlim = c(1,max(20,length(scores()))),xlab='iteration',ylab='score')
  })
  
  output$raw_data <- DT::renderDataTable({
    # TODO: We can get the selected row in the other datatable (my_table), with
    # input$my_table_rows_selected. If that is null, return the entire df.
    # If it is not null, return only the rows of df where 
    # df$id is in solutions()[[input$my_table_rows_selected]]
    if() {
      
    }
    else {
      
    }
  })
}

shinyApp(ui, server)