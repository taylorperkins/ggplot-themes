# ###################
# # HEATMAP GEOMS
# ###################


heatmap_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_bin2d.html
  
  base_plot <- dget("./plots/geom__heatmap.R")
  
  output$bin_2d <- renderPlot({ base_plot() + geom_bin2d() + theme_reactive()() })
  output$bin_2d_10 <- renderPlot({ base_plot() + geom_bin2d(bins = 10) + theme_reactive()() })
  output$bin_2d_30 <- renderPlot({ base_plot() + geom_bin2d(bins = 30) + theme_reactive()() })
  output$bin_2d_binwidtth <- renderPlot({ base_plot() + geom_bin2d(binwidth = c(0.1, 0.1)) + theme_reactive()() })
}
