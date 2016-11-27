#library(shiny)

# Define UI for create the tool
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Outputs (my assignment)"),

  sidebarPanel(
    radioButtons("vari", "Variable:",
                 list("Vales Generados"="Solicitados" ,
                      "Vales Entregados"="Entregados",
                      "Vales Cancelados"="Cancelados" ))
   
  ),
  
  # Show a tabset that includes a plot and summary of data
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot")), 
      tabPanel("Summary", verbatimTextOutput("summary"))
    )
  )
))