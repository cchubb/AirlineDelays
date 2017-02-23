#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

delays <- readRDS("delays.rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  #Filter
  showData <- reactive({
    subset(delays, DepDelay >= input$delayMin &
             DepDelay <= input$delayMax &
             Origin %in% input$airports &
             Description %in% input$companies)
  })

  output$DelayPlot <- renderPlot({


    #Plot
    #qplot(Origin, DepDelay, data=showData(), geom=c("boxplot"), fill=Origin)
    p <- ggplot(showData(), aes(x=Origin, y=DepDelay)) +
      geom_boxplot() +
      geom_jitter(shape=16, size=2, position=position_jitter(0.2), alpha=0.5, aes(color=Name))
    print(p)


  })



})
