data_source <- function(var_str) {
  if (var_str == "state") {
    a(href = "https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/",
      "Source: USAFacts")
  } else if (var_str == "prefecture") {
    a(href = "https://www3.nhk.or.jp/news/special/coronavirus/data/",
      "Source: NHK")
  } else {
    a(href = "https://covid19.who.int/", "Source: WHO")
  }
}