observeEvent & reactiveVal
=======================

In Shiny applications, we use reactive expressions that output calculated values, and observers to cause so called side-effects. `reactive` is the most commonly used reactive expression. Another example is the `reactiveVal`, which you can use to store and update a value. You can call the value of a `reactiveVal` called `x` with `x()`, and set its value to `y` with `x(y)`. Any reactive element that uses this value will then take a dependency on it, and thus invalidate when the `reactiveVal` changes value. We can update the `reactiveVal` using observers.

One example of an observer is `observe`, which invalidates whenever a reactive element in its body changes value. Unlike reactive expressions, observers do not return any value. They are purely used for their side-effects, such as showing a pop-up, resetting an input, or changing a `reactiveVal`'s value.

The `observeEvent`, defined as `observeEvent(x,{y})` is very similar to `observe`, except that it only invalidates whenever `x` changes, and it is not dependent on reactive expressions in y.

An example is shown below.

```{r,eval=FALSE}
library(shiny)

ui <- fluidPage(
  actionButton('btn1','Show pop-up!'),
  actionButton('btn2','Increment value!')
)

# The server function
server <- function(input,output)
{
  # Initialize the reactiveValue
  val <- reactiveVal(1)
  
  # Observer that shows a modalDialog with the current value
  observeEvent(input$btn1,
               {
                 showModal(modalDialog(
                   title = "Important message",
                   paste0("The current value is ", val())
                 ))
               })
  
  # Observer that increments the reactiveValue val() by 1.
  observeEvent(input$btn2,
               {
                 val(val()+1)
               })
  
}

shinyApp(ui, server)
```
