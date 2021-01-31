# I corrected update_sr_47 and 48. So don't run this again.

library(tidyverse)

load("data/tables.rdata")

# sr 47-49
tab_47_49 <- table2 %>% 
  filter(publish_date >= "2020-03-07", publish_date <= "2020-03-09")

# Manually input missing area names
# Bosnia and Herzegovina
# Iran (Islamic Republic of)
# United Arab Emirates
# occupied Palestinian territory
# the United States

# OK
tab_47_49 %>% 
  filter(area == "Bosnia and Herzegovina")

# OK
tab_47_49 %>% 
  filter(area == "Iran (Islamic Republic of)")

# OK
tab_47_49 %>% 
  filter(area == "United Arab Emirates")

# NG, 47_48: the United States
tab_47_49 %>% 
  filter(area == "occupied Palestinian territory")

# NG, 47_48: occupied Palestinian territory
tab_47_49 %>% 
  filter(area == "the United States")

# correct
temp1 <- table2[(table2$area == "the United States" & table2$publish_date == "2020-03-07"), 2:5]
temp2 <- table2[(table2$area == "the United States" & table2$publish_date == "2020-03-08"), 2:5]

table2[(table2$area == "the United States" & table2$publish_date == "2020-03-07"), 2:5] <- 
  table2[(table2$area == "occupied Palestinian territory" & table2$publish_date == "2020-03-07"), 2:5]
table2[(table2$area == "the United States" & table2$publish_date == "2020-03-08"), 2:5] <- 
  table2[(table2$area == "occupied Palestinian territory" & table2$publish_date == "2020-03-08"), 2:5]

table2[(table2$area == "occupied Palestinian territory" & table2$publish_date == "2020-03-07"), 2:5] <- 
  temp1
table2[(table2$area == "occupied Palestinian territory" & table2$publish_date == "2020-03-08"), 2:5] <- 
  temp2

save(table1, table2, file = "data/tables.rdata")
