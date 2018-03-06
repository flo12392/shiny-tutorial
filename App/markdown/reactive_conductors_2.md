
Note that the operation `input$x * 2` is done in both outputs. It would make sense to make this code a **reactive expression** by putting this code in a `reactive`. Any other reactive element that depends on this value will invalidate whenever the `reactive` changes value.

If we do that, the server looks as follows:
  
  ```{r,eval=FALSE}
# The server function
server <- function(input,output)
{
  val <- reactive({input$x * 2})
  
  # Render the text object
  output$text <- renderText({paste0('X * 2 = ', val() )})
  
  # Render the second text object
  output$text2 <- renderText({paste0('X * 2 + 1 = ', val() + 1 )})
}
```

Note that we only multiply the input by two once now. Of course in this example, the gain in speed of the application is negligible, but this concept is essential for managing the code and performance in large applications. 