# ###################
# # BOXPLOT GEOMS
# ###################
boxplot_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_boxplot.html
  
  output$boxplot <- renderPlot({ boxplot_plot_1() + geom_boxplot() + theme_reactive()() })
  output$boxplot_coord_flip <- renderPlot({ boxplot_plot_1() + geom_boxplot() + coord_flip() + theme_reactive()() })
  output$boxplot_notch <- renderPlot({ boxplot_plot_1() + geom_boxplot(notch = TRUE) + theme_reactive()() })
  output$boxplot_varwidth <- renderPlot({ boxplot_plot_1() + geom_boxplot(varwidth = TRUE) + theme_reactive()() })
  output$boxplot_fill <- renderPlot({ boxplot_plot_1() + geom_boxplot(fill = "white", colour = "#3366FF") + theme_reactive()() })
  output$boxplot_outlier <- renderPlot({ boxplot_plot_1() + geom_boxplot(outlier.colour = "red", outlier.shape = 1) + theme_reactive()() })
  output$boxplot_jitter <- renderPlot({ boxplot_plot_1() + geom_boxplot(outlier.shape = NA) + geom_jitter(width = 0.2) + theme_reactive()() })
  output$boxplot_aes_colour <- renderPlot({ boxplot_plot_1() + geom_boxplot(aes(colour = drv)) + theme_reactive()() })
  output$boxplot_continuous_x <- renderPlot({ boxplot_plot_2() + geom_boxplot() + theme_reactive()() })
  output$boxplot_continuous_x_2 <- renderPlot({ boxplot_plot_2() + geom_boxplot(aes(group = cut_width(carat, 0.25))) + theme_reactive()() })
  output$boxplot_transparent_outliers <- renderPlot({ boxplot_plot_2() + geom_boxplot(aes(group = cut_width(carat, 0.25)), outlier.alpha = 0.1) + theme_reactive()() })
  output$boxplot_identity <- renderPlot({ 
    y <- rnorm(100)
    df <- data.frame(
      x = 1,
      y0 = min(y),
      y25 = quantile(y, 0.25),
      y50 = median(y),
      y75 = quantile(y, 0.75),
      y100 = max(y)
    )
    ggplot(df, aes(x)) +
      geom_boxplot(
        aes(ymin = y0, lower = y25, middle = y50, upper = y75, ymax = y100),
        stat = "identity"
      )
  }) 
}