###################
# REFERENCE LINE GEOMS
###################


reference_line_server <- function(input, output, session, theme_reactive) {
  # https://ggplot2.tidyverse.org/reference/geom_abline.html
  
  base_plot <- dget("./plots/geom__reference_line.R")
  
  # used in hline_facet, and hline_facet_mult_aes
  mean_wt <- data.frame(cyl = c(4, 6, 8), wt = c(2.28, 3.11, 4.00))
  
  output$rl_vline_1 <- renderPlot({ base_plot() + geom_vline(xintercept = 5) + theme_reactive()() })
  output$rl_vline_2 <- renderPlot({ base_plot() + geom_vline(xintercept = 1:5) + theme_reactive()() })
  output$rl_hline <- renderPlot({ base_plot() + geom_hline(yintercept = 20) + theme_reactive()() })
  output$rl_abline_1 <- renderPlot({ base_plot() + geom_abline() + theme_reactive()() })
  output$rl_abline_2 <- renderPlot({ base_plot() + geom_abline(intercept = 20) + theme_reactive()() })
  output$rl_abline_3 <- renderPlot({
    mtcars_lm <- coef(lm(mpg ~ wt, data = mtcars2))
    base_plot() + geom_abline(intercept = mtcars_lm[["(Intercept)"]], slope = mtcars_lm[["wt"]]) + theme_reactive()() })
  output$rl_smooth <- renderPlot({ base_plot() + geom_smooth(method = "lm", se = FALSE) + theme_reactive()() })
  output$rl_hline_facet <- renderPlot({
    base_plot(base_plot = FALSE) + facet_wrap(~ cyl) +
      geom_hline(aes(yintercept = wt), mean_wt) +
      theme_reactive()() })
  output$rl_hline_facet_mult_aes <- renderPlot({
    base_plot(base_plot = FALSE, include_aes = TRUE) +
      geom_hline(aes(yintercept = wt, colour = wt), mean_wt) +
      facet_wrap(~ cyl) +
      theme_reactive()() })

}
