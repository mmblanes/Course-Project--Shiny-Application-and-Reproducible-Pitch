library(shiny)


shinyServer(function(input, output) {
  
  
 datos<-read.csv(file="indicadores_estupe.csv",head=TRUE,sep=";")
 data <- reactive({  
   xvar <- switch(input$vari,
                  Solicitados = datos$Total.Vales,
                  Entregados = datos$Total.Entregados,
                  Cancelados = datos$Total.Cancelados,
                  datos$Total.Cancelados)
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