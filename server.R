library(ggplot2)
library(shiny)
library(shinythemes)
data(mtcars)
mpg<-mtcars$mpg

shinyServer(function(input, output, session) {
        rdata<-reactive({     
                if(input$selectFactor=='NULL'){
                       g<-qplot(y=mpg,x=mtcars[,input$selectPredictor],
                               data=mtcars,
                              xlab=input$selectPredictor
                        )
               
                        
                }else{
                        g<-qplot(y=mpg,x=mtcars[,input$selectPredictor],
                              data=mtcars,
                              colour=factor(mtcars[,input$selectFactor]),
                              xlab=input$selectPredictor)+
                              guides(color=guide_legend(title=input$selectFactor))
                                
                }
                if(input$smooth){
                        g<-g+geom_smooth()
                }
                
                print(g)
        })
#         rhist<-reactive({
#                 if(input$selectFactor=='NULL'){
#                         fillcolor<-NULL
#                        tl<-'Factors'
#                         
#                 }else{
#                        fillcolor=factor(mtcars[,input$selectFactor])
#                        tl<-input$selectFactor
#                 }
#                 qplot(mtcars[,input$selectPredictor],data=mtcars,
#                       fill=fillcolor,geom="histogram")+
#                         xlab(input$selectPredictor)+
#                         guides(fill=guide_legend(title=tl))
#                 
#         })
        output$disPlot <- renderPlot(  
            rdata()     
                )
#         output$hisPlot <- renderPlot(  
#            rhist()    
#         )
        
})