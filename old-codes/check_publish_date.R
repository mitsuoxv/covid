library(tidyverse)

# load
load("data/tables.rdata")

# check missing dates in table2
table_sum <- table2 %>% 
  group_by(area) %>% 
  summarize(
    min_date = min(publish_date),
    max_date = max(publish_date),
    duration = max_date - min_date + 1,
    n_rows = length(area),
    missing = as.numeric(duration) - n_rows
    )

table_sum

# Saint Vincent and the Grenadines
table_sum %>% 
  filter(missing > 0)

table2 %>% 
  filter(area == "Saint Vincent and the Grenadines")

table2[table2$publish_date == "2020-01-20", ]
table2[table2$publish_date == "2020-01-20", "publish_date"] <- 
  as.Date("2020-03-20")

# check continuous publish_dates, OK
table2 %>% 
  group_by(area) %>% 
  arrange(publish_date) %>% 
  mutate(
    lag_date = lag(publish_date),
    diff_date = publish_date - lag_date
    ) %>% 
  ungroup() %>% 
  filter(diff_date > 1)

# save
table2 %>% 
  write.csv("data/table2.csv", row.names = FALSE)

save(table1, table2, area_cat, file = "data/tables.rdata")
