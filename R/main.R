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
             selectShowUI("world_region", world$region_df,
                           a_menu = world$region_menu)),
    tabPanel("World (map)",
             drawMapUI("world_map", world$area_df)),
    tabPanel("Areas",
             selectShowUI("world_area", world$area_df,
                           a_menu = world$area_menu)),
    tabPanel("In Japan",
             selectShowUI("japan", japan$area_df,
                           a_menu = japan$area_menu)),
    tabPanel("In Japan (map)",
             drawMapUI("japan_map", japan$area_df)),
    tabPanel("In the U.S.",
             selectShowUI("usa", usa$area_df,
                           a_menu = usa$area_menu)),
    tabPanel("In the U.S. (map)",
             drawMapUI("usa_map", usa$area_df))
  )
  
  
  # Define server logic required to draw a chart
  server <- function(input, output, session) {
    selectShowServer("world_region", world$region_df)
    selectShowServer("world_area", world$area_df)
    selectShowServer("japan", japan$area_df)
    selectShowServer("usa", usa$area_df)
    
    drawMapServer("usa_map", usa$area_df)
    drawMapServer("japan_map", japan$area_df)
    drawMapServer("world_map", world$area_df)
  }
  
  # Run the application
  shinyApp(ui = ui, server = server)
}
