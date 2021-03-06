###################
# sidebar.R
# 
# Create the sidebar menu options for the ui.
###################


sidebar <- dashboardSidebar(
  sidebarMenu(
    
    ###################
    # GEOM
    # 
    # Select from the list of available geoms
    ###################
    selectInput(
      "geom_selection",
      label = 'First.. Select a geom to test against.',
      choices = c(
        "reference_lines",
        "bars",
        "heatmap_2d",
        "boxplot",
        "contour",
        "count_overlap",
        "density",
        "density_2d",
        "dotplot",
        "error_bar",
        "hex",
        "histogram",
        "jitter",
        "vertical_intervals",
        "map",
        "path",
        "point",
        "qq",
        "quantile",
        "ribbons",
        "rug",
        "segment",
        "smooth",
        "spoke",
        "text",
        "raster",
        "violin"
      ),
      selected = 'jitter'),
    
    
    ###################
    # THEME SELECTOR OPTIONS
    # 
    # These action group butttons determine the layout for the next filters that will be shown.
    # You can either choose from defaults, or upload your own.
    ###################
    actionGroupButtons(
      status = "primary",
      size = 'sm',
      
      inputIds = c("default_theme_action", "upload_theme_action"),
      labels = list("Defaults", "Upload")
    ),
    
    # this is either a dropdown for default themes.. Or an option to upload a custom theme.    
    uiOutput("theme_action")

  )
)
