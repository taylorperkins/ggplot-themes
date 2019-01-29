function(density = TRUE) {
  if (density) {
    return(ggplot(faithfuld, aes(waiting, eruptions, z = density)))
  } else {
    return(ggplot(faithful, aes(waiting, eruptions)))
  } 
}