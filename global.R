###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################
library(shiny)
library(shinydashboard)

library(ggplot2)

###################
# DATASETS USED FOR PLOTS
###################
source('./datasets.R')

###################
# UI COMPONENTS PER GEOM
###################
source('./components/geoms/scatter.R')


###################
# PLOTS FOR SUPPORTING SELECTED GEOMS
###################
source('./plots.py')


###################
# ALL CURRENT GGPLOT THEMES
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
#   * A UI component that lives in './components/geoms/'.
#      Function like: 
#        <geom_name>_geom -> function() {
#          fluidRow(..)
#        }
#
#   * Base and other supporting plots in './plots.R'
#   * Server components to return appropriate plots in './server.R'
###################
geoms <- c(
  'scatter')
