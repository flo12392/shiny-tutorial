# Xiaowen has a new business model! She will just buy 10 new houses and rent them all out.
# However, she is unable to choose which houses to buy. Therefore, she develops an application
# that helps her narrow down her search.
# She think the city, the amount of bedrooms and the amount of baths is very important.
# Therefore, she wants to select a column, and subsequently select values from that column to filter on.


library(shiny)

df = read.table('http://www.rossmanchance.com/iscam2/data/housing.txt',sep='\t',header=T)

ui <- fluidPage(
  selectInput('column','Column: ', choices = c('City','bedrooms','baths')),
  selectizeInput('value','Values: ', choices = NULL, multiple =T),
  tableOutput('table1')
)

# The server function
server <- function(input,output, session) 
{
  observeEvent(input$column, 
               {
                 updateSelectizeInput(session,inputId='value',choices=unique(df[[input$column]]))
               })
  
  output$table1 <- renderTable({
    if(!is.null(input$value))
      df = df[ df[[input$column]] %in% input$value,]
    return(df)
  })
}

shinyApp(ui, server)
