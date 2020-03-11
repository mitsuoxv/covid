library(tidyverse)

# load
load("data/tables.rdata")

table1 %>% 
  select(publish_date, region, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  write.csv("data/table1.csv", row.names = FALSE)

table2 %>% 
  select(publish_date, area, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  write.csv("data/table2.csv", row.names = FALSE)

