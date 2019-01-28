# ###################
# # COUNT OVERLAP GEOMS
# ###################

count_overlap_server <- function(input, output, session, theme_reactive) { 
  # https://ggplot2.tidyverse.org/reference/geom_count.html
  
  output$count_overlap_point <- renderPlot({ count_overlap_plot() + geom_point() + theme_reactive()() })
  output$count_overlap_count <- renderPlot({ count_overlap_plot() + geom_count() + theme_reactive()() })
  output$count_overlap_scale_size_area <- renderPlot({ count_overlap_plot() + geom_count() + scale_size_area() + theme_reactive()() })
  output$count_overlap_count_aes <- renderPlot({ count_overlap_plot(use_mpg = FALSE) + geom_count(aes(size = stat(prop))) + theme_reactive()() })
  output$count_overlap_count_aes_scale_size <- renderPlot({ count_overlap_plot(use_mpg = FALSE) + geom_count(aes(size = stat(prop), group = 1)) + scale_size_area(max_size = 10) + theme_reactive()() })
  output$count_overlap_count_aes_scale_size_group_cut <- renderPlot({ count_overlap_plot(use_mpg = FALSE) + geom_count(aes(size = stat(prop), group = cut)) + scale_size_area(max_size = 10) + theme_reactive()() })
  output$count_overlap_count_aes_scale_size_group_clarity <- renderPlot({ count_overlap_plot(use_mpg = FALSE) + geom_count(aes(size = stat(prop), group = clarity)) + scale_size_area(max_size = 10) + theme_reactive()() }) 
}