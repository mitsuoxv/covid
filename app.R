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
library(slider)

# load data
table2 <- readRDS("rds/table2.rds")
data_usa <- readRDS("rds/data_usa.rds")

data_usa_ma7_std <- readRDS("rds/data_usa_ma7_std.rds")

states_map <- map_data("state")


# tidy data
world_area <- table2 %>%
  pivot_longer(!c(publish_date, area, population, region),
               names_to = "concept")

world_total <- table2 %>% 
  group_by(publish_date) %>% 
  summarize(across(!c(area, region), sum, na.rm = TRUE), .groups = "drop") %>% 
  mutate(region = "Total")

world_reg <- table2 %>% 
  filter(region != "Others") %>% 
  group_by(publish_date, region) %>% 
  summarize(across(!area, sum, na.rm = TRUE), .groups = "drop")

world_region <- 
  bind_rows(world_reg, world_total) %>% 
  pivot_longer(!c(publish_date, region, population),
               names_to = "concept")


in_usa <- data_usa %>%
  select(-state_abb, -party) %>%
  pivot_longer(!c(publish_date, state, population),
               names_to = "concept")

in_usa_map <- data_usa_ma7_std %>%
  filter(!is.na(new_conf)) %>%
  pivot_longer(cum_conf:new_deaths,
               names_to = "concept")

# create menus
area_menu <- unique(world_area$area) %>% sort()

concept_menu <- unique(world_area$concept) %>% sort()
names(concept_menu) <- c(
  "Confirmed cases (cumulative)",
  "Deaths (cumulative)",
  "Confirmed cases (new)",
  "Deaths (new)"
)

region_menu <- c("Total", unique(world_reg$region) %>% sort())

state_menu <- unique(in_usa$state)


# Define UI for application
ui <- navbarPage(
  "WHO, Covid-19 situation report",
  
  tags$head(includeHTML((
    "google-analytics.html"
  ))),
  
  selected = "Regions",
  
  tabPanel("Regions",
           select_showUI("world_region", world_region, "region",
                         a_menu = region_menu, c_menu = concept_menu)),
  tabPanel("Areas",
           select_showUI("world_area", world_area, "area",
                         a_menu = area_menu, c_menu = concept_menu)),
  tabPanel("In the United States",
           select_showUI("usa", in_usa, "state",
                         a_menu = state_menu, c_menu = concept_menu)),
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
        data_source("state"),
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
  select_showServer("world_region", world_region, "region")
  select_showServer("world_area", world_area, "area")
  select_showServer("usa", in_usa, "state")
  
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
