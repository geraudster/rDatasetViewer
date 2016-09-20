#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(futile.logger)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$datasetControl <- renderUI({
    datasets <- data()$results[,3]
    selectInput("datasets", "Choose Dataset", datasets)
  })
  
  output$distPlot <- renderPlot({
    data(list = c(input$datasets))
    dataset <- get(input$datasets)
    flog.info('Displaying plot for dataset %s, class %s', input$datasets, class(dataset))
    plot(dataset)
  })
  
  output$datasetTable <- renderDataTable({
    data(list = c(input$datasets))
    dataset <- get(input$datasets)
    flog.info('Displaying table for dataset %s, class %s', input$datasets, class(dataset))
    as.data.frame(dataset)
  },
  options = list(pageLength = 5))
  
})
