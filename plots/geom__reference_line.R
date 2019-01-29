function(
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