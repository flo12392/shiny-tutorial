# Oh no! Freek has lost his moustache. run the ap to see where it has end up.
# We need to build an app that puts the moustache back in the correct place.
# For this to work, you require the png package first.

library(shiny)
library(png)

ui <- fluidPage(
  sliderInput('scale','Scale:',min=0,max=1,value=0.5,step=0.01),
  sliderInput('x','x:',min=-1,max=1,value=0,step=0.01),
  sliderInput('y','y:',min=-1,max=1,value=0,step=0.01),
  plotOutput('myplot',width = 500,height=500)
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
    
    scale = input$scale
    x_delta = input$x
    y_delta = input$y
    
    xleft = lim$usr[1] + (lim$usr[2]-lim$usr[1])*(0.5-0.5*scale)
    xright = lim$usr[1] + (lim$usr[2]-lim$usr[1])*(0.5+0.5*scale)
    ybottom = lim$usr[3] + (lim$usr[4]-lim$usr[3])*(0.5-0.5*scale)
    ytop = lim$usr[3] + (lim$usr[4]-lim$usr[3])*(0.5+0.5*scale)
    
    xleft = xleft + x_delta
    ybottom = ybottom + y_delta
    xright = xright + x_delta
    ytop = ytop + y_delta
    
    rasterImage(my_image, xleft, ybottom, xright, ytop)
    
    grid()
  })
  
}

shinyApp(ui, server)
