# Oh no! Mark Rutte is trying to impress the chair of the House of Representatives by
# staring her sensually in the eyes while stirring his coffee. However, we all know that 
# he does not stand a chance without the appropriate facial hair.
# We shall help him impress the lady by building an app that puts a moustache on his face.
# For this to work, you require the png package first.

library(shiny)
library(png)

ui <- fluidPage(
  fluidRow(
    column(width=4,
           sliderInput('scale','Scale:',min=0,max=1,value=0.5,step=0.01),
           sliderInput('x','x:',min=-1,max=1,value=0,step=0.01),
           sliderInput('y','y:',min=-1,max=1,value=0,step=0.01)
    ),
    column(width=8,
           plotOutput('myplot',width = 1000,height=720)
    )
  )
)

# The server function
server <- function(input,output) 
{
  output$myplot <- renderPlot({
    
    # Add Freek to the plot.
    my_image=readPNG("www/rutte.png")
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
    
    grid(NA)
  })
  
}

shinyApp(ui, server)
