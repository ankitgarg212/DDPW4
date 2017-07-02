#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
#

library(shiny)

# Define UI for application that draws the time series plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Index Data"),
  
  # Sidebar with a list input for the index and the slider input for the year range 
  sidebarLayout(
    sidebarPanel(
      selectInput("index1", "Select Index:", choices = c("DAX", "SMI", "CAC", "FTSE")), 
      sliderInput("time",
                  "Select Year Range:",
                  min = 1991,
                  max = 1999,
                  value = c(1992, 1998))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Price movement for the selected index in the year range:"),  
      plotOutput("distPlot")
    )
  )
))
