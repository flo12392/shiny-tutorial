# Oh no! Freek has lost his moustache. run the app to see where it has end up.
# We need to build an app that puts the moustache back in the correct place.
# For this to work, you require the png package first.

library(shiny)
library(png)

ui <- fluidPage(
  fluidRow(
    column(width=4
           # Add a slider for the scale, between 0 and 1.
           # Add a slider for the x displacement, between 0 and 1.
           # Add a slider for the y displacement, between 0 and 1.
    ),
    column(width=8,
           plotOutput('myplot',width = 500,height=500)
    )
  )
)

# The server function
server <- function(input,output) 
{
  output$myplot <- renderPlot({
    
    # Add Freek to the plot.
    my_image=readPNG("www/Freek.png")
    plot(1:2, type='n', main="", xlab="x", ylab="y")
    lim <- par()
    rasterImage(my_image, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
    
    my_image=readPNG("www/moustache.png")
    xleft = lim$usr[1]
    ybottom = lim$usr[3]
    xright = lim$usr[2]
    ytop = lim$usr[4]
    
    scale = 1 # Value of the scale slider
    x_delta = 0 # Value of the x slider
    y_delta = 0 # Value of the y slider
    
    xleft = lim$usr[1] + (lim$usr[2]-lim$usr[1])*(0.5-0.5*scale)
    xright = lim$usr[1] + (lim$usr[2]-lim$usr[1])*(0.5+0.5*scale)
    ybottom = lim$usr[3] + (lim$usr[4]-lim$usr[3])*(0.5-0.5*scale)
    ytop = lim$usr[3] + (lim$usr[4]-lim$usr[3])*(0.5+0.5*scale)
    
    xleft = xleft + x_delta
    ybottom = ybottom + y_delta
    xright = xright + x_delta
    ytop = ytop + y_delta
    
    rasterImage(my_image, xleft, ybottom, xright, ytop)
    
    grid(NA)
  })
  
}

shinyApp(ui, server)
