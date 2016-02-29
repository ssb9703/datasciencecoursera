# Coursera - Developing Data Products- Course Project

# server.R file for the shiny app

# This app was developed to predict your cars Horsepower.  
library(shiny)
library(datasets)

# We tweak the "am" field to have nicer factor labels. Since
# this doesn't rely on any user inputs we can do this once at
# startup and then use the value throughout the lifetime of the
# application
hp_Data <- mtcars
hp_Data$am <- factor(hp_Data$am, labels = c("Automatic", "Manual"))


# Define server logic required to plot various variables against
# hp
shinyServer(function(input, output) {
  
  # Compute the formula text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
  formulaText <- reactive({
    paste("hp ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg and
  # only include outliers if requested
  output$hp_Plot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = hp_Data,
            outline = input$outliers)
  })
})