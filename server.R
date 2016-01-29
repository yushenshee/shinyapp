library(shiny)
library(ggplot2)
library(lubridate)

putrajaya <- read.csv("API_Putrajaya.csv", header = T, sep=':')
colnames(putrajaya) <- c("Station No.","Location", "Date", "Hour", "API", "Pollutant")

server <-function(input, output) {
  output$plot1 <- renderPlot({
    select_data <- putrajaya[month(putrajaya$Date)==input$month & year(putrajaya$Date)==input$year,]
    p <- ggplot(data=select_data, aes(x=select_data$Hour, y=select_data$API)) + geom_smooth(color="blue") + labs(x="Hour", y = "API reading")
    print(p)
  })}