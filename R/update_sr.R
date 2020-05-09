library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# Specify FILE
FILE <- readline(prompt = "Input file name: ")

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
table_end2 <- str_which(lines, "Grand total") + 1

lines_table2 <- lines[table_start2:table_end2] %>% 
  remove_dis_char() %>% 
  str_remove_all("†") %>% 
  stringi::stri_trans_general("latin-ascii")

pattern <- "^\\s*([a-zA-z\\(\\),]+[^a-zA-z\\(\\),])*\\s+((\\d+\\s?)+)\\s+(-?(\\d+\\s?)+)\\s+((\\d+\\s?)+)\\s+(-?(\\d+\\s?)+)"

df_all <- read_chr_vec3(lines_table2, pattern = pattern)

# check and correct "Grand total"
tail(df_all)

df_all[df_all$area == "", ]
df_all[df_all$area == "", "area"] <- "Grand total"

df_table2 <- df_all %>% 
  filter(!(area %in% c("Subtotal for all regions", "Grand total")))

# check sum
sum_calc <- df_table2 %>% 
  select(-area) %>% 
  map_dbl(sum)

sum_to_be <- df_all %>% 
  filter(area == "Grand total") %>% 
  select(-area) %>% 
  unlist()

sum_calc

sum_to_be

sum_calc - sum_to_be

# correct long area names
df_table2 <- df_table2 %>% 
  correct_area()

df_table2$area

# Manually correct area names
df_table2[(df_table2$area == "Congo"), ]
df_table2[(df_table2$area == "Congo"), "area"] <- 
  c("Democratic Republic of the Congo", "Republic of the Congo")

df_table2[(df_table2$area == "of)"), ]
df_table2[(df_table2$area == "of)"), "area"] <- "Venezuela"

# check duplication in area name
df_table2 %>% 
  count(area) %>% 
  filter(n > 1)

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

# check new entry
length(unique(table2$area))
length(df_table2$area)

setdiff(df_table2$area, unique(table2$area))

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
    rep("Sub-Saharan Africa", 48),
    rep("Americas", 54),
    rep("Eastern Mediterranean", 22),
    rep("Europe", 61),
    rep("South East Asia, excl China", 10),
    rep("China", 1),
    rep("South East Asia, excl China", 18),
    rep("Other", 1)
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


