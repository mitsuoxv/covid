WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-04

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
    ##  1 United States            6887.   213600             31
    ##  2 Spain                    3441.   110238             32
    ##  3 Italy                    2878.   115242             40
    ##  4 Germany                  2411.    79696             33
    ##  5 France                   1817.    58327             32
    ##  6 Iran                     1360.    50468             37
    ##  7 United Kingdom           1159.    33722             29
    ##  8 Turkey                   1122.    18135             16
    ##  9 China                    1115.    82802             74
    ## 10 Belgium                   544.    15348             28
    ## 11 Netherlands               520.    14697             28
    ## 12 Canada                    453.    10114             22
    ## 13 Portugal                  425.     9034             21
    ## 14 Brazil                    336.     6836             20
    ## 15 South Korea               226.    10062             44
    ## 16 Australia                 213      5224             24
    ## 17 Russia                    213.     3548             16
    ## 18 Ecuador                   188      3163             16
    ## 19 Chile                     180.     3404             18
    ## 20 Czech Republic            170.     3858             22

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        74.0                2370.             32
    ##  2 Belgium                      52.3                1475.             28
    ##  3 Italy                        47.7                1910.             40
    ##  4 Portugal                     39.8                 846.             21
    ##  5 Netherlands                  31.3                 883.             28
    ##  6 Germany                      29.5                 974.             33
    ##  7 France                       28.0                 901.             32
    ##  8 United States                22.2                 689.             31
    ##  9 United Kingdom               18.6                 541.             29
    ## 10 Iran                         17.7                 656.             37
    ## 11 Czech Republic               16.2                 368.             22
    ## 12 Turkey                       14.4                 233.             16
    ## 13 Canada                       13.5                 300.             22
    ## 14 Ecuador                      12.7                 214.             16
    ## 15 Chile                        10.8                 203.             18
    ## 16 Australia                     9.90                243.             24
    ## 17 Romania                       5.95                125.             20
    ## 18 Greece                        5.85                138.             20
    ## 19 South Korea                   4.67                208.             44
    ## 20 Malaysia                      4.24                110.             25

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Italy                                    12.1       13917   115242
    ##  2 Democratic Republic of the Congo          9.70         13      134
    ##  3 Indonesia                                 9.50        170     1790
    ##  4 Netherlands                               9.11       1339    14697
    ##  5 Spain                                     9.07      10003   110238
    ##  6 United Kingdom                            8.66       2921    33722
    ##  7 Algeria                                   8.42         83      986
    ##  8 France                                    7.70       4490    58327
    ##  9 Iraq                                      6.99         54      772
    ## 10 Egypt                                     6.71         58      865
    ## 11 Belgium                                   6.59       1011    15348
    ## 12 Morocco                                   6.39         47      735
    ## 13 Iran                                      6.26       3160    50468
    ## 14 Burkina Faso                              5.36         14      261
    ## 15 Philippines                               4.06        107     2633
    ## 16 China                                     4.02       3331    82802
    ## 17 Ecuador                                   3.79        120     3163
    ## 18 Brazil                                    3.53        241     6836
    ## 19 Greece                                    3.50         53     1514
    ## 20 Romania                                   3.43         94     2738

EOL
