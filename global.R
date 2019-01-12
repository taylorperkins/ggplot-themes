###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################
library(shiny)
library(shinydashboard)

library(ggplot2)


themes <- c(
  'theme_gray',
  'theme_bw',
  'theme_linedraw',
  'theme_light',
  'theme_dark',
  'theme_minimal',
  'theme_classic',
  'theme_void')


mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V-shaped", "Straight"))
  am <- factor(am, labels = c("Automatic", "Manual"))
  cyl  <- factor(cyl)
  gear <- factor(gear)
})
