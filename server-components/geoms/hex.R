# ###################
# # HEX GEOMS
# ###################


hex_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_hex.html
  
  base_plot <- dget("./plots/geom__hex.R")
  
  output$hex <- renderPlot({ 
    base_plot() + 
      geom_hex() + 
      theme_reactive()() })
  
  output$hex_bins_10 <- renderPlot({ 
    base_plot() + 
      geom_hex(bins = 10) + 
      theme_reactive()() })
  
  output$hex_bins_30 <- renderPlot({ 
    base_plot() + 
      geom_hex(bins = 30) + 
      theme_reactive()() })
  
  output$hex_binwidth_1000 <- renderPlot({ 
    base_plot() + 
      geom_hex(binwidth = c(.1, 1000)) + 
      theme_reactive()() })
  
  output$hex_binwidth_500 <- renderPlot({ 
    base_plot() + 
      geom_hex(binwidth = c(.1, 500)) + 
      theme_reactive()() })
  
}
