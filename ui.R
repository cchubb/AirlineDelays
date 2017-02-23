#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Jan 2008 Departure Delays by Airport and Airline"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       sliderInput("delayMin",
                   "Min Delay:",
                   min = -25,
                   max = 120,
                   value = 0),
       sliderInput("delayMax",
                   "Max Delay:",
                   min = 0,
                   max = 120,
                   value = 60),
       selectInput("airports", "Airports",
                   c("Fort Lauderdale" = "FLL",
                     "Jacksonville" = "JAX",
                     "Orlando" = "MCO",
                     "Miami" = "MIA",
                     "Tampa" = "TPA"),
                   selected=c("Fort Lauderdale" = "FLL",
                              "Jacksonville" = "JAX",
                              "Orlando" = "MCO",
                              "Miami" = "MIA",
                              "Tampa" = "TPA"),
                   multiple = TRUE,
                   selectize=FALSE, size = 5),
       selectInput("companies", "Companies",
                   c("AirTran Airways Corporation",
                     "Alaska Airlines Inc.",
                     "American Airlines Inc.",
                     "American Eagle Airlines Inc.",
                     "Comair Inc.",
                     "Continental Air Lines Inc.",
                     "Delta Air Lines Inc.",
                     "Expressjet Airlines Inc.",
                     "Frontier Airlines Inc.",
                     "JetBlue Airways",
                     "Mesa Airlines Inc.",
                     "Northwest Airlines Inc.",
                     "Pinnacle Airlines Inc.",
                     "Southwest Airlines Co.",
                     "United Air Lines Inc."),
                   selected=c("AirTran Airways Corporation",
                              "Alaska Airlines Inc.",
                              "American Airlines Inc.",
                              "American Eagle Airlines Inc.",
                              "Comair Inc.",
                              "Continental Air Lines Inc.",
                              "Delta Air Lines Inc.",
                              "Expressjet Airlines Inc.",
                              "Frontier Airlines Inc.",
                              "JetBlue Airways",
                              "Mesa Airlines Inc.",
                              "Northwest Airlines Inc.",
                              "Pinnacle Airlines Inc.",
                              "Southwest Airlines Co.",
                              "United Air Lines Inc."),
                   multiple = TRUE,
                   selectize=FALSE, size = 10),
       submitButton("Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("DelayPlot")
    )
  )
))
