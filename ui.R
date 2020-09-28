#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that predicts an animal class
shinyUI(fluidPage(

    # Application title
    titlePanel("Animal classifier"),
    h3('This app provides an animal classification based on several characteristics entered by the user. Read the Instructions tab for more info.'),

    # Multiple check boxes and numeric input for animal characteristics
    sidebarLayout(
        sidebarPanel(
            h3('Select characteristics:'),
            checkboxInput('id1', 'Has hair', TRUE),
            checkboxInput('id2', 'Has feathers'),
            checkboxInput('id3', 'Lays eggs'),
            checkboxInput('id4', 'Produces milk', TRUE),
            checkboxInput('id5', 'Flies'),
            checkboxInput('id6', 'Is aquatic'),
            checkboxInput('id7', 'Is predator'),
            checkboxInput('id8', 'Has teeth', TRUE),
            checkboxInput('id9', 'Has a backbone', TRUE),
            checkboxInput('id10', 'Breathes', TRUE),
            checkboxInput('id11', 'Is venomous'),
            checkboxInput('id12', 'Has fins'),
            numericInput('id13', 'Number of legs', 4, min=0, max=8, step=2),
            checkboxInput('id14', 'Has a tail', TRUE),
            checkboxInput('id15', 'Is domestic'),
            checkboxInput('id16', 'Is the size of a cat')
        ),

        # Show the predicted animal class
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Main", br(), h3('Animal class:') ,br(), verbatimTextOutput("animal_class")),
                        tabPanel("Instructions", br(), "This app uses data from zoos to train a machine learning 
                                 algorithm and then predict an animal class based on user input. Click on the check 
                                 boxes and/or enter a number in the 'legs' text box at the left to find the different 
                                 animal classes.", br(), "Please note that if the selected characteristics are not 
                                 enough to determine a class, you need to keep adjusting the values.",br(), br(),"The data comes from Kaggle:", br(), 
                                 "https://www.kaggle.com/uciml/zoo-animal-classification
                                 https://www.kaggle.com/agajorte/zoo-animals-extended-dataset"))
            #h3('Animal class:'),
            #verbatimTextOutput("animal_class")
        )
    )
))
