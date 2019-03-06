# ###################
# # VIOLIN GEOMS
# ###################


violin_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_violin.html
  
  output$violin <- renderPlot({ 
    ggplot(mtcars, aes(factor(cyl), mpg)) +
      geom_violin() +
      theme_reactive()() })
  
  output$violin_aes_fill <- renderPlot({ 
    ggplot(mtcars, aes(factor(cyl), mpg)) +
      geom_violin(aes(fill = cyl)) +
      theme_reactive()() })
  
  output$violin_aes_fill_factor <- renderPlot({ 
    ggplot(mtcars, aes(factor(cyl), mpg)) +
      geom_violin(aes(fill = factor(am))) +
      theme_reactive()() })
  
}
