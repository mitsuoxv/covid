Japan, Covid-19 situation by prefecture
================
Mitsuo Shiota
2021-03-31

-   [Summary](#summary)
-   [Read data from NHK site](#read-data-from-nhk-site)
-   [Add population column](#add-population-column)
-   [Fastest spreading prefecutures in the last 14
    days](#fastest-spreading-prefecutures-in-the-last-14-days)
-   [Highest fatality rate
    prefectures](#highest-fatality-rate-prefectures)
-   [Highest deaths per population
    prefectures](#highest-deaths-per-population-prefectures)

Updated: 2021-04-16

## Summary

I added Japan page to [my Shiny
App](https://mitsuoxv.shinyapps.io/covid/) on March 31, 2021. I use data
of 47 prefectures from [NHK
site](https://www3.nhk.or.jp/news/special/coronavirus/data/).

## Read data from NHK site

``` r
data_raw <- read_csv("https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv")
names(data_raw) <- c("publish_date", "code", "prefecture",
                     "new_conf", "cum_conf", "new_deaths", "cum_deaths")

data_japan <- data_raw %>% 
  mutate(publish_date = ymd(publish_date))
```

## Add population column

I download population by prefecture data from [e-stat
page](https://www.e-stat.go.jp/stat-search/database?page=1&layout=datalist&toukei=00200524&bunya_l=02&tstat=000000090001&cycle=0&tclass1=000001136886&statdisp_id=0003412316&tclass2val=0).
The data are estimated as of October 1, 2019.

    ## Reading layer `jpn' from data source `/home/mitsuoxv/R/x86_64-pc-linux-gnu-library/4.0/NipponMap/shapes/jpn.shp' using driver `ESRI Shapefile'
    ## Simple feature collection with 47 features and 5 fields
    ## Geometry type: POLYGON
    ## Dimension:     XY
    ## Bounding box:  xmin: 127.6461 ymin: 26.0709 xmax: 148.8678 ymax: 45.5331
    ## CRS:           NA

## Fastest spreading prefecutures in the last 14 days

Highest “increase\_in\_14\_days”, which is an increase in cumulative
confirmed cases in the last 14 days, are:

![](Japan_files/figure-gfm/spreading-1.png)<!-- -->

Above calculation might be unfair to populous prefectures. Highest
“increase\_std\_in\_14\_days”, which is an increase in cumulative
confirmed cases in the last 14 days per 1 million population, are:

![](Japan_files/figure-gfm/standardized-1.png)<!-- -->

## Highest fatality rate prefectures

Among prefectures with more than 10 cumulative deaths, highest
“fatality\_rate”, which is cumulative deaths per 100 cumulative
confirmed cases, are:

![](Japan_files/figure-gfm/fatality_rates-1.png)<!-- -->

## Highest deaths per population prefectures

Highest “deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

![](Japan_files/figure-gfm/deaths_per_population-1.png)<!-- -->

EOL
