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
load("data/world.rda")
load("data/usa.rda")
load("data/japan.rda")

# Define UI for application
ui <- navbarPage(
  "Covid-19 situation",
  
  tags$head(includeHTML((
    "google-analytics.html"
  ))),
  
  selected = "Regions",
  
  tabPanel("Regions",
           select_showUI("world_region", world$region_df, "region",
                         a_menu = world$region_menu, c_menu = world$concept_menu)),
  tabPanel("World (map)",
           draw_mapUI("world_map", world$ma7_df, 
                      c_menu = world$concept_menu)),
  tabPanel("Areas",
           select_showUI("world_area", world$area_df, "area",
                         a_menu = world$area_menu, c_menu = world$concept_menu)),
  tabPanel("In Japan",
           select_showUI("japan", japan$area_df, "prefecture",
                         a_menu = japan$area_menu, c_menu = world$concept_menu)),
  tabPanel("In Japan (map)",
           draw_mapUI("japan_map", japan$ma7_df, 
                      c_menu = world$concept_menu)),
  tabPanel("In the U.S.",
           select_showUI("usa", usa$area_df, "state",
                         a_menu = usa$area_menu, c_menu = world$concept_menu)),
  tabPanel("In the U.S. (map)",
           draw_mapUI("usa_map", usa$ma7_df, 
                      c_menu = world$concept_menu))
)


# Define server logic required to draw a chart
server <- function(input, output, session) {
  select_showServer("world_region", world$region_df, "region")
  select_showServer("world_area", world$area_df, "area")
  select_showServer("japan", japan$area_df, "prefecture")
  select_showServer("usa", usa$area_df, "state")
  
  draw_mapServer("usa_map", usa$map_df, usa$ma7_df)
  draw_mapServer("japan_map", japan$map_df, japan$ma7_df)
  draw_mapServer("world_map", world$map_df, world$ma7_df)
}

# Run the application
shinyApp(ui = ui, server = server)
