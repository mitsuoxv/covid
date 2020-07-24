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

conf_raw <- conf_raw %>% 
  drop_na(countyFIPS)

conf_total <- conf_raw %>% 
  gather(key = "publish_date", value = "cum_conf", -c(1:4)) %>% 
  mutate(publish_date = as.Date(publish_date, "%m/%d/%y")) %>% 
  group_by(publish_date) %>% 
  summarize(cum_conf = sum(cum_conf), .groups = "drop_last") %>% 
  mutate(
    cum_conf_lag = lag(cum_conf),
    new_conf = cum_conf - cum_conf_lag
  ) %>% 
  select(-cum_conf_lag) %>% 
  mutate(State = "Total")

conf_by_state <- conf_raw %>% 
  gather(key = "publish_date", value = "cum_conf", -c(1:4)) %>% 
  mutate(publish_date = as.Date(publish_date, "%m/%d/%y")) %>% 
  group_by(State, publish_date) %>% 
  summarize(cum_conf = sum(cum_conf), .groups = "drop_last") %>% 
  mutate(
    cum_conf_lag = lag(cum_conf),
    new_conf = cum_conf - cum_conf_lag
  ) %>% 
  select(-cum_conf_lag)

conf <- bind_rows(conf_total, conf_by_state) %>% 
  filter(!is.na(publish_date))

# Check sum
# close enough
conf %>% 
  filter(State == "Total", publish_date == max(publish_date))

conf %>% 
  filter(State != "Total", publish_date == max(publish_date)) %>% 
  summarize(cum_conf = sum(cum_conf))

# Read deaths
deaths_raw <- read_csv("https://usafactsstatic.blob.core.windows.net/public/data/covid-19/covid_deaths_usafacts.csv")

# names(deaths_raw)

deaths_total <- deaths_raw %>% 
  gather(key = "publish_date", value = "cum_deaths", -c(1:4)) %>% 
  mutate(publish_date = as.Date(publish_date, "%m/%d/%y")) %>% 
  group_by(publish_date) %>% 
  summarize(cum_deaths = sum(cum_deaths), .groups = "drop_last") %>% 
  mutate(
    cum_deaths_lag = lag(cum_deaths),
    new_deaths = cum_deaths - cum_deaths_lag
  ) %>% 
  select(-cum_deaths_lag) %>% 
  mutate(State = "Total")

deaths_by_state <- deaths_raw %>% 
  gather(key = "publish_date", value = "cum_deaths", -c(1:4)) %>% 
  mutate(publish_date = as.Date(publish_date, "%m/%d/%y")) %>% 
  group_by(State, publish_date) %>% 
  summarize(cum_deaths = sum(cum_deaths), .groups = "drop_last") %>% 
  mutate(
    cum_deaths_lag = lag(cum_deaths),
    new_deaths = cum_deaths - cum_deaths_lag
  ) %>% 
  select(-cum_deaths_lag)

deaths <- bind_rows(deaths_total, deaths_by_state) %>% 
  filter(!is.na(publish_date))

# Check sum
# match
deaths %>% 
  filter(State == "Total", publish_date == max(publish_date))

deaths %>% 
  filter(State != "Total", publish_date == max(publish_date)) %>% 
  summarize(cum_deaths = sum(cum_deaths))

# Bind
data_usa <- left_join(conf, deaths, by = c("State", "publish_date"))

# Add state name column
states <- 
  bind_rows(
    tibble(
      State = state.abb,
      state_name = state.name
    ),
    tibble(
      State = c("DC", "Total"),
      state_name = c("District of Columbia", "Total")
    )
  )

data_usa <- data_usa %>% 
  left_join(states, by = "State")

# Save updated data
save(table1, table2, area_cat, data_usa, file = "data/tables.rdata")


