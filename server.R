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
  output$scatter_facet <- renderPlot({ scatter_plot(subtitle = "Scatter Plot With Facet Grid") + facet_grid(vs ~ am) + theme_reactive()() })
  
  ###################
  # REFERENCE LINE GEOMS
  ###################
  # used in hline_facet, and hline_facet_mult_aes
  mean_wt <- data.frame(cyl = c(4, 6, 8), wt = c(2.28, 3.11, 4.00))

  output$rl_vline_1 <- renderPlot({ reference_line_plot() + geom_vline(xintercept = 5) + theme_reactive()() })
  output$rl_vline_2 <- renderPlot({ reference_line_plot() + geom_vline(xintercept = 1:5) + theme_reactive()() })
  output$rl_hline <- renderPlot({ reference_line_plot() + geom_hline(yintercept = 20) + theme_reactive()() })
  output$rl_abline_1 <- renderPlot({ reference_line_plot() + geom_abline() + theme_reactive()() })
  output$rl_abline_2 <- renderPlot({ reference_line_plot() + geom_abline(intercept = 20) + theme_reactive()() })
  output$rl_abline_3 <- renderPlot({
    mtcars_lm <- coef(lm(mpg ~ wt, data = mtcars2))
    reference_line_plot() + geom_abline(intercept = mtcars_lm[["(Intercept)"]], slope = mtcars_lm[["wt"]]) + theme_reactive()() })
  output$rl_smooth <- renderPlot({ reference_line_plot() + geom_smooth(method = "lm", se = FALSE) + theme_reactive()() })
  output$rl_hline_facet <- renderPlot({
    reference_line_plot(base_plot = FALSE) + facet_wrap(~ cyl) +
      geom_hline(aes(yintercept = wt), mean_wt) +
      theme_reactive()() })
  output$rl_hline_facet_mult_aes <- renderPlot({
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
  
  output$bar_col_means <- renderPlot({
    df <- data.frame(trt = c("a", "b", "c"), outcome = c(2.3, 1.9, 3.2))

    ggplot(df, aes(trt, outcome)) +
      geom_col() +
      theme_reactive()()
  })
  
  output$bar_continuous <- renderPlot({
    df <- data.frame(x = rep(c(2.9, 3.1, 4.5), c(5, 10, 4)))
    ggplot(df, aes(x)) + geom_bar() + theme_reactive()()
  })
  
  output$bar_hist <- renderPlot({
    df <- data.frame(x = rep(c(2.9, 3.1, 4.5), c(5, 10, 4)))
    ggplot(df, aes(x)) + geom_histogram(binwidth = 0.5) + theme_reactive()()
  })
  
  
  # ###################
  # # HEATMAP GEOMS
  # ###################
  output$bin_2d <- renderPlot({ heatmap_plot() + geom_bin2d() + theme_reactive()() })
  output$bin_2d_10 <- renderPlot({ heatmap_plot() + geom_bin2d(bins = 10) + theme_reactive()() })
  output$bin_2d_30 <- renderPlot({ heatmap_plot() + geom_bin2d(bins = 30) + theme_reactive()() })
  output$bin_2d_binwidtth <- renderPlot({ heatmap_plot() + geom_bin2d(binwidth = c(0.1, 0.1)) + theme_reactive()() })
  

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
  output$contour_density_2d <- renderPlot({ contour_plot(density = FALSE) + geom_density_2d() + theme_reactive()() })
  output$contour_bins_2 <- renderPlot({ contour_plot() + geom_contour(bins = 2) + theme_reactive()() })
  output$contour_bins_10 <- renderPlot({ contour_plot() + geom_contour(bins = 10) + theme_reactive()() })
  output$contour_binwidth_01 <- renderPlot({ contour_plot() + geom_contour(binwidth = 0.01) + theme_reactive()() })
  output$contour_binwidth_001 <- renderPlot({ contour_plot() + geom_contour(binwidth = 0.001) + theme_reactive()() })
  output$contour_aes_colour <- renderPlot({ contour_plot() + geom_contour(aes(colour = stat(level))) + theme_reactive()() })
  output$contour_colour_red <- renderPlot({ contour_plot() + geom_contour(colour = "red") + theme_reactive()() })
  output$contour_raster_with_contour <- renderPlot({ contour_plot() + geom_raster(aes(fill = density)) + geom_contour(colour = "white") + theme_reactive()() })
  
  
  # ###################
  # # COUNT OVERLAP GEOMS
  # ###################
  output$count_overlap_point <- renderPlot({ count_overlap_plot() + geom_point() + theme_reactive()() })
  output$count_overlap_count <- renderPlot({ count_overlap_plot() + geom_count() + theme_reactive()() })
  output$count_overlap_scale_size_area <- renderPlot({ count_overlap_plot() + geom_count() + scale_size_area() + theme_reactive()() })
  output$count_overlap_count_aes <- renderPlot({ count_overlap_plot(use_mpg = FALSE) + geom_count(aes(size = stat(prop))) + theme_reactive()() })
  output$count_overlap_count_aes_scale_size <- renderPlot({ count_overlap_plot(use_mpg = FALSE) + geom_count(aes(size = stat(prop), group = 1)) + scale_size_area(max_size = 10) + theme_reactive()() })
  output$count_overlap_count_aes_scale_size_group_cut <- renderPlot({ count_overlap_plot(use_mpg = FALSE) + geom_count(aes(size = stat(prop), group = cut)) + scale_size_area(max_size = 10) + theme_reactive()() })
  output$count_overlap_count_aes_scale_size_group_clarity <- renderPlot({ count_overlap_plot(use_mpg = FALSE) + geom_count(aes(size = stat(prop), group = clarity)) + scale_size_area(max_size = 10) + theme_reactive()() })
  
  
  # ###################
  # # DENSITY GEOMS
  # ###################
  output$density <- renderPlot({ density_plot() + geom_density() + theme_reactive()() })
  output$density_adjust_1_5 <- renderPlot({ density_plot() + geom_density(adjust = 1/5) + theme_reactive()() })
  output$density_adjust_5 <- renderPlot({ density_plot() + geom_density(adjust = 5) + theme_reactive()() })
  output$density_xlim <- renderPlot({ density_plot('depth', colour = 'cut') +  geom_density() + xlim(55, 70) + theme_reactive()() })
  output$density_xlim_alpha <- renderPlot({ density_plot('depth', fill = 'cut', colour = 'cut') + geom_density(alpha = 0.1) + xlim(55, 70) + theme_reactive()() })
  output$density_stacked <- renderPlot({ density_plot(fill = 'cut') + geom_density(position = "stack") + theme_reactive()() })
  output$density_stacked_count <- renderPlot({ density_plot_advanced() + geom_density(position = "stack") + theme_reactive()() })
  output$density_filled <- renderPlot({ density_plot_advanced() + geom_density(position = "fill") + theme_reactive()() })
  

  # ###################
  # # DENSITY2D GEOMS
  # ###################
  output$density_2d <- renderPlot({ density_2d_faithful_plot() + geom_density_2d() + theme_reactive()() })
  output$density_2d_poly <- renderPlot({ density_2d_faithful_plot() + stat_density_2d(aes(fill = stat(level)), geom = "polygon") + theme_reactive()() })
  
  output$density_2d_aes_colour <- renderPlot({ density_2d_diamonds_plot() + geom_density_2d(aes(color = cut)) + theme_reactive()() })
  output$density_2d_poly_facet <- renderPlot({ density_2d_diamonds_plot() + stat_density_2d(aes(fill = stat(level)), geom = "polygon") + facet_grid(. ~ cut) + scale_fill_viridis_c() + theme_reactive()() })
  output$density_2d_poly_facet_per <- renderPlot({ density_2d_diamonds_plot() + stat_density_2d(aes(fill = stat(nlevel)), geom = "polygon") + facet_grid(. ~ cut) + scale_fill_viridis_c() + theme_reactive()() })
  output$density_2d_raster <- renderPlot({ density_2d_diamonds_plot() + stat_density_2d(geom = "raster", aes(fill = stat(density)), contour = FALSE) + theme_reactive()() })
  output$density_2d_point <- renderPlot({ density_2d_faithful_plot() + stat_density_2d(geom = "point", aes(size = stat(density)), n = 20, contour = FALSE) + theme_reactive()() })
  
  
  ###################
  # DOTPLOT GEOMS
  ###################
  output$dotplot <- renderPlot({ dotplot_plot() + geom_dotplot() + theme_reactive()() })
  output$dotplot_binwidth_1_5 <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5) + theme_reactive()() })
  output$dotplot_method_histodot <- renderPlot({ dotplot_plot() + geom_dotplot(method="histodot", binwidth = 1.5) + theme_reactive()() })
  output$dotplot_stackdir_center <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5, stackdir = "center") + theme_reactive()() })
  output$dotplot_stackdir_centerwhole <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5, stackdir = "centerwhole") + theme_reactive()() })
  output$dotplot_scale_y <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5) + scale_y_continuous(NULL, breaks = NULL) + theme_reactive()() })
  output$dotplot_stack_ratio_7 <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5, stackratio = .7) + theme_reactive()() })
  output$dotplot_dotsize_1_25 <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5, dotsize = 1.25) + theme_reactive()() })
  output$dotplot_binaxis_y <- renderPlot({ dotplot_plot(reverse = TRUE) + geom_dotplot(binaxis = "y", stackdir = "center") + theme_reactive()() })
  output$dotplot_binaxis_y_factor <- renderPlot({ dotplot_plot(as_factor = TRUE) + geom_dotplot(binaxis = "y", stackdir = "center") + theme_reactive()() })
  output$dotplot_binaxis_y_factor_centerwhole <- renderPlot({ dotplot_plot(as_factor = TRUE) + geom_dotplot(binaxis = "y", stackdir = "centerwhole") + theme_reactive()() })
  output$dotplot_factor_center_dodge <- renderPlot({ 
    ggplot(mtcars, aes(x = factor(vs), fill = factor(cyl), y = mpg)) +
      geom_dotplot(binaxis = "y", stackdir = "center", position = "dodge") +
      theme_reactive()()
  })
  output$dotplot_factor_center_binpositions <- renderPlot({ 
    ggplot(mtcars, aes(x = factor(am), y = mpg)) +
      geom_dotplot(binaxis = "y", stackdir = "center", binpositions="all") +
      theme_reactive()()
  })
  output$dotplot_factor_stackgroups_histdot <- renderPlot({ 
    ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
      geom_dotplot(stackgroups = TRUE, binwidth = 1, method = "histodot") +
      theme_reactive()()
  })
  output$dotplot_binaxis_y_factor_histodot <- renderPlot({ 
    ggplot(mtcars, aes(x = 1, y = mpg, fill = factor(cyl))) +
      geom_dotplot(binaxis = "y", stackgroups = TRUE, binwidth = 1, method = "histodot") +
      theme_reactive()()
  })
  
  
  # ###################
  # # DENSITY2D GEOMS
  # ###################
  output$density_2d <- renderPlot({ density_2d_faithful_plot() + geom_density_2d() + theme_reactive()() })
  
}






















