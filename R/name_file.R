name_file <- function(cat, input) {
  stopifnot(cat %in% c("area", "region", "state"))
  
  fname <- input$select_concept
  
  if (input$ma == "Yes") {
    fname <- paste0(fname, "_ma")
  }
    
  if (input$per1m == "Yes") {
    fname <- paste0(fname, "_per1m")
  }
  
  paste0(fname, ".tsv")
}

