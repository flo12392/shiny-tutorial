# Create an app that allows the user to select the 'mpg','cyl' or 'disp' column for both the x-axis
# and the y axis. Then create a scatter plot of those two values.

library(shiny)

ui <- fluidPage(
  
  # Add inputs that enable the user to select columns for the x and y axis.
  
  plotOutput('plot1')
)

# The server function
server <- function(input,output)
{
  output$plot1 <- renderPlot({
    # Add the plot.
  })
}

shinyApp(ui, server)