###################
# body.R
# 
# Create the body for the ui. 
# If you had multiple tabs, you could split those into their own
# components as well.
###################
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "scatters",
            h2("ggplot Example Scatter Plots"),
            fluidRow(
              box( plotOutput("scatter") ),
              box( plotOutput("facet_scatter"))
            )  
    ),
    
    tabItem(tabName = "reference_lines",
            h2("ggplot Example Reference Lines"),
            fluidRow(
              box( plotOutput("vline_1") ),
              box( plotOutput("vline_2") ),
              box( plotOutput("hline") ),
              box( plotOutput("abline_1") ),
              box( plotOutput("abline_2") ),
              box( plotOutput("abline_3") ),
              box( plotOutput("smooth") ),
              box( plotOutput("hline_facet") ),
              box( plotOutput("hline_facet_mult_aes") )
            )
    ),

    tabItem(tabName = "bars",
            h2("ggplot Example Bar Plots"),
            fluidRow(
              box( plotOutput("bar") ),
              box( plotOutput("bar_weight_aes") ),
              box( plotOutput("bar_fill_aes") ),
              box( plotOutput("bar_position") ),
              box( plotOutput("col_means") ),
              box( plotOutput("bar_continuous") ),
              box( plotOutput("hist") )
            )
    ),
    
    tabItem(tabName = "heatmap_2d",
            h2("ggplot Example Heatmaps"),
            fluidRow(
              box( plotOutput("bin2d") ),
              box( plotOutput("bin2d_10") ),
              box( plotOutput("bin2d_30") ),
              box( plotOutput("bin2d_binwidtth") )
            )
    )
  )
)
