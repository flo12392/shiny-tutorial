dashboardPage(
  dashboardHeader(title='Shiny demo'),
  dashboardSidebar(
    sidebarMenu(id='sidebar',
                div(style='display:block;margin-left: auto;margin-right: auto;',
                    div(style="display:inline-block",actionButton('btn_prev','Prev')),
                    div(style="display:inline-block",actionButton('btn_next','Next'))
                ),
                menuItem('App components', tabName = 'panel1', icon = icon('chart')),
                menuItem('UI Components', tabName = 'panel2', icon = icon('chart')),
                menuItem('Server Components', tabName = 'panel3', icon = icon('chart')),
                menuItem('An example', tabName = 'panel4', icon = icon('chart')),
                menuItem('Reactive conductors', tabName = 'panel5', icon = icon('chart')),
                menuItem('Isolate', tabName = 'panel6', icon = icon('chart')),
                menuItem('observeEvent & reactiveVal', tabName = 'panel7', icon = icon('chart'))
                
    )
    
  ),
  dashboardBody(
    tags$head(
      tags$style(HTML("hr {border-top: 1px solid #000000;}"))
    ),
    tabItems(
      # First tab content
      tabItem(tabName = "panel1",
              fluidRow(
                column(width=12,
                       includeMarkdown('markdown/app_components.md')
                )
              )
      ),
      tabItem(tabName = "panel2",
              fluidRow(
                column(width=12,
                       includeMarkdown('markdown/UI_components.md')
                )
              )
      ),
      tabItem(tabName = "panel3",
              fluidRow(
                column(width=12,
                       includeMarkdown('markdown/server_components.md')
                )
              )
      ),
      tabItem(tabName = "panel4",
              fluidRow(
                column(width=12,
                       includeMarkdown('markdown/app_example.md')
                )
              ),
              hr(),
              fluidRow(
                column(width=12,
                       # Ask the user for input
                       selectInput('p4_select','Pick one:',choices=LETTERS[1:10]),
                       # Output the rendered text object
                       textOutput('p4_text') 
                )
              )
      ),
      tabItem(tabName = "panel5",
              fluidRow(
                column(width=12,
                       hr(),
                       includeMarkdown('markdown/reactive_conductors_1.md'),
                       numericInput('p5_x','X = ',min=1,max=10,step=1,value=1),
                       
                       # Output the rendered text object
                       textOutput('p5_text'),
                       textOutput('p5_text2'),
                       hr(),
                       includeMarkdown('markdown/reactive_conductors_2.md')
                       
                )
              )
      ),
      tabItem(tabName = "panel6",
              fluidRow(
                column(width=12,
                       includeMarkdown('markdown/isolate_1.md')
                )
              ),
              hr(),
              fluidRow(
                column(width=12,
                       numericInput('p6_x1','X1 = ',min=1,max=10,step=1,value=1),
                       numericInput('p6_x2','X2 = ',min=1,max=10,step=1,value=1),
                       textOutput('p6_text')
                )
              )
      ),
      tabItem(tabName = "panel7",
              fluidRow(
                column(width=12,
                       includeMarkdown('markdown/observeEvent_1.md'),
                       hr(),
                       actionButton('p7_btn1','Show pop-up!'),
                       actionButton('p7_btn2','Increment value!'),
                       hr()
                )
              )
      )
      
    )
    
    
  )
)