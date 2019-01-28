# ###################
# # DENSITY2D GEOMS
# ###################
density2d_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_density_2d.html
  
  output$density_2d <- renderPlot({ density_2d_faithful_plot() + geom_density_2d() + theme_reactive()() })
  output$density_2d_poly <- renderPlot({ density_2d_faithful_plot() + stat_density_2d(aes(fill = stat(level)), geom = "polygon") + theme_reactive()() })
  
  output$density_2d_aes_colour <- renderPlot({ density_2d_diamonds_plot() + geom_density_2d(aes(color = cut)) + theme_reactive()() })
  output$density_2d_poly_facet <- renderPlot({ density_2d_diamonds_plot() + stat_density_2d(aes(fill = stat(level)), geom = "polygon") + facet_grid(. ~ cut) + scale_fill_viridis_c() + theme_reactive()() })
  output$density_2d_poly_facet_per <- renderPlot({ density_2d_diamonds_plot() + stat_density_2d(aes(fill = stat(nlevel)), geom = "polygon") + facet_grid(. ~ cut) + scale_fill_viridis_c() + theme_reactive()() })
  output$density_2d_raster <- renderPlot({ density_2d_diamonds_plot() + stat_density_2d(geom = "raster", aes(fill = stat(density)), contour = FALSE) + theme_reactive()() })
  output$density_2d_point <- renderPlot({ density_2d_faithful_plot() + stat_density_2d(geom = "point", aes(size = stat(density)), n = 20, contour = FALSE) + theme_reactive()() })
}