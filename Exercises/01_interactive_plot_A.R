# Create an app that allows the user to select the 'mpg','cyl' or 'disp' column for both the x-axis
# and the y axis. Then create a scatter plot of those two values.

library(shiny)

ui <- fluidPage(
  selectInput('axis1','x-axis:', choices = c('mpg','cyl','disp')),
  selectInput('axis2','y-axis:', choices = c('mpg','cyl','disp')),
  plotOutput('plot1')
)

# The server function
server <- function(input,output)
{
  output$plot1 <- renderPlot({
    plot(mtcars[[input$axis1]],mtcars[[input$axis2]])
  })
}

shinyApp(ui, server)
