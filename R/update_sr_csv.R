# Libraries
library(tidyverse)
library(rvest)
library(readxl)

# Load old data
load("data/tables.rdata")

# Read csv from url
WHO_COVID_19_global_data <- read_csv("https://covid19.who.int/WHO-COVID-19-global-data.csv",
                        col_types = cols(Date_reported = col_date(format = "%Y-%m-%d")),
                        na = c(""))

table2 <- WHO_COVID_19_global_data %>% 
  select(Date_reported, Country_code, Country, New_cases, Cumulative_cases, New_deaths, Cumulative_deaths)

names(table2) <- c("publish_date", "iso_alpha2", "area", "new_conf", "cum_conf", "new_deaths", "cum_deaths")

# Check sum by comparing with
# https://covid19.who.int/table
table2 %>% 
  filter(publish_date == max(publish_date)) %>% 
  select(cum_conf, new_conf, cum_deaths, new_deaths) %>% 
  map_dbl(sum)

# table1 (China)
df_table1 <- table2 %>% 
  filter(area == "China", publish_date == max(publish_date)) %>% 
  select(-iso_alpha2) %>% 
  rename(region = area)

df_table1[df_table1$region == "China", "region"] <- "Total"

table1 <- bind_rows(table1, df_table1)

table1 <- table1 %>% 
  select(publish_date, region, new_conf, new_deaths, cum_conf, cum_deaths)

# Add info to table2
cc_html <- read_html("https://countrycode.org/")

cc_df <- cc_html %>% 
  html_nodes("table") %>% 
  .[[1]] %>% 
  html_table()

cc_df$POPULATION <- as.numeric(str_remove_all(cc_df$POPULATION, ","))

cc_df <- cc_df %>% 
  mutate(
    iso_alpha2 = str_sub(`ISO CODES`, 1L, 2L)
  )

UNSD_Methodology <- read_excel("data/UNSD-Methodology.xlsx")

cc_df <- cc_df %>% 
  left_join(UNSD_Methodology, by = c("iso_alpha2" = "ISO-alpha2 Code"))

cc_df <- cc_df %>% 
  mutate(
    region = if_else(`Sub-region Name` %in% c("Southern Europe", "Northern Europe", "Western Europe"), "West Europe", 
                     if_else(`Sub-region Name` %in% c("Australia and New Zealand", "Melanesia", "Micronesia", "Polynesia"), "Oceania", `Sub-region Name`)
    )
  )

# Change area name according to countrycode.org
table2 <- table2 %>% 
  left_join(cc_df, by = "iso_alpha2") %>% 
  mutate(COUNTRY = if_else(is.na(COUNTRY), area, COUNTRY)) %>% 
  select(-area) %>% 
  rename(area = COUNTRY)

# Check entry
length(unique(table2$area))

# Save updated data
table1 %>% 
  write.csv("data/table1.csv", row.names = FALSE)

table2 %>% 
  write.csv("data/table2.csv", row.names = FALSE)

save(table1, table2, data_usa, file = "data/tables.rdata")


