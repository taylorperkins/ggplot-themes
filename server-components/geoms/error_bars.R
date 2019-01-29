# ###################
# # ERROR BAR GEOMS
# ###################


error_bar_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_errorbarh.html
  
  base_plot <- dget("./plots/geom__error_bar.R")
  
  output$error_bar <- renderPlot({ 
    base_plot() + 
      geom_point() +
      geom_errorbarh(aes(xmax = resp + se, xmin = resp - se)) + 
      theme_reactive()() })
  
  output$error_bar_with_height <- renderPlot({ 
    base_plot() + 
      geom_point() +
      geom_errorbarh(aes(xmax = resp + se, xmin = resp - se, height = .2)) + 
      theme_reactive()() })
}
