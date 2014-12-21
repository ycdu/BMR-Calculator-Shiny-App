library(shiny)

bmrvalue <- function (height, weight, age, gender) {
  if (gender == 'f') {655 + (9.6 * weight) + (1.8 * height) - ( 4.7 * age )}
  else {66 + ( 13.7 * weight ) + ( 5 * height) - ( 6.8 * age )}
}

totalcalories <- function(bmrvalue, activity){
  activity = as.numeric(activity)
  bmrvalue * activity
}

shinyServer(
  function(input, output){
    output$bmr <- renderText ({
      if(input$goButton>=1)
        isolate(
          bmrvalue(input$height, input$weight, input$age, input$gender))
    })
    output$calories <- renderText({
        if(input$goButton>=1)
        isolate(
          totalcalories(bmrvalue(input$height, input$weight, input$age, input$gender), input$activity))
    })
  }
  )