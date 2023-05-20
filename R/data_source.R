#' Display data source
#'
#' @param id A character vector of length 1.
#'
#' @return A HTML element.
#'
#' @examples
#' \dontrun{
#' data_source("usa")
#' }
data_source <- function(id) {
  if (id %in% c("usa", "usa_map")) {
    a(href = "https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/",
      "Source: USAFacts")
  } else if (id %in% c("japan", "japan_map")) {
    a(href = "https://www.mhlw.go.jp/stf/covid-19/open-data.html",
      "Source: Ministry of Health, Labour and Welfare")
  } else if (id %in% c("japan_wk", "japan_wk_map")) {
    a(href = "https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000121431_00432.html",
      "Source: Ministry of Health, Labour and Welfare")
  } else if (id %in% c("world_region", "world_map", "world_area")) {
    a(href = "https://covid19.who.int/", "Source: WHO")
  } else stop("Incorrect id.")
}