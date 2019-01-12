###################
# server.R
# 
# For all your server needs..
###################
server <- function(input, output, session) {
  
  ###################
  # LISTEN TO GEOM CHANGE AND INJECT UI
  ###################
  geom_reactive <- eventReactive(input$geom, { getFunction(paste0(input$geom, '_geom')) })
  output$geom_display <- renderUI({ geom_reactive()() })
  
  ###################
  # LISTEN TO THEME SELECTION AND GENERATE PLOT
  ###################
  plotReactive <- eventReactive(input$geom, { getFunction(paste0(input$geom, '_plot'))() })
  
  ###################
  # LISTEN TO THEME SELECTION
  ###################
  theme_reactive <- eventReactive(input$theme, { getFunction(input$theme) })
  
  ###################
  # SCATTER GEOMS
  ###################
  output$scatter <- renderPlot({ plotReactive() + theme_reactive()() })
  output$facet_scatter <- renderPlot({ plotReactive() + facet_grid(vs ~ am) + theme_reactive()() })
  
}
