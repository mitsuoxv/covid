WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-14

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
    ##  1 United States           12790.   524514             41
    ##  2 Spain                    3950.   166019             42
    ##  3 Italy                    3125.   156363             50
    ##  4 Germany                  2858.   123016             43
    ##  5 France                   2243.    94382             42
    ##  6 Turkey                   2183.    56956             26
    ##  7 United Kingdom           2158.    84283             39
    ##  8 Iran                     1522.    71686             47
    ##  9 China                     992.    83597             84
    ## 10 Belgium                   777.    29647             38
    ## 11 Canada                    736.    23702             32
    ## 12 Russia                    699.    18328             26
    ## 13 Brazil                    687.    20727             30
    ## 14 Netherlands               670.    25587             38
    ## 15 Portugal                  531.    16585             31
    ## 16 India                     302.     9152             30
    ## 17 Ecuador                   281.     7466             26
    ## 18 Peru                      258.     6848             26
    ## 19 Chile                     252.     7213             28
    ## 20 Poland                    219.     6674             30

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        84.9                3570.             42
    ##  2 Belgium                      74.7                2850.             38
    ##  3 Italy                        51.8                2591.             50
    ##  4 Portugal                     49.8                1553.             31
    ##  5 United States                41.2                1691.             41
    ##  6 Netherlands                  40.3                1537.             38
    ##  7 Germany                      34.9                1504.             43
    ##  8 France                       34.6                1457.             42
    ##  9 United Kingdom               34.6                1352.             39
    ## 10 Turkey                       28.1                 732.             26
    ## 11 Canada                       21.9                 704.             32
    ## 12 Iran                         19.8                 932.             47
    ## 13 Ecuador                      19.0                 505.             26
    ## 14 Czech Republic               17.5                 572.             32
    ## 15 Chile                        15.1                 431.             28
    ## 16 Romania                       9.38                287.             30
    ## 17 Peru                          8.62                229.             26
    ## 18 Australia                     8.49                294.             34
    ## 19 Greece                        5.72                192.             30
    ## 20 Poland                        5.68                173.             30

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Algeria                                  15.3         293     1914
    ##  2 France                                   15.2       14374    94382
    ##  3 Italy                                    12.7       19901   156363
    ##  4 United Kingdom                           12.6       10612    84283
    ##  5 Belgium                                  12.1        3600    29647
    ##  6 Netherlands                              10.7        2737    25587
    ##  7 Spain                                    10.2       16972   166019
    ##  8 Indonesia                                 8.80        373     4241
    ##  9 Democratic Republic of the Congo          8.51         20      235
    ## 10 Egypt                                     7.70        159     2065
    ## 11 Morocco                                   7.10        118     1661
    ## 12 Mexico                                    6.47        273     4219
    ## 13 Philippines                               6.39        297     4648
    ## 14 Iran                                      6.24       4474    71686
    ## 15 Iraq                                      5.62         76     1352
    ## 16 Bangladesh                                5.48         34      621
    ## 17 Brazil                                    5.42       1124    20727
    ## 18 Romania                                   4.86        306     6300
    ## 19 Greece                                    4.64         98     2114
    ## 20 Ecuador                                   4.46        333     7466

EOL
