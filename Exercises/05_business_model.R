# Xiaowen has a new business model! She will just buy 10 new houses and rent them all out.
# However, she is unable to choose which houses to buy. Therefore, she develops an application
# that helps her narrow down her search.
# She think the city, the amount of bedrooms and the amount of baths is very important.
# Therefore, she wants to select a column, and subsequently select values from that column to filter on.


library(shiny)

df = read.table('http://www.rossmanchance.com/iscam2/data/housing.txt',sep='\t',header=T)

ui <- fluidPage(
  # Add an input to select a column here
  selectizeInput('value','Values: ', choices = NULL, multiple =T), # Initialize with choices = NULL
  tableOutput('table1')
)

# The server function
server <- function(input,output, session) 
{
  # Observer to update the choices of the input 'value' whenever the input$column changes
  observeEvent(..., 
               {
                 updateSelectizeInput(session,inputId='...',choices=...))
               })
  
  output$table1 <- renderTable({

          # If input$value is not null, filter the table
      
    return(df)
  })
}

shinyApp(ui, server)
