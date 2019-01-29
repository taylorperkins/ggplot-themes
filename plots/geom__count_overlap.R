function(use_mpg = TRUE) {
  if (use_mpg) {
    return(ggplot(mpg, aes(cty, hwy)))
  } else{
    return(ggplot(diamonds, aes(x = cut, y = clarity)))
  }
}