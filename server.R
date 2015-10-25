library(ggplot2)
mpg <- mtcars$mpg - mean(mtcars$mpg)
disp <- mtcars$disp - mean(mtcars$disp)
shinyServer(function(input, output){
        c <- reactive(input$col)
        output$my <- renderPlot({
                d <- data.frame(mpg, disp)
                beta <- input$beta
                g <- ggplot(d, aes(disp, mpg))
                g <- g + geom_point(size = 4) +
                        geom_abline(intercept = 0,
                                    slope = beta, col = c(), size = 1)
                mse <- mean((mpg - beta * disp)^2)
                g <- g + ggtitle(input$title)
                g
        })
        output$id1 <- renderText({
                paste("Mean squared error of regression with slope ",
                      input$beta, "is ",
                      round(mean((mpg - input$beta * disp)^2), 3))
        })
})
