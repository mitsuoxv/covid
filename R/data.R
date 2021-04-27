#' Japan Covid-19 situation
#'
#' @source https://www3.nhk.or.jp/news/special/coronavirus/data/
#' @format A list.
#' \describe{
#' \item{area_df}{
#' @format A tibble.
#' \describe{
#' \item{publish_date}{2020-01-16}
#' \item{population}{5250000}
#' \item{code}{xxxx}
#' \item{prefecture}{"Hokkaido"}
#' \item{concept}{"new_conf"}
#' \item{value}{0}
#' \item{value_ma}{0}
#' \item{value_per1m}{0}
#' \item{value_ma_per1m}{0}
#' }
#' }
#' \item{map_df}{
#' @format A data frame. Each row is prefecture map data. 47 rows.
#' \describe{
#' \item{SP_ID}{"1"}
#' \item{jiscode}{"01"}
#' \item{name}{"Hokkaido"}
#' \item{population}{5506419}
#' \item{region}{"Hokkaido"}
#' \item{geometry}{sf data}
#' }
#' }
#' \item{area_menu}{
#' @format A character vector of length 47.
#' \describe{
#' \item{1}{"Hokkaido"}
#' \item{2}{"Aomori"}
#' \item{3}{"Iwate"}
#' \item{4}{"Miyagi"}
#' \item{5}{"Akita"}
#' }
#' }
#' }
"japan"

#' USA Covid-19 situation
#'
#' @source https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/
#' @format A list.
#' \describe{
#' \item{area_df}{
#' @format A tibble.
#' \describe{
#' \item{publish_date}{2020-01-22}
#' \item{state}{"Alaska"}
#' \item{state_abb}{"AL"}
#' \item{population}{731545}
#' \item{concept}{"cum_conf"}
#' \item{value}{0}
#' \item{value_ma}{0}
#' \item{value_per1m}{0}
#' \item{value_ma_per1m}{0}
#' }
#' }
#' \item{map_df}{
#' @format A tibble.
#' \describe{
#' \item{long}{-87.5}
#' \item{lat}{30.4}
#' \item{group}{1}
#' \item{order}{1}
#' \item{region}{"alabama"}
#' \item{subregion}{NA_character_}
#' \item{state_abb}{"AL"}
#' }
#' }
#' \item{area_menu}{
#' @format A character vector of length 52. 50 states plus DC and Total.
#' \describe{
#' \item{1}{"Total"}
#' \item{2}{"Alaska"}
#' \item{3}{"Alabama"}
#' \item{4}{"Arkansas"}
#' \item{5}{"Arizona"}
#' }
#' }
#' }
"usa"

#' World Covid-19 situation
#'
#' @source https://covid19.who.int/
#' @format A list.
#' \describe{
#' \item{area_df}{
#' @format A tibble.
#' \describe{
#' \item{publish_date}{2020-01-03}
#' \item{area}{"Afghanistan"}
#' \item{population}{29121286}
#' \item{region}{"Southern Asia"}
#' \item{concept}{"new_conf"}
#' \item{value}{0}
#' \item{value_ma}{0}
#' \item{value_per1m}{0}
#' \item{value_ma_per1m}{0}
#' }
#' }
#' \item{region_df}{
#' @format A tibble.
#' \describe{
#' \item{publish_date}{2020-01-03}
#' \item{region}{"Central Asia"}
#' \item{population}{61142769}
#' \item{concept}{"new_conf"}
#' \item{value}{0}
#' \item{value_ma}{0}
#' \item{value_per1m}{0}
#' \item{value_ma_per1m}{0}
#' }
#' }
#' \item{map_df}{
#' @format A tibble.
#' \describe{
#' \item{long}{-69.9}
#' \item{lat}{12.5}
#' \item{group}{1}
#' \item{order}{1}
#' \item{region}{"Aruba"}
#' \item{subregion}{NA_character_}
#' }
#' }
#' \item{area_menu}{
#' @format A character vector of length 237.
#' \describe{
#' \item{1}{"Afghanistan"}
#' \item{2}{"Albania"}
#' \item{3}{"Algeria"}
#' \item{4}{"American Samoa"}
#' \item{5}{"Andorra"}
#' }
#' }
#' \item{region_menu}{
#' @format A character vector of length 13.
#' \describe{
#' \item{1}{"Total"}
#' \item{2}{"Central Asia"}
#' \item{3}{"Eastern Asia"}
#' \item{4}{"Eastern Europe"}
#' \item{5}{"Latin America and the Caribbean"}
#' }
#' }
#' \item{concept_menu}{
#' @format A named character vector of length 4.
#' \describe{
#' \item{Confirmed cases (cumulative)}{"cum_conf"}
#' \item{Deaths (cumulative)}{"cum_deaths"}
#' \item{Confirmed cases (new)}{"new_conf"}
#' \item{Deaths (new)}{"new_deaths"}
#' }
#' }
#' }
"world"