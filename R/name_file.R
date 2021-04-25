#' Define download file name
#'
#' @param select_concept A character vector of length 1.
#' @param ma A character vector of length 1.
#' @param per1m A character vector of length 1.
#'
#' @return A character vector of length 1.
#'
#' @examples
#' \dontrun{
#' name_file("new_conf", "Yes", "No")
#' }
name_file <- function(select_concept, ma, per1m) {
  fname <- select_concept
  
  if (ma == "Yes") {
    fname <- paste0(fname, "_ma")
  }
    
  if (per1m == "Yes") {
    fname <- paste0(fname, "_per1m")
  }
  
  paste0(fname, ".tsv")
}

