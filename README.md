WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-27

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
    ##  1 United States           16651.   899281             54
    ##  2 Spain                    3994.   219764             55
    ##  3 Italy                    3099.   195351             63
    ##  4 United Kingdom           2851.   148381             52
    ##  5 Turkey                   2759.   107773             39
    ##  6 Germany                  2751.   154175             56
    ##  7 France                   2231.   122875             55
    ##  8 Russia                   1909.    74588             39
    ##  9 Iran                     1486.    89328             60
    ## 10 Brazil                   1230.    52995             43
    ## 11 Canada                    983.    44353             45
    ## 12 Belgium                   887.    45325             51
    ## 13 China                     867.    84338             97
    ## 14 Netherlands               727.    37190             51
    ## 15 India                     614.    26496             43
    ## 16 Ecuador                   579.    22719             39
    ## 17 Peru                      551.    21648             39
    ## 18 Portugal                  529.    23392             44
    ## 19 Saudi Arabia              377.    16299             43
    ## 20 Mexico                    336.    12872             38

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        85.9                4726.             55
    ##  2 Belgium                      85.2                4357.             51
    ##  3 United States                53.7                2899.             54
    ##  4 Italy                        51.4                3237.             63
    ##  5 Portugal                     49.6                2191.             44
    ##  6 United Kingdom               45.7                2380.             52
    ##  7 Netherlands                  43.7                2234.             51
    ##  8 Ecuador                      39.1                1536.             39
    ##  9 Turkey                       35.5                1385.             39
    ## 10 France                       34.4                1897.             55
    ## 11 Germany                      33.6                1885.             56
    ## 12 Canada                       29.2                1317.             45
    ## 13 Iran                         19.3                1161.             60
    ## 14 Chile                        18.5                 768.             41
    ## 15 Peru                         18.4                 724.             39
    ## 16 Czech Republic               15.3                 702.             45
    ## 17 Saudi Arabia                 14.6                 633.             43
    ## 18 Russia                       13.6                 530.             39
    ## 19 Romania                      11.1                 484.             43
    ## 20 Poland                        6.74                293.             43

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   18.4       22580   122875
    ##  2 Belgium                                  15.3        6917    45325
    ##  3 United Kingdom                           13.7       20319   148381
    ##  4 Italy                                    13.5       26384   195351
    ##  5 Algeria                                  12.9         419     3256
    ##  6 Netherlands                              11.9        4409    37190
    ##  7 Spain                                    10.2       22524   219764
    ##  8 Mexico                                    9.49       1221    12872
    ##  9 Indonesia                                 8.37        720     8607
    ## 10 Sudan                                     7.98         17      213
    ## 11 Egypt                                     7.11        307     4319
    ## 12 Brazil                                    6.93       3670    52995
    ## 13 Philippines                               6.77        494     7294
    ## 14 Burkina Faso                              6.52         41      629
    ## 15 Democratic Republic of the Congo          6.33         28      442
    ## 16 Iran                                      6.33       5650    89328
    ## 17 Mali                                      5.68         21      370
    ## 18 China                                     5.50       4642    84338
    ## 19 Romania                                   5.41        575    10635
    ## 20 Canada                                    5.30       2350    44353

EOL
