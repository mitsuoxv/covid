% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/draw.R
\name{draw_map_world}
\alias{draw_map_world}
\title{Draw World map}
\usage{
draw_map_world(df, value_var)
}
\arguments{
\item{df}{A data frame with columns: publish_date, concept, value, area.}

\item{value_var}{A symbol: value, value_ma, value_per1m or value_ma_per1m.}
}
\value{
A plot.
}
\description{
Draw World map
}
\examples{
\dontrun{
draw_map_world(df, value_ma_per1m)
}
}
