#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

library(shiny)
library(dplyr)
library(tidyr)

# Define server logic required to draw a time series plot
shinyServer(function(input, output) {
   
  data("EuStockMarkets")
  
  #Change the datset in the long format to make the selections and plot the graph
  stocks <- as.data.frame(EuStockMarkets)
  stocks <- gather(stocks, index, price)
  stocks <- mutate(stocks,time = rep(time(EuStockMarkets),4))
  
  
  output$distPlot <- renderPlot({
    
    #Subset the data for the required index and time range
    datasub <- stocks[stocks$index == input$index1,]
    datasub <- datasub[datasub$time >= input$time[1],]
    datasub <- datasub[datasub$time <= input$time[2],]
    
    plot(datasub$time, datasub$price, xlab = "Time", ylab = "Price", main = "Time series plot of the selcted index in the selcted time range")
    
  })
  
})
