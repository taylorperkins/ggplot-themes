####################
# SCATTER BASE VIZ
####################
scatter_plot <- function(
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


reference_line_plot <- function(
  subtitle = '',
  base_plot = TRUE,
  include_aes = FALSE
) {
  if (base_plot) {
    return(
      ggplot(mtcars, aes(wt, mpg)) + 
          geom_point())
  } else {
    if (include_aes) {
      return(
        ggplot(mtcars, aes(mpg, wt, colour = wt)) +
          geom_point()
      )
    } else {
      return(
        p <- ggplot(mtcars, aes(mpg, wt)) +
          geom_point()
      )
    }
  }
}


bar_plot <- function() {
  ggplot(mpg, aes(class))
}


heatmap_plot <- function() {
  ggplot(diamonds, aes(x, y)) + xlim(4, 10) + ylim(4, 10)
}


boxplot_plot_1 <- function() {
  ggplot(mpg, aes(class, hwy))
}

boxplot_plot_2 <- function() {
  ggplot(diamonds, aes(carat, price))
}