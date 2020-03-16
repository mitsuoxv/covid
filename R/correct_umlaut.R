library(tidyverse)

# load and check area names
load("data/tables.rdata")

# stringi::stri_trans_general
# remove umlaut
unique(table2$area) %>% sort()

table2 <- table2 %>% 
  mutate(
    area = stringi::stri_trans_general(area, "latin-ascii"),
    
    area = if_else(area == "Cote d Ivoire",
                   "Cote d'Ivoire", area)
  )

# correct area_cat
area_cat <- area_cat %>% 
  mutate(
    area = stringi::stri_trans_general(area, "latin-ascii")
  )

unique(area_cat$area) %>% sort()

# correct table2 and area_cat
setdiff(unique(table2$area), unique(area_cat$area))

table2 <- table2 %>% 
  mutate(
    area = if_else(area == "Malyasia",
                   "Malaysia", area),
    
    area = if_else(area == "Dominica",
                   "Dominican Republic", area),
    
    area = if_else(area == "Czechia",
                   "Czech Republic", area),
    
    area = if_else(area == "Grenadines",
                   "Saint Vincent and the Grenadines", area)
    
  )

area_cat <- area_cat %>% 
  mutate(
    area = if_else(area == "Czechia",
                   "Czech Republic", area)
  )

# save
table2 <- table2 %>% 
  select(publish_date, area, new_conf, new_deaths, cum_conf, cum_deaths)

table2 %>% 
  write.csv("data/table2.csv", row.names = FALSE)

save(table1, table2, area_cat, file = "data/tables.rdata")

