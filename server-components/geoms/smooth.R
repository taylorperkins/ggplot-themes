# ###################
# # SMOOTH GEOMS
# ###################


smooth_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_smooth.html
  
  output$smooth <- renderPlot({ 
    ggplot(mpg, aes(displ, hwy)) +
      geom_point() +
      geom_smooth() +
      theme_reactive()() })
  
  output$smooth_lm <- renderPlot({ 
    ggplot(mpg, aes(displ, hwy)) +
      geom_point() +
      geom_smooth(method = lm, se = FALSE) +
      theme_reactive()() })
  
  output$smooth_lm_colour <- renderPlot({ 
    ggplot(mpg, aes(displ, hwy, colour = class)) +
      geom_point() +
      geom_smooth(se = FALSE, method = lm) +
      theme_reactive()() })
  
  output$smooth_facet <- renderPlot({ 
    ggplot(mpg, aes(displ, hwy)) +
      geom_point() +
      geom_smooth(span = 0.8) +
      facet_wrap(~drv) +
      theme_reactive()() })
  
}
