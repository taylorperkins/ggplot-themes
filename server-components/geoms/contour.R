# ###################
# # CONTOUR GEOMS
# ###################

contour_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_contour.html
  
  output$contour <- renderPlot({ contour_plot() + geom_contour() + theme_reactive()() })
  output$contour_density_2d <- renderPlot({ contour_plot(density = FALSE) + geom_density_2d() + theme_reactive()() })
  output$contour_bins_2 <- renderPlot({ contour_plot() + geom_contour(bins = 2) + theme_reactive()() })
  output$contour_bins_10 <- renderPlot({ contour_plot() + geom_contour(bins = 10) + theme_reactive()() })
  output$contour_binwidth_01 <- renderPlot({ contour_plot() + geom_contour(binwidth = 0.01) + theme_reactive()() })
  output$contour_binwidth_001 <- renderPlot({ contour_plot() + geom_contour(binwidth = 0.001) + theme_reactive()() })
  output$contour_aes_colour <- renderPlot({ contour_plot() + geom_contour(aes(colour = stat(level))) + theme_reactive()() })
  output$contour_colour_red <- renderPlot({ contour_plot() + geom_contour(colour = "red") + theme_reactive()() })
  output$contour_raster_with_contour <- renderPlot({ contour_plot() + geom_raster(aes(fill = density)) + geom_contour(colour = "white") + theme_reactive()() })
}