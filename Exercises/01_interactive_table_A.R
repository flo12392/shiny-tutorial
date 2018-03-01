# Create an app that allows the user to first select a column.
# Then, the user should be able to select a value from that column
# Then output the table where the selected column is filtered on the selected value.

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
