# ###################
# # VERTICAL INTERVALS GEOMS (lines, crossbars, errorbars)
# ###################


vertical_intervals_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_linerange.html
  
  df <- data.frame(
    trt = factor(c(1, 1, 2, 2)),
    resp = c(1, 5, 3, 4),
    group = factor(c(1, 2, 1, 2)),
    upper = c(1.1, 5.3, 3.3, 4.2),
    lower = c(0.8, 4.6, 2.4, 3.6)
  )
  
  p <- ggplot(df, aes(trt, resp, colour = group))
  
  output$linerange <- renderPlot({ 
    p + geom_linerange(aes(ymin = lower, ymax = upper)) +
      theme_reactive()() })
  
  output$pointrange <- renderPlot({ 
    p + geom_pointrange(aes(ymin = lower, ymax = upper)) +
      theme_reactive()() })
  
  output$crossbar <- renderPlot({ 
    p + geom_crossbar(aes(ymin = lower, ymax = upper), width = 0.2) +
      theme_reactive()() })
  
  output$errorbar <- renderPlot({ 
    p + geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.2) +
      theme_reactive()() })
  
  output$line_errorbar <- renderPlot({ 
    p + geom_line(aes(group = group)) +
      geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.2) +
      theme_reactive()() })
  
  output$dodge_error <- renderPlot({ 
    ggplot(df, aes(trt, resp, fill = group)) +
      geom_col(position = "dodge") +
      geom_errorbar(aes(ymin = lower, ymax = upper), position = "dodge", width = 0.25) +
      theme_reactive()() })
  
  output$dodge_error_width <- renderPlot({ 
    dodge <- position_dodge(width=0.9)
    
    ggplot(df, aes(trt, resp, fill = group)) +
      geom_col(position = dodge) +
      geom_errorbar(aes(ymin = lower, ymax = upper), position = dodge, width = 0.25) +
      theme_reactive()() })
  
  output$dodge2_error <- renderPlot({ 
    ggplot(df, aes(trt, resp, fill = group)) +
      geom_col(position = "dodge2") +
      geom_errorbar(
        aes(ymin = lower, ymax = upper),
        position = position_dodge2(width = 0.5, padding = 0.5)
      ) +
      theme_reactive()() })
}
