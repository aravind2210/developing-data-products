
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   model1 <- lm(hp~mpg, data = mtcars)
   model2 <- lm(hp~mpg+cyl,data = mtcars)
   
   model1pred <-reactive({
     mpgInput <- input$SliderMpg
     predict(model1, newdata = data.frame(mpg = mpgInput))
   })
   
   model2pred <- reactive({
     mpgInput <- input$SliderMpg
     cylInput <- input$SliderCyl
     predict(model2, newdata = 
               data.frame(mpg = mpgInput,
                          cyl = cylInput))
   })
  output$plot1 <- renderPlot({
    
    mpgInput <- input$SliderMpg
    cylInput <- input$SliderCyl
    
    plot(mtcars$mpg, mtcars$hp, xlab = "Miles per Gallon",
         ylab = "Horsepower", bty = "n", pch =16,
         xlim = c(10,35), ylim = c(50,350))
    if(input$showModel1){
      
      abline(model1, col = "red", lwd = 2)
    }
    if(input$showModel2){
      model2lines <- predict(model2, newdata= data.frame(
        mpg = 10:35, cyl = cylInput))
      lines(10:35, model2lines, col = "blue", lwd = 2)
    
    }
    legend(25,250,c("Model 1 Prediction", "Model 2 Prediction"), pch =16,
           col = c("red","blue"), bty = "n", cex = 1.2)
    points(mpgInput, model1pred(), col = "blue", pch = 16, cex =2)
    
  })
 
 
output$pred1 <- renderText({
  model1pred()
  })
output$pred2 <- renderText({
  model2pred()
})
})