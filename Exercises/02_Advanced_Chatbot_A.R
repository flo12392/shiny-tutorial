# It is even possible to create a complete chatbot in Shiny! We will illustrate 
# in this exercise that it is possible to create a fully functioning chatbot
# without all this Artificial Intelligence hocus-pocus that everyone is talking about.

# To illustrate this, we will create a Pikachu chatbot. It's vocabulary exists 
# out of two words; 'Pika' and 'Pikachu'. We will use our very own Pikachu named Mike.

library(shiny)

ui <- fluidPage(
  selectInput('mode', 'Mode: ', choices = c('Friendly','Hostile')),
  textInput('name', 'Your name: '),
  textInput('greeting', 'Your greeting: '),
  actionButton('interact', 'Interact!'),
  hr(),
  img(src='pikachu.png')
  
)

# The server function
server <- function(input,output) 
{
  observeEvent(input$interact, 
               {
                 text1 = paste0(input$name,': ', input$greeting)
                 text2 = paste0('Mike: ', ifelse(input$mode=='Friendly','Pikachu.','Pika!'))
                 finaltext = HTML(paste0(text1,'<br>',text2))
                 
                 showModal(modalDialog(
                   title = "Pikachu Chatbot",
                   finaltext
                 ))               
               })
  
}

shinyApp(ui, server)
