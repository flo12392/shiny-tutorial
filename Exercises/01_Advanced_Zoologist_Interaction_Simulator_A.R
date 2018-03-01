# Now we have learned the basics of Shiny. We can create Artificial Intelligence.
# In this case, we create a Advanced Zoologist Interaction Simulator (AZIS), 
# To simulate the response of a Zoologist when it is greeted.
# The AZIS should have two personality options; friendly or hostile.

library(shiny)

ui <- fluidPage(
  selectInput('mode', 'Mode: ', choices = c('Friendly','Hostile')),
  textInput('name', 'Your name: '),
  textInput('greeting', 'Your greeting: '),
  actionButton('interact', 'Interact!')
)

# The server function
server <- function(input,output) 
{
  observeEvent(input$interact, 
               {
                 text1 = paste0(input$name,': ', input$greeting)
                 text2 = paste0('AZIS: ', ifelse(input$mode=='Friendly','Hello!','I do not like your face.'))
                 finaltext = HTML(paste0(text1,'<br>',text2))
                 
                 showModal(modalDialog(
                   title = "Advanced Zoologist Interaction Simulator",
                   finaltext
                 ))               
               })
  
}

shinyApp(ui, server)
