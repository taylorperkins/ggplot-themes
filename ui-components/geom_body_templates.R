function(selected_geom) {


  if (selected_geom == 'scatters') {
    return(
      box(
        width = 12,
         
        h2("ggplot Example Scatter Plots"),
        fluidRow(
          box( width = 12, plotOutput("scatter") ),
          box( width = 12, plotOutput("scatter_facet") )
        )
      )
    )
    

  } else if (selected_geom == 'reference_lines') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Reference Lines"),
        fluidRow(
          box( width = 12, plotOutput("rl_vline_1") ),
          box( width = 12, plotOutput("rl_vline_2") ),
          box( width = 12, plotOutput("rl_hline") ),
          box( width = 12, plotOutput("rl_abline_1") ),
          box( width = 12, plotOutput("rl_abline_2") ),
          box( width = 12, plotOutput("rl_abline_3") ),
          box( width = 12, plotOutput("rl_smooth") ),
          box( width = 12, plotOutput("rl_hline_facet") ),
          box( width = 12, plotOutput("rl_hline_facet_mult_aes") )
        ) 
      )
    )
  } else if (selected_geom == 'bars') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Bar Plots"),
        fluidRow(
          box( width = 12, plotOutput("bar") ),
          box( width = 12, plotOutput("bar_weight_aes") ),
          box( width = 12, plotOutput("bar_fill_aes") ),
          box( width = 12, plotOutput("bar_position") ),
          box( width = 12, plotOutput("bar_col_means") ),
          box( width = 12, plotOutput("bar_continuous") ),
          box( width = 12, plotOutput("bar_hist") )
        )
      )
    )
    

  } else if (selected_geom == 'heatmap_2d') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Heatmaps"),
        fluidRow(
          box( width = 12, plotOutput("bin_2d") ),
          box( width = 12, plotOutput("bin_2d_10") ),
          box( width = 12, plotOutput("bin_2d_30") ),
          box( width = 12, plotOutput("bin_2d_binwidtth") )
        ) 
      )
    )
    

  } else if (selected_geom == 'boxplot') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Boxplots"),
        fluidRow(
          box( width = 12, plotOutput("boxplot") ),
          box( width = 12, plotOutput("boxplot_coord_flip") ),
          box( width = 12, plotOutput("boxplot_notch") ),
          box( width = 12, plotOutput("boxplot_varwidth") ),
          box( width = 12, plotOutput("boxplot_fill") ),
          box( width = 12, plotOutput("boxplot_outlier") ),
          box( width = 12, plotOutput("boxplot_jitter") ),
          box( width = 12, plotOutput("boxplot_aes_colour") ),
          box( width = 12, plotOutput("boxplot_continuous_x") ),
          box( width = 12, plotOutput("boxplot_continuous_x_2") ),
          box( width = 12, plotOutput("boxplot_transparent_outliers") ),
          box( width = 12, plotOutput("boxplot_identity") )
        )
      )
    )
    
    
  } else if (selected_geom == 'contour') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example 2d contours of a 3d Surface"),
        fluidRow(
          box( width = 12, plotOutput("contour") ),
          box( width = 12, plotOutput("contour_density_2d") ),
          box( width = 12, plotOutput("contour_bins_2") ),
          box( width = 12, plotOutput("contour_bins_10") ),
          box( width = 12, plotOutput("contour_binwidth_01") ),
          box( width = 12, plotOutput("contour_binwidth_001") ),
          box( width = 12, plotOutput("contour_aes_colour") ),
          box( width = 12, plotOutput("contour_colour_red") ),
          box( width = 12, plotOutput("contour_raster_with_contour") )
        )
      )
    )
    
    
  } else if (selected_geom == 'count_overlap') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Count Overlapping Points"),
        fluidRow(
          box( width = 12, plotOutput("count_overlap_point") ),
          box( width = 12, plotOutput("count_overlap_count") ),
          box( width = 12, plotOutput("count_overlap_scale_size_area") ),
          box( width = 12, plotOutput("count_overlap_count_aes") ),
          box( width = 12, plotOutput("count_overlap_count_aes_scale_size") ),
          box( width = 12, plotOutput("count_overlap_count_aes_scale_size_group_cut") ),
          box( width = 12, plotOutput("count_overlap_count_aes_scale_size_group_clarity") )
        )
      )
    )
    
    
  } else if (selected_geom == 'density') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Smoothed Density Estimates"),
        fluidRow(
          box( width = 12, plotOutput("density") ),
          box( width = 12, plotOutput("density_adjust_1_5") ),
          box( width = 12, plotOutput("density_adjust_5") ),
          box( width = 12, plotOutput("density_xlim") ),
          box( width = 12, plotOutput("density_xlim_alpha") ),
          box( width = 12, plotOutput("density_stacked") ),
          box( width = 12, plotOutput("density_stacked_count") ),
          box( width = 12, plotOutput("density_filled") )
        )
      )
    )
    
    
  } else if (selected_geom == 'density_2d') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Contours of a 2d density estimate"),
        fluidRow(
          box( width = 12, plotOutput("density_2d") ),
          box( width = 12, plotOutput("density_2d_poly") ),
          box( width = 12, plotOutput("density_2d_aes_colour") ),
          box( width = 12, plotOutput("density_2d_poly_facet") ),
          box( width = 12, plotOutput("density_2d_poly_facet_per") ),
          box( width = 12, plotOutput("density_2d_raster") ),
          box( width = 12, plotOutput("density_2d_point") )
        )
      )
    )
    
    
  } else if (selected_geom == 'dotplot') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Dot Plot"),
        fluidRow(
          box( width = 12, plotOutput("dotplot") ),
          box( width = 12, plotOutput("dotplot_binwidth_1_5") ),
          box( width = 12, plotOutput("dotplot_method_histodot") ),
          box( width = 12, plotOutput("dotplot_stackdir_center") ),
          box( width = 12, plotOutput("dotplot_stackdir_centerwhole") ),
          box( width = 12, plotOutput("dotplot_scale_y") ),
          box( width = 12, plotOutput("dotplot_stack_ratio_7") ),
          box( width = 12, plotOutput("dotplot_dotsize_1_25") ),
          box( width = 12, plotOutput("dotplot_binaxis_y") ),
          box( width = 12, plotOutput("dotplot_binaxis_y_factor") ),
          box( width = 12, plotOutput("dotplot_binaxis_y_factor_centerwhole") ),
          box( width = 12, plotOutput("dotplot_factor_center_dodge") ),
          box( width = 12, plotOutput("dotplot_factor_center_binpositions") ),
          box( width = 12, plotOutput("dotplot_factor_stackgroups_histdot") ),
          box( width = 12, plotOutput("dotplot_binaxis_y_factor_histodot") )
        )
      )
    )
    
    
  } else if (selected_geom == 'error_bar') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Error Bars"),
        fluidRow(
          box( width = 12, plotOutput("error_bar") ),
          box( width = 12, plotOutput("error_bar_with_height") )
        )
      )
    )
    
    
  } else if (selected_geom == 'hex') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Hex 2d Bin Counts"),
        fluidRow(
          box( width = 12, plotOutput("hex") ),
          box( width = 12, plotOutput("hex_bins_10") ),
          box( width = 12, plotOutput("hex_bins_30") ),
          box( width = 12, plotOutput("hex_binwidth_1000") ),
          box( width = 12, plotOutput("hex_binwidth_500") )
        )
      )
    )
    
    
  } else if (selected_geom == 'histogram') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Histograms and Frequency Polygons"),
        fluidRow(
          box( width = 12, plotOutput("histogram") ),
          box( width = 12, plotOutput("histogram_binwidth_01") ),
          box( width = 12, plotOutput("histogram_bins_200") ),
          box( width = 12, plotOutput("histogram_fill_binwidth_500") ),
          box( width = 12, plotOutput("histogram_colour_binwidth_500") ),
          box( width = 12, plotOutput("histogram_stat_density") )
        )
      )
    )
    

  } else if (selected_geom == 'jitter') {
    return(
      box(
        width = 12,
        
        h2("ggplot Example Jitter"),
        fluidRow(
          box( width = 12, plotOutput("jitter") ),
          box( width = 12, plotOutput("jitter_colour") ),
          box( width = 12, plotOutput("jitter_width_25") ),
          box( width = 12, plotOutput("jitter_width_height") )
        )
      )
    )
    
    
  }
  
}