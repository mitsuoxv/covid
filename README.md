WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-04

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
    ##  1 United States           17931.  1093880             61
    ##  2 Spain                    3491.   216582             62
    ##  3 United Kingdom           3087.   182264             59
    ##  4 Italy                    2989.   209328             70
    ##  5 Russia                   2925.   134687             46
    ##  6 Turkey                   2700.   124375             46
    ##  7 Germany                  2577.   162496             63
    ##  8 France                   2085.   129458             62
    ##  9 Brazil                   1829.    91589             50
    ## 10 Iran                     1437.    96448             67
    ## 11 Canada                   1066.    55572             52
    ## 12 Peru                      876.    40459             46
    ## 13 Belgium                   852.    49517             58
    ## 14 China                     809.    84393            104
    ## 15 India                     797.    39980             50
    ## 16 Netherlands               692.    40236             58
    ## 17 Ecuador                   594.    27464             46
    ## 18 Saudi Arabia              507.    25459             50
    ## 19 Portugal                  492.    25190             51
    ## 20 Mexico                    458.    20739             45

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      81.9                4760.             58
    ##  2 Spain                        75.1                4657.             62
    ##  3 United States                57.8                3526.             61
    ##  4 Italy                        49.5                3469.             70
    ##  5 United Kingdom               49.5                2923.             59
    ##  6 Portugal                     46.1                2359.             51
    ##  7 Netherlands                  41.5                2417.             58
    ##  8 Ecuador                      40.1                1857.             46
    ##  9 Turkey                       34.7                1599.             46
    ## 10 France                       32.2                1999.             62
    ## 11 Canada                       31.7                1650.             52
    ## 12 Germany                      31.5                1986.             63
    ## 13 Peru                         29.3                1353.             46
    ## 14 Chile                        22.7                1101.             48
    ## 15 Russia                       20.8                 957.             46
    ## 16 Saudi Arabia                 19.7                 989.             50
    ## 17 Iran                         18.7                1254.             67
    ## 18 Czech Republic               14.0                 740.             52
    ## 19 Romania                      11.5                 580.             50
    ## 20 Brazil                        9.10                455.             50

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.1       24724   129458
    ##  2 Belgium                15.7        7765    49517
    ##  3 United Kingdom         15.4       28131   182264
    ##  4 Italy                  13.7       28710   209328
    ##  5 Netherlands            12.4        4987    40236
    ##  6 Spain                  11.6       25100   216582
    ##  7 Algeria                10.7         459     4295
    ##  8 Mexico                  9.51       1972    20739
    ##  9 Indonesia               7.66        831    10843
    ## 10 Sudan                   6.93         41      592
    ## 11 Brazil                  6.91       6329    91589
    ## 12 Philippines             6.75        603     8928
    ## 13 Burkina Faso            6.75         44      652
    ## 14 Egypt                   6.70        415     6193
    ## 15 Iran                    6.38       6156    96448
    ## 16 Canada                  6.20       3446    55572
    ## 17 Romania                 6.06        771    12732
    ## 18 United States           5.71      62406  1093880
    ## 19 China                   5.50       4643    84393
    ## 20 Greece                  5.46        143     2620

EOL
