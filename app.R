#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# libraries
library(shiny)
library(tidyverse)
library(scales)
library(maps)
library(mapproj)

# load data
table1 <- readRDS("rds/table1.rds")
table2 <- readRDS("rds/table2.rds")
data_usa <- readRDS("rds/data_usa.rds")

data_usa_ma7_std <- readRDS("rds/data_usa_ma7_std.rds")

states_map <- map_data("state")

# make table1 with Total
table1 <- table2 %>%
  filter(area == "China") %>%
  rename(region = area) %>%
  mutate(region = "Total") %>%
  bind_rows(table1)

# tidy data
world <- table2 %>%
  pivot_longer(!c(area, publish_date),
               names_to = "concept",
               values_to = "value")

in_china <- table1 %>%
  pivot_longer(!c(region, publish_date),
               names_to = "concept",
               values_to = "value")

in_usa <- data_usa %>%
  pivot_longer(!c(State, publish_date, state_name),
               names_to = "concept",
               values_to = "value") %>%
  select(-State) %>%
  rename(state = state_name)

in_usa_map <- data_usa_ma7_std %>%
  filter(!is.na(new_conf)) %>%
  pivot_longer(cum_conf:new_deaths,
               names_to = "concept",
               values_to = "value")

# create menus
area_menu <- unique(world$area) %>% sort()

concept_menu <- unique(world$concept) %>% sort()
names(concept_menu) <- c(
  "Confirmed cases (cumulative)",
  "Deaths (cumulative)",
  "Confirmed cases (new)",
  "Deaths (new)"
)

region_menu <- unique(in_china$region)

state_menu <- unique(in_usa$state)


# Define UI for application
ui <- navbarPage(
  "WHO, Covid-19 situation report",
  
  tags$head(includeHTML((
    "google-analytics.html"
  ))),
  
  selected = "World",
  
  tabPanel("World",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "select_area",
                 label = h4("Select areas (add/remove)"),
                 choices = area_menu,
                 selected = "Japan",
                 multiple = TRUE
               ),
               
               hr(),
               
               selectInput(
                 "select_concept_area",
                 label = h4("Select concept"),
                 choices = concept_menu,
                 selected = "new_conf"
               ),
               
               hr(),
               
               # Sidebar with a slider input for date
               sliderInput(
                 "date_range_world",
                 label = h4("Select date range"),
                 min = min(world$publish_date),
                 max = max(world$publish_date),
                 value = c(min(world$publish_date),
                           max(world$publish_date)),
                 timeFormat = "%m %d"
               ),
               
               hr(),
               
               # Show source and Shiny app creator
               a(href = "hhttps://covid19.who.int/",
                 "Source: WHO"),
               br(),
               a(href = "https://mitsuoxv.rbind.io/",
                 "Shiny app creator: Mitsuo Shiota")
             ),
             
             # Show a plot of the generated line chart
             mainPanel(plotOutput("plot1"))
           )),
  tabPanel("In China",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "select_region",
                 label = h4("Select regions (add/remove)"),
                 choices = region_menu,
                 selected = "Hubei",
                 multiple = TRUE
               ),
               
               hr(),
               
               selectInput(
                 "select_concept_region",
                 label = h4("Select concept"),
                 choices = concept_menu,
                 selected = "new_conf"
               ),
               
               hr(),
               
               # Sidebar with a slider input for date
               sliderInput(
                 "date_range_china",
                 label = h4("Select date range"),
                 min = min(in_china$publish_date),
                 max = max(in_china$publish_date),
                 value = c(min(in_china$publish_date),
                           max(in_china$publish_date)),
                 timeFormat = "%m %d"
               ),
               
               hr(),
               
               # Show source and Shiny app creator
               a(href = "https://covid19.who.int/",
                 "Source: WHO"),
               br(),
               a(href = "https://mitsuoxv.rbind.io/",
                 "Shiny app creator: Mitsuo Shiota")
             ),
             
             # Show a plot of the generated line chart
             mainPanel(plotOutput("plot_region"))
           ),),
  tabPanel(
    "In the United States",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "select_state",
          label = h4("Select states (add/remove)"),
          choices = state_menu,
          selected = "New York",
          multiple = TRUE
        ),
        
        hr(),
        
        selectInput(
          "select_concept_state",
          label = h4("Select concept"),
          choices = concept_menu,
          selected = "new_conf"
        ),
        
        hr(),
        
        # Sidebar with a slider input for date
        sliderInput(
          "date_range_usa",
          label = h4("Select date range"),
          min = min(in_usa$publish_date),
          max = max(in_usa$publish_date),
          value = c(min(in_usa$publish_date),
                    max(in_usa$publish_date)),
          timeFormat = "%m %d"
        ),
        
        hr(),
        
        # Show source and Shiny app creator
        a(href = "https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/",
          "Source: USAFacts"),
        br(),
        a(href = "https://mitsuoxv.rbind.io/",
          "Shiny app creator: Mitsuo Shiota")
      ),
      
      # Show a plot of the generated line chart
      mainPanel(plotOutput("plot_state"))
    ),
  ),
  tabPanel(
    "In the United States (map)",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "select_concept_map",
          label = h4("Select concept"),
          choices = concept_menu,
          selected = "new_conf"
        ),
        
        hr(),
        
        sliderInput(
          "date_usa",
          label = h4("Select date"),
          min = min(in_usa_map$publish_date),
          max = max(in_usa_map$publish_date),
          value = max(in_usa_map$publish_date),
          timeFormat = "%m %d",
          step = 7,
          animate = TRUE
        ),
        
        hr(),
        
        # Show source and Shiny app creator
        a(href = "https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/",
          "Source: USAFacts"),
        br(),
        a(href = "https://mitsuoxv.rbind.io/",
          "Shiny app creator: Mitsuo Shiota")
      ),
      
      # Show a map
      mainPanel(plotOutput("plot_map"))
    ),
  )
)


# Define server logic required to draw a chart
server <- function(input, output, session) {
  chart_data_area <- reactive({
    world %>%
      filter(
        area %in% c(input$select_area),
        concept == input$select_concept_area
      ) %>%
      filter(
        publish_date >= input$date_range_world[1],
        publish_date <= input$date_range_world[2]
      )
  })
  
  output$plot1 <- renderPlot({
    chart_data_area() %>%
      draw_line_chart(area, concept_menu, input)
  })
  
  
  chart_data_region <- reactive({
    in_china %>%
      filter(
        region %in% c(input$select_region),
        concept == input$select_concept_region
      ) %>%
      filter(
        publish_date >= input$date_range_china[1],
        publish_date <= input$date_range_china[2]
      )
  })
  
  output$plot_region <- renderPlot({
    chart_data_region() %>%
      draw_line_chart(region, concept_menu, input)
  })
  
  chart_data_state <- reactive({
    in_usa %>%
      filter(
        state %in% c(input$select_state),
        concept == input$select_concept_state
      ) %>%
      filter(publish_date >= input$date_range_usa[1],
             publish_date <= input$date_range_usa[2])
  })
  
  output$plot_state <- renderPlot({
    chart_data_state() %>%
      draw_line_chart(state, concept_menu, input)
  })
  
  chart_data_map <- reactive({
    in_usa_map %>%
      filter(concept == input$select_concept_map,
             publish_date == input$date_usa)
  })
  
  output$plot_map <- renderPlot({
    states_map %>%
      left_join(chart_data_map(), by = c("region" = "state")) %>%
      ggplot(aes(
        x = long,
        y = lat,
        group = group,
        fill = value
      )) +
      geom_polygon(color = "white") +
      coord_map("polyconic") +
      scale_fill_gradient2(
        low = "#559999",
        mid = "grey90",
        high = "#BB650B",
        midpoint = median(chart_data_map()$value)
      ) +
      labs(title = names(concept_menu)[concept_menu == input$select_concept_map],
           fill = "cases per 1 million\n(7 day average)") +
      theme_void(base_size = 16)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
