function() {
  ggplot(
    data.frame(
      trt = factor(c(1, 1, 2, 2)),
      resp = c(1, 5, 3, 4),
      group = factor(c(1, 2, 1, 2)),
      se = c(0.1, 0.3, 0.3, 0.2)
    ), 
    aes(resp, trt, colour = group))
}