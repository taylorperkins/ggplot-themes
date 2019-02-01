# ###################
# # PATH GEOMS
# ###################


path_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_path.html
  
  output$date_trend <- renderPlot({ 
    ggplot(economics, aes(date, unemploy)) + 
      geom_line() +
      theme_reactive()()
  })
  
  output$date_trend_colour <- renderPlot({ 
    ggplot(economics_long, aes(date, value01, colour = variable)) +
      geom_line() +
      theme_reactive()()
  })
  
  output$step <- renderPlot({ 
    ggplot(
      economics[economics$date > as.Date("2013-01-01"), ], 
      aes(date, unemploy)) + 
      geom_step() +
      theme_reactive()()
  })
  
  output$path_colour <- renderPlot({ 
    ggplot(economics, aes(unemploy/pop, psavert)) + 
      geom_path(aes(colour = as.numeric(date))) +
      theme_reactive()()
  })
  
  output$trend_red <- renderPlot({ 
    ggplot(economics, aes(date, unemploy)) +
      geom_line(colour = "red") +
      theme_reactive()()
  })
  
  output$arrow <- renderPlot({ 
    ggplot(economics, aes(x = date, y = pop)) +
      geom_line(
        arrow = arrow(angle = 15, ends = "both", type = "closed")
      ) +
      theme_reactive()()
  })
  
  output$line_break <- renderPlot({ 
    ggplot(
      data.frame(x = 1:5, y = c(1, 2, NA, 4, 5)), 
      aes(x, y)) + 
      geom_point() + 
      geom_line() +
      theme_reactive()()
  })
  
  output$line_type_colour_size <- renderPlot({ 
    x <- seq(0.01, .99, length.out = 100)
    
    ggplot(
      data.frame(
        x = rep(x, 2),
        y = c(qlogis(x), 2 * qlogis(x)),
        group = rep(c("a","b"),
                    each = 100)
      ), 
      aes(x=x, y=y, group=group)) +
      geom_line(aes(colour = group), linetype = 2) +
      theme_reactive()()
  })
  
  
}
