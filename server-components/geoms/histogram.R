# ###################
# # HISTOGRAM AND FREQPOLY GEOMS
# ###################


histogram_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_histogram.html
  
  output$histogram <- renderPlot({ 
    ggplot(diamonds, aes(carat)) +
      geom_histogram() +
      theme_reactive()() })
  
  output$histogram_binwidth_01 <- renderPlot({ 
    ggplot(diamonds, aes(carat)) +
      geom_histogram(binwidth = 0.01) + 
      theme_reactive()() })
  
  output$histogram_bins_200 <- renderPlot({ 
    ggplot(diamonds, aes(carat)) +
      geom_histogram(bins = 200) + 
      theme_reactive()() })
  
  output$histogram_fill_binwidth_500 <- renderPlot({ 
    ggplot(diamonds, aes(price, fill = cut)) +
      geom_histogram(binwidth = 500) + 
      theme_reactive()() })
  
  output$histogram_colour_binwidth_500 <- renderPlot({ 
    ggplot(diamonds, aes(price, colour = cut)) +
      geom_freqpoly(binwidth = 500) + 
      theme_reactive()() })
  
  output$histogram_stat_density <- renderPlot({ 
    ggplot(diamonds, aes(price, stat(density), colour = cut)) +
      geom_freqpoly(binwidth = 500) + 
      theme_reactive()() })
  
}
