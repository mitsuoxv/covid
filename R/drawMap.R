#' Draw map module UI
#'
#' @param id A character vector of length 1.
#' @param df A data frame with columns: publish_date, concept, value and var.
#'
#' @return A module UI.
#'
#' @examples
#' \dontrun{
#' drawMapUI("world_map", world$area_df)
#' }
drawMapUI <- function(id, df) {
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
      a(
        href = "https://mitsuoxv.rbind.io/",
        "Shiny app creator: Mitsuo Shiota"
      )
    ),

    # Show a map
    mainPanel(
      plotOutput(NS(id, "plot_map")),
      fluidRow(
        column(
          4,
          radioButtons(NS(id, "ma"), "7 day moving average?", c("Yes", "No"),
            selected = "Yes"
          )
        ),
        column(
          4,
          radioButtons(NS(id, "per1m"), "Per 1m population?", c("Yes", "No"),
            selected = "Yes"
          )
        )
      ),
      plotOutput(NS(id, "plot_bar"), height = "600px")
    )
  )
}

#' Draw map module Server
#'
#' @param id A character vector of length 1.
#' @param df A data frame. Columns: publish_date, concept and value_map.
#'
#' @return A module server.
#'
#' @examples
#' \dontrun{
#' drawMapServer("usa_map", usa$area_df)
#' }
drawMapServer <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    value_var <- reactive({
      get_value_var(input$ma, input$per1m)
    })

    chart_data <- reactive({
      df %>%
        dplyr::filter(
          concept == input$select_concept,
          publish_date == input$select_date
        )
    })

    output$plot_map <- renderPlot({
      if (id == "usa_map") {
        draw_map_usa(chart_data(), !!value_var())
      } else if (id == "japan_map") {
        draw_map_japan(chart_data(), !!value_var())
      } else if (id == "world_map") {
        draw_map_world(chart_data(), !!value_var())
      } else {
        stop('Error: id must be either "world_map", "usa_map" or "japan_map"')
      }
    })
    
    output$plot_bar <- renderPlot({
      if (id == "japan_map") {
        draw_bar_chart(chart_data(), !!value_var())
      } else if (id == "usa_map") {
        draw_bar_chart(chart_data(), !!value_var())
      } else if (id == "world_map") {
        draw_bar_chart(chart_data(), !!value_var())
      } else {
        stop('Error: id must be either "world_map", "usa_map" or "japan_map"')
      }
    })
  })
}
