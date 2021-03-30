data_source <- function(var_str) {
  if (var_str == "state") {
    a(href = "https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/",
      "Source: USAFacts")
  } else {
    a(href = "https://covid19.who.int/", "Source: WHO")
  }
}