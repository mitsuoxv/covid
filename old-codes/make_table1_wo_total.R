# Libraries
library(tidyverse)

# Load old data
load("data/tables.rdata")

# table1 without Total
table1 <- table1 %>% 
  filter(region != "Total")

# Save
table1 %>% 
  write.csv("data/table1.csv", row.names = FALSE)

saveRDS(table1, "data/table1.rds")
