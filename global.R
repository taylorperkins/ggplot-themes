###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################

library(shiny)
library(shinydashboard)
library(shinyalert)

library(ggplot2)
library(ggthemes)
library(hexbin)


###################
# DATASETS USED FOR PLOTS (used in misc. servers)
###################
source('./datasets.R')


###################
# ALL CURRENT GGPLOT THEMES (used in UI)
###################
themes <- c(
  # default ggplot themes
  'theme_gray',
  'theme_bw',
  'theme_linedraw',
  'theme_light',
  'theme_dark',
  'theme_minimal',
  'theme_classic',
  'theme_void',
  
  # ggthemes
  'theme_wsj',
  'theme_tufte',
  'theme_stata',
  'theme_solid',
  'theme_solarized',
  'theme_map',
  'theme_igray',
  'theme_hc',
  'theme_gdocs',
  'theme_fivethirtyeight',
  'theme_few',
  'theme_excel',
  'theme_economist',
  'theme_calc')


###################
# CURRENTLY SUPPORTED GEOMS
# 
# A geom is supported if it has the following: 
#   * A UI component that lives in './components/body.R'.
#   * Base and other supporting plots in './plots.R'
#   * Server components to return appropriate plots in './server.R'
###################
