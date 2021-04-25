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
#' select_showUI("world_region", world$region_df, world$region_menu)
#' }
select_showUI <- function(id, df, a_menu) {
  var_str <- extract_var_str(df)
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        NS(id, "select_area"),
        label = h4(paste0("Select ", var_str, "s (add/remove)")),
        choices = a_menu,
        selected = dplyr::case_when(
          var_str == "area" ~ "Japan",
          var_str == "region" ~ c("Total", "Northern America"),
          var_str == "state" ~ c("New York", "Michigan"),
          var_str == "prefecture" ~ c("Tokyo", "Osaka"),
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
                            selected = "No")),
        column(4,
               radioButtons(NS(id, "per1m"), "Per 1m population?", c("Yes", "No"),
                            selected = "No")),
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
#' select_showServer("world_region", world$region_df)
#' }
select_showServer <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    var_str <- extract_var_str(df)
    
    chart_data <- reactive({
      data <- df %>%
        dplyr::filter(
          .data[[var_str]] %in% input$select_area,
          concept == input$select_concept,
          publish_date >= input$date_range[1],
          publish_date <= input$date_range[2]
        )
      
      if (input$ma == "Yes") {
        data <- data %>%
          dplyr::group_by(.data[[var_str]]) %>% 
          dplyr::mutate(value = slider::slide_dbl(value, mean, na.rm = TRUE,
                                   .before = 6, .complete = TRUE)) %>% 
          dplyr::ungroup()
      }
      
      if (input$per1m == "Yes") {
        data <- data %>%
          dplyr::mutate(value = value / population * 1000000)
      }
      
      data
    })
    
    output$plot1 <- renderPlot({
      chart_data() %>%
        draw_line_chart(var_str)
    })
    
    output$download <- downloadHandler(
      filename = function() {
        name_file(input$select_concept, input$ma, input$per1m)
      },
      content = function(file) {
        var <- rlang::sym(var_str)
        
        chart_data() %>%
          dplyr::select(publish_date, var, value) %>%
          tidyr::pivot_wider(names_from = var) %>%
          vroom::vroom_write(file)
      }
    )
  })
}