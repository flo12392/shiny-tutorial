# Create an app that allows the user to first select a column 'cyl', 'vs', 'am' or 'gear'.
# Then, the user should be able to select a value from that column.
# Then, output the table where the selected column is filtered on the selected value.

library(shiny)

ui <- fluidPage(
  selectInput('column','x-axis:', choices = '...'), # add the right choices
  selectizeInput('value','y-axis:', choices = NULL),
  tableOutput('table1')
)

# The server function
server <- function(input,output,session) 
{
  observeEvent(xxx, # Replace x with the right object.
               {
                updateSelectizeInput(session,inputId=xxx,choices=xxx)
               })
  
  output$table1 <- renderTable({
    plot(mtcars[[input$axis1]],mtcars[[input$axis2]])
  })
}

shinyApp(ui, server)
