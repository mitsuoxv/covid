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
    a(href = "https://www3.nhk.or.jp/news/special/coronavirus/data/",
      "Source: NHK")
  } else if (id %in% c("world_region", "world_map", "world_area")) {
    a(href = "https://covid19.who.int/", "Source: WHO")
  } else stop("Incorrect id.")
}