#
# This is the user-interface definition of the Airline Delay application

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Jan 2008 Departure Delays by Airport and Airline"),

  p("Select which Florida airports and airlines you are interested in and what the min/max delays are to compare the flight delays at each airport by airline."),

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
       selectInput("airports", "Airports (Multiselect)",
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
       selectInput("companies", "Airlines (Multiselect)",
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
       h2("Delay Distribution"),
       plotOutput("DelayPlot"),
       h3("Delay Details"),
       dataTableOutput("DelayTable")
    )
  )
))
