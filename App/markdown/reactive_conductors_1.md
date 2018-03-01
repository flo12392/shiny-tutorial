Reactive conductors
=======================

Sometimes, one operation is done at multiple places in an application, for example in the application below: 

```{r,eval=FALSE}
library(shiny)

# The user interface
ui <- fluidPage(

# Ask the user for input
numericInput('x','X = ',min=1,max=10,step=1,value=1),

# Output the rendered text object
textOutput('text'),
textOutput('text2')
)

# The server function
server <- function(input,output)
{
# Render the text object
output$text <- renderText({paste0('X * 2 = ', input$x * 2 )})

# Render the second text object
output$text2 <- renderText({paste0('X * 2 + 1 = ', input$x * 2 + 1 )})
}

shinyApp(ui, server)
```
