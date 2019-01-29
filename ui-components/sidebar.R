###################
# sidebar.R
# 
# Create the sidebar menu options for the ui.
###################


sidebar <- dashboardSidebar(
  sidebarMenu(
    
    ###################
    # THEMES
    # 
    # Choose from list of default themes specified in global.R
    ###################
    selectInput(
      "theme",
      label = 'Choose from the default themes.',
      choices = themes,
      selected = 'theme_classic'),
    

    ###################
    # CUSTOM THEME (OPTIONAL)
    # 
    # Optionally.. Upload your own theme from .Rds file
    ###################
    fileInput(
      "theme_upload", 
      span(
        "Or.. Upload your own.",
        actionLink(
          "upload_what_is_this",
          label = "",
          icon = icon("question-circle"),
          style = "display: inline-block;"
        )
      ),
      multiple = FALSE,
      accept = c(".Rds")),
    
    
    ###################
    # GEOM
    # 
    # Select from the list of available geoms
    ###################
    selectInput(
      "geom_selection",
      label = 'Finally.. Select a geom to test against.',
      choices = c(
        "scatters",
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
        "hex"
      ),
      selected = 'scatters')
  )
)
