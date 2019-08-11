#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(colourpicker)

# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("CARBON EMISSIONS AROUND THE WORLD (2014)"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "theme",
        label = "Choose A Theme",
        choices = c("darkgreen",
                    "darkblue",
                    "avocado",
                    "darkunica",
                    "gray",
                    "gridlight",
                    "grid",
                    "sandsignika",
                    "sunset"),
        selected = "sunset"
      ),
      textInput(
        inputId = "title",
        label = "Input Chart Title: ",
        placeholder = "Chart title：",
        value = "CARBON EMISSIONS AROUND THE WORLD (2014)"
      ),
      selectInput(
        inputId = "titleAlign",
        label = "Title Alignment: ",
        choices = c("left", "center", "right"),
        selected = 'center'
      ),
      textInput(
        inputId = "titleSize",
        label = "Title Size: ",
        placeholder = "20px",
        value = "20px"
      ),
      colourInput(
        inputId = "titleColor",
        label = "Title Color: ",
        value = "#333333",
        showColour = "background",
        allowTransparent = TRUE
      ),
      textInput(
        inputId = "subtitle",
        label = "Input Subtitle: ",
        placeholder = "https://www.czxa.top",
        value = ""
      ),
      selectInput(
        inputId = "subtitleAlign",
        label = "Subtitle Alignment: ",
        choices = c("left", "center", "right"),
        selected = "center"
      ),
      textInput(
        inputId = "subtitleSize",
        label = "Subtitle Size: ",
        placeholder = "10px",
        value = ""
      ),
      colourInput(
        inputId = "subtitleColor",
        label = "Subtitle Color: ",
        value = "#666666",
        showColour = "background",
        allowTransparent = TRUE
      ),
      textInput(
        inputId = "pointFormat",
        label = "The HTML of the point's line in the tooltip: ",
        placeholder = "<b>{point.name}:</b> {point.y}",
        value = "<b>{point.name}:</b> {point.y}m CO<sub>2</sub>"
      ),
      selectInput(
        inputId = "split",
        label = "Split or not?",
        choices = c(0, 1),
        selected = 1,
      ),
      textInput(
        inputId = "height",
        label = "Height: ",
        placeholder = "500px",
        value = "500px"
      ),
      textInput(
        inputId = "width",
        label = "Width: ",
        placeholder = "100%",
        value = "100%"
      ),
      textInput(
        inputId = "packedbubbleMinSize",
        label = "Minimum bubble size: ",
        placeholder = "10%",
        value = "50%"
      ),
      textInput(
        inputId = "packedbubbleMaxSize",
        label = "Maximum bubble size: ",
        placeholder = "120%",
        value = "250%"
      ),
      textInput(
        inputId = "packedbubbleZMin",
        label = "The minimum for the Z value range: ",
        placeholder = 0,
        value = 0
      ),
      textInput(
        inputId = "packedbubbleZMax",
        label = "The maximum for the Z value range: ",
        placeholder = 1000,
        value = 1000
      ),
      textInput(
        inputId = "gravitational",
        label = "Gravitational const used in the barycenter force of the algorithm： ",
        placeholder = "0.0625",
        value = "0.0625"
      ),
      selectInput(
        inputId = "seriesInteraction",
        label = "Whether series should interact with each other or not: ",
        choices = c(0, 1),
        selected = 1,
      ),
      selectInput(
        inputId = "dragBetweenSeries",
        label = "In case of split series, this option allows user to drag and drop points between series, for changing point related series: ",
        choices = c(0, 1),
        selected = 1,
      ),
      selectInput(
        inputId = "parentNodeLimit",
        label = "Whether bubbles should interact with their parentNode to keep them inside: ",
        choices = c(0, 1),
        selected = 1,
      ),
      selectInput(
        inputId = "dataLabels",
        label = "Options for the series data labels, appearing next to each data point. 1 means to true, 0 means to false: ",
        choices = c(0, 1),
        selected = 1,
      ),
      textInput(
        inputId = "dataLabelsformat",
        label = "Data labels' format: ",
        placeholder = "{point.name}",
        value = '{point.name}'
      ),
      textInput(
        inputId = "dataLabelsFilter",
        label = "Show data labels while 'value' larger than dataLabelsFilter. defaults to 250: ",
        placeholder = 100,
        value = 100
      ),
      colourInput(
        inputId = "dataLabelsColor",
        label = "Data Labels' Color: ",
        value = "black",
        showColour = "background",
        allowTransparent = TRUE
      )
    ),

    # Show a plot of the generated distribution
    mainPanel(
      hpackedbubbleOutput("shinybubble", height = "800px")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$shinybubble <- renderHpackedbubble({
    hpackedbubble(
      cat = CO2$continent,
      name = CO2$country,
      value = CO2$CO2,
      theme = input$theme,
      title = input$title,
      titleAlign = input$titleAlign,
      titleSize = input$titleSize,
      titleColor = input$titleColor,
      subtitle = input$subtitle,
      subtitleAlign = input$subtitleAlign,
      subtitleSize = input$subtitleSize,
      subtitleColor = input$subtitleColor,
      pointFormat = input$pointFormat,
      split = input$split,
      packedbubbleMinSize = input$packedbubbleMinSize,
      packedbubbleMaxSize = input$packedbubbleMaxSize,
      packedbubbleZMin = input$packedbubbleZMin,
      packedbubbleZmax = input$packedbubbleZmax,
      gravitational = input$gravitational,
      seriesInteraction = input$seriesInteraction,
      dragBetweenSeries = input$dragBetweenSeries,
      parentNodeLimit = input$parentNodeLimit,
      dataLabels = input$dataLabels,
      dataLabelsformat = input$dataLabelsformat,
      dataLabelsFilter = input$dataLabelsFilter,
      dataLabelsColor = input$dataLabelsColor,
      height = input$height,
      width = input$width
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)
