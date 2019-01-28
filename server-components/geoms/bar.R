# ###################
# # BAR GEOMS
# ###################
bar_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_bar.html
  
  output$bar <- renderPlot({ bar_plot() + geom_bar() + theme_reactive()() })
  output$bar_weight_aes <- renderPlot({ bar_plot() + geom_bar(aes(weight = displ)) + theme_reactive()() })
  output$bar_fill_aes <- renderPlot({ bar_plot() + geom_bar(aes(fill = drv)) + theme_reactive()() })
  output$bar_position <- renderPlot({
    bar_plot() +
      geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
      coord_flip() +
      theme_reactive()() +
      theme(legend.position = "top") })
  
  output$bar_col_means <- renderPlot({
    df <- data.frame(trt = c("a", "b", "c"), outcome = c(2.3, 1.9, 3.2))
    
    ggplot(df, aes(trt, outcome)) +
      geom_col() +
      theme_reactive()()
  })
  
  output$bar_continuous <- renderPlot({
    df <- data.frame(x = rep(c(2.9, 3.1, 4.5), c(5, 10, 4)))
    ggplot(df, aes(x)) + geom_bar() + theme_reactive()()
  })
  
  output$bar_hist <- renderPlot({
    df <- data.frame(x = rep(c(2.9, 3.1, 4.5), c(5, 10, 4)))
    ggplot(df, aes(x)) + geom_histogram(binwidth = 0.5) + theme_reactive()()
  })
}