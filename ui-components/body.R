###################
# body.R
# 
# Create the body for the ui.
# Most of this is actually being determined in './ui-components/geom_body_templates.R'
###################


body <- dashboardBody(
  fluidRow(
    uiOutput("geom_viz")  
  )
)
