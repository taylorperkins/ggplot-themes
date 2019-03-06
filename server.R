###################
# server.R
# 
# For all your server needs..
###################

# GEOM SERVERS
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
source('./server-components/geoms/histogram.R')
source('./server-components/geoms/jitter.R')
source('./server-components/geoms/vertical_intervals.R')
source('./server-components/geoms/map.R')
source('./server-components/geoms/path.R')
source('./server-components/geoms/point.R')
source('./server-components/geoms/qq.R')
source('./server-components/geoms/quantile_regression.R')
source('./server-components/geoms/ribbons.R')
source('./server-components/geoms/rug.R')
source('./server-components/geoms/segment.R')
source('./server-components/geoms/smooth.R')
source('./server-components/geoms/spoke.R')
source('./server-components/geoms/text.R')
source('./server-components/geoms/raster.R')


server <- function(input, output, session) {
  
  ###################
  # LISTEN TO GEOM SELECTION, PASSING IN THE SELECTED GEOM AS ARG
  ###################
  geom_viz_reactive <- eventReactive(input$geom_selection, { dget('./ui-components/geom_body_templates.R')(input$geom_selection) })

  # wait for the selection of the geom, then populate the body
  output$geom_viz <- renderUI({ geom_viz_reactive() })
  
  
  ###################
  # LISTEN TO THEME SELECTION, WITH DEFAULT AS CLASSIC
  ###################
  theme_reactive <- reactiveVal(value = theme_classic)
  
  # doing it this way also allows for the theme to be changed on separate events,
  # such as the file upload. Not just the theme dropdown.
  observeEvent(input$theme, {
    theme_reactive <- theme_reactive(themes[[input$theme]])
  })
  
  observeEvent(input$theme_upload, {
    tryCatch(
      {
        custom_theme <- readRDS(input$theme_upload$datapath)
      },
      error = function(e) {
        # return a safeError if a parsing error occurs
        stop(safeError(e))
      }
    )
    
    if (is.function(custom_theme) && is.theme(custom_theme())) {
      theme_reactive <- theme_reactive(custom_theme)
    } else {
      print("Is not a theme..")
    }
  })
  
  
  ###################
  # LISTEN TO THEME ACTION SELECTION, WITH DEFAULT AS DEFAULT THEMES VIEW
  ###################
  theme_action_reactive <- reactiveVal(val = default_theme_render())
  
  # Update the theme_action_reactive value when the sidebar theme action buttons are clicked.
  observeEvent(input$default_theme_action, { theme_action_reactive(default_theme_render()) })
  observeEvent(input$upload_theme_action, { theme_action_reactive(upload_theme_render()) })
  
  # wait for selection of the action, then populate the sidebar
  output$theme_action <- renderUI({ theme_action_reactive() })
  
  
  # This guy is the modal that pops up next to the file input to upload your own theme.
  # It is aiming to walk the user through the steps to begin testing outt their own themes! 
  observeEvent(input$upload_what_is_this, {
    showModal(modalDialog(
      title = tags$h3("How does one upload a theme?!?", tags$br(), "Well, let me show you.."),
      fluidRow(
        tags$ol(
          tags$li("First.. Create a test-y file."),
          tags$li("Second.. Paste in this supa cool code!"),
          tags$blockquote(
            p("library(ggthemes)"),
            p("my_theme <- theme_tufte  # or.. you can build your own here!"),
            p("saveRDS(my_theme, '<some file>.Rds')")
          ),
          tags$li("Then.. Select that file in the dropdown! You should be good to go :)")
        ),
        column(
          width = 10,
          offset = 1,
          
          p("Behind the scenes.. Shiny needs to assert two things. One, that the saved value is callable (a function). Two, that it is an instance of a ggplot theme. Otherwise, it will fail.")
        )
      )
      
    ))
  })
  
  
  ###################
  # ALL GEOM SERVERS (#so-cute)
  ###################
  reference_line_server(input, output, session, theme_reactive)
  bar_server(input, output, session, theme_reactive)
  heatmap_server(input, output, session, theme_reactive)
  boxplot_server(input, output, session, theme_reactive)
  contour_server(input, output, session, theme_reactive)
  count_overlap_server(input, output, session, theme_reactive)
  density_server(input, output, session, theme_reactive)
  density2d_server(input, output, session, theme_reactive)
  dotplot_server(input, output, session, theme_reactive)
  error_bar_server(input, output, session, theme_reactive)
  hex_server(input, output, session, theme_reactive)
  histogram_server(input, output, session, theme_reactive)
  jitter_server(input, output, session, theme_reactive)
  vertical_intervals_server(input, output, session, theme_reactive)
  map_server(input, output, session, theme_reactive)
  path_server(input, output, session, theme_reactive)
  point_server(input, output, session, theme_reactive)
  qq_server(input, output, session, theme_reactive)
  quantile_regression_server(input, output, session, theme_reactive)
  ribbons_server(input, output, session, theme_reactive)
  rug_server(input, output, session, theme_reactive)
  segment_server(input, output, session, theme_reactive)
  smooth_server(input, output, session, theme_reactive)
  spoke_server(input, output, session, theme_reactive)
  text_server(input, output, session, theme_reactive)
  raster_server(input, output, session, theme_reactive)
}
