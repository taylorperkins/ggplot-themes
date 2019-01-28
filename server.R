###################
# server.R
# 
# For all your server needs..
###################

# all server imports 

# GEOMS
source('./server-components/geoms/scatter.R')
source('./server-components/geoms/reference_line.R')
source('./server-components/geoms/bar.R')
source('./server-components/geoms/heatmap.R')
source('./server-components/geoms/boxplot.R')
source('./server-components/geoms/contour.R')
source('./server-components/geoms/count_overlap.R')
source('./server-components/geoms/density.R')
source('./server-components/geoms/density2d.R')
source('./server-components/geoms/dotplot.R')
source('./server-components/geoms/error_bars.R')
source('./server-components/geoms/hex.R')


server <- function(input, output, session) {
  ###################
  # LISTEN TO THEME SELECTION AND GENERATE PLOT
  ###################
  # plotReactive <- eventReactive(input$geom, { getFunction(paste0(input$geom, '_plot')) })
  
  ###################
  # LISTEN TO THEME SELECTION
  ###################
  theme_reactive <- eventReactive(input$theme, { getFunction(input$theme) })
  
  # scatter geoms
  scatter_server(input, output, session, theme_reactive)
  
  # reference line geoms
  reference_line_server(input, output, session, theme_reactive)

  # bar geoms
  bar_server(input, output, session, theme_reactive)
  
  # heatmap geoms
  heatmap_server(input, output, session, theme_reactive)
  
  # boxplot geoms
  boxplot_server(input, output, session, theme_reactive)
  
  # contour geoms
  contour_server(input, output, session, theme_reactive)
  
  # count overlap geoms
  count_overlap_server(input, output, session, theme_reactive)
  
  # density geoms
  density_server(input, output, session, theme_reactive)
  
  # density2d geoms
  density2d_server(input, output, session, theme_reactive)
  
  # dotplot geoms
  dotplot_server(input, output, session, theme_reactive)
  
  # error bar geoms
  error_bar_server(input, output, session, theme_reactive)
  
  # hex geoms
  hex_server(input, output, session, theme_reactive)
}






















