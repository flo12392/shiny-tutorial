An example app
=======================

It is possible to create a shinyApp as a single file called **app.R** with the following structure, which can also be run by running the code in the console:

```{r,eval=FALSE}
library(shiny)

# The user interface
ui <- fluidPage(

# Ask the user for input
selectInput('select','Pick one:',choices=LETTERS[1:10]),

# Output the rendered text object
textOutput('text')
)

# The server function
server <- function(input,output)
{
  # Render the text object
  output$text <- renderText({paste0('You picked: ', input$select)})
}

shinyApp(ui, server)
```

This will create the application that is shown below. Here, `input$select` is the reactive source, while `output$text` is the reactive endpoint. Note that when `input$select` changes, `output$text` invalidates automatically, and its value is updated.
