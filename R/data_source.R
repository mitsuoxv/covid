data_source <- function(id) {
  if (id %in% c("usa", "usa_map")) {
    a(href = "https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/",
      "Source: USAFacts")
  } else if (id %in% c("japan", "japan_map")) {
    a(href = "https://www3.nhk.or.jp/news/special/coronavirus/data/",
      "Source: NHK")
  } else {
    a(href = "https://covid19.who.int/", "Source: WHO")
  }
}