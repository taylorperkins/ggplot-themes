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
      selected = 'theme_classic')
    
  )
)
