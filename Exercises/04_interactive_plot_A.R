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
           selectInput('axis1','x-axis:', choices = c('mpg','cyl','disp','hp')),
           selectInput('axis2','y-axis:', choices = c('mpg','cyl','disp','hp'))
    )
  ),
  fluidRow(
    column(width=6,
           plotOutput('plot1')
    ),
    column(width=6,
           tableOutput('table1')
    )
  )
)

# The server function
server <- function(input,output)
{
  dat <- reactive({
    mtcars[,c(input$axis1,input$axis2)]
  })
  
  output$table1 <- renderTable({
    dat()
  })
  
  output$plot1 <- renderPlot({
    plot(dat()[,1],dat()[,2])
  })
}

shinyApp(ui, server)
