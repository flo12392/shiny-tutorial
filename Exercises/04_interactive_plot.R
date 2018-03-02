# Willem wants a car with more chairs, so that whenever he gets more children, they will easily 
# fit in his car. However, he only wants a car that outperforms his current car.
# Create an app that allows Willem to select the 'mpg','cyl' or 'disp' or 'hp' column for 
# both the x-axis and the y axis. Then create a scatter plot of those two columns.
# Willem also wants to see the dataframe with only the selected columns next to it.
# Therefore, we will use a reactive to store the dataframe with the subsetted columns.

library(shiny)

ui <- fluidPage(
  fluidRow(
    column(width=12,
           # Add inputs that enable the user to select columns for the x and y axis.
    )
  ),
  fluidRow(
    column(width=6,
           # Add the plot
    ),
    column(width=6,
           # Add the table
    )
  )
)

# The server function
server <- function(input,output)
{
  dat <- reactive({
    # return the dataframe with the two columns
  })
  
  output$table1 <- renderTable({
    # create the right table
  })
  
  output$plot1 <- renderPlot({
    # create the right plot
  })
}

shinyApp(ui, server)
