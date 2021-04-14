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

library(fuzzyjoin)
library(ggthemes)

# load data
load("data/world_map")
load("data/world_area")
load("data/world_region")
load("data/in_world_map")
load("data/area_menu")
load("data/concept_menu")
load("data/region_menu")

load("data/states_map")
load("data/in_usa")
load("data/in_usa_map")
load("data/state_menu")

load("data/prefectures_map")
load("data/in_japan")
load("data/in_japan_map")
load("data/prefecture_menu")

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
  tabPanel("World (map)",
           draw_mapUI("world_map", in_world_map, 
                      c_menu = concept_menu)),
  tabPanel("Areas",
           select_showUI("world_area", world_area, "area",
                         a_menu = area_menu, c_menu = concept_menu)),
  tabPanel("In Japan",
           select_showUI("japan", in_japan, "prefecture",
                         a_menu = prefecture_menu, c_menu = concept_menu)),
  tabPanel("In Japan (map)",
           draw_mapUI("japan_map", in_japan_map, 
                      c_menu = concept_menu)),
  tabPanel("In the U.S.",
           select_showUI("usa", in_usa, "state",
                         a_menu = state_menu, c_menu = concept_menu)),
  tabPanel("In the U.S. (map)",
           draw_mapUI("usa_map", in_usa_map, 
                      c_menu = concept_menu))
)


# Define server logic required to draw a chart
server <- function(input, output, session) {
  select_showServer("world_region", world_region, "region")
  select_showServer("world_area", world_area, "area")
  select_showServer("japan", in_japan, "prefecture")
  select_showServer("usa", in_usa, "state")
  
  draw_mapServer("usa_map", states_map, in_usa_map)
  draw_mapServer("japan_map", prefectures_map, in_japan_map)
  draw_mapServer("world_map", world_map, in_world_map)
}

# Run the application
shinyApp(ui = ui, server = server)
