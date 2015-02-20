library(ggplot2)
library(shiny)
library(shinythemes)
data(mtcars)
shinyUI(
        fluidPage(theme = shinytheme("flatly"),
        
        headerPanel("Miles/(US) gallon prediction"),
        sidebarPanel(
                selectInput("selectPredictor", 
                           label = h3("Select Predictor"),  
                           choices = list("Number of cylinders" ="cyl",
                                           "Displacement (cu.in.)"='disp',
                                           "Gross horsepower"='hp',
                                           'Rear axle ratio'="drat",
                                           'Weight (lb/1000)'="wt",
                                           '1/4 mile time'="qsec",
                                           'V/S'="vs",
                                           'Transmission'="am",
                                           'Number of forward gears'="gear",
                                           'Number of carburetors'="carb"),
                           selected = 'cyl'),
                radioButtons("selectFactor", 
                            label = h3("Select Factor"),  
                            choices = list('No Factor'='NULL',
                                           "Number of cylinders" ="cyl",
                                           'V/S'="vs",
                                           'Transmission'="am",
                                           'Number of forward gears'="gear",
                                           'Number of carburetors'="carb"),
                            selected = 'NULL'),
               h3("Options"),
               checkboxInput("smooth","Add a smoothed conditional mean", FALSE),
               submitButton("PLOT")
              
                
        ),
      
        
        mainPanel(
                plotOutput('disPlot',width = "100%", height = "400px")
               # plotOutput('hisPlot',width = "100%", height = "400px")
        )
))