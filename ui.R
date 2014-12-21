library(shiny)
shinyUI(navbarPage("Basal Metabolic Rate (BMR) Calculator",
                   tabPanel("BMR Calculator",
                            sidebarLayout(
                                sidebarPanel(
                                  h4('Please input your height, weight, gender, age and activity level'),
                                  numericInput('height', 'Height in Centimeters',165),
                                  numericInput('weight', 'Weight in Kilograms',60),
                                  numericInput('age', 'Age',30),
                                  radioButtons("gender", "Gender",
                                               c("Female"="f", "Male"="m")
                                  ),
                                  radioButtons("activity", "Activity Level",
                                               c("Sedentary (little or no exercise) "=1.2, 
                                                 "Lightly active (light exercise/sports 1-3 days/week) "=1.375,
                                                 "Moderatetely active (moderate exercise/sports 3-5 days/week)"=1.55,
                                                 "Very active (hard exercise/sports 6-7 days a week)"=1.725,
                                                 "Extra active (very hard exercise/sports & physical job or 2x training)"=1.9)
                                  ),
                                  actionButton('goButton',"Submit")
                                ),
                                mainPanel(
                                  h3('Your Basal Metabolic Rate (BMR) is '),
                                  verbatimTextOutput("bmr"),
                                  h3 ('The total calories you need to maintain your current weight is '),
                                  verbatimTextOutput("calories")
                                  )
                            )),
                   tabPanel("Documentation",
                            includeMarkdown("Readme.md")
                   )))