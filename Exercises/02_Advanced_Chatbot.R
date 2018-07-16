# It is even possible to create a complete chatbot in Shiny! We will illustrate 
# in this exercise that it is possible to create a fully functioning chatbot
# without all this Artificial Intelligence hocus-pocus that everyone is talking about.

# To illustrate this, we will create a Pikachu chatbot. It's vocabulary exists 
# out of two words; 'Pika' and 'Pikachu'. We will use our very own Pikachu named Mike.

library(shiny)

ui <- fluidPage(
  # Create an input called mode with two options; Friendly and Hostile.
  # Create an input where the user can enter his or her name. (textInput)
  # Create an input where the user can enter the greeting to Mike. (textInput)
  # Add an actionButton to send the message to Mike and get the response from the chatbot.
  hr(),
  img(src='pikachu.png')
)

# The server function
server <- function(input,output) 
{
  ( # Create a reactive/observe/observeEvent/reactiveVal to listen to input and fire the code chunk below.
               {
                 # text1 should be 'x: y', where x is the users name, and y is the greeting.
                 # text2 should be 'Mike: Pikachu.' when Mike is friendly.
                 # Otherwise it should be 'Mike: Pika!'
                 # If you are not familiar with it yet; paste0 can be used to paste strings easily.
                 
                 # We paste the two lines, and wrap in HTML and add <br> for a line break. 
                 finaltext = HTML(paste0(text1,'<br>',text2))
                 
                 # Show a modalDialog with the finaltext element.           
               })
  
}

shinyApp(ui, server)
