library(tidyverse)
library(pdftools)

# functions
# read character vector into a data frame, split by >= 3 spaces
read_chr_vec <- function(chr_vec, skip, expect_col_num,
                         column_chr = c(1)) {
  df_no_name <- chr_vec %>% 
    str_split("\\s{3,}") %>% 
    `[`((skip + 1):length(chr_vec)) %>% 
    `[`(map_lgl(., ~ length(.x) == expect_col_num)) %>% 
    bind_cols() %>% 
    t() %>% 
    as_tibble(.name_repair = "minimal")
  
  bind_cols(map_dfr(df_no_name[, column_chr], ~ str_trim(.x, side = "left")),
                  map_dfr(df_no_name[, -column_chr], as.numeric))
}

# read character vector into a data frame, for Table 1 in sr25-27
read_chr_vec2 <- function(chr_vec) {
  temp <- chr_vec %>% 
    str_subset("^\\s*([a-zA-z]+\\s)*\\s+(\\d+)") %>% 
    str_replace_all("-", "0") %>% 
    str_match("^\\s*([a-zA-z]+\\s)*\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)") %>% 
    as_tibble(.name_repair = "minimal") %>% 
    `[`(c(1, 3, 6:8, 11:12))
  
  df_no_name <- bind_cols(temp[1],
                         map_dfr(temp[-1], as.numeric))
  
  names(df_no_name) <- c("region", "pop_10k",
                        "new_conf", "new_susp", "new_deaths",
                        "cum_conf", "cum_deaths")
  
  df_no_name %>%
    mutate(region = region %>% 
             str_sub(1L, 20L) %>% 
             str_trim(side = "both"))
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

# sr_list[[i]] into lines
make_lines <- function(a_list) {
  a_list %>% 
#    str_replace_all("Iran \\(Islamic\r\n", "Iran \\(Islamic Republic of\\)") %>% 
#    str_replace_all("United Arab\r\n", "United Arab Emirates") %>% 
#    str_replace_all("International\r\n", "International") %>% 
#    str_replace_all("United\r\n", "United Kingdom") %>% 
    str_remove_all("§") %>% 
    str_remove_all("‡") %>% 
    str_remove_all("\\*") %>% 
    str_remove_all("\\^") %>% 
    str_split("\r\n") %>% 
    unlist()
}



# read pdf files into a list of character vectors
files <- dir("pdf", pattern = "\\.pdf$", full.names = TRUE)

sr_list <- vector("list", length = length(files))

for (i in seq_along(sr_list)) {
  sr_list[[i]] <- pdf_text(files[i])
}

names(sr_list) <- str_sub(files, 10L, 13L)

# Prepare a data frame to put tables
sr_df <- tibble(
  sr = seq_along(sr_list),
  table1 = vector("list", length = length(sr_list)),
  table2 = vector("list", length = length(sr_list))
)

sr_df <- sr_df %>% 
  mutate(publish_date = as.Date("2020-01-20") + sr)

# Table 1
# Read 28 - 
for (i in 28:45) {
  lines <- sr_list[[i]]  %>% 
    make_lines()
  
  table_start <- str_which(lines, "^Table 1. Confirmed")

  lines_table1 <- lines[table_start:(table_start + 42)]
  
  df_table1 <- read_chr_vec(lines_table1, skip = 8, expect_col_num = 7,
                            column_chr = c(1))
  
  names(df_table1) <- c("region", "pop_10k",
                        "new_conf", "new_susp", "new_deaths",
                        "cum_conf", "cum_deaths")
  
  sr_df$table1[[i]] <- df_table1 %>% 
    select(region, new_conf, new_deaths, cum_conf, cum_deaths)
}

# Read 25 - 27
# Mistakes!! Don't use the data
# Written space instead of comma, like 15 384
for (i in 25:27) {
  lines <- sr_list[[i]]  %>% 
    make_lines()
  
  table_start <- str_which(lines, "^Table 1. Confirmed")

  lines_table1 <- lines[table_start:(table_start + 41)]
  
  df_table1 <- read_chr_vec2(lines_table1)
  
  sr_df$table1[[i]] <- df_table1 %>% 
    select(region, new_conf, new_deaths, cum_conf, cum_deaths)
}

# Cleaning
table1 <- sr_df %>% 
  filter(sr >= 25) %>% 
  unnest(table1) %>% 
  select(-sr, -table2)

unique(table1$region)

table1 <- table1 %>% 
  mutate(region = if_else(region == "Totals",
                          "Total", region),
         region = if_else(region == "Hong Kong Sar",
                          "Hong Kong SAR", region),
         region = if_else(region == "Macao Sar",
                          "Macao SAR", region)
         )

# Table 1 completed
table1 %>% 
  filter(region %in% c("Hubei", "Total")) %>% 
  ggplot(aes(publish_date, new_conf, color = region)) +
  geom_line()

table1 %>% 
  filter(region == "Beijing") %>% 
  ggplot(aes(publish_date, new_conf)) +
  geom_line()

table1 %>% 
  filter(region == "Shanghai") %>% 
  ggplot(aes(publish_date, new_conf)) +
  geom_line()


# Table 2
# Read 42 - 44
for (i in 42:44) {
  lines <- sr_list[[i]]  %>% 
    make_lines()
  
  table_start2 <- str_which(lines, "^Table 2.")
  table_end2 <- str_which(lines, "Grand total")
  
  lines_table2 <- lines[table_start2:table_end2]
  
  df_table2 <- read_chr_vec(lines_table2, skip = 8, expect_col_num = 7,
                            column_chr = c(1, 6))
  
  names(df_table2) <- c("area", "transmission", "cum_conf",
                    "new_conf", "cum_deaths", "new_deaths",
                    "days_no_new_conf")
  
  sr_df$table2[[i]] <- df_table2 %>% 
    select(area, new_conf, new_deaths, cum_conf, cum_deaths)
}

df_table2 %>% tail()

# Read 39 - 41
for (i in 39:41) {
  lines <- sr_list[[i]] %>% 
    make_lines()
  
  table_start2 <- str_which(lines, "^Table 2.")
  table_end2 <- str_which(lines, "Grand total")
  
  lines_table2 <- lines[table_start2:table_end2]
  
  df_table2 <- read_chr_vec(lines_table2, skip = 6, expect_col_num = 5,
                            column_chr = 1:5)
  
  df_table2 <- df_table2[, 1:3]
  
  df_table2 <- separate_cols(df_table2)
  
  sr_df$table2[[i]] <- df_table2 %>% 
    select(area, new_conf, new_deaths, cum_conf, cum_deaths)
}

# check
sr_df$table2[[39]] %>% 
  summarize(total = sum(new_conf))

tail(sr_df$table2[[39]])

sr_df$table2[[39]] <- 
  sr_df$table2[[39]] %>% 
  bind_rows(
    tibble(
      area = "International conveyance",
      new_conf = 0,
      new_deaths = 0,
      cum_conf = 705,
      cum_deaths = 4
    )
  )

# Read 32 - 38
for (i in 32:38) {
  lines <- sr_list[[i]] %>% 
    make_lines()
  
  table_start2 <- str_which(lines, "^\\s*Table 2.")
  table_end2 <- str_which(lines, "Grand total")
  
  lines_table2 <- lines[table_start2:table_end2]
  
  df_table2 <- read_chr_vec(lines_table2, skip = 13, expect_col_num = 7,
                            column_chr = 1:7)
  
  df_table2 <- df_table2[, c(1:2, 7)]
  
  df_table2 <- separate_cols(df_table2)
  
  sr_df$table2[[i]] <- df_table2 %>% 
    select(area, new_conf, new_deaths, cum_conf, cum_deaths)
}

# Read 31
for (i in 31) {
  lines <- sr_list[[i]] %>% 
    make_lines()
  
  table_start2 <- str_which(lines, "^\\s*Table 2.")
  table_end2 <- str_which(lines, "Diamond Princes")
  
  lines_table2 <- lines[table_start2:table_end2]
  
  df_table2 <- read_chr_vec(lines_table2, skip = 13, expect_col_num = 7,
                            column_chr = 1:7)
  
  df_table2 <- df_table2[, c(1:2, 7)]
  
  df_table2 <- separate_cols(df_table2)
  
  sr_df$table2[[i]] <- df_table2 %>% 
    select(area, new_conf, new_deaths, cum_conf, cum_deaths)
}

# Read 30
for (i in 30) {
  lines <- sr_list[[i]] %>% 
    make_lines()
  
  table_start2 <- str_which(lines, "^\\s*Table 2.")
  table_end2 <- str_which(lines, "Diamond Princes")
  
  lines_table2 <- lines[table_start2:table_end2]
  
  df_table2 <- read_chr_vec(lines_table2, skip = 11, expect_col_num = 7,
                            column_chr = 1:7)
  
  df_table2 <- df_table2[, c(1:2, 7)]
  
  df_table2 <- separate_cols(df_table2)
  
  sr_df$table2[[i]] <- df_table2 %>% 
    select(area, new_conf, new_deaths, cum_conf, cum_deaths)
}

# Cleaning
table2 <- sr_df %>% 
  filter(sr >= 30) %>% 
  unnest(table2) %>% 
  select(-sr, -table1)

unique(table2$area)

table2 <- table2 %>% 
  mutate(area = if_else(area == "United States of",
                        "the United States", area),
         area = if_else(area == "United States of",
                        "the United States", area),
         area = if_else(area == "America",
                        "the United States", area),
         area = if_else(area == "United States of America",
                        "the United States", area),
         
         area = if_else(area == "The United",
                        "the United Kingdom", area),
         area = if_else(area == "The United Kingdom",
                        "the United Kingdom", area),
         area = if_else(area == "Kingdom",
                        "the United Kingdom", area),
         
         area = if_else(area == "United Arab",
                        "United Arab Emirates", area),
         
         area = if_else(area == "International",
                        "International conveyance", area),
         area = if_else(area == "conveyance",
                        "International conveyance", area),
         area = if_else(area == "conveyance (Diamond",
                        "International conveyance", area),
         area = if_else(area == "Princess)",
                        "International conveyance", area)
         
  )

table2 %>% 
  filter(area == "Italy") %>% 
  ggplot(aes(publish_date, new_conf)) +
  geom_line()

table2 %>% 
  filter(area == "Japan") %>% 
  ggplot(aes(publish_date, new_conf)) +
  geom_line()

table2 %>% 
  filter(area == "International conveyance") %>% 
  ggplot(aes(publish_date, new_conf)) +
  geom_line()

table2 %>% 
  filter(area == "")

table2[(table2$area == "" &
          table2$cum_conf > 500 &
          table2$publish_date >= "2020-03-02"), "area"] <- "Iran (Islamic Republic of)"

table2[(table2$area == "" &
          table2$cum_conf > 500), "area"] <- "International conveyance"

table2[(table2$area == "" &
          table2$cum_conf > 50), "area"] <- "the United Kingdom"

table2[(table2$area == "" &
          table2$cum_conf > 20), "area"] <- "United Arab Emirates"

table2[(table2$area == "" &
          table2$cum_conf > 10), "area"] <- "the United States"

table2 %>% 
  filter(area == "the United Kingdom", publish_date == "2020-02-20")

table2[(table2$area == "" &
          table2$cum_conf == 9), "area"] <- "United Arab Emirates"

table2[(table2$area == "" &
          table2$cum_conf == 2 &
          table2$publish_date == "2020-02-20"), "area"] <- "Iran (Islamic Republic of)"

# table2[(table2$area == "" &
#           table2$cum_conf == 2 &
#           table2$publish_date == "2020-03-05"), "area"] <- "Bosnia and Herzegovina"

table2 <- table2 %>% 
  filter(!(area %in% c("Subtotal for all regions", "Grand total")))

# check total
table2 %>% 
  group_by(publish_date) %>% 
  summarize(total = sum(cum_conf))

# problem in sr45, delete sr45
# table2 <- table2 %>% 
#   filter(publish_date < "2020-03-05")

# save
# load("data/tables.rdata")
save(table1, table2, file = "data/tables.rdata")
