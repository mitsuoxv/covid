#' Define download file name
#'
#' @param input A Shiny input.
#'
#' @return A character vector of length 1.
#'
#' @examples
#' \dontrun{
#' name_file(input)
#' }
name_file <- function(input) {
  fname <- input$select_concept
  
  if (input$ma == "Yes") {
    fname <- paste0(fname, "_ma")
  }
    
  if (input$per1m == "Yes") {
    fname <- paste0(fname, "_per1m")
  }
  
  paste0(fname, ".tsv")
}

