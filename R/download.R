library(tidyverse)
library(httr)
library(pdftools)

publish_date <- c(
  str_c("01", 21:31),
  str_c("020", 1:9), str_c("02", 10:29),
  str_c("030", 1:9)
)

for (i in seq_along(publish_date)) {
  if (i <= 5) {
    app <- "-2019-ncov"
  } else if (i <= 7) {
    app <- "-2019--ncov"
  } else if (i == 8) {
    app <- "-ncov-cleared"
  } else if (i == 9) {
    app <- "-ncov-v2"
  } else if (i <= 12) {
    app <- "-ncov"
  } else if (i == 13) {
    app <- "-ncov-v3"
  } else if (i <= 23) {
    app <- "-ncov"
  } else {
    app <- "-covid-19"
  }
  
  url <- str_c("https://www.who.int/docs/default-source/coronaviruse/situation-reports/2020",
               publish_date[i],
               "-sitrep-",
               i,
               app,
               ".pdf")
  
  file_name <- str_c("pdf/sr",
                     str_pad(i, 2, pad = "0"),
                     ".pdf")
  
  if (file.exists(file_name)) next
  
  GET(url, httr::write_disk(file_name))
  Sys.sleep(10) # I'm not attacking the server

}
