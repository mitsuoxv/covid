library(tidyverse)
library(rvest)

cc_html <- read_html("https://countrycode.org/")

cc_df <- cc_html %>% 
  html_nodes("table") %>% 
  .[[1]] %>% 
  html_table()

# load
load("data/tables.rdata")

setdiff(unique(table2$area), cc_df$COUNTRY)

# https://countrycode.org/
table2 <- table2 %>% 
  mutate(
    area = if_else(area == "Viet Nam",
                   "Vietnam", area),
    
    area = if_else(area == "Russian Federation",
                   "Russia", area),
    
    area = if_else(area == "North Macedonia",
                   "Macedonia", area),
    
    area = if_else(area == "occupied Palestinian territory",
                   "Palestine", area),
    
    area = if_else(area == "French Guiana",
                   "Guiana", area),
    
    area = if_else(area == "Cote d'Ivoire",
                   "Ivory Coast", area),
    
    area = if_else(area == "Congo",
                   "Republic of the Congo", area),
    
    area = if_else(area == "Eswatini",
                   "Swaziland", area),
    
    area = if_else(area == "Timor-Leste",
                   "East Timor", area),
    
    area = if_else(area == "Cabo Verde",
                   "Cape Verde", area),
    
    area = if_else(area == "Kosovo[1]",
                   "Kosovo", area),
    
    area = if_else(area == "Syrian Arab Republic",
                   "Syria", area)
  )

# save
table2 %>% 
  write.csv("data/table2.csv", row.names = FALSE)

save(table1, table2, area_cat, file = "data/tables.rdata")
