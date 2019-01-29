function() {
  return(ggplot(diamonds, aes(carat, stat(count), fill = cut)))
}