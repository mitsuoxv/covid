library(tidyverse)
library(pdftools)

# load data
load("data/tables.rdata")

# Abandon table 1 in sr 25 - 27, due to mistakes
table1 <- table1 %>% 
  filter(publish_date >= "2020-02-17")


# read pdf file
files <- dir("pdf", pattern = "\\.pdf$", full.names = TRUE)

sr_list <- vector("list", length = length(files))

for (i in seq_along(sr_list)) {
  sr_list[[i]] <- pdf_text(files[i])
}

names(sr_list) <- str_sub(files, 10L, 13L)

# Function: correct area names
correct_area <- function(df) {
  df %>% 
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
}


# sr45, table 2
pattern <- "^\\s*([a-zA-z]+\\s)*\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+"

# read character vector into a data frame
read_chr_vec3 <- function(chr_vec, pattern) {
  temp <- chr_vec %>% 
    str_subset(pattern) %>% 
    str_match(pattern) %>% 
    as_tibble(.name_repair = "minimal") %>% 
    `[`(c(1, 3:6))
  
  df_no_name <- bind_cols(temp[1],
                          map_dfr(temp[-1], as.numeric))
  
  names(df_no_name) <- c("area", "cum_conf",
                         "new_conf", "cum_deaths", "new_deaths")
  
  df_no_name %>%
    mutate(area = area %>% 
             str_sub(1L, 20L) %>% 
             str_trim(side = "both"))
}

# sr_list[[i]] into lines
make_lines <- function(a_list) {
  a_list %>% 
    str_remove_all("§") %>% 
    str_remove_all("‡") %>% 
    str_remove_all("\\*") %>% 
    str_remove_all("\\^") %>% 
    str_split("\r\n") %>% 
    unlist()
}


# sr 45
lines <- sr_list[[45]]  %>% 
  make_lines()

table_start2 <- str_which(lines, "^Table 2.")
table_end2 <- str_which(lines, "Grand total")

lines_table2 <- lines[table_start2:table_end2]

df_table2 <- read_chr_vec3(lines_table2, pattern = pattern)

tail(df_table2)

# 1 missing, "é" is not [a-zA-Z]
# Saint Barthélemy
df_table2 %>% 
  summarize(total = sum(cum_conf))

pattern2 <- "^\\s*([a-zA-z]+[^a-zA-z])*\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+"

df_table2 <- read_chr_vec3(lines_table2, pattern = pattern2)

# 14768 match!
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
df_table2[(df_table2$area == ""), ]

df_table2[(df_table2$area == ""), "area"] <- 
  c("Bosnia and Herzegovina",
    "Iran (Islamic Republic of)",
    "United Arab Emirates",
    "occupied Palestinian territory")

unique(df_table2$area)

df_table2 <- df_table2 %>% 
  select(area, new_conf, new_deaths, cum_conf, cum_deaths) %>% 
  mutate(publish_date = as.Date("2020-03-05"))

table2 <- bind_rows(table2, df_table2)

# save
save(table1, table2, file = "data/tables.rdata")
