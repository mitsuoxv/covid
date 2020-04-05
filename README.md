WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-06

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
    ##  1 United States            8294.   273808             33
    ##  2 Spain                    3665.   124736             34
    ##  3 Italy                    2964.   124632             42
    ##  4 Germany                  2617.    91714             35
    ##  5 France                   1987.    67757             34
    ##  6 Iran                     1426.    55743             39
    ##  7 United Kingdom           1348.    41907             31
    ##  8 Turkey                   1319.    23934             18
    ##  9 China                    1088.    82930             76
    ## 10 Belgium                   611.    18431             30
    ## 11 Netherlands               550.    16627             30
    ## 12 Canada                    533.    12938             24
    ## 13 Portugal                  453.    10524             23
    ## 14 Brazil                    406.     9056             22
    ## 15 Russia                    255.     4731             18
    ## 16 South Korea               220.    10237             46
    ## 17 Australia                 212.     5635             26
    ## 18 Chile                     200.     4161             20
    ## 19 Ecuador                   184.     3465             18
    ## 20 Czech Republic            182.     4472             24

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        78.8                2682.             34
    ##  2 Belgium                      58.7                1772.             30
    ##  3 Italy                        49.1                2065.             42
    ##  4 Portugal                     42.4                 986.             23
    ##  5 Netherlands                  33.0                 999.             30
    ##  6 Germany                      32.0                1121.             35
    ##  7 France                       30.7                1046.             34
    ##  8 United States                26.7                 883.             33
    ##  9 United Kingdom               21.6                 672.             31
    ## 10 Iran                         18.5                 725.             39
    ## 11 Czech Republic               17.3                 427.             24
    ## 12 Turkey                       17.0                 308.             18
    ## 13 Canada                       15.8                 384.             24
    ## 14 Ecuador                      12.4                 234.             18
    ## 15 Chile                        12.0                 248.             20
    ## 16 Australia                     9.87                262.             26
    ## 17 Romania                       7.22                165.             22
    ## 18 Greece                        5.97                152.             22
    ## 19 South Korea                   4.55                211.             46
    ## 20 Malaysia                      4.41                123.             27

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Italy                                    12.3       15362   124632
    ##  2 France                                   11.1        7546    67757
    ##  3 Democratic Republic of the Congo         10.8          16      148
    ##  4 Algeria                                  10.4         130     1251
    ##  5 United Kingdom                           10.3        4313    41907
    ##  6 Netherlands                               9.93       1651    16627
    ##  7 Spain                                     9.42      11744   124736
    ##  8 Indonesia                                 9.13        191     2092
    ##  9 Belgium                                   6.96       1283    18431
    ## 10 Morocco                                   6.88         66      960
    ## 11 Egypt                                     6.64         71     1070
    ## 12 Iraq                                      6.38         56      878
    ## 13 Iran                                      6.19       3452    55743
    ## 14 Burkina Faso                              4.97         15      302
    ## 15 Ecuador                                   4.96        172     3465
    ## 16 Philippines                               4.65        144     3094
    ## 17 Greece                                    4.06         68     1673
    ## 18 China                                     4.03       3338    82930
    ## 19 Brazil                                    3.96        359     9056
    ## 20 Romania                                   3.90        141     3613

EOL
