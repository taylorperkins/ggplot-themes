###################
# body.R
# 
# Create the body for the ui. 
# If you had multiple tabs, you could split those into their own
# components as well.
###################
body <- dashboardBody(
  fluidRow(
    # PLOT THE THTINGS
    box( plotOutput("scatter") ),
    box( plotOutput("facet_scatter") )
  )
)