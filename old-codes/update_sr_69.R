library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# Specify FILE
FILE <- "20200329-sitrep-69-covid-19.pdf"

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


# Table 1. or 2.
table_start2 <- str_which(lines, "^Table \\d. Countries")
table_end2 <- str_which(lines, "Grand total")

lines_table2 <- lines[table_start2:table_end2] %>% 
  remove_dis_char() %>% 
  str_remove_all("†")

length(lines_table2)

lines_table2[247]

pattern <- "^\\s*([a-zA-z\\(]+[^a-zA-z\\(])*\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+"

df_table2 <- read_chr_vec3(lines_table2, pattern = pattern)

tail(df_table2)

# 634835 match!
df_table2 %>% 
  summarize(total = sum(cum_conf))

# correct long area names
df_table2 <- df_table2 %>% 
  correct_area()

df_table2$area

# Manually correct area names
# df_table2[(df_table2$area == ""), "area"] <-
#   c(
#     "Laos",
#     "Bosnia and Herzegovina",
#     "Iran",
#     "Palestine",
#     "United States",
#     "Venezuela",
#     "Bolivia",
#     "Saint Vincent and the Grenadines",
#     "U.S. Virgin Islands",
#     "Turks and Caicos Islands",
#     "Democratic Republic of the Congo",
#     "Tanzania",
#     "Central African Republic"
#   )

df_table2[(df_table2$area == ""), ]

df_table2[(df_table2$area == ""), "area"] <- "Northern Mariana Islands"

df_table2[(df_table2$area == "Democratic Republic"), ]

df_table2[(df_table2$area == "Democratic Republic"), "area"] <- "Laos"

df_table2[(df_table2$area == "Islands"), ]

df_table2[(df_table2$area == "Islands"), "area"] <- 
  c(
    "U.S. Virgin Islands",
    "Turks and Caicos Islands"
  )

df_table2[(df_table2$area == "the Congo"), ]

df_table2[(df_table2$area == "the Congo"), "area"] <- 
  "Democratic Republic of the Congo"

df_table2[(df_table2$area == "conveyance (Diamo"), ]

df_table2[(df_table2$area == "conveyance (Diamo"), "area"] <- 
  "International conveyance (Diamond Princess)"

# add publish_date
df_table2 <- df_table2 %>% 
  select(area, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  mutate(publish_date = DATE)

# df_table1
df_table1 <- df_table2 %>% 
  filter(area == "China") %>% 
  rename(region = area)

df_table1[df_table1$region == "China", "region"] <- "Total"

# load
load("data/tables.rdata")

# merge table1 and table2
table1 <- bind_rows(table1, df_table1)
table2 <- bind_rows(table2, df_table2)

table1 <- table1 %>% 
  select(publish_date, region, new_conf, new_deaths, cum_conf, cum_deaths)

table2 <- table2 %>% 
  select(publish_date, area, new_conf, new_deaths, cum_conf, cum_deaths)

# update area category
df_table2$area

area_cat <- tibble(
  area = df_table2$area,
  cat = c(
    rep("China", 1),
    rep("South East Asia, excl China", 18),
    rep("Europe", 60),
    rep("South East Asia, excl China", 10),
    rep("Eastern Mediterranean", 21),
    rep("Americas", 51),
    rep("Sub-Saharan Africa", 41),
    rep("International conveyance", 1)
  )
)

# check
length(unique(table2$area))

length(unique(area_cat$area))

setdiff(unique(table2$area), unique(area_cat$area))

# save
table1 %>% 
  write.csv("data/table1.csv", row.names = FALSE)

table2 %>% 
  write.csv("data/table2.csv", row.names = FALSE)

save(table1, table2, area_cat, file = "data/tables.rdata")

