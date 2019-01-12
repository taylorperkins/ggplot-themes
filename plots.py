####################
# SCATTER BASE VIZ
####################
scatter_plot <- function() {
  ggplot(mtcars2) +
    geom_point(aes(x = wt, y = mpg, colour = gear)) +
    labs(title = "Fuel economy declines as weight increases",
         subtitle = "(1973-74)",
         caption = "Data from the 1974 Motor Trend US magazine.",
         tag = "Figure 1",
         x = "Weight (1000 lbs)",
         y = "Fuel economy (mpg)",
         colour = "Gears")
}
