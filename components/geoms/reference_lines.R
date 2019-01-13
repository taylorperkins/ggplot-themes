# UI to handle reference line view
reference_line_geom <- function() {
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
}