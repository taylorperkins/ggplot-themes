# ###################
# # DENSITY2D GEOMS
# ###################


density2d_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_density_2d.html
  
  base_plot_faithful <- dget("./plots/geom__density_2d_faithful.R")
  base_plot_diamonds <- dget("./plots/geom__density_2d_diamonds.R")
  
  output$density_2d <- renderPlot({ base_plot_faithful() + geom_density_2d() + theme_reactive()() })
  output$density_2d_poly <- renderPlot({ base_plot_faithful() + stat_density_2d(aes(fill = stat(level)), geom = "polygon") + theme_reactive()() })
  
  output$density_2d_aes_colour <- renderPlot({ base_plot_diamonds() + geom_density_2d(aes(color = cut)) + theme_reactive()() })
  output$density_2d_poly_facet <- renderPlot({ base_plot_diamonds() + stat_density_2d(aes(fill = stat(level)), geom = "polygon") + facet_grid(. ~ cut) + scale_fill_viridis_c() + theme_reactive()() })
  output$density_2d_poly_facet_per <- renderPlot({ base_plot_diamonds() + stat_density_2d(aes(fill = stat(nlevel)), geom = "polygon") + facet_grid(. ~ cut) + scale_fill_viridis_c() + theme_reactive()() })
  output$density_2d_raster <- renderPlot({ base_plot_diamonds() + stat_density_2d(geom = "raster", aes(fill = stat(density)), contour = FALSE) + theme_reactive()() })
  output$density_2d_point <- renderPlot({ base_plot_faithful() + stat_density_2d(geom = "point", aes(size = stat(density)), n = 20, contour = FALSE) + theme_reactive()() })
}
