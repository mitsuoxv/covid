Japan, Covid-19 situation by prefecture
================
Mitsuo Shiota
2021-03-31

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-nhk-site" id="toc-read-data-from-nhk-site">Read
    data from NHK site</a>
-   <a href="#add-population-column" id="toc-add-population-column">Add
    population column</a>
-   <a href="#fastest-spreading-prefecutures-in-the-last-14-days"
    id="toc-fastest-spreading-prefecutures-in-the-last-14-days">Fastest
    spreading prefecutures in the last 14 days</a>
-   <a href="#highest-fatality-rate-prefectures"
    id="toc-highest-fatality-rate-prefectures">Highest fatality rate
    prefectures</a>
-   <a href="#highest-deaths-per-population-prefectures"
    id="toc-highest-deaths-per-population-prefectures">Highest deaths per
    population prefectures</a>

Updated: 2022-07-30

## Summary

I added Japan page to [my Shiny
App](https://mitsuoxv.shinyapps.io/covid/) on March 31, 2021. I use data
of 47 prefectures from [NHK
site](https://www3.nhk.or.jp/news/special/coronavirus/data/).

## Read data from NHK site

``` r
data_japan <- read_csv("https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv") %>% 
  setNames(c("publish_date", "code", "prefecture",
             "new_conf", "cum_conf", "new_deaths", "cum_deaths", "dummy")) %>% 
  select(-dummy) %>% 
  mutate(publish_date = ymd(publish_date))
```

## Add population column

I download population by prefecture data from [the Statistics Bureau,
Ministry of Internal Affairs and
Communications](https://www.stat.go.jp/data/nihon/02.htm). The data are
estimated as of October 1, 2020.

## Fastest spreading prefecutures in the last 14 days

Highest “increase_in_14_days”, which is an increase in cumulative
confirmed cases in the last 14 days, are:

![](Japan_files/figure-gfm/spreading-1.png)<!-- -->

Above calculation might be unfair to populous prefectures. Highest
“increase_std_in_14_days”, which is an increase in cumulative confirmed
cases in the last 14 days per 1 million population, are:

![](Japan_files/figure-gfm/standardized-1.png)<!-- -->

## Highest fatality rate prefectures

Among prefectures with more than 10 cumulative deaths, highest
“fatality_rate”, which is cumulative deaths per 100 cumulative confirmed
cases, are:

![](Japan_files/figure-gfm/fatality_rates-1.png)<!-- -->

## Highest deaths per population prefectures

Highest “deaths_per_1m”, which is cumulative deaths per 1 million
population, are:

![](Japan_files/figure-gfm/deaths_per_population-1.png)<!-- -->

EOL
