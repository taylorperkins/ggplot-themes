function(selected_geom) {
  viz_outline <- function(label, ...) {
    parent_width <- 12
    plot_width <- 12
    
    box(
      width = parent_width,
      
      h2(label),
      fluidRow(
        lapply(list(...), function(id) { box( width = plot_width, plotOutput(id) ) })
      )
    )
  }


  if (selected_geom == 'scatters') {
    return(
      viz_outline(
        label = "ggplot Example Scatter Plots",
        "scatter",
        "scatter_facet"
      )
    )
    

  } else if (selected_geom == 'reference_lines') {
    return(
      viz_outline(
        label = "ggplot Example Reference Lines",
        "rl_vline_1",
        "rl_vline_2",
        "rl_hline",
        "rl_abline_1",
        "rl_abline_2",
        "rl_abline_3",
        "rl_smooth",
        "rl_hline_facet",
        "rl_hline_facet_mult_aes"
      )
    )
    

  } else if (selected_geom == 'bars') {
    return(
      viz_outline(
        label = "ggplot Example Bar Plots",
        "bar",
        "bar_weight_aes",
        "bar_fill_aes",
        "bar_position",
        "bar_col_means",
        "bar_continuous",
        "bar_hist"
      )
    )
    

  } else if (selected_geom == 'heatmap_2d') {
    return(
      viz_outline(
        label = "ggplot Example Heatmaps",
        "bin_2d",
        "bin_2d_10",
        "bin_2d_30",
        "bin_2d_binwidtth"
      )
    )
    

  } else if (selected_geom == 'boxplot') {
    return(
      viz_outline(
        label = "ggplot Example Boxplots",
        "boxplot",
        "boxplot_coord_flip",
        "boxplot_notch",
        "boxplot_varwidth",
        "boxplot_fill",
        "boxplot_outlier",
        "boxplot_jitter",
        "boxplot_aes_colour",
        "boxplot_continuous_x",
        "boxplot_continuous_x_2",
        "boxplot_transparent_outliers",
        "boxplot_identity"
      )
    )
    
    
  } else if (selected_geom == 'contour') {
    return(
      viz_outline(
        label = "ggplot Example 2d contours of a 3d Surface",
        "contour",
        "contour_density_2d",
        "contour_bins_2",
        "contour_bins_10",
        "contour_binwidth_01",
        "contour_binwidth_001",
        "contour_aes_colour",
        "contour_colour_red",
        "contour_raster_with_contour"
      )
    )
    
    
  } else if (selected_geom == 'count_overlap') {
    return(
      viz_outline(
        label = "ggplot Example Count Overlapping Points",
        "count_overlap_point",
        "count_overlap_count",
        "count_overlap_scale_size_area",
        "count_overlap_count_aes",
        "count_overlap_count_aes_scale_size",
        "count_overlap_count_aes_scale_size_group_cut",
        "count_overlap_count_aes_scale_size_group_clarity"
      )
    )
    
    
  } else if (selected_geom == 'density') {
    return(
      viz_outline(
        label = "ggplot Example Smoothed Density Estimates",
        "density",
        "density_adjust_1_5",
        "density_adjust_5",
        "density_xlim",
        "density_xlim_alpha",
        "density_stacked",
        "density_stacked_count",
        "density_filled"
      )
    )
    
    
  } else if (selected_geom == 'density_2d') {
    return(
      viz_outline(
        label = "ggplot Example Contours of a 2d density estimate",
        "density_2d",
        "density_2d_poly",
        "density_2d_aes_colour",
        "density_2d_poly_facet",
        "density_2d_poly_facet_per",
        "density_2d_raster",
        "density_2d_point"
      )
    )
    
    
  } else if (selected_geom == 'dotplot') {
    return(
      viz_outline(
        label = "ggplot Example Dot Plot",
        "dotplot",
        "dotplot_binwidth_1_5",
        "dotplot_method_histodot",
        "dotplot_stackdir_center",
        "dotplot_stackdir_centerwhole",
        "dotplot_scale_y",
        "dotplot_stack_ratio_7",
        "dotplot_dotsize_1_25",
        "dotplot_binaxis_y",
        "dotplot_binaxis_y_factor",
        "dotplot_binaxis_y_factor_centerwhole",
        "dotplot_factor_center_dodge",
        "dotplot_factor_center_binpositions",
        "dotplot_factor_stackgroups_histdot",
        "dotplot_binaxis_y_factor_histodot"
      )
    )
    
    
  } else if (selected_geom == 'error_bar') {
    return(
      viz_outline(
        label = "ggplot Example Error Bars",
        "error_bar",
        "error_bar_with_height"
      )
    )
    
    
  } else if (selected_geom == 'hex') {
    return(
      viz_outline(
        label = "ggplot Example Hex 2d Bin Counts",
        "hex",
        "hex_bins_10",
        "hex_bins_30",
        "hex_binwidth_1000",
        "hex_binwidth_500"
      )
    )
    
    
  } else if (selected_geom == 'histogram') {
    return(
      viz_outline(
        label = "ggplot Example Histograms and Frequency Polygons",
        "histogram",
        "histogram_binwidth_01",
        "histogram_bins_200",
        "histogram_fill_binwidth_500",
        "histogram_colour_binwidth_500",
        "histogram_stat_density"
      )
    )
    

  } else if (selected_geom == 'jitter') {
    return(
      viz_outline(
        label = "ggplot Example Jitter",
        "jitter",
        "jitter_colour",
        "jitter_width_25",
        "jitter_width_height"
      )
    )
    
    
  } else if (selected_geom == 'vertical_intervals') {
    return(
      viz_outline(
        label = "ggplot Example Vertical Intervals: (lines, crossbars & errorbars)",
        "linerange",
        "pointrange",
        "crossbar",
        "errorbar",
        "line_errorbar",
        "dodge_error",
        "dodge_error_width",
        "dodge2_error"
      )
    )
    
    
  } else if (selected_geom == 'map') {
    return(
      viz_outline(
        label = "ggplot Example Map",
        "map",
        "map_fill",
        "map_fill_ylim",
        "map_crimes"
      )
    )
    
    
  } else if (selected_geom == 'path') {
    return(
      viz_outline(
        label = "ggplot Example Paths",
        "date_trend",
        "date_trend_colour",
        "step",
        "path_colour",
        "trend_red",
        "arrow",
        "line_break",
        "line_type_colour_size"
      )
    )
    
    
  } else if (selected_geom == 'point') {
    return(
      viz_outline(
        label = "ggplot Example Point",
        "point",
        "point_colour",
        "point_shape",
        "point_size",
        "point_static_colour_size",
        "point_alpha_10",
        "point_alpha_20",
        "point_alpha_100",
        "point_black_fill",
        "point_pink_shape"
      )
    )
    
    
  } else if (selected_geom == 'qq') {
    return(
      viz_outline(
        label = "ggplot Example Quantile-Quantile (qq)",
        "qq",
        "qq_dist",
        "qq_dist_variable",
        "qq_dist_variable_colour"
        
      )
    )
    
    
  } else if (selected_geom == 'quantile') {
    return(
      viz_outline(
        label = "ggplot Example Quantile-Regression",
        "quantile",
        "quantile_05",
        "quantile_by_seq",
        "quantile_rqss",
        "quantile_rqss_smoothing",
        "quantile_red"
        
      )
    )
    
    
  } else if (selected_geom == 'ribbons') {
    return(
      viz_outline(
        label = "ggplot Example Ribbons and Area",
        "ribbon_level",
        "ribbon_line"
        
      )
    )
    
    
  } else if (selected_geom == 'rug') {
    return(
      viz_outline(
        label = "ggplot Example Rug",
        "rug",
        "rug_b_side",
        "rug_trbl_side",
        "rug_with_jitter"
      )
    )
    
    
  } else if (selected_geom == 'segment') {
    return(
      viz_outline(
        label = "ggplot Example Segments",
        "segment",
        "segment_map"
      )
    )
    
    
  } else if (selected_geom == 'smooth') {
    return(
      viz_outline(
        label = "ggplot Example Smoothing",
        "smooth",
        "smooth_lm",
        "smooth_lm_colour",
        "smooth_facet"
      )
    )
    
    
  }
  
}