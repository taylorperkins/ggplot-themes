# ###################
# # HEX GEOMS
# ###################


hex_plot <- function() {
  ggplot(diamonds, aes(carat, price))
}


hex_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_hex.html
  
  output$hex <- renderPlot({ 
    hex_plot() + 
      geom_hex() + 
      theme_reactive()() })
  
  output$hex_bins_10 <- renderPlot({ 
    hex_plot() + 
      geom_hex(bins = 10) + 
      theme_reactive()() })
  
  output$hex_bins_30 <- renderPlot({ 
    hex_plot() + 
      geom_hex(bins = 30) + 
      theme_reactive()() })
  
  output$hex_binwidth_1000 <- renderPlot({ 
    hex_plot() + 
      geom_hex(binwidth = c(.1, 1000)) + 
      theme_reactive()() })
  
  output$hex_binwidth_500 <- renderPlot({ 
    hex_plot() + 
      geom_hex(binwidth = c(.1, 500)) + 
      theme_reactive()() })
  
}