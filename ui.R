###################
# ui.R
# 
# Initializes the ui. 
# Used to load in your header, sidebar, and body components.
###################
source('./ui-components/header.R')
source('./ui-components/sidebar.R')
source('./ui-components/body.R')


ui <- dashboardPage(
  useShinyalert(),
  
  header = header,
  sidebar =  sidebar,
  body = body)
