###################
# SCATTER GEOMS
###################
scatter_server <- function(input, output, session, theme_reactive) {
  # I dont remember where I came up with these..
  output$scatter <- renderPlot({ scatter_plot(subtitle = "Scatter Plot") + theme_reactive()() })
  output$scatter_facet <- renderPlot({ scatter_plot(subtitle = "Scatter Plot With Facet Grid") + facet_grid(vs ~ am) + theme_reactive()() })
}