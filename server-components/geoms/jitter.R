# ###################
# # JITTER GEOMS
# ###################


jitter_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_jitter.html
  
  p <- ggplot(mpg, aes(cyl, hwy))
  
  output$jitter <- renderPlot({ 
    p + geom_jitter() +
      theme_reactive()() })
  
  output$jitter_colour <- renderPlot({ 
    p + geom_jitter(aes(colour = class)) +
      theme_reactive()() })
  
  output$jitter_width_25 <- renderPlot({ 
    ggplot(mpg, aes(cty, hwy)) + geom_jitter(width = 0.25) + 
      theme_reactive()() })
  
  output$jitter_width_height <- renderPlot({ 
    ggplot(mpg, aes(cty, hwy)) + geom_jitter(width = 0.5, height = 0.5) +
      theme_reactive()() })
}
