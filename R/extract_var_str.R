#' Extract area variable from a data frame
#'
#' @param df A data frame
#'
#' @return A character vector of length 1.
#'
#' @examples
#' \dontrun{
#' extract_var_str(world$region_df)
#' }
extract_var_str <- function(df) {
  columns <- names(df)
  
  if ("area" %in% columns) {
    "area"
  } else if ("state" %in% columns) {
    "state"
  } else if ("prefecture" %in% columns) {
    "prefecture"
  } else if ("region" %in% columns) {
    "region"
  } else stop("Columns must include either 'area', 'state', 'prefecture' or 'region'.")
}