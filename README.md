WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-28

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
    ##  1 United States           16938    931698             55
    ##  2 Spain                    3706.   207634             56
    ##  3 Italy                    3087.   197675             64
    ##  4 United Kingdom           2882.   152844             53
    ##  5 Turkey                   2748.   110130             40
    ##  6 Germany                  2720.   155193             57
    ##  7 France                   2198    123279             56
    ##  8 Russia                   2175     87147             40
    ##  9 Iran                     1481.    90481             61
    ## 10 Brazil                   1327     58509             44
    ## 11 Canada                    992.    45778             46
    ## 12 Belgium                   885.    46134             52
    ## 13 China                     858.    84341             98
    ## 14 Netherlands               725.    37845             52
    ## 15 India                     631.    27892             44
    ## 16 Peru                      630.    25331             40
    ## 17 Ecuador                   564.    22719             40
    ## 18 Portugal                  528.    23864             45
    ## 19 Saudi Arabia              396.    17522             44
    ## 20 Mexico                    352.    13842             39

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      85.1                4435.             52
    ##  2 Spain                        79.7                4465.             56
    ##  3 United States                54.6                3003.             55
    ##  4 Italy                        51.2                3276.             64
    ##  5 Portugal                     49.4                2235.             45
    ##  6 United Kingdom               46.2                2451.             53
    ##  7 Netherlands                  43.6                2274.             52
    ##  8 Ecuador                      38.1                1536.             40
    ##  9 Turkey                       35.3                1415.             40
    ## 10 France                       33.9                1903.             56
    ## 11 Germany                      33.3                1897.             57
    ## 12 Canada                       29.5                1359.             46
    ## 13 Peru                         21.1                 847.             40
    ## 14 Iran                         19.3                1176.             61
    ## 15 Chile                        18.7                 796.             42
    ## 16 Russia                       15.5                 619.             40
    ## 17 Saudi Arabia                 15.4                 681.             44
    ## 18 Czech Republic               15.1                 707.             46
    ## 19 Romania                      11.3                 503.             44
    ## 20 Poland                        6.79                302.             44

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   18.5       22821   123279
    ##  2 Belgium                                  15.4        7094    46134
    ##  3 United Kingdom                           13.6       20732   152844
    ##  4 Italy                                    13.5       26644   197675
    ##  5 Algeria                                  12.6         425     3382
    ##  6 Netherlands                              11.8        4475    37845
    ##  7 Spain                                    11.2       23190   207634
    ##  8 Mexico                                    9.43       1305    13842
    ##  9 Sudan                                     8.86         21      237
    ## 10 Indonesia                                 8.37        743     8882
    ## 11 Egypt                                     6.99        317     4534
    ## 12 Brazil                                    6.86       4016    58509
    ## 13 Burkina Faso                              6.65         42      632
    ## 14 Philippines                               6.61        501     7579
    ## 15 Iran                                      6.31       5710    90481
    ## 16 Democratic Republic of the Congo          6.10         28      459
    ## 17 Mali                                      5.91         23      389
    ## 18 Romania                                   5.51        608    11036
    ## 19 China                                     5.51       4643    84341
    ## 20 Canada                                    5.44       2489    45778

EOL
