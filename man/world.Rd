% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{world}
\alias{world}
\title{World Covid-19 situation}
\format{
A list.
\describe{
\item{area_df}{

A tibble.
\describe{
\item{publish_date}{2020-01-03}
\item{area}{"Afghanistan"}
\item{population}{29121286}
\item{region}{"Southern Asia"}
\item{concept}{"new_conf"}
\item{value}{0}
\item{value_ma}{0}
\item{value_per1m}{0}
\item{value_ma_per1m}{0}
}
}
\item{region_df}{

A tibble.
\describe{
\item{publish_date}{2020-01-03}
\item{region}{"Central Asia"}
\item{population}{61142769}
\item{concept}{"new_conf"}
\item{value}{0}
\item{value_ma}{0}
\item{value_per1m}{0}
\item{value_ma_per1m}{0}
}
}
\item{map_df}{

A tibble.
\describe{
\item{long}{-69.9}
\item{lat}{12.5}
\item{group}{1}
\item{order}{1}
\item{region}{"Aruba"}
\item{subregion}{NA_character_}
}
}
\item{area_menu}{

A character vector of length 237.
\describe{
\item{1}{"Afghanistan"}
\item{2}{"Albania"}
\item{3}{"Algeria"}
\item{4}{"American Samoa"}
\item{5}{"Andorra"}
}
}
\item{region_menu}{

A character vector of length 13.
\describe{
\item{1}{"Total"}
\item{2}{"Central Asia"}
\item{3}{"Eastern Asia"}
\item{4}{"Eastern Europe"}
\item{5}{"Latin America and the Caribbean"}
}
}
\item{concept_menu}{

A named character vector of length 4.
\describe{
\item{Confirmed cases (cumulative)}{"cum_conf"}
\item{Deaths (cumulative)}{"cum_deaths"}
\item{Confirmed cases (new)}{"new_conf"}
\item{Deaths (new)}{"new_deaths"}
}
}
}
}
\source{
https://covid19.who.int/
}
\usage{
world
}
\description{
World Covid-19 situation
}
\keyword{datasets}
