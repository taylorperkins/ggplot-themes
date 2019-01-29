function() {
  ggplot(faithful, aes(x = eruptions, y = waiting)) +
    geom_point() +
    xlim(0.5, 6) +
    ylim(40, 110)    
}
