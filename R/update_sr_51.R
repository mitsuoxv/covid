library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# Extract text
sr51 <- pdf_text("pdf/sr51.pdf")

str(sr51)

# Split into lines
lines <- sr51  %>% 
  make_lines()

# Table 1
table_start <- str_which(lines, "^Table 1. Confirmed")
  
lines_table1 <- lines[table_start:(table_start + 42)]
  
df_table1 <- read_chr_vec(lines_table1, skip = 8, expect_col_num = 7,
                          column_chr = c(1))
  
names(df_table1) <- c("region", "pop_10k",
                        "new_conf", "new_susp", "new_deaths",
                        "cum_conf", "cum_deaths")

df_table1 <- df_table1 %>% 
  select(region, new_conf, new_deaths, cum_conf, cum_deaths)

tail(df_table1)

# add publish_date
df_table1 <- df_table1 %>% 
  mutate(publish_date = as.Date("2020-03-11"))

# Table 2
table_start2 <- str_which(lines, "^Table 2.")
table_end2 <- str_which(lines, "Grand total")

lines_table2 <- lines[table_start2:table_end2]

pattern <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+"

df_table2 <- read_chr_vec3(lines_table2, pattern = pattern)

# 37371 match!
df_table2 %>% 
  summarize(total = sum(cum_conf))

# correct long area names
df_table2 <- df_table2 %>% 
  correct_area()

unique(df_table2$area)

# Manually input missing area names
# None
df_table2[(df_table2$area == ""), ]

# add publish_date
df_table2 <- df_table2 %>% 
  select(area, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  mutate(publish_date = as.Date("2020-03-11"))

# Merge and save
load("data/tables.rdata")

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

save(table1, table2, file = "data/tables.rdata")

