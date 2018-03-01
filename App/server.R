server <- function(input, output, session)
{
  
  observeEvent(input$btn_next,
               {
                 selected = as.numeric(gsub("[^\\d]+", "", input$sidebar, perl=TRUE))
                 updateTabItems(session, 'sidebar', paste0('panel',selected+1))
               })
  
  observeEvent(input$btn_prev,
               {
                 selected = as.numeric(gsub("[^\\d]+", "", input$sidebar, perl=TRUE))
                 updateTabItems(session, 'sidebar', paste0('panel',selected-1))
               })
  
  
  # Panel 4 -------------------------------------------
  
  # Render the text object
  output$p4_text <- renderText({paste0('You picked: ', input$p4_select)})
  
  
  # Panel 5 -------------------------------------------
  
  p5_val <- reactive({input$p5_x * 2})
  
  # Render the text object
  output$p5_text <- renderText({paste0('X * 2 = ', p5_val() )})
  
  # Render the second text object
  output$p5_text2 <- renderText({paste0('X * 2 + 1 = ', p5_val() + 1 )})
  
  
  # Panel 6 -------------------------------------------
  
  output$p6_text <- renderText({
    isolate(x1 <- input$p6_x1)
    x2 <- input$p6_x2
    paste0('X1 + X2 = ', x1 + x2 )})
  
  
  # Panel 7 --------------------------------------------
  
  # Initialize the reactiveValue
  p7_val <- reactiveVal(1)
  
  # Observer that shows a modalDialog with the current value
  observeEvent(input$p7_btn1,
               {
                 showModal(modalDialog(
                   title = "Important message",
                   paste0("The current value is ", p7_val())
                 ))
               })
  
  # Observer that increments the reactiveValue val() by 1.
  observeEvent(input$p7_btn2,
               {
                 p7_val(p7_val()+1)
               })
  
}