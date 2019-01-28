###################
# body.R
# 
# Create the body for the ui. 
# If you had multiple tabs, you could split those into their own
# components as well.
###################
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "scatters",
            h2("ggplot Example Scatter Plots"),
            fluidRow(
              box( plotOutput("scatter") ),
              box( plotOutput("scatter_facet"))
            )  
    ),
    
    tabItem(tabName = "reference_lines",
            h2("ggplot Example Reference Lines"),
            fluidRow(
              box( plotOutput("rl_vline_1") ),
              box( plotOutput("rl_vline_2") ),
              box( plotOutput("rl_hline") ),
              box( plotOutput("rl_abline_1") ),
              box( plotOutput("rl_abline_2") ),
              box( plotOutput("rl_abline_3") ),
              box( plotOutput("rl_smooth") ),
              box( plotOutput("rl_hline_facet") ),
              box( plotOutput("rl_hline_facet_mult_aes") )
            )
    ),

    tabItem(tabName = "bars",
            h2("ggplot Example Bar Plots"),
            fluidRow(
              box( plotOutput("bar") ),
              box( plotOutput("bar_weight_aes") ),
              box( plotOutput("bar_fill_aes") ),
              box( plotOutput("bar_position") ),
              box( plotOutput("bar_col_means") ),
              box( plotOutput("bar_continuous") ),
              box( plotOutput("bar_hist") )
            )
    ),
    
    tabItem(tabName = "heatmap_2d",
            h2("ggplot Example Heatmaps"),
            fluidRow(
              box( plotOutput("bin_2d") ),
              box( plotOutput("bin_2d_10") ),
              box( plotOutput("bin_2d_30") ),
              box( plotOutput("bin_2d_binwidtth") )
            )
    ),
    
    tabItem(tabName = "boxplot",
            h2("ggplot Example Boxplots"),
            fluidRow(
              box( plotOutput("boxplot") ),
              box( plotOutput("boxplot_coord_flip") ),
              box( plotOutput("boxplot_notch") ),
              box( plotOutput("boxplot_varwidth") ),
              box( plotOutput("boxplot_fill") ),
              box( plotOutput("boxplot_outlier") ),
              box( plotOutput("boxplot_jitter") ),
              box( plotOutput("boxplot_aes_colour") ),
              box( plotOutput("boxplot_continuous_x") ),
              box( plotOutput("boxplot_continuous_x_2") ),
              box( plotOutput("boxplot_transparent_outliers") ),
              box( plotOutput("boxplot_identity") )
            )
    ),
    
    tabItem(tabName = "contour",
            h2("ggplot Example 2d contours of a 3d Surface"),
            fluidRow(
              box( plotOutput("contour") ),
              box( plotOutput("contour_density_2d") ),
              box( plotOutput("contour_bins_2") ),
              box( plotOutput("contour_bins_10") ),
              box( plotOutput("contour_binwidth_01") ),
              box( plotOutput("contour_binwidth_001") ),
              box( plotOutput("contour_aes_colour") ),
              box( plotOutput("contour_colour_red") ),
              box( plotOutput("contour_raster_with_contour") )
            )
    ),
    
    tabItem(tabName = "count_overlap",
            h2("ggplot Example Count Overlapping Points"),
            fluidRow(
              box( plotOutput("count_overlap_point") ),
              box( plotOutput("count_overlap_count") ),
              box( plotOutput("count_overlap_scale_size_area") ),
              box( plotOutput("count_overlap_count_aes") ),
              box( plotOutput("count_overlap_count_aes_scale_size") ),
              box( plotOutput("count_overlap_count_aes_scale_size_group_cut") ),
              box( plotOutput("count_overlap_count_aes_scale_size_group_clarity") )
            )
    ),
    
    tabItem(tabName = "density",
            h2("ggplot Example Smoothed Density Estimates"),
            fluidRow(
              box( plotOutput("density") ),
              box( plotOutput("density_adjust_1_5") ),
              box( plotOutput("density_adjust_5") ),
              box( plotOutput("density_xlim") ),
              box( plotOutput("density_xlim_alpha") ),
              box( plotOutput("density_stacked") ),
              box( plotOutput("density_stacked_count") ),
              box( plotOutput("density_filled") )
            )
    ),
    
    tabItem(tabName = "density_2d",
            h2("ggplot Example Contours of a 2d density estimate"),
            fluidRow(
              box( plotOutput("density_2d") ),
              box( plotOutput("density_2d_poly") ),
              box( plotOutput("density_2d_aes_colour") ),
              box( plotOutput("density_2d_poly_facet") ),
              box( plotOutput("density_2d_poly_facet_per") ),
              box( plotOutput("density_2d_raster") ),
              box( plotOutput("density_2d_point") )
            )
    ),
    
    tabItem(tabName = "dotplot",
            h2("ggplot Example Dot Plot"),
            fluidRow(
              box( plotOutput("dotplot") ),
              box( plotOutput("dotplot_binwidth_1_5") ),
              box( plotOutput("dotplot_method_histodot") ),
              box( plotOutput("dotplot_stackdir_center") ),
              box( plotOutput("dotplot_stackdir_centerwhole") ),
              box( plotOutput("dotplot_scale_y") ),
              box( plotOutput("dotplot_stack_ratio_7") ),
              box( plotOutput("dotplot_dotsize_1_25") ),
              box( plotOutput("dotplot_binaxis_y") ),
              box( plotOutput("dotplot_binaxis_y_factor") ),
              box( plotOutput("dotplot_binaxis_y_factor_centerwhole") ),
              box( plotOutput("dotplot_factor_center_dodge") ),
              box( plotOutput("dotplot_factor_center_binpositions") ),
              box( plotOutput("dotplot_factor_stackgroups_histdot") ),
              box( plotOutput("dotplot_binaxis_y_factor_histodot") )
            )
    )
  )
)
