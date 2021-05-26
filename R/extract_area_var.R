#' Extract area variable symbol from a data frame
#'
#' @param df A data frame
#'
#' @return A symbol.
#'
#' @examples
#' \dontrun{
#' extract_area_var(world$region_df)
#' }
extract_area_var <- function(df) {
  columns <- names(df)
  
  if ("area" %in% columns) {
    rlang::sym("area")
  } else if ("state" %in% columns) {
    rlang::sym("state")
  } else if ("prefecture" %in% columns) {
    rlang::sym("prefecture")
  } else if ("region" %in% columns) {
    rlang::sym("region")
  } else stop("Columns must include either 'area', 'state', 'prefecture' or 'region'.")
}