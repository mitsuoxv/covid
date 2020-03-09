library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# functions
# read
read_chr_vec4 <- function(chr_vec, pattern) {
  temp <- chr_vec %>% 
    str_replace_all("-", "0") %>% 
    str_subset(pattern) %>% 
    str_match(pattern) %>% 
    as_tibble(.name_repair = "minimal") %>% 
    `[`(c(1, 3, 6:8, 11:12))
  
  df_no_name <- bind_cols(temp[1],
                          map_dfr(temp[-1], make_numeric))
  
  names(df_no_name) <- c("region", "pop_10k",
                         "new_conf", "new_susp", "new_deaths",
                         "cum_conf", "cum_deaths")
  
  df_no_name %>%
    mutate(region = region %>% 
             str_sub(1L, 20L) %>% 
             str_trim(side = "both"))
}


# 
table_add <- vector("list", length = 3)

for (i in 1:3) {
  # file name
  file <- str_c("pdf/sr", i + 24, ".pdf")
  
  # Split into lines
  lines <- pdf_text(file) %>% 
    make_lines()
  
  # Table 1
  table_start <- str_which(lines, "^Table 1. Confirmed")
  
  lines_table1 <- lines[table_start:(table_start + 42)]
  
  pattern <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)"
  
  df_table1 <- read_chr_vec4(lines_table1, pattern = pattern)
  
  df_table1 <- df_table1 %>% 
    select(region, new_conf, new_deaths, cum_conf, cum_deaths)
  
  tail(df_table1)
  
  unique(df_table1$region)
  
  df_table1 <- df_table1 %>% 
    correct_region()
  
  # add publish_date
  table_add[[i]] <- df_table1 %>% 
    mutate(publish_date = as.Date("2020-02-13") + i)
}

df_25_27 <- bind_rows(table_add)


df_25_27 %>% 
  filter(region != "Total") %>% 
  group_by(publish_date) %>% 
  summarize(total = sum(cum_conf))


# Merge
# load data
load("data/tables.rdata")

table1 <- bind_rows(df_25_27, table1)

save(table1, table2, file = "data/tables.rdata")
