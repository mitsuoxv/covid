library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# Extract text
sr47 <- pdf_text("pdf/sr47.pdf")

str(sr47)

# Split into lines
lines <- sr47  %>% 
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
  mutate(publish_date = as.Date("2020-03-07"))

# Table 2
table_start2 <- str_which(lines, "^Table 2.")
table_end2 <- str_which(lines, "Grand total")

lines_table2 <- lines[table_start2:table_end2]

pattern <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+"

df_table2 <- read_chr_vec3(lines_table2, pattern = pattern)

# 21114 match!
df_table2 %>% 
  summarize(total = sum(cum_conf))

# correct long area names
unique(df_table2$area)

df_table2 <- df_table2 %>% 
  correct_area()

# Manually input missing area names
# Bosnia and Herzegovina
# Iran (Islamic Republic of)
# United Arab Emirates
# occupied Palestinian territory
# the United States
df_table2[(df_table2$area == ""), ]

df_table2[(df_table2$area == ""), "area"] <- 
  c("Bosnia and Herzegovina",
    "Iran (Islamic Republic of)",
    "United Arab Emirates",
    "occupied Palestinian territory",
    "the United States"
    )

# add publish_date
df_table2 <- df_table2 %>% 
  select(area, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  mutate(publish_date = as.Date("2020-03-07"))

# Merge
# load data
load("data/tables.rdata")

table1 <- bind_rows(table1, df_table1)
table2 <- bind_rows(table2, df_table2)

save(table1, table2, file = "data/tables.rdata")

