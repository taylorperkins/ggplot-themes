###################
# sidebar.R
# 
# Create the sidebar menu options for the ui.
###################
sidebar <- dashboardSidebar(
  sidebarMenu(
    
    selectInput(
      "theme",
      label = 'Choose a theme',
      choices = themes,
      selected = 'theme_classic'),
    
    menuItem("Scatter", tabName = "scatters"),
    menuItem("Reference Lines", tabName = "reference_lines"),
    menuItem("Bar", tabName = "bars"),
    menuItem("Heatmap 2D Bin Counts", tabName = "heatmap_2d")
    
  )
)
