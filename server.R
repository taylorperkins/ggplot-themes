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
  # LISTEN TO THEME SELECTION, WITH DEFAULT AS CLASSIC
  ###################
  theme_reactive <- reactiveVal(value = theme_classic)
  
  # doing it this way also allows for the theme to be changed on separate events,
  # such as the file upload. Not just the theme dropdown.
  observeEvent(input$theme, {
    theme_reactive <- theme_reactive(getFunction(input$theme))
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
      print(input$theme_upload$datapath)
      theme_reactive <- theme_reactive(custom_theme)
    } else {
      print("Is not a theme..")
    }
  })
  
  observeEvent(input$upload_what_is_this, {
    print("clicking..")
    showModal(modalDialog(
      title = tags$h3("How does one upload a theme?!?", tags$br(), "Well, let me show you.."),
      fluidRow(
        tags$ol(
          tags$li("First.. Create a test-y file."),
          tags$li("Second.. Paste in this supa cool code!"),
          tags$blockquote(
            p(tags$code("library(ggthemes)")),
            p(tags$code("my_theme <- theme_tufte  # or.. you can build your own here!")),
            p(tags$code("saveRDS(my_theme, '<some file>.Rds')"))
          ),
          tags$li("Then.. Select that file in the dropdown! You should be good to go :)")
        ),
        p("Behind the scenes.. Shiny needs to assert two things. One, that the saved value is callable (a function). Two, that it is an instance of a ggplot theme. Otherwise, it will fail.")
      )
      
    ))
  })
  
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






















