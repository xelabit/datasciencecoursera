library(shiny)
shinyUI(
        pageWithSidebar(
                headerPanel("Simple linear model application"),
                sidebarPanel(
                        h3("Navigation panel"),
                        sliderInput("beta",
                                    "Change the slope parameter",
                                    value = -.1, min = -.1, max = 0,
                                    step = .006),
                        textInput("title", "The title you would prefer"),
                        radioButtons("col", "Color of regression line",
                                     c("Red" = "red",
                                       "Blue" = "blue",
                                       "Green" = "green")),
                        checkboxInput("view", "Documentation"),
                        conditionalPanel(
                                condition = "input.view == true",
                                p("This basic application just demonstrates the
regression model. There are two variables on the plot: disp (displacement) and
mpg (miles per gallon). With slider you can change the slope of the regression
line. You can set the title of the plot as well. Just put the name in the text
box. The color of the regression line can be changed by selecting a
corresponding radio button."))),
                mainPanel(
                        plotOutput('my'),
                        textOutput("id1"))))
