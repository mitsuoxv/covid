#' Draw map module UI
#'
#' @param id A character vector of length 1.
#' @param df A data frame with columns: publish_date, concept, value and var.
#'
#' @return A module UI.
#'
#' @examples
#' \dontrun{
#' draw_mapUI("world_map", world$ma7_df)
#' }
draw_mapUI <- function(id, df) {
  sidebarLayout(
    sidebarPanel(
      selectInput(
        NS(id, "select_concept"),
        label = h4("Select concept"),
        choices = world$concept_menu,
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
      data_source(id),
      br(),
      a(href = "https://mitsuoxv.rbind.io/",
        "Shiny app creator: Mitsuo Shiota")
    ),
    
    # Show a map
    mainPanel(plotOutput(NS(id, "plot_map")))
  )
}

#' Draw map module Server
#'
#' @param id A character vector of length 1.
#' @param df A data frame with 3 columns: publish_date, concept and value.
#'
#' @return A module server.
#'
#' @examples
#' \dontrun{
#' draw_mapServer("usa_map", usa$ma7_df)
#' }
draw_mapServer <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    chart_data_map <- reactive({
      df %>%
        dplyr::filter(concept == input$select_concept,
               publish_date == input$select_date)
    })
    
    output$plot_map <- renderPlot({
      if (id == "usa_map") {
        draw_map_usa_simple(chart_data_map())
      } else if (id == "japan_map") {
        draw_map_japan_simple(chart_data_map())
      } else if (id == "world_map") {
        draw_map_world(chart_data_map())
      } else {
        stop('Error: id must be either "world_map", "usa_map" or "japan_map"')
      }
    })
  })
}