App structure - global.R, ui.R, server.R 
=======================
  
In general, an app consists of three files:
  
* **global.R**. This contains code that is run before the application is launched. Objects that are created here are available in **ui.R** and **server.R**.
* **ui.R**. This contains the user interface; what is displayed where.
* **server.R**. This contains the server logic; this creates the objects to be displayed.

### global.R
```{r,eval=FALSE}
library(shiny)
```

### ui.R
```{r,eval=FALSE}
fluidPage(
selectInput('select','Pick one:',choices=LETTERS[1:10]),
textOutput('text')
)
```

### server.R
```{r,eval=FALSE}
server <- function(input,output)
{
  output$text <- renderText({paste0('You picked: ', input$select)})
}
```
