###################
# server.R
# 
# For all your server needs..
###################
server <- function(input, output, session) {
  
  ###################
  # LISTEN TO THEME SELECTION AND GENERATE PLOT
  ###################
  # plotReactive <- eventReactive(input$geom, { getFunction(paste0(input$geom, '_plot')) })
  
  ###################
  # LISTEN TO THEME SELECTION
  ###################
  theme_reactive <- eventReactive(input$theme, { getFunction(input$theme) })
  
  ###################
  # SCATTER GEOMS
  ###################
  output$scatter <- renderPlot({ scatter_plot(subtitle = "Scatter Plot") + theme_reactive()() })
  output$facet_scatter <- renderPlot({ scatter_plot(subtitle = "Scatter Plot With Facet Grid") + facet_grid(vs ~ am) + theme_reactive()() })
  
  ###################
  # REFERENCE LINE GEOMS
  ###################
  # used in hline_facet, and hline_facet_mult_aes
  mean_wt <- data.frame(cyl = c(4, 6, 8), wt = c(2.28, 3.11, 4.00))

  output$vline_1 <- renderPlot({ reference_line_plot() + geom_vline(xintercept = 5) + theme_reactive()() })
  output$vline_2 <- renderPlot({ reference_line_plot() + geom_vline(xintercept = 1:5) + theme_reactive()() })
  output$hline <- renderPlot({ reference_line_plot() + geom_hline(yintercept = 20) + theme_reactive()() })
  output$abline_1 <- renderPlot({ reference_line_plot() + geom_abline() + theme_reactive()() })
  output$abline_2 <- renderPlot({ reference_line_plot() + geom_abline(intercept = 20) + theme_reactive()() })
  output$abline_3 <- renderPlot({
    mtcars_lm <- coef(lm(mpg ~ wt, data = mtcars2))
    reference_line_plot() + geom_abline(intercept = mtcars_lm[["(Intercept)"]], slope = mtcars_lm[["wt"]]) + theme_reactive()() })
  output$smooth <- renderPlot({ reference_line_plot() + geom_smooth(method = "lm", se = FALSE) + theme_reactive()() })
  output$hline_facet <- renderPlot({
    reference_line_plot(base_plot = FALSE) + facet_wrap(~ cyl) +
      geom_hline(aes(yintercept = wt), mean_wt) +
      theme_reactive()() })
  output$hline_facet_mult_aes <- renderPlot({
    reference_line_plot(base_plot = FALSE, include_aes = TRUE) +
      geom_hline(aes(yintercept = wt, colour = wt), mean_wt) +
      facet_wrap(~ cyl) +
      theme_reactive()() })


  # ###################
  # # BAR GEOMS
  # ###################
  output$bar <- renderPlot({ bar_plot() + geom_bar() + theme_reactive()() })
  output$bar_weight_aes <- renderPlot({ bar_plot() + geom_bar(aes(weight = displ)) + theme_reactive()() })
  output$bar_fill_aes <- renderPlot({ bar_plot() + geom_bar(aes(fill = drv)) + theme_reactive()() })
  output$bar_position <- renderPlot({
    bar_plot() +
      geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
      coord_flip() +
      theme_reactive()() +
      theme(legend.position = "top") })
  output$col_means <- renderPlot({
    df <- data.frame(trt = c("a", "b", "c"), outcome = c(2.3, 1.9, 3.2))

    ggplot(df, aes(trt, outcome)) +
      geom_col() +
      theme_reactive()()
  })
  output$bar_continuous <- renderPlot({
    df <- data.frame(x = rep(c(2.9, 3.1, 4.5), c(5, 10, 4)))
    ggplot(df, aes(x)) + geom_bar() + theme_reactive()()
  })
  output$hist <- renderPlot({
    df <- data.frame(x = rep(c(2.9, 3.1, 4.5), c(5, 10, 4)))
    ggplot(df, aes(x)) + geom_histogram(binwidth = 0.5) + theme_reactive()()
  })
  
  
  # ###################
  # # HEATMAP GEOMS
  # ###################
  output$bin2d <- renderPlot({ heatmap_plot() + geom_bin2d() + theme_reactive()() })
  output$bin2d_10 <- renderPlot({ heatmap_plot() + geom_bin2d(bins = 10) + theme_reactive()() })
  output$bin2d_30 <- renderPlot({ heatmap_plot() + geom_bin2d(bins = 30) + theme_reactive()() })
  output$bin2d_binwidtth <- renderPlot({ heatmap_plot() + geom_bin2d(binwidth = c(0.1, 0.1)) + theme_reactive()() })
  

  # ###################
  # # BOXPLOT GEOMS
  # ###################
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
  
  
  # ###################
  # # CONTOUR GEOMS
  # ###################
  output$contour <- renderPlot({ contour_plot() + geom_contour() + theme_reactive()() })
  output$density_2d <- renderPlot({ contour_plot(density = FALSE) + geom_density_2d() + theme_reactive()() })
  output$contour_bins_2 <- renderPlot({ contour_plot() + geom_contour(bins = 2) + theme_reactive()() })
  output$contour_bins_10 <- renderPlot({ contour_plot() + geom_contour(bins = 10) + theme_reactive()() })
  output$contour_binwidth_01 <- renderPlot({ contour_plot() + geom_contour(binwidth = 0.01) + theme_reactive()() })
  output$contour_binwidth_001 <- renderPlot({ contour_plot() + geom_contour(binwidth = 0.001) + theme_reactive()() })
  output$contour_aes_colour <- renderPlot({ contour_plot() + geom_contour(aes(colour = stat(level))) + theme_reactive()() })
  output$contour_colour_red <- renderPlot({ contour_plot() + geom_contour(colour = "red") + theme_reactive()() })
  output$raster_with_contour <- renderPlot({ contour_plot() + geom_raster(aes(fill = density)) + geom_contour(colour = "white") + theme_reactive()() })
  
}























