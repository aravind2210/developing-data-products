library(shiny)
dataset <- mtcars
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict horsepower from no of cylinders and miles per gallon"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("SliderMpg",
                   "Miles per Gallon:",
                   min = 10,
                   max = 34,
                   value = 30),
       sliderInput("SliderCyl",
                   "No of Cylinders:",
                   min = 4,
                   max = 8,
                   2),
       checkboxInput("showModel1","Show/Hide Model 1", value = T),
       checkboxInput("showModel2","Show/Hide Model 1", value = T)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted hp from model 1:"),
       textOutput("pred1"),
       h3("Predicted hp from model 2:"),
       textOutput("pred2")
    )
  )
))
