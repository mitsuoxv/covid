library(tidyverse)

load("data/tables.rdata")

table2 <- table2 %>% 
  mutate(area = if_else(area == "International conveyance (Diamond Princess)",
                        "Other", area))

tail(table2)

save(table1, table2, area_cat, file = "data/tables.rdata")
