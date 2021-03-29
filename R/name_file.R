name_file <- function(cat, input) {
  stopifnot(cat %in% c("area", "region", "state"))
  
  fname <- input[[paste0("select_concept_", cat)]]
  
  if (cat == "region") {
    paste0(fname, ".tsv")
  } else {
    if (input[[paste0("ma_", cat)]] == "Yes") {
      fname <- paste0(fname, "_ma")
    }
    
    if (input[[paste0("per1m_", cat)]] == "Yes") {
      fname <- paste0(fname, "_per1m")
    }
    
    paste0(fname, ".tsv")
  }
}

