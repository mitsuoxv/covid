draw_mapUI <- function(id, df, var_str, c_menu) {
  sidebarLayout(
    sidebarPanel(
      selectInput(
        NS(id, "select_concept"),
        label = h4("Select concept"),
        choices = c_menu,
        selected = "new_conf"
      ),
      
      hr(),
      
      sliderInput(
        NS(id, "select_date"),
        label = h4("Select date"),
        min = min(df$publish_date),
        max = max(df$publish_date),
        value = max(df$publish_date),
        timeFormat = "%m %d",
        step = 7,
        animate = TRUE
      ),
      
      hr(),
      
      # Show source and Shiny app creator
      data_source(var_str),
      br(),
      a(href = "https://mitsuoxv.rbind.io/",
        "Shiny app creator: Mitsuo Shiota")
    ),
    
    # Show a map
    mainPanel(plotOutput(NS(id, "plot_map")))
  )
}

draw_mapServer <- function(id, map_df, df, var_str) {
  moduleServer(id, function(input, output, session) {
    chart_data_map <- reactive({
      df %>%
        filter(concept == input$select_concept,
               publish_date == input$select_date)
    })
    
    output$plot_map <- renderPlot({
      if (var_str == "state") {
        draw_map_usa_simple(map_df, chart_data_map())
      } else if (var_str == "prefecture") {
        draw_map_japan_simple(map_df, chart_data_map())
      } else {
        stop('Error: var_str must be either "state" or "prefecture"')
      }
    })
  })
}