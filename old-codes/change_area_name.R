library(tidyverse)

# load utility
source("R/utility.R")

load("data/tables.rdata")

table2 <- table2 %>% 
  correct_area()

table2$area %>% unique()

save(table1, table2, file = "data/tables.rdata")

