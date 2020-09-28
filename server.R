#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(caret)
library(randomForest)
set.seed(1234)
zoo <- read.csv("zoo.csv")
zoo2 <- read.csv("zoo2.csv")
zoo3 <- read.csv("zoo3.csv")
classes <- read.csv("class.csv")
classes <- rbind(classes,c(8,0,"No animal class found - keep selecting characteristics","None"))
zoo <- rbind(zoo, zoo2, zoo3)
zoo <- select(zoo, -animal_name)
fitControl <- trainControl(method = "cv", number = 5)
fit <- train(class_type ~ ., method="rf", trControl=fitControl, data=zoo)

# Define server logic required to predict an animal class
shinyServer(function(input, output) {
    output$animal_class <- renderText({
        entered_data <- data.frame(hair=as.numeric(input$id1), feathers=as.numeric(input$id2),
                                   eggs=as.numeric(input$id3), milk=as.numeric(input$id4),
                                   airborne=as.numeric(input$id5), aquatic=as.numeric(input$id6),
                                   predator=as.numeric(input$id7), toothed=as.numeric(input$id8),
                                   backbone=as.numeric(input$id9), breathes=as.numeric(input$id10),
                                   venomous=as.numeric(input$id11), fins=as.numeric(input$id12),
                                   legs=as.numeric(input$id13), tail=as.numeric(input$id14),
                                   domestic=as.numeric(input$id15), catsize=as.numeric(input$id16))
        predicted_class <- predict(fit, newdata=entered_data)
        if (predicted_class%%1!=0) {
            predicted_class=8
        }
        filter(classes, Class_Number==predicted_class)$Class_Type
    })
})
