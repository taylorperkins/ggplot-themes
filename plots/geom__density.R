function(col = 'carat', ...) {
  return(ggplot(diamonds, aes_string(col, ...)))
}