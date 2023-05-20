#' Draw map weekly module UI
#'
#' @param id A character vector of length 1.
#' @param df A data frame with columns: publish_date, concept, value and var.
#'
#' @return A module UI.
#'
#' @examples
#' \dontrun{
#' drawMapWkUI("japan_map", japan_wk$area_df)
#' }
drawMapWkUI <- function(id, df) {
  sidebarLayout(
    sidebarPanel(
      # selectInput(
      #   NS(id, "select_concept"),
      #   label = h4("Select concept"),
      #   choices = world$concept_menu[3],
      #   selected = "new_conf"
      # ),
      h3("Weekly confirmed cases (new) at pre-registered hospitals"),
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
        # column(
        #   4,
        #   radioButtons(NS(id, "ma"), "7 day moving average?", c("Yes", "No"),
        #     selected = "Yes"
        #   )
        # ),
        column(
          4,
          radioButtons(NS(id, "perhos"), "Per hospital?", c("Yes", "No"),
            selected = "Yes"
          )
        )
      ),
      plotOutput(NS(id, "plot_bar"), height = "600px")
    )
  )
}

#' Draw map weekly module Server
#'
#' @param id A character vector of length 1.
#' @param df A data frame. Columns: publish_date, concept and value_map.
#'
#' @return A module server.
#'
#' @examples
#' \dontrun{
#' drawMapWkServer("japan_map", japan_wk$area_df)
#' }
drawMapWkServer <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    value_var <- reactive({
      rlang::sym(dplyr::if_else(input$perhos == "Yes", "value_per_hospital", "value"))
    })

    chart_data <- reactive({
      df %>%
        dplyr::filter(
          # concept == input$select_concept,
          publish_date == input$select_date
        )
    })

    output$plot_map <- renderPlot({
      if (id == "usa_wk_map") {
        draw_map_usa(chart_data(), !!value_var())
      } else if (id == "japan_wk_map") {
        draw_map_japan(chart_data(), !!value_var())
      } else if (id == "world_wk_map") {
        draw_map_world(chart_data(), !!value_var())
      } else {
        stop('Error: id must be either "world_wk_map", "usa_wk_map" or "japan_wk_map"')
      }
    })
    
    output$plot_bar <- renderPlot({
      if (id == "japan_wk_map") {
        draw_bar_chart(chart_data(), !!value_var())
      } else if (id == "usa_wk_map") {
        draw_bar_chart(chart_data(), !!value_var())
      } else if (id == "world_wk_map") {
        draw_bar_chart(chart_data(), !!value_var())
      } else {
        stop('Error: id must be either "world_wk_map", "usa_wk_map" or "japan_wk_map"')
      }
    })
  })
}
