# ###################
# # DENSITY GEOMS
# ###################


density_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_density.html
  
  base_plot <- dget("./plots/geom__density.R")
  base_plot_advanced <- dget("./plots/geom__density_advanced.R")
  
  output$density <- renderPlot({ base_plot() + geom_density() + theme_reactive()() })
  output$density_adjust_1_5 <- renderPlot({ base_plot() + geom_density(adjust = 1/5) + theme_reactive()() })
  output$density_adjust_5 <- renderPlot({ base_plot() + geom_density(adjust = 5) + theme_reactive()() })
  output$density_xlim <- renderPlot({ base_plot('depth', colour = 'cut') +  geom_density() + xlim(55, 70) + theme_reactive()() })
  output$density_xlim_alpha <- renderPlot({ base_plot('depth', fill = 'cut', colour = 'cut') + geom_density(alpha = 0.1) + xlim(55, 70) + theme_reactive()() })
  output$density_stacked <- renderPlot({ base_plot(fill = 'cut') + geom_density(position = "stack") + theme_reactive()() })
  output$density_stacked_count <- renderPlot({ base_plot_advanced() + geom_density(position = "stack") + theme_reactive()() })
  output$density_filled <- renderPlot({ base_plot_advanced() + geom_density(position = "fill") + theme_reactive()() })
}
