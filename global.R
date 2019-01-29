###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################

library(shiny)
library(shinydashboard)
library(shinyalert)

library(ggplot2)
library(hexbin)


###################
# DATASETS USED FOR PLOTS (used in misc. servers)
###################
source('./datasets.R')


###################
# ALL CURRENT GGPLOT THEMES (used in UI)
###################
themes <- c(
  'theme_gray',
  'theme_bw',
  'theme_linedraw',
  'theme_light',
  'theme_dark',
  'theme_minimal',
  'theme_classic',
  'theme_void')


###################
# CURRENTLY SUPPORTED GEOMS
# 
# A geom is supported if it has the following: 
#   * A UI component that lives in './components/body.R'.
#   * Base and other supporting plots in './plots.R'
#   * Server components to return appropriate plots in './server.R'
###################
