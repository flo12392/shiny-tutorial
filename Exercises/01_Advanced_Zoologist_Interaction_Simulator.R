# Now we have learned the basics of Shiny. We can create Artificial Intelligence.
# In this case, we create a Advanced Zoologist Interaction Simulator (AZIS), 
# To simulate the response of a Zoologist when it is greeted.
# The AZIS should have two personality options; friendly or hostile.

library(shiny)

ui <- fluidPage(
  # Create an input called mode with two options; Friendly and Hostile.
  # Create an input where the user can enter his or her name. (textInput)
  # Create an input where the user can enter the greeting to AZIS. (textInput)
  # Add an actionButton to start the interaction simulator.
  hr(),
  img(src='zoologist.jpg')
)

# The server function
server <- function(input,output) 
{
  observeEvent(NULL, # When should this observer fire?
               {
                 # text1 should be 'x: y', where x is the users name, and y is the greeting.
                 # text2 should be 'AZIS: Hello' when AZIS is friendly.
                 # Otherwise it should be 'AZIS: I do not like your face.'
                 # If not familiar with it yet; paste0 can be used to paste strings easily.
                 
                 # We paste the two lines, and wrap in HTML and add <br> for a line break. 
                 finaltext = HTML(paste0(text1,'<br>',text2))
                 
                 # Show a modalDialog with the finaltext element.           
               })
  
}

shinyApp(ui, server)
