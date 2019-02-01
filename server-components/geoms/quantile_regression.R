# ###################
# # QUANTILE-REGRESSION GEOMS
# ###################


quantile_regression_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_quantile.html
  
  m <- ggplot(mpg, aes(displ, 1 / hwy)) + geom_point()
  
  output$quantile <- renderPlot({ 
    m + geom_quantile() +
      theme_reactive()()
  })
  
  output$quantile_05 <- renderPlot({ 
    m + geom_quantile(quantiles = 0.5) +
      theme_reactive()()
  })
  
  output$quantile_by_seq <- renderPlot({ 
    q10 <- seq(0.05, 0.95, by = 0.05)
    m + geom_quantile(quantiles = q10) +
      theme_reactive()()
  })
  
  output$quantile_rqss <- renderPlot({ 
    m + geom_quantile(method = "rqss") +
      theme_reactive()()
  })
  
  output$quantile_rqss_smoothing <- renderPlot({ 
    m + geom_quantile(method = "rqss", lambda = 0.1) +
      theme_reactive()()
  })
  
  output$quantile_red <- renderPlot({ 
    m + geom_quantile(colour = "red", size = 2, alpha = 0.5) +
      theme_reactive()()
  })
  
}
