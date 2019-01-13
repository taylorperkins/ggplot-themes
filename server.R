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
  plotReactive <- eventReactive(input$geom, { getFunction(paste0(input$geom, '_plot')) })
  
  ###################
  # LISTEN TO THEME SELECTION
  ###################
  theme_reactive <- eventReactive(input$theme, { getFunction(input$theme) })
  
  ###################
  # SCATTER GEOMS
  ###################
  output$scatter <- renderPlot({ plotReactive()(subtitle = "Scatter Plot") + theme_reactive()() })
  output$facet_scatter <- renderPlot({ plotReactive()(subtitle = "Scatter Plot With Facet Grid") + facet_grid(vs ~ am) + theme_reactive()() })
  
  ###################
  # REFERENCE LINE GEOMS
  ###################
  
  # used in hline_facet, and hline_facet_mult_aes
  mean_wt <- data.frame(cyl = c(4, 6, 8), wt = c(2.28, 3.11, 4.00))
  
  output$vline_1 <- renderPlot({ plotReactive()() + geom_vline(xintercept = 5) + theme_reactive()() })
  output$vline_2 <- renderPlot({ plotReactive()() + geom_vline(xintercept = 1:5) + theme_reactive()() })
  output$hline <- renderPlot({ plotReactive()() + geom_hline(yintercept = 20) + theme_reactive()() })
  output$abline_1 <- renderPlot({ plotReactive()() + geom_abline() + theme_reactive()() })
  output$abline_2 <- renderPlot({ plotReactive()() + geom_abline(intercept = 20) + theme_reactive()() })
  output$abline_3 <- renderPlot({ 
    mtcars_lm <- coef(lm(mpg ~ wt, data = mtcars2))
    plotReactive()() + geom_abline(intercept = mtcars_lm[["(Intercept)"]], slope = mtcars_lm[["wt"]]) + theme_reactive()() 
  })
  output$smooth <- renderPlot({ plotReactive()() + geom_smooth(method = "lm", se = FALSE) + theme_reactive()() })
  output$hline_facet <- renderPlot({ 
    plotReactive()(base_plot = FALSE) + facet_wrap(~ cyl) + 
      geom_hline(aes(yintercept = wt), mean_wt) + 
      theme_reactive()()  
  })
  output$hline_facet_mult_aes <- renderPlot({ 
    plotReactive()(base_plot = FALSE, include_aes = TRUE) +
      geom_hline(aes(yintercept = wt, colour = wt), mean_wt) +
      facet_wrap(~ cyl) +
      theme_reactive()()  
  })
  
  
}
