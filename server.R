#
# This is the server logic of the Airline Delay application


library(shiny)
library(ggplot2)
library(dplyr)

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

  delayMeans <- reactive({
    table <- group_by(showData(), Origin, Name)
    table <- summarise(table, MeanDelay = round(mean(DepDelay), 1))
    table

  })

  output$DelayPlot <- renderPlot({


    #Plot
    p <- ggplot(showData(), aes(x=Origin, y=DepDelay)) +
      geom_boxplot() +
      geom_jitter(shape=16, size=2, position=position_jitter(0.2), alpha=0.5, aes(color=Name))
    print(p)


  })

  output$DelayTable <- renderDataTable(delayMeans())



})
