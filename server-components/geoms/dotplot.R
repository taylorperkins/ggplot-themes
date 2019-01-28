###################
# DOTPLOT GEOMS
###################

dotplot_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_dotplot.html
  
  output$dotplot <- renderPlot({ dotplot_plot() + geom_dotplot() + theme_reactive()() })
  output$dotplot_binwidth_1_5 <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5) + theme_reactive()() })
  output$dotplot_method_histodot <- renderPlot({ dotplot_plot() + geom_dotplot(method="histodot", binwidth = 1.5) + theme_reactive()() })
  output$dotplot_stackdir_center <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5, stackdir = "center") + theme_reactive()() })
  output$dotplot_stackdir_centerwhole <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5, stackdir = "centerwhole") + theme_reactive()() })
  output$dotplot_scale_y <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5) + scale_y_continuous(NULL, breaks = NULL) + theme_reactive()() })
  output$dotplot_stack_ratio_7 <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5, stackratio = .7) + theme_reactive()() })
  output$dotplot_dotsize_1_25 <- renderPlot({ dotplot_plot() + geom_dotplot(binwidth = 1.5, dotsize = 1.25) + theme_reactive()() })
  output$dotplot_binaxis_y <- renderPlot({ dotplot_plot(reverse = TRUE) + geom_dotplot(binaxis = "y", stackdir = "center") + theme_reactive()() })
  output$dotplot_binaxis_y_factor <- renderPlot({ dotplot_plot(as_factor = TRUE) + geom_dotplot(binaxis = "y", stackdir = "center") + theme_reactive()() })
  output$dotplot_binaxis_y_factor_centerwhole <- renderPlot({ dotplot_plot(as_factor = TRUE) + geom_dotplot(binaxis = "y", stackdir = "centerwhole") + theme_reactive()() })
  output$dotplot_factor_center_dodge <- renderPlot({ 
    ggplot(mtcars, aes(x = factor(vs), fill = factor(cyl), y = mpg)) +
      geom_dotplot(binaxis = "y", stackdir = "center", position = "dodge") +
      theme_reactive()()
  })
  output$dotplot_factor_center_binpositions <- renderPlot({ 
    ggplot(mtcars, aes(x = factor(am), y = mpg)) +
      geom_dotplot(binaxis = "y", stackdir = "center", binpositions="all") +
      theme_reactive()()
  })
  output$dotplot_factor_stackgroups_histdot <- renderPlot({ 
    ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
      geom_dotplot(stackgroups = TRUE, binwidth = 1, method = "histodot") +
      theme_reactive()()
  })
  output$dotplot_binaxis_y_factor_histodot <- renderPlot({ 
    ggplot(mtcars, aes(x = 1, y = mpg, fill = factor(cyl))) +
      geom_dotplot(binaxis = "y", stackgroups = TRUE, binwidth = 1, method = "histodot") +
      theme_reactive()()
  })
}