###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################

library(shiny)
library(shinydashboard)
library(shinyalert)
library(shinyWidgets)

library(ggplot2)
library(ggthemes)
library(hexbin)


###################
# DATASETS USED FOR PLOTS (used in misc. servers)
###################
source('./datasets.R')


###################
# FUNCTIONS USED THROUGHOUT THE APP
###################

# sidebar action theme templates
default_theme_render <- dget('./ui-components/sidebar__default_theme_action.R')
upload_theme_render <- dget('./ui-components/sidebar__upload_theme_action.R')


###################
# ALL CURRENT GGPLOT THEMES (used in UI)
###################
themes <- c(
  # default ggplot themes
  theme_gray=theme_gray,
  theme_bw=theme_bw,
  theme_linedraw=theme_linedraw,
  theme_light=theme_light,
  theme_dark=theme_dark,
  theme_minimal=theme_minimal,
  theme_classic=theme_classic,
  theme_void=theme_void,
  
  # ggthemes
  theme_wsj=theme_wsj,
  theme_tufte=theme_tufte,
  theme_stata=theme_stata,
  theme_solid=theme_solid,
  theme_solarized=theme_solarized,
  theme_map=theme_map,
  theme_igray=theme_igray,
  theme_hc=theme_hc,
  theme_gdocs=theme_gdocs,
  theme_fivethirtyeight=theme_fivethirtyeight,
  theme_few=theme_few,
  theme_excel=theme_excel,
  theme_economist=theme_economist,
  theme_calc=theme_calc)


###################
# CURRENTLY SUPPORTED GEOMS
# 
# A geom is supported if it has the following: 
#   * A UI component that lives in './components/body.R'.
#   * Base and other supporting plots in './plots.R'
#   * Server components to return appropriate plots in './server.R'
###################
