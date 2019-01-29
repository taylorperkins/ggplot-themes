###################
# sidebar.R
# 
# Create the sidebar menu options for the ui.
###################
sidebar <- dashboardSidebar(
  sidebarMenu(
    
    selectInput(
      "theme",
      label = 'Choose from the default themes.',
      choices = themes,
      selected = 'theme_classic'),
    
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
    
    menuItem("Scatter", tabName = "scatters"),
    menuItem("Reference Lines", tabName = "reference_lines"),
    menuItem("Bar", tabName = "bars"),
    menuItem("Heatmap 2D Bin Counts", tabName = "heatmap_2d"),
    menuItem("Boxplot", tabName = "boxplot"),
    menuItem("Contour", tabName = "contour"),
    menuItem("Count Overlapping Points", tabName = "count_overlap"),
    menuItem("Density", tabName = "density"),
    menuItem("Density 2D", tabName = "density_2d"),
    menuItem("Dotplot", tabName = "dotplot"),
    menuItem("Error Bars", tabName = "error_bar"),
    menuItem("Hex 2D Bins", tabName = "hex")
    
  )
)
