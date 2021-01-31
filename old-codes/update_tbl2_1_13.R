library(tidyverse)
library(pdftools)

# load utility
source("R/utility.R")

# functions
# remove 1st column
remove_1st_column <- function(chr_vec) {
  chr_vec %>% 
    str_remove("Western Pacific Region") %>% 
    str_remove("South-East Asia Region") %>% 
    str_remove("Region of the Americas") %>% 
    str_remove("European Region") %>% 
    str_remove("Eastern Mediterranean") %>% 
    str_remove("Region") %>% 
    str_remove("Other") %>% 
    str_remove("Region of the") %>% 
    str_remove("Americas") %>% 
    str_remove("Eastern") %>% 
    str_remove("Mediterranean") %>% 
    str_subset("\\w")
}

# read
read_chr_vec7 <- function(chr_vec, skip = 0, expect_col_num = 6) {
  chr_vec %>% 
    `[`((skip + 1):length(chr_vec)) %>% 
    str_split("\\s{3,}") %>% 
    map(remove_1st_column) %>% 
    `[`(map_lgl(., ~ length(.x) == expect_col_num)) %>% 
    bind_cols() %>% 
    t() %>% 
    as_tibble(.name_repair = "minimal")
}


# 6-13
table_add <- vector("list", length = 8)

for (i in 1:8) {
  if (i <= 4) {
    file <- str_c("pdf/sr0", i + 5, ".pdf")
  } else {
    file <- str_c("pdf/sr", i + 5, ".pdf")
  }
  
  # Split into lines
  lines <- pdf_text(file) %>% 
    make_lines()
  
  # Table 1 or 2
  table_start2 <- str_which(lines, "Table \\d. Countries")
  table_end2 <- str_which(lines, "Total Confirmed cases")
  
  lines_table2 <- lines[table_start2:table_end2]
  
  df_table2 <- read_chr_vec7(lines_table2, expect_col_num = 2)
  
  names(df_table2) <- c("area", "cum_conf")
  
  df_table2$cum_conf <- as.numeric(df_table2$cum_conf)

  # add publish_date, remove population
  table_add[[i]] <- df_table2 %>% 
    mutate(publish_date = as.Date("2020-01-25") + i)
}

df_6_13 <- bind_rows(table_add)

unique(df_6_13$area)

df_6_13 <- df_6_13 %>% 
  filter(area != "China")

# check
# NG 6, 8, 9
df_6_13 %>% 
  group_by(publish_date) %>% 
  summarize(total = sum(cum_conf))

miss <- vector("list", length = 3)

# 6
temp <- df_6_13 %>% 
  filter(publish_date == "2020-01-26")

unique(temp$area)

miss[[1]] <- tibble(
  area = c("Viet Nam"),
  cum_conf = c(2),
  publish_date = as.Date("2020-01-26")
)

# 8
temp <- df_6_13 %>% 
  filter(publish_date == "2020-01-28")

unique(temp$area)

miss[[2]] <- tibble(
  area = c("Republic of Korea", "Nepal"),
  cum_conf = c(4, 1),
  publish_date = as.Date("2020-01-28")
)

# 9
temp <- df_6_13 %>% 
  filter(publish_date == "2020-01-29")

unique(temp$area)

miss[[3]] <- tibble(
  area = c("Republic of Korea", "Nepal"),
  cum_conf = c(4, 1),
  publish_date = as.Date("2020-01-29")
)


# add missing
df_6_13 <- bind_rows(df_6_13, miss)

# check, all OK
df_6_13 %>% 
  group_by(publish_date) %>% 
  summarize(total = sum(cum_conf))

df_6_13 <- df_6_13 %>% 
  mutate(area = str_trim(area, side = "both"))
  
unique(df_6_13$area)

df_6_13 <- df_6_13 %>% 
  correct_area()

# 1-5
table_add <- vector("list", length = 5)

# 1
table_add[[1]] <- tibble(
  area = c("Japan", "Republic of Korea", "Thailand"),
  cum_conf = c(1, 1, 2),
  publish_date = as.Date("2020-01-21")
)

# 2
table_add[[2]] <- tibble(
  area = c("Japan", "Republic of Korea", "Thailand"),
  cum_conf = c(1, 1, 2),
  publish_date = as.Date("2020-01-22")
)

# 3
table_add[[3]] <- tibble(
  area = c("Japan", "Republic of Korea", "Thailand",
           "the United States"),
  cum_conf = c(1, 1, 4, 1),
  publish_date = as.Date("2020-01-23")
)

# 4
table_add[[4]] <- tibble(
  area = c("Japan", "Republic of Korea", "Viet Nam",
           "Singapore", "Thailand",
           "the United States"),
  cum_conf = c(1, 2, 2, 1, 4, 1),
  publish_date = as.Date("2020-01-24")
)

# 5
table_add[[5]] <- tibble(
  area = c("Japan", "Republic of Korea", "Viet Nam",
           "Singapore", "Australia", "Thailand",
           "Nepal", 
           "the United States", "France"),
  cum_conf = c(3, 2, 2, 3, 3, 4, 1, 2, 3),
  publish_date = as.Date("2020-01-25")
)

# bind and merge
df_1_5 <- bind_rows(table_add)

df_1_13 <- bind_rows(df_1_5, df_6_13)

# new_conf
df_1_13 <- df_1_13 %>% 
  group_by(area) %>% 
  arrange(publish_date) %>% 
  mutate(
    cum_conf_lag = lag(cum_conf),
    new_conf = cum_conf - cum_conf_lag
  ) %>% 
  ungroup()

df_1_13 <- df_1_13 %>% 
  select(-cum_conf_lag)

df_1_13$cum_deaths <- NA_real_
df_1_13$new_deaths <- NA_real_


# Merge
# load data
load("data/tables.rdata")

table2 <- bind_rows(df_1_13, table2)

save(table1, table2, file = "data/tables.rdata")

