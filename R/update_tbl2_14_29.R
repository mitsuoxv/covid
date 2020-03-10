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

# separate (new)
separate_cols <- function(df) {
  names(df) <- c("area", "conf", "deaths")
  
  temp <- df %>% 
    separate(conf, into = c("cum_conf", "new_conf"), sep = "\\s\\(") %>% 
    separate(deaths, into = c("cum_deaths", "new_deaths"), sep = "\\s\\(") %>% 
    mutate(new_conf = str_remove(new_conf, "\\)")) %>% 
    mutate(new_deaths = str_remove(new_deaths, "\\)"))
  
  temp2 <- temp %>% 
    select(-area) %>% 
    map_dfr(as.numeric)
  
  bind_cols(temp[1], temp2)
}

# 14-29
table_add <- vector("list", length = 16)

for (i in 1:16) {
  file <- str_c("pdf/sr", i + 13, ".pdf")
  
  # Split into lines
  lines <- pdf_text(file) %>% 
    make_lines() %>% 
    str_remove_all("†") 
  
  # Table 1 or 2
  table_start2 <- str_which(lines, "Table \\d. Countries")
  table_end2 <- str_which(lines, "Case\\s+classifications are based")
  
  lines_table2 <- lines[table_start2:table_end2] %>% 
    str_remove("‡‡")
  
  temp <- read_chr_vec7(lines_table2, expect_col_num = 6)
  
  temp2 <- temp[, c(1:2, 6)]
  
  df_table2 <- separate_cols(temp2) %>% 
    replace_na(list(new_conf = 0, new_deaths = 0))
  
  # add publish_date, remove population
  table_add[[i]] <- df_table2 %>% 
    mutate(publish_date = as.Date("2020-02-02") + i)
}

df_14_29 <- bind_rows(table_add)

# check
# NG 15, 16, 17, 25, 26, 27, 28
df_14_29 %>% 
  group_by(publish_date) %>% 
  summarize(total = sum(cum_conf))

miss <- vector("list", length = 7)

# 15
miss[[1]] <- tibble(
  area = c("the United States", "United Arab Emirates"),
  cum_conf = c(11, 5),
  new_conf = c(0, 0),
  cum_deaths = c(0, 0),
  new_deaths = c(0, 0),
  publish_date = as.Date("2020-02-04")
)

# 16
miss[[2]] <- tibble(
  area = c("the United States"),
  cum_conf = c(11),
  new_conf = c(0),
  cum_deaths = c(0),
  new_deaths = c(0),
  publish_date = as.Date("2020-02-05")
)

# 17
temp <- df_14_29 %>% 
  filter(publish_date == "2020-02-06")

unique(temp$area)

miss[[3]] <- tibble(
  area = c("the United States", "Spain", "United Arab Emirates", "International conveyance"),
  cum_conf = c(12, 1, 5, 20),
  new_conf = c(1, 0, 0, 10),
  cum_deaths = c(0, 0, 0, 0),
  new_deaths = c(0, 0, 0, 0),
  publish_date = as.Date("2020-02-06")
)

# 25
temp <- df_14_29 %>% 
  filter(publish_date == "2020-02-14")

unique(temp$area)

miss[[4]] <- tibble(
  area = c("Republic of Korea", "Malyasia", "Spain"),
  cum_conf = c(28, 19, 2),
  new_conf = c(0, 1, 0),
  cum_deaths = c(0, 0, 0),
  new_deaths = c(0, 0, 0),
  publish_date = as.Date("2020-02-14")
)

# 26
temp <- df_14_29 %>% 
  filter(publish_date == "2020-02-15")

unique(temp$area)

miss[[5]] <- tibble(
  area = c("Republic of Korea", "Malyasia", "Spain"),
  cum_conf = c(28, 21, 2),
  new_conf = c(0, 2, 0),
  cum_deaths = c(0, 0, 0),
  new_deaths = c(0, 0, 0),
  publish_date = as.Date("2020-02-15")
)

# 26
temp <- df_14_29 %>% 
  filter(publish_date == "2020-02-16")

unique(temp$area)

miss[[6]] <- tibble(
  area = c("Republic of Korea", "Malyasia", "Spain"),
  cum_conf = c(29, 22, 2),
  new_conf = c(1, 1, 0),
  cum_deaths = c(0, 0, 0),
  new_deaths = c(0, 0, 0),
  publish_date = as.Date("2020-02-16")
)

# 27
temp <- df_14_29 %>% 
  filter(publish_date == "2020-02-17")

unique(temp$area)

miss[[7]] <- tibble(
  area = c("Republic of Korea", "Malyasia", "Spain"),
  cum_conf = c(30, 22, 2),
  new_conf = c(1, 0, 0),
  cum_deaths = c(0, 0, 0),
  new_deaths = c(0, 0, 0),
  publish_date = as.Date("2020-02-17")
)

# add missing
df_new <- bind_rows(df_14_29, miss)

# check, all OK
df_new %>% 
  group_by(publish_date) %>% 
  summarize(total = sum(cum_conf))

df_new <- df_new %>% 
  mutate(area = str_trim(area, side = "both"))
  
unique(df_new$area)

df_new <- df_new %>% 
  correct_area()

df_new <- df_new %>% 
  mutate(
    area = if_else(area == "Western Pacific Japan",
                   "Japan", area)
  )

#

# Merge
# load data
load("data/tables.rdata")

table2 <- bind_rows(df_new, table2)

save(table1, table2, file = "data/tables.rdata")

