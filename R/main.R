#' Shiny app to show Covid-19 situation
#'
#' @return A Shiny app.
#' @import shiny
#' @export
#'
#' @examples
#' \dontrun{
#' mainApp()
#' }
mainApp <- function() {
  ui <- navbarPage(
    "Covid-19 situation",
    
    tags$head(includeHTML((
      "google-analytics.html"
    ))),
    
    selected = "Regions",
    
    tabPanel("Regions",
             select_showUI("world_region", world$region_df, "region",
                           a_menu = world$region_menu)),
    tabPanel("World (map)",
             draw_mapUI("world_map", world$ma7_df)),
    tabPanel("Areas",
             select_showUI("world_area", world$area_df, "area",
                           a_menu = world$area_menu)),
    tabPanel("In Japan",
             select_showUI("japan", japan$area_df, "prefecture",
                           a_menu = japan$area_menu)),
    tabPanel("In Japan (map)",
             draw_mapUI("japan_map", japan$ma7_df)),
    tabPanel("In the U.S.",
             select_showUI("usa", usa$area_df, "state",
                           a_menu = usa$area_menu)),
    tabPanel("In the U.S. (map)",
             draw_mapUI("usa_map", usa$ma7_df))
  )
  
  
  # Define server logic required to draw a chart
  server <- function(input, output, session) {
    select_showServer("world_region", world$region_df, "region")
    select_showServer("world_area", world$area_df, "area")
    select_showServer("japan", japan$area_df, "prefecture")
    select_showServer("usa", usa$area_df, "state")
    
    draw_mapServer("usa_map", usa$ma7_df)
    draw_mapServer("japan_map", japan$ma7_df)
    draw_mapServer("world_map", world$ma7_df)
  }
  
  # Run the application
  shinyApp(ui = ui, server = server)
}
