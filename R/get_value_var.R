#' Generate value variable symbol
#'
#' @param ma "Yes" or "No".
#' @param per1m "Yes" or "No".
#'
#' @return A symbol.
#'
#' @examples
#' \dontrun{
#' get_value_var("Yes", "No")
#' }
get_value_var <- function(ma, per1m) {
  var <- "value"
  
  if (ma == "Yes") {
    var <- paste0(var, "_ma")
  }

  if (per1m == "Yes") {
    var <- paste0(var, "_per1m")
  }
  
  rlang::sym(var)
}