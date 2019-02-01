# ###################
# # POINT GEOMS
# ###################


point_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_point.html
  
  p <- ggplot(mtcars, aes(wt, mpg))
  d <- ggplot(diamonds, aes(carat, price))
  
  output$point <- renderPlot({ p + geom_point() + theme_reactive()()})
  output$point_colour <- renderPlot({ p + geom_point(aes(colour = factor(cyl))) + theme_reactive()() })
  output$point_shape <- renderPlot({ p + geom_point(aes(shape = factor(cyl))) + theme_reactive()() })
  output$point_size <- renderPlot({ p + geom_point(aes(size = qsec)) + theme_reactive()() })
  output$point_static_colour_size <- renderPlot({ p + geom_point(colour = "red", size = 3) + theme_reactive()() })
  output$point_alpha_10 <- renderPlot({ d + geom_point(alpha = 1/10) + theme_reactive()() })
  output$point_alpha_20 <- renderPlot({ d + geom_point(alpha = 1/20) + theme_reactive()() })
  output$point_alpha_100 <- renderPlot({ d + geom_point(alpha = 1/100) + theme_reactive()() })
  output$point_black_fill <- renderPlot({ p + geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5) + theme_reactive()() })
  output$point_pink_shape <- renderPlot({ 
    ggplot(mtcars, aes(mpg, wt, shape = factor(cyl))) + 
      geom_point(colour = "black", size = 4.5) +
      geom_point(colour = "pink", size = 4) +
      geom_point(aes(shape = factor(cyl))) + 
      theme_reactive()() 
  })
  
  
}
