# Libraries
library(tidyverse)
library(rvest)
library(httr)

# Functions
read_url <- function(url) {
  tf <- tempfile(fileext = ".csv")
  
  GET(url, write_disk(tf))
  
  read_csv(tf)
}

# Load old data
load("data/tables.rdata")

# https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/
# Read confirmed cases
conf_raw <- read_url("https://usafactsstatic.blob.core.windows.net/public/data/covid-19/covid_confirmed_usafacts.csv")

names(conf_raw) <- str_replace(names(conf_raw), "200", "")

conf <- conf_raw %>% 
  gather(key = "publish_date", value = "cum_conf", -c(1:4)) %>% 
  mutate(publish_date = as.Date(publish_date, "%m/%d/%y")) %>% 
  group_by(State, publish_date) %>% 
  summarize(cum_conf = sum(cum_conf)) %>% 
  mutate(
    cum_conf_lag = lag(cum_conf),
    new_conf = cum_conf - cum_conf_lag
  ) %>% 
  ungroup() %>% 
  select(-cum_conf_lag)

# Check sum
# close enough
conf %>% 
  filter(publish_date == max(publish_date)) %>% 
  summarize(cum_conf = sum(cum_conf))

# Read deaths
deaths_raw <- read_csv("https://usafactsstatic.blob.core.windows.net/public/data/covid-19/covid_deaths_usafacts.csv")

# names(deaths_raw)

deaths <- deaths_raw %>% 
  gather(key = "publish_date", value = "cum_deaths", -c(1:4)) %>% 
  mutate(publish_date = as.Date(publish_date, "%m/%d/%y")) %>% 
  group_by(State, publish_date) %>% 
  summarize(cum_deaths = sum(cum_deaths)) %>% 
  mutate(
    cum_deaths_lag = lag(cum_deaths),
    new_deaths = cum_deaths - cum_deaths_lag
  ) %>% 
  ungroup() %>% 
  select(-cum_deaths_lag)

# Check sum
# match
deaths %>% 
  filter(publish_date == max(publish_date)) %>% 
  summarize(cum_deaths = sum(cum_deaths))

# Bind
data_usa <- left_join(conf, deaths, by = c("State", "publish_date"))

# states
states <- 
  bind_rows(
  tibble(
    State = state.abb,
    state_name = state.name
  ),
  tibble(
    State = "DC",
    state_name = "District of Columbia"
  )
)

gov_html <- read_html("https://en.wikipedia.org/wiki/List_of_United_States_governors")

gov_df <- gov_html %>% 
  html_nodes("table") %>% 
  .[[1]] %>% 
  html_table(fill = TRUE)

gov_df <- gov_df[-1, c(1, 5)]

names(gov_df) <- c("state_name", "party")

gov_df <- gov_df %>% 
  mutate(party = str_sub(party, 1L, 10L))

dc_df <- gov_html %>% 
  html_nodes("table") %>% 
  .[[3]] %>% 
  html_table(fill = TRUE)

dc_df <- dc_df[-1, c(1, 5)]

names(dc_df) <- c("state_name", "party")

gov_dc_df <- bind_rows(gov_df, dc_df)

states <- states %>% 
  left_join(gov_dc_df, by = "state_name")

# data_usa with govornors
data_usa <- data_usa %>% 
  left_join(states, by = "State")

# Save updated data
save(table1, table2, area_cat, data_usa, file = "data/tables.rdata")


