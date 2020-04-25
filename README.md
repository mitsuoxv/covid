WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-26

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
    ##  1 United States           16239.   860772             53
    ##  2 Spain                    4068.   219764             54
    ##  3 Italy                    3111.   192994             62
    ##  4 United Kingdom           2811.   143468             51
    ##  5 Germany                  2769.   152438             55
    ##  6 Turkey                   2756.   104912             38
    ##  7 France                   2243.   121338             54
    ##  8 Russia                   1802.    68622             38
    ##  9 Iran                     1492.    88194             59
    ## 10 Brazil                   1176.    49492             42
    ## 11 Canada                    968.    42739             44
    ## 12 Belgium                   884.    44293             50
    ## 13 China                     875.    84325             96
    ## 14 Netherlands               728.    36535             50
    ## 15 Ecuador                   594.    22719             38
    ## 16 India                     581.    24506             42
    ## 17 Peru                      547.    20914             38
    ## 18 Portugal                  528.    22797             43
    ## 19 Saudi Arabia              357.    15102             42
    ## 20 Mexico                    311.    11633             37

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        87.5                4726.             54
    ##  2 Belgium                      84.9                4258.             50
    ##  3 United States                52.3                2775.             53
    ##  4 Italy                        51.6                3198.             62
    ##  5 Portugal                     49.4                2135.             43
    ##  6 United Kingdom               45.1                2301.             51
    ##  7 Netherlands                  43.7                2195.             50
    ##  8 Ecuador                      40.1                1536.             38
    ##  9 Turkey                       35.4                1348.             38
    ## 10 France                       34.6                1873.             54
    ## 11 Germany                      33.9                1863.             55
    ## 12 Canada                       28.7                1269.             44
    ## 13 Iran                         19.4                1147.             59
    ## 14 Peru                         18.3                 699.             38
    ## 15 Chile                        18.1                 735.             40
    ## 16 Czech Republic               15.5                 694.             44
    ## 17 Saudi Arabia                 13.9                 587.             42
    ## 18 Russia                       12.8                 488.             38
    ## 19 Romania                      11.2                 474.             42
    ## 20 Poland                        6.67                283.             42

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   18.3       22212   121338
    ##  2 Belgium                                  15.1        6679    44293
    ##  3 United Kingdom                           13.6       19506   143468
    ##  4 Italy                                    13.5       25969   192994
    ##  5 Algeria                                  13.3         415     3127
    ##  6 Netherlands                              11.7        4289    36535
    ##  7 Spain                                    10.2       22524   219764
    ##  8 Sudan                                     9.20         16      174
    ##  9 Mexico                                    9.19       1069    11633
    ## 10 Indonesia                                 8.39        689     8211
    ## 11 Egypt                                     7.18        294     4092
    ## 12 Democratic Republic of the Congo          6.73         28      416
    ## 13 Brazil                                    6.69       3313    49492
    ## 14 Burkina Faso                              6.66         41      616
    ## 15 Philippines                               6.63        477     7192
    ## 16 Mali                                      6.46         21      325
    ## 17 Iran                                      6.32       5574    88194
    ## 18 China                                     5.50       4642    84325
    ## 19 Romania                                   5.30        552    10417
    ## 20 Greece                                    5.22        130     2490

EOL
