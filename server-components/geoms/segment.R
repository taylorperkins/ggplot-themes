# ###################
# # SEGMENT GEOMS
# ###################


segment_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_segment.html
  
  b <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point()
  
  df <- data.frame(x1 = 2.62, x2 = 3.57, y1 = 21.0, y2 = 15.0)
  
  output$segment <- renderPlot({ 
    b +
      geom_curve(aes(x = x1, y = y1, xend = x2, yend = y2, colour = "curve"), data = df) +
      geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2, colour = "segment"), data = df) + 
      theme_reactive()() })
  
  output$segment_map <- renderPlot({
    ggplot(seals, aes(long, lat)) +
      geom_segment(aes(xend = long + delta_long, yend = lat + delta_lat),
                   arrow = arrow(length = unit(0.1,"cm"))) +
      borders("state") +
      theme_reactive()()
  })
  
}
