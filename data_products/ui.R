# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app


library(shiny)

# Define UI for understanding horse power application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Horse Power"),
  
  # Sidebar with controls to select the variable to plot against
  # HP and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Variable:",
                  c("Cylinders" = "cyl",
                    "Transmission" = "am",
                    "Gears" = "gear", "MPG"="mpg")),
      
      checkboxInput("outliers", "Show outliers", FALSE)
    ),
    
    # Show the caption and plot of the requested variable against
    # hp
    mainPanel(
      h3(textOutput("caption")),
      
      plotOutput("hp_Plot")
    )
  )
))