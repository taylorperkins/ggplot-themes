# ###################
# # RIBBONS AND AREA GEOMS
# ###################


ribbons_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_ribbon.html
  
  h <- ggplot(
    data.frame(year = 1875:1972, level = as.vector(LakeHuron)), 
    aes(year))
  
  output$ribbon_level <- renderPlot({
    h + geom_ribbon(aes(ymin=0, ymax=level)) + 
      theme_reactive()()
  })
  
  output$ribbon_line <- renderPlot({
    h + geom_ribbon(aes(ymin = level - 1, ymax = level + 1), fill = "grey70") +
      geom_line(aes(y = level)) + 
      theme_reactive()()
  })
}
