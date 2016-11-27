library(shiny)


shinyServer(function(input, output) {
  
 # Load the data.
 datos<-read.csv(file="estupe.csv",head=TRUE,sep=";")
 # Create a reactive data with tree posibilities
 data <- reactive({  
   xvar <- switch(input$vari,
                  Solicitados = datos$TotalVales,
                  Entregados = datos$TotalEntregados,
                  Cancelados = datos$TotalCancelados,
                  datos$TotalCancelados)
 })
  # Generate a plot of the data.
  output$plot <- renderPlot({
    v <- input$vari
    hist(data(), main=paste('Variable: ', v, sep=''))
  })
  
  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(data())
  })
  
  
})