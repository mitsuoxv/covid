select_showUI <- function(id, df, var_str, a_menu, c_menu) {
  sidebarLayout(
    sidebarPanel(
      selectInput(
        NS(id, "select_area"),
        label = h4(paste0("Select ", var_str, "s (add/remove)")),
        choices = a_menu,
        selected = case_when(
          var_str == "area" ~ "Japan",
          var_str == "region" ~ c("Total", "Northern America"),
          var_str == "state" ~ "New York",
          var_str == "prefecture" ~ "Tokyo",
          TRUE ~ "foo"
        ),
        multiple = TRUE
      ),
      
      hr(),
      
      selectInput(
        NS(id, "select_concept"),
        label = h4("Select concept"),
        choices = c_menu,
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
      data_source(var_str),
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

select_showServer <- function(id, df, var_str) {
  moduleServer(id, function(input, output, session) {
    chart_data <- reactive({
      data <- df %>%
        filter(
          .data[[var_str]] %in% input$select_area,
          concept == input$select_concept
        ) %>%
        filter(
          publish_date >= input$date_range[1],
          publish_date <= input$date_range[2]
        )
      
      if (input$ma == "Yes") {
        data <- data %>%
          group_by(.data[[var_str]]) %>% 
          mutate(value = slide_dbl(value, mean, na.rm = TRUE,
                                   .before = 6, .complete = TRUE)) %>% 
          ungroup()
      }
      
      if (input$per1m == "Yes") {
        data <- data %>%
          mutate(value = value / population * 1000000)
      }
      
      data
    })
    
    output$plot1 <- renderPlot({
      chart_data() %>%
        draw_line_chart(var_str)
    })
    
    output$download <- downloadHandler(
      filename = function() {
        name_file(input)
      },
      content = function(file) {
        chart_data() %>%
          select(publish_date, all_of(var_str), value) %>% 
          pivot_wider(names_from = all_of(var_str)) %>% 
          vroom::vroom_write(file)
      }
    )
  })
}