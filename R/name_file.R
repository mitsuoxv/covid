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

