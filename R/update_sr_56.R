library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# Specify FILE
FILE <- "20200316-sitrep-56-covid-19.pdf"

DATE <- as.Date(
  str_c(str_sub(FILE, 1L, 4L), "-",
        str_sub(FILE, 5L, 6L), "-",
        str_sub(FILE, 7L, 8L))
  )

# Extract text
sr <- pdf_text(str_c("pdf/", FILE))

str(sr)

# Split into lines
lines <- sr  %>% 
  make_lines()


# New Table1, old Table 2
table_start2 <- str_which(lines, "^Table 1.")
table_end2 <- str_which(lines, "Grand total")

lines_table2 <- lines[table_start2:table_end2]

pattern <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+"

df_table2 <- read_chr_vec3(lines_table2, pattern = pattern)

# less than 167511 by 5
# When I manually calculate using soroban, the sum of cum_conf is 167506
# So, I ignore this difference
df_table2 %>% 
  summarize(total = sum(cum_conf))

# match other than cum_conf
df_table2 %>% 
  summarize(total = sum(new_conf))

# correct long area names
df_table2 <- df_table2 %>% 
  correct_area()

unique(df_table2$area)

# Manually input missing area names
# Bosnia and Herzegovina
# Iran
# occupied Palestinian territory
# United States
# Bolivia
# Venezuela
# Saint Vincent and the Grenadines
# Democratic Republic of the Congo
# Central African Republic
df_table2[(df_table2$area == ""), ]

df_table2[(df_table2$area == ""), "area"] <- 
  c(
    "Bosnia and Herzegovina",
    "Iran",
    "occupied Palestinian territory",
    "United States",
    "Bolivia",
    "Venezuela",
    "Saint Vincent and the Grenadines",
    "Democratic Republic of the Congo",
    "Central African Republic"
  )

# area category
area_cat <- tibble(
  area = df_table2$area,
  cat = c(
    rep("China", 1),
    rep("South-East Asia, excl China", 12),
    rep("Europe", 55),
    rep("South-East Asia, excl China", 8),
    rep("Eastern Mediterranean", 17),
    rep("Americas", 34),
    rep("Sub-Saharan Africa", 24),
    rep("International conveyance", 1)
    )
)

# add publish_date
df_table2 <- df_table2 %>% 
  select(area, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  mutate(publish_date = DATE)

# df_table1
df_table1 <- df_table2 %>% 
  filter(area == "China") %>% 
  rename(region = area)

df_table1[df_table1$region == "China", "region"] <- "Total"

df_table2 <- df_table2 %>% 
  filter(area != "China")

# load and check area names
load("data/tables.rdata")

# merge
table1 <- bind_rows(table1, df_table1)
table2 <- bind_rows(table2, df_table2)

table1 <- table1 %>% 
  select(publish_date, region, new_conf, new_deaths, cum_conf, cum_deaths)

table2 <- table2 %>% 
  select(publish_date, area, new_conf, new_deaths, cum_conf, cum_deaths)

table1 %>% 
  write.csv("data/table1.csv", row.names = FALSE)

table2 %>% 
  write.csv("data/table2.csv", row.names = FALSE)

save(table1, table2, area_cat, file = "data/tables.rdata")

# check
length(unique(table2$area))

length(unique(area_cat$area))

setdiff(unique(table2$area), unique(area_cat$area))

# add China to table2
table2 <- table1 %>% 
  filter(region == "Total") %>% 
  rename(area = region) %>% 
  mutate(area = "China") %>% 
  bind_rows(table2) %>% 
  select(publish_date, area, new_conf, new_deaths, cum_conf, cum_deaths)

table2 %>% 
  write.csv("data/table2.csv", row.names = FALSE)

save(table1, table2, area_cat, file = "data/tables.rdata")
