function(
  subtitle = "(1973-74)"
) {
  ggplot(mtcars2) +
    geom_point(aes(x = wt, y = mpg, colour = gear)) +
    labs(title = "Fuel economy declines as weight increases",
         subtitle = subtitle,
         caption = "Data from the 1974 Motor Trend US magazine.",
         x = "Weight (1000 lbs)",
         y = "Fuel economy (mpg)",
         colour = "Gears")
}