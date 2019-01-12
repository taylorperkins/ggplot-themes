###################
# server.R
# 
# For all your server needs 
###################
server <- function(input, output, session) {
  
  geom_reactive <- eventReactive(input$geom, { getFunction(paste0(input$geom, '_geom')) })
  output$geom_display <- renderUI({ geom_reactive()() })
  
  theme_reactive <- eventReactive(input$theme, { getFunction(input$theme) })
  
  output$scatter <- renderPlot({ getFunction('scatter_plot')() + theme_reactive()() })
  output$facet_scatter <- renderPlot({ getFunction('scatter_plot')() + facet_grid(vs ~ am) + theme_reactive()() })
  
}
