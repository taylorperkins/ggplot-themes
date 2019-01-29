###################
# SCATTER GEOMS
###################


scatter_server <- function(input, output, session, theme_reactive) {
  base_plot <- dget("./plots/geom__scatter.R")
  
  # I dont remember where I came up with these..
  output$scatter <- renderPlot({ base_plot(subtitle = "Scatter Plot") + theme_reactive()() })
  output$scatter_facet <- renderPlot({ base_plot(subtitle = "Scatter Plot With Facet Grid") + facet_grid(vs ~ am) + theme_reactive()() })
}
