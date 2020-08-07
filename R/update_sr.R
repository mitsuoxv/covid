# Libraries
library(tidyverse)
library(pdftools)

# Load utility
source("R/utility.R")

# Load old data
load("data/tables.rdata")

# Specify FILE
FILE <- readline(prompt = "Input file name: ")

DATE <- as.Date(
  str_c(str_sub(FILE, 1L, 4L), "-",
        str_sub(FILE, 5L, 6L), "-",
        str_sub(FILE, 7L, 8L))
  )

# Check FILE is really new
if (DATE == max(table2$publish_date) + 1) {
  print("OK.")
} else {
  print("Stop! Date is not new.") 
}
  
# Extract text
sr <- pdf_text(str_c("~/Downloads/", FILE, ".pdf"))

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

pattern <- "^\\s*([a-zA-z\\(\\),]+[^a-zA-z\\(\\),])*\\s*((\\d+\\s?)+)\\s+(-?\\s?(\\d+\\s?)+)\\s+((\\d+\\s?)+)\\s+(-?\\s?(\\d+\\s?)+)"

df_all <- read_chr_vec3(lines_table2, pattern = pattern)

# Check and correct "Grand total"
tail(df_all)

# df_all[df_all$area == "", ]
# df_all[df_all$area == "", "area"] <- "Grand total"

df_table2 <- df_all %>% 
  filter(!(area %in% c("Subtotal for all regions", "Grand total")))

# Check sum
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

# Correct long area names
df_table2 <- df_table2 %>% 
  correct_area()

df_table2$area

# Manually correct area names
# "Democratic Republic of the Congo"
df_table2[(df_table2$area == "Congo"), ]
df_table2[(df_table2$area == "Congo"), "area"] <- 
  c("Republic of the Congo")

df_table2[(df_table2$area == ""), ]
# df_table2[(df_table2$area == ""), "area"] <- "French Polynesia"
  
# df_table2[(df_table2$area == "of)"), ]
# df_table2[(df_table2$area == "of)"), "area"] <- "Venezuela"

# Check duplication in area name
df_table2 %>% 
  count(area) %>% 
  filter(n > 1)

# Add publish_date
df_table2 <- df_table2 %>% 
  select(area, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  mutate(publish_date = DATE)

# df_table1
df_table1 <- df_table2 %>% 
  filter(area == "China") %>% 
  rename(region = area)

df_table1[df_table1$region == "China", "region"] <- "Total"


# Check entry
length(unique(table2$area))
length(df_table2$area)

setdiff(df_table2$area, unique(table2$area))

setdiff(unique(table2$area), df_table2$area)

# Merge table1 and table2
table1 <- bind_rows(table1, df_table1)
table2 <- bind_rows(table2, df_table2)

table1 <- table1 %>% 
  select(publish_date, region, new_conf, new_deaths, cum_conf, cum_deaths)

table2 <- table2 %>% 
  select(publish_date, area, new_conf, new_deaths, cum_conf, cum_deaths)

# Save updated data
table1 %>% 
  write.csv("data/table1.csv", row.names = FALSE)

table2 %>% 
  write.csv("data/table2.csv", row.names = FALSE)

save(table1, table2, data_usa, file = "data/tables.rdata")


