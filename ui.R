library(shiny)
library(ggplot2)
library(lubridate)

putrajaya <- read.csv("API_Putrajaya.csv", header = T, sep=':')
colnames(putrajaya) <- c("Station No.","Location", "Date", "Hour", "API", "Pollutant")

ui <- fluidPage(
  headerPanel("Putrajaya Air Pollutant Index(API) from August 2013 to February 2015"),
  sidebarPanel(
    radioButtons("year", label = "Select Year", selected = 2014, choices = c(2013, 2014, 2015)),
    selectInput("month", label = "Select Month", selected = 1, choices = c(1,2,3,4,5,6,7,8,9,10,11,12))),
  mainPanel(
    h3('API reading, Putrajaya'),
    plotOutput("plot1"))
)