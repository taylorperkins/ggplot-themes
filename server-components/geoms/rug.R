# ###################
# # RUG GEOMS
# ###################


rug_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_rug.html
  
  p <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point()
  
  output$rug <- renderPlot({
    p + geom_rug() +
      theme_reactive()()
  })
  
  output$rug_b_side <- renderPlot({
    p + geom_rug(sides="b") +
      theme_reactive()()
  })
  
  output$rug_trbl_side <- renderPlot({
    p + geom_rug(sides="trbl") +
      theme_reactive()()
  })
  
  output$rug_with_jitter <- renderPlot({
    ggplot(mpg, aes(displ, cty)) +
      geom_jitter() +
      geom_rug(alpha = 1/2, position = "jitter") +
      theme_reactive()()
  })
}
