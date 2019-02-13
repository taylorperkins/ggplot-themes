# ###################
# # SPOKE GEOMS
# ###################


spoke_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_spoke.html
  
  df <- expand.grid(x = 1:10, y=1:10)
  df$angle <- runif(100, 0, 2*pi)
  df$speed <- runif(100, 0, sqrt(0.1 * df$x))
  
  output$spoke <- renderPlot({ 
    ggplot(df, aes(x, y)) +
      geom_point() +
      geom_spoke(aes(angle = angle), radius = 0.5) +
      theme_reactive()() })
  
  output$spoke_by_variable <- renderPlot({ 
    ggplot(df, aes(x, y)) +
      geom_point() +
      geom_spoke(aes(angle = angle, radius = speed)) +
      theme_reactive()() })
  
}
