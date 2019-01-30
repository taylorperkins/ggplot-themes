###################
# DEFAULT THEMES
#
# Choose from list of default themes specified in global.R
###################


function() {
  return(
    selectInput(
      "theme",
      label = 'Choose from the default themes.',
      choices = names(themes),
      selected = 'theme_classic')
  )
}
