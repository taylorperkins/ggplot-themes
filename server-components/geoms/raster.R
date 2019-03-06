# ###################
# # RASTER GEOMS
# ###################


raster_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_raster.html
  
  df <- data.frame(
    x = rep(c(2, 5, 7, 9, 12), 2),
    y = rep(c(1, 2), each = 5),
    z = factor(rep(1:5, each = 2)),
    w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
  )
  
  cars <- ggplot(mtcars, aes(mpg, factor(cyl)))
  
  output$raster <- renderPlot({ 
    ggplot(faithfuld, aes(waiting, eruptions)) +
      geom_raster(aes(fill = density)) +
      theme_reactive()() })
  
  output$raster_grey50 <- renderPlot({ 
    ggplot(df, aes(x, y)) +
      geom_tile(aes(fill = z), colour = "grey50") +
      theme_reactive()() })
  
  output$raster_density <- renderPlot({ 
    cars + stat_density(aes(fill = stat(count)), geom = "raster", position = "identity") +
      theme_reactive()() })
  
}
