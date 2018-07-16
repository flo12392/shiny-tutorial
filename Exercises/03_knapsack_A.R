# Problem solving is difficult. Although; that's what people usually make you think. However, this does not 
# always have to be the case. Take sorting for example; there is a large variety of sorting algorithms that 
# vary in complexity and efficiency. Luckily there is bogosort; a sorting algorithm  that creates random 
# permutations of its input until it finds a permutation that is sorted.Or, explained with an analogy: Bogosort 
# is "to sort a deck of cards by throwing the deck into the air, picking the cards up at random, and repeating 
# the process until the deck is sorted.".

# We will implement a bogosort heuristic for the knapsack problem, although in this case we do not have an
# easy way to verify that we have found the optimal solution; so we'll just have to find a solution we are happy with.
# In the knapsack problem, we have a set of items with weights and values and a knapsack with limited capacity. 
# We want to maximize the value of the objects we put in our knapsack. In the bogosort approach, we will just put 
# random stuff in our knapsack until it's full, and then check the total value of the objects that are in our knapsack.
# The algorithm stops when we find a solution that we are happy with, or when we are tired.

# Note that the file '05_knapsack_helpers.R' has to either be in your working directory, or run this 
# app by clicking the 'Run App' button in RStudio.

# libraries
library(shiny)
library(shinydashboard)
library(DT)
source('03_knapsack_helpers.R')

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
                    DT::dataTableOutput('my_table')
                ),
                box(width=6,
                    plotOutput('my_plot'),
                    DT::dataTableOutput('raw_data')
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
                 new_solution = create_solution(df,capacity) 
                 new_score = score(df = df, solution = new_solution)
                 scores(c(scores(),new_score))
                 solutions(c(solutions(),list(new_solution)))
               })
  
  output$my_table <- DT::renderDataTable({
    df2 <- data.frame(solution = sapply(solutions(), function(x) { paste(x,collapse=', ')}),
                      score = scores())
    DT::datatable(df2,selection='single')
  })
  
  output$my_plot <- renderPlot({
    plot(1:length(scores()),scores(),xlim = c(1,max(20,length(scores()))),xlab='iteration',ylab='score')
  })
  
  output$raw_data <- DT::renderDataTable({
    if(is.null(input$my_table_rows_selected)) {
      return(df)
    }
    else {
      df <- df[df$id %in% solutions()[[input$my_table_rows_selected]],]
      return(df)
    }
  })
}

shinyApp(ui, server)