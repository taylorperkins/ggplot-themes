# ###################
# # TEXT GEOMS
# ###################


text_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_text.html
  
  p <- ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars)))
  
  output$text <- renderPlot({ 
    p + geom_text() +
      theme_reactive()() })
  
  output$text_label <- renderPlot({ 
    p + geom_label() +
      theme_reactive()() })
  
  output$text_colour <- renderPlot({ 
    p + geom_text(aes(colour = factor(cyl))) +
      theme_reactive()() })
  
}
