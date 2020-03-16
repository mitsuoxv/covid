library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# Specify FILE
FILE <- "20200315-sitrep-55-covid-19.pdf"

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
  mutate(publish_date = DATE)

# Table 2
table_start2 <- str_which(lines, "^Table 2.")
table_end2 <- str_which(lines, "Grand total")

lines_table2 <- lines[table_start2:table_end2]

pattern <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+"

df_table2 <- read_chr_vec3(lines_table2, pattern = pattern)

# 72469 match!
df_table2 %>% 
  summarize(total = sum(cum_conf))

# correct long area names
df_table2 <- df_table2 %>% 
  correct_area()

unique(df_table2$area)

# Manually input missing area names
# None
df_table2[(df_table2$area == ""), ]

df_table2[(df_table2$area == ""), "area"] <- 
  "International conveyance (Diamond Princess)"

# area category
area_cat <- tibble(
  area = df_table2$area,
  cat = c(
    rep("South-East Asia, excl China", 12),
    rep("Europe", 54),
    rep("South-East Asia, excl China", 8),
    rep("Eastern Mediterranean", 17),
    rep("Americas", 30),
    rep("Sub-Saharan Africa", 22),
    rep("International conveyance", 1)
    )
)

# add publish_date
df_table2 <- df_table2 %>% 
  select(area, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  mutate(publish_date = DATE)

# load and check area names
load("data/tables.rdata")

# tried to correct umlaut, but failed
unique(table2$area) %>% sort()

table2_mod <- table2 %>% 
  mutate(
    area = if_else(area == "Côte d’Ivoire",
                   "Cote d Ivoire", area),
    
    area = if_else(area == "Cote d Ivoire",
                   "Côte d’Ivoire", area),

    area = if_else(area == "Cote d’Ivoire",
                   "Côte d’Ivoire", area),
    
    area = if_else(area == "Saint Barthelemy",
                   "Saint Barthelemy", area)
  )

unique(table2_mod$area) %>% sort()

"Cote d’Ivoire" == "Côte d’Ivoire" # TRUE really!?

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

