# ###################
# # QUANTILE-QUANTILE GEOMS
# ###################


qq_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_qq.html
  
  df <- data.frame(y = rt(200, df = 5))
  
  output$qq <- renderPlot({ 
    ggplot(df, aes(sample = y)) + 
      stat_qq() + 
      stat_qq_line() +
      theme_reactive()()
  })
  
  output$qq_dist <- renderPlot({ 
    params <- as.list(MASS::fitdistr(df$y, "t")$estimate)
    
    ggplot(df, aes(sample = y)) +
      stat_qq(distribution = qt, dparams = params["df"]) +
      stat_qq_line(distribution = qt, dparams = params["df"]) +
      theme_reactive()()
  })
  
  output$qq_dist_variable <- renderPlot({ 
    ggplot(mtcars, aes(sample = mpg)) +
      stat_qq() +
      stat_qq_line() +
      theme_reactive()()
  })
  
  output$qq_dist_variable_colour <- renderPlot({ 
    ggplot(mtcars, aes(sample = mpg, colour = factor(cyl))) +
      stat_qq() +
      stat_qq_line() +
      theme_reactive()()
  })
  
}
