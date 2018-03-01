Isolate
=======================

We can use `isolate` to use reactive elements in a function, but prevent invalidation whenever that element changes. Note that in the example below, the output is only recalculated whenever `input$x2` changes, since the reference to `input$x1` is wrapped in `isolate()`.

```{r,eval=FALSE}
library(shiny)

ui <- fluidPage(
  numericInput('x1','X1 = ',min=1,max=10,step=1,value=1),
  numericInput('x2','X2 = ',min=1,max=10,step=1,value=1),
  textOutput('text')
)

# The server function
server <- function(input,output)
{
  output$text <- renderText({
    isolate(x1 <- input$x1)
    x2 <- input$x2
    paste0('X1 + X2 = ', x1 + x2 )})
}

shinyApp(ui, server)
```
