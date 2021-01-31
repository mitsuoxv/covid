library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# functions
# read
read_chr_vec5 <- function(chr_vec, pattern) {
  temp <- chr_vec %>% 
    str_subset(pattern) %>% 
    str_match(pattern) %>% 
    as_tibble(.name_repair = "minimal") %>% 
    `[`(c(1, 3:4))
  
  df_no_name <- bind_cols(temp[1],
                          map_dfr(temp[-1], make_numeric))
  
  names(df_no_name) <- c("region", "pop_10k",
                         "cum_conf")
  
  df_no_name %>%
    mutate(region = region %>% 
             str_sub(1L, 20L) %>% 
             str_trim(side = "both"))
}

#
read_chr_vec6 <- function(chr_vec, pattern) {
  temp <- chr_vec %>% 
    str_subset(pattern) %>% 
    str_match(pattern) %>% 
    as_tibble(.name_repair = "minimal") %>% 
    `[`(c(1, 3))
  
  df_no_name <- bind_cols(temp[1],
                          map_dfr(temp[-1], make_numeric))
  
  names(df_no_name) <- c("region", "cum_conf")
  
  df_no_name %>%
    mutate(region = region %>% 
             str_sub(1L, 20L) %>% 
             str_trim(side = "both"))
}


# 12-24
table_add <- vector("list", length = 13)

# 24
# Split into lines
lines <- pdf_text("pdf/sr24.pdf") %>% 
  make_lines()

# Table 1 or 2
table_start <- str_which(lines, "^Table 2. Confirmed")

lines_table1 <- lines[table_start:(table_start + 37)]

pattern <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)"
  
df_table1 <- read_chr_vec5(lines_table1, pattern = pattern)

tail(df_table1)
  
unique(df_table1$region)
  
df_table1 <- df_table1 %>% 
  correct_region()

# 46550 match!
df_table1 %>% 
  filter(region != "Total") %>% 
  summarize(total = sum(cum_conf))

tail(df_table1)

# add publish_date, remove population
table_add[[13]] <- df_table1 %>% 
  mutate(publish_date = as.Date("2020-02-13")) %>% 
  select(-pop_10k)


# 23
# Split into lines
lines <- pdf_text("pdf/sr23.pdf") %>% 
  make_lines()

# Table 1
table_start <- str_which(lines, "^Table 1. Confirmed")

lines_table1 <- lines[table_start:(table_start + 39)]

pattern <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+\\s?\\d*)\\s+(\\d+\\s?\\d*)"

df_table1 <- read_chr_vec5(lines_table1, pattern = pattern)

tail(df_table1)

unique(df_table1$region)

df_table1 <- df_table1 %>% 
  correct_region()

# 44730 match!
df_table1 %>% 
  filter(region != "Total") %>% 
  summarize(total = sum(cum_conf))

tail(df_table1)

# add publish_date, remove population
table_add[[12]] <- df_table1 %>% 
  mutate(publish_date = as.Date("2020-02-12")) %>% 
  select(-pop_10k)


# 12-22
for (i in 1:11) {
  file <- str_c("pdf/sr", i + 11, ".pdf")
  
  # Split into lines
  lines <- pdf_text(file) %>% 
    make_lines()
  
  table_start <- str_which(lines, "Confirmed cases of 2019-nCoV")
  
  lines_table1 <- lines[(table_start + 2):(table_start + 39)]
  
  pattern <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+\\s?\\d*)"
  
  df_table1 <- read_chr_vec6(lines_table1, pattern = pattern)
  
  df_table1 <- df_table1 %>% 
    correct_region()

  # add publish_date, remove population
  table_add[[i]] <- df_table1 %>% 
    mutate(publish_date = as.Date("2020-01-31") + i)
}

df_12_24 <- bind_rows(table_add)

# check sum
df_12_24 %>% 
  filter(region != "Total") %>% 
  group_by(publish_date) %>% 
  summarize(total = sum(cum_conf))

df_12_24 %>% 
  filter(region == "Total")

# 14-15 doubled
df_12_24[df_12_24$region == "", ]

df_12_24[df_12_24$region == "", "region"] <- "Total"



# 1-11
df_1_11 <- 
  tibble(
    region = "Total",
    cum_conf = c(278, 309, 571, 830, 1297, 1985, 2761, 4537, 5997, 7736, 9720)
  )

df_1_11$publish_date <- as.Date("2020-01-20") + 1:11

max(df_1_11$publish_date)
min(df_12_24$publish_date)

df_1_24 <- bind_rows(df_1_11, df_12_24)

# new_conf
df_1_24a <- df_1_24 %>% 
  group_by(region) %>% 
  arrange(publish_date) %>% 
  mutate(
    cum_conf_lag = lag(cum_conf),
    new_conf = cum_conf - cum_conf_lag
  ) %>% 
  ungroup()

df_1_24a %>% 
  filter(region == "Total") %>% 
  ggplot(aes(publish_date, new_conf)) +
  geom_line()

#
df_1_24a <- df_1_24a %>% 
  select(-cum_conf_lag)

df_1_24a$cum_deaths <- NA_real_
df_1_24a$new_deaths <- NA_real_


# Merge
# load data
load("data/tables.rdata")

table1 <- bind_rows(df_1_24a, table1)

save(table1, table2, file = "data/tables.rdata")

