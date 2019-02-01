###################
# USED FOR: 
#   * map
###################
crimes <- data.frame(
  state = tolower(rownames(USArrests)), 
  USArrests
)
crimesm <- reshape2::melt(
  crimes, 
  id = 1
)
