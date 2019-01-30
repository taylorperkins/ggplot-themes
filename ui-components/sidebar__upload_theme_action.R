###################
# CUSTOM THEME (OPTIONAL)
#
# Optionally.. Upload your own theme from .Rds file
###################


function() {
  return(
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
      accept = c(".Rds"))
  )
}
