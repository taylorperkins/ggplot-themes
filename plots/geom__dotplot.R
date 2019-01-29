function(reverse = FALSE, as_factor = FALSE) {
  p <- ggplot(mtcars, aes(x = mpg))
  
  if (reverse) { p <- p + aes(x = 1, y = mpg) }
  if (as_factor) { p <- p + aes(x = factor(cyl), y = mpg) }
  
  return(p)
}