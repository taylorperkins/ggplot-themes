###################
# server.R
# 
# For all your server needs 
###################
server <- function(input, output, session) {
  
  plot <- ggplot(mtcars2) +
    geom_point(aes(x = wt, y = mpg, colour = gear)) +
    labs(title = "Fuel economy declines as weight increases",
         subtitle = "(1973-74)",
         caption = "Data from the 1974 Motor Trend US magazine.",
         tag = "Figure 1",
         x = "Weight (1000 lbs)",
         y = "Fuel economy (mpg)",
         colour = "Gears") +
    theme_classic()
  
  theme_reactive <- eventReactive(input$theme, {
    getFunction(input$theme)
  })
  
  output$scatter <- renderPlot({ plot + theme_reactive()() })
  output$facet_scatter <- renderPlot({ plot + facet_grid(vs ~ am) + theme_reactive()() })
  
}
