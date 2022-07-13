# This App predicts Texas housing sales based on the data set 'txhousing'
# collected in 2000-2015 per months and per city.

library(shiny)
library(ggplot2)

# Load data
data("txhousing")

shinyUI(fluidPage(
  titlePanel("Predict Texas housing median sale price per year"),
  sidebarLayout(
    sidebarPanel(
      selectInput("city", "City", (sort(unique(txhousing$city)))),
      sliderInput("sliderMonth", "Select month", min=1, max=12, value = 5, step=1),
      sliderInput("sliderYear", "Select year", min=2000, max=2015, value = 2005, step=1),
      checkboxInput("showModel1", "Show/Hide ModelFit", value = TRUE),
      submitButton("Submit")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Texas housing median sale price [10^3 $]"),
      textOutput("pred1")
    )
  )
))
