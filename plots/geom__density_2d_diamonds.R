function() {
  set.seed(4393)
  dsmall <- diamonds[sample(nrow(diamonds), 1000), ]
  
  ggplot(dsmall, aes(x, y))
}