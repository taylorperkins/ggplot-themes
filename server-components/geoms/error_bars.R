# ###################
# # ERROR BAR GEOMS
# ###################

error_bar_plot <- function() {
  ggplot(
    data.frame(
      trt = factor(c(1, 1, 2, 2)),
      resp = c(1, 5, 3, 4),
      group = factor(c(1, 2, 1, 2)),
      se = c(0.1, 0.3, 0.3, 0.2)
    ), 
    aes(resp, trt, colour = group))
}


error_bar_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_errorbarh.html
  
  output$error_bar <- renderPlot({ 
    error_bar_plot() + 
      geom_point() +
      geom_errorbarh(aes(xmax = resp + se, xmin = resp - se)) + 
      theme_reactive()() })
  
  output$error_bar_with_height <- renderPlot({ 
    error_bar_plot() + 
      geom_point() +
      geom_errorbarh(aes(xmax = resp + se, xmin = resp - se, height = .2)) + 
      theme_reactive()() })
}