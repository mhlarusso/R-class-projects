library(ggplot2)
require(shiny)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Investigation of Mammal Sleep Data"),
  # Sidebar with options for the data set
  sidebarLayout(
    sidebarPanel("Select the mammal's biological order:",
      selectInput("vore", label = "Vore", choices = c("omni", "herbi", "insecti", "carni")),
      sliderInput("Size of Points on Graph", "Size of Points on Graph", min = 1, max = 10, value = 5, step = 1, round = TRUE),
      checkboxGroupInput("Color Code Conservation Status", label = NULL, choices =  "Color Code Conservation Status")
  ),
  mainPanel(
    plotOutput("sleepPlot")
  )
)
)
)
