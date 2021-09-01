#' Select show module UI
#'
#' @param id A character vector of length 1.
#' @param df A data frame with columns: publish_date, concept, value and var.
#' @param a_menu A named character vector, area menu.
#'
#' @return A module UI.
#'
#' @examples
#' \dontrun{
#' selectShowUI("world_region", world$region_df, world$region_menu)
#' }
selectShowUI <- function(id, df, a_menu) {
  area_var <- extract_area_var(df)
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        NS(id, "select_area"),
        label = h4(paste0("Select ", area_var, "s (add/remove)")),
        choices = a_menu,
        selected = dplyr::case_when(
          area_var == "area" ~ c("Japan", "Israel"),
          area_var == "region" ~ c("Total", "Northern America"),
          area_var == "state" ~ c("New York", "Florida"),
          area_var == "prefecture" ~ c("Tokyo", "Osaka"),
          TRUE ~ "foo"
        ),
        multiple = TRUE
      ),
      
      hr(),
      
      selectInput(
        NS(id, "select_concept"),
        label = h4("Select concept"),
        choices = world$concept_menu,
        selected = "new_conf"
      ),
      
      hr(),
      
      # Sidebar with a slider input for date
      sliderInput(
        NS(id, "date_range"),
        label = h4("Select date range"),
        min = min(df$publish_date),
        max = max(df$publish_date),
        value = c(min(df$publish_date),
                  max(df$publish_date)),
        timeFormat = "%m %d"
      ),
      
      hr(),
      
      # Show source and Shiny app creator
      data_source(id),
      br(),
      a(href = "https://mitsuoxv.rbind.io/",
        "Shiny app creator: Mitsuo Shiota")
    ),
    
    # Show a plot of the generated line chart
    mainPanel(
      plotOutput(NS(id, "plot1")),
      fluidRow(
        column(4,
               radioButtons(NS(id, "ma"), "7 day moving average?", c("Yes", "No"),
                            selected = "Yes")),
        column(4,
               radioButtons(NS(id, "per1m"), "Per 1m population?", c("Yes", "No"),
                            selected = "Yes")),
        column(4,
               downloadButton(NS(id, "download"), "Download .tsv"))
      )
    )
  )
}

#' Select show module Server
#'
#' @param id A character vector of length 1.
#' @param df A data frame with columns: publish_date, concept, value and var.
#'
#' @return A module server.
#'
#' @examples
#' \dontrun{
#' selectShowServer("world_region", world$region_df)
#' }
selectShowServer <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    area_var <- extract_area_var(df)
    
    value_var <- reactive({
      get_value_var(input$ma, input$per1m)
    })
    
    chart_data <- reactive({
      df %>%
        dplyr::filter(
          {{ area_var }} %in% input$select_area,
          concept == input$select_concept,
          publish_date >= input$date_range[1],
          publish_date <= input$date_range[2]
        )
    })
    
    output$plot1 <- renderPlot({
      chart_data() %>%
        draw_line_chart(!!value_var())
    })
    
    output$download <- downloadHandler(
      filename = function() {
        name_file(input$select_concept, input$ma, input$per1m)
      },
      content = function(file) {
        chart_data() %>%
          dplyr::select(publish_date, {{ area_var }}, value) %>%
          tidyr::pivot_wider(names_from = {{ area_var }}) %>%
          vroom::vroom_write(file)
      }
    )
  })
}