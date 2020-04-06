WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-07

## Summary

<https://mitsuoxv.shinyapps.io/covid/>

Coronavirus is affecting the world economy. Uncertaintiy is very high. I
searched around and found some informative sites, like [Coronavirus
Situation
Dashboard](https://who.maps.arcgis.com/apps/opsdashboard/index.html#/c88e37cfc43b4ed3baf977d77e4a0667)
and [Coronavirus Update by
worldometer](https://www.worldometers.info/coronavirus/). But they fail
to offer time-series data of the newly confirmed cases by each area, in
which I am most interested. If the average number of infections one
infected person inflict is even slightly more than one, infections grow
exponentially. If less than one, the newly confirmed cases begin to
decrease, and the virus will be contained eventually in that area.

WHO offers those numbers in [the situation
reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/),
which are unfortunately pdf files.

So I scratched numbers from pdf files, scratched my head learning
regular expressions, and made the shiny app above. I would like to
update frequently, but I am not sure. The ugly codes I wrote are in R
directory. Data in Table 1 (In China) and Table 2 (World including
China) in the situation reports are in table1.csv, table2.csv and
tables.rdata in data directory.

Note that the confirmed cases are not the actual cases, due to delays
from infection to symptoms, limited testing capacity, and so on, as
[Nate Silver tells
us](https://fivethirtyeight.com/features/coronavirus-case-counts-are-meaningless/).

## Load

Here, I load Table 1 and Table 2, which I managed to scratch from WHO
situation reports. Beware Table 1 (in\_china) includes total, but Table
2 (world) does not include subtotal or total, as I cut them.

``` r
# load data
load("data/tables.rdata")
```

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 10 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States            9036.   307318             34
    ##  2 Spain                    3733.   130759             35
    ##  3 Italy                    2996.   128948             43
    ##  4 Germany                  2646.    95391             36
    ##  5 France                   1983.    69607             35
    ##  6 United Kingdom           1490.    47810             32
    ##  7 Iran                     1452.    58226             40
    ##  8 Turkey                   1415.    27069             19
    ##  9 China                    1074.    83005             77
    ## 10 Belgium                   632.    19691             31
    ## 11 Netherlands               572.    17851             31
    ## 12 Canada                    551.    13904             25
    ## 13 Portugal                  465.    11278             24
    ## 14 Brazil                    442.    10278             23
    ## 15 Russia                    276.     5389             19
    ## 16 South Korea               217.    10284             47
    ## 17 Australia                 209.     5744             27
    ## 18 Chile                     205.     4471             21
    ## 19 Czech Republic            179.     4587             25
    ## 20 Ecuador                   174.     3465             19

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        80.3                2812.             35
    ##  2 Belgium                      60.7                1893.             31
    ##  3 Italy                        49.7                2137.             43
    ##  4 Portugal                     43.6                1056.             24
    ##  5 Netherlands                  34.3                1072.             31
    ##  6 Germany                      32.3                1166.             36
    ##  7 France                       30.6                1075.             35
    ##  8 United States                29.1                 991.             34
    ##  9 United Kingdom               23.9                 767.             32
    ## 10 Iran                         18.9                 757.             40
    ## 11 Turkey                       18.2                 348.             19
    ## 12 Czech Republic               17.1                 438.             25
    ## 13 Canada                       16.3                 413.             25
    ## 14 Chile                        12.3                 267.             21
    ## 15 Ecuador                      11.8                 234.             19
    ## 16 Australia                     9.69                267.             27
    ## 17 Romania                       7.41                176.             23
    ## 18 Greece                        5.96                158.             23
    ## 19 Poland                        4.51                107.             23
    ## 20 Malaysia                      4.48                130.             28

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Italy                                    12.3       15889   128948
    ##  2 France                                   11.6        8064    69607
    ##  3 Democratic Republic of the Congo         11.2          18      161
    ##  4 Algeria                                  10.4         130     1251
    ##  5 United Kingdom                           10.3        4934    47810
    ##  6 Netherlands                               9.89       1766    17851
    ##  7 Spain                                     9.50      12418   130759
    ##  8 Indonesia                                 8.71        198     2273
    ##  9 Belgium                                   7.35       1447    19691
    ## 10 Egypt                                     6.65         78     1173
    ## 11 Morocco                                   6.38         71     1113
    ## 12 Iraq                                      6.35         61      961
    ## 13 Iran                                      6.19       3603    58226
    ## 14 Burkina Faso                              4.97         15      302
    ## 15 Ecuador                                   4.96        172     3465
    ## 16 Philippines                               4.68        152     3246
    ## 17 Greece                                    4.21         73     1735
    ## 18 Brazil                                    4.20        432    10278
    ## 19 Peru                                      4.18         73     1746
    ## 20 Mexico                                    4.18         79     1890

EOL
