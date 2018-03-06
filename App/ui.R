dashboardPage(
  dashboardHeader(title='Shiny demo'),
  dashboardSidebar(
    sidebarMenu(id='sidebar',
                hr(style='margin-top:7px;margin-bottom:7px;border-top: 3px solid #000000;'),
                div(style='display:block;margin-left: 30px;margin-right: auto;',
                    div(style="display:inline-block",actionButton('btn_prev','Prev')),
                    div(style="display:inline-block",actionButton('btn_next','Next'))
                ),
                hr(style='margin-top:7px;margin-bottom:0px;border-top: 3px solid #000000;'),
                menuItem('Showcase',tabName='panel0',icon=icon('star-o')),
                menuItem('App components', tabName = 'panel1', icon = icon('cube')),
                menuItem('UI Components', tabName = 'panel2', icon = icon('cube')),
                menuItem('Server Components', tabName = 'panel3', icon = icon('cube')),
                menuItem('An example', tabName = 'panel4', icon = icon('lightbulb-o')),
                menuItem('Reactive conductors', tabName = 'panel5', icon = icon('random')),
                menuItem('Isolate', tabName = 'panel6', icon = icon('genderless')),
                menuItem('observeEvent & reactiveVal', tabName = 'panel7', icon = icon('external-link')),
                menuItem('Further resources', tabName = 'panel8', icon = icon('archive'))
    )
    
  ),
  dashboardBody(
    tags$head(
      tags$style(HTML("hr {border-top: 1px solid #000000;}"))
    ),
    tabItems(
      tabItem(tabName = "panel0",
              fluidRow(
                column(width=12,
                       tags$iframe(src='https://shiny.rstudio.com/gallery/see-more.html',
                                   width = '100%', height='950px')
                )
              )
      ),
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
                       includeMarkdown('markdown/server_components.md'),
                       img(src='reactivity.png',height=500)
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
      ),
      tabItem(tabName = "panel8",
              includeMarkdown('markdown/further_resources.md')
      )
      
    )
    
    
  )
)