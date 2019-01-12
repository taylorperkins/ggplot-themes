# UI to handle scatter plot view
scatter_geom <- function() {
  fluidRow(
    box( plotOutput("scatter") ),
    box( plotOutput("facet_scatter"))
  )  
}
