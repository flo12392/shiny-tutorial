# No cool description from this exercise I'm afraid; this one is boring. But if you need a break; here's a link to
# a joke to lighten the mood: 
# https://www.reddit.com/r/Jokes/comments/8vx7ym/a_lost_dog_strays_into_a_jungle_a_lion_sees_this/

# Anyway, the goal here is to create an app that allows the user to select the 'mpg','cyl' or 'disp' or 'hp' column 
# for both the x-axis and the y axis. Then create a scatter plot of those two columns. The user also wants to see the 
# dataframe with only the selected columns next to it. That last part sounds pretty useless. Why would you want to see 
# that?  Nobody knows. However, asking questions is not in the job description of a Data Scientist. So we will just go 
# ahead and execute this plan. We will use a reactive to store the dataframe with the subsetted columns.

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
    plot(dat()[,1],dat()[,2]) # or simply: plot(dat())
  })
}

shinyApp(ui, server)
