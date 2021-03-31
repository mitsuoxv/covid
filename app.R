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
library(slider)

library(maps)
library(mapproj)

library(NipponMap)
library(sf)

# load data
table2 <- readRDS("rds/table2.rds")
data_usa <- readRDS("rds/data_usa.rds")
data_usa_ma7_std <- readRDS("rds/data_usa_ma7_std.rds")
data_japan <- readRDS("rds/data_japan.rds")

states_map <- map_data("state")
prefectures_map <-
  st_read(system.file("shapes/jpn.shp", package = "NipponMap"))

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

in_japan <- data_japan %>%
  select(-code) %>%
  pivot_longer(!c(publish_date, prefecture, population),
               names_to = "concept")

in_japan_map <- data_japan %>% 
  group_by(code) %>% 
  mutate(
    across(new_conf:cum_deaths,
      ~ .x / population * 1000000
    ),
    across(new_conf:cum_deaths,
      ~ slide_dbl(.x, mean, na.rm = TRUE,
                       .before = 6, .complete = TRUE)
    )
  ) %>% 
  ungroup() %>% 
  filter(!is.na(new_conf)) %>% 
  pivot_longer(new_conf:cum_deaths, names_to = "concept")

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

prefecture_menu <- unique(in_japan$prefecture)

# Define UI for application
ui <- navbarPage(
  "Covid-19 situation",
  
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
  tabPanel("In Japan",
           select_showUI("japan", in_japan, "prefecture",
                         a_menu = prefecture_menu, c_menu = concept_menu)),
  tabPanel("In Japan (map)",
           draw_mapUI("japan_map", in_japan_map, "prefecture",
                      c_menu = concept_menu)),
  tabPanel("In the U.S.",
           select_showUI("usa", in_usa, "state",
                         a_menu = state_menu, c_menu = concept_menu)),
  tabPanel("In the U.S. (map)",
           draw_mapUI("usa_map", in_usa_map, "state",
                      c_menu = concept_menu))
)


# Define server logic required to draw a chart
server <- function(input, output, session) {
  select_showServer("world_region", world_region, "region")
  select_showServer("world_area", world_area, "area")
  select_showServer("japan", in_japan, "prefecture")
  select_showServer("usa", in_usa, "state")
  
  draw_mapServer("usa_map", states_map, in_usa_map, "state")
  draw_mapServer("japan_map", prefectures_map, in_japan_map, "prefecture")
}

# Run the application
shinyApp(ui = ui, server = server)
