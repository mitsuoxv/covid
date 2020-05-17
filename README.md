WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-18

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
    ##  1 United States           18791.  1409452             75
    ##  2 Russia                   4693.   281752             60
    ##  3 Brazil                   3408.   218223             64
    ##  4 United Kingdom           3288.   240165             73
    ##  5 Spain                    3034    230698             76
    ##  6 Italy                    2674.   224760             84
    ##  7 Turkey                   2465.   148067             60
    ##  8 Germany                  2263.   174355             77
    ##  9 France                   1840.   140008             76
    ## 10 Iran                     1460.   118392             81
    ## 11 India                    1419.    90927             64
    ## 12 Peru                     1406.    84495             60
    ## 13 Canada                   1134.    74993             66
    ## 14 Saudi Arabia              811.    52016             64
    ## 15 Belgium                   762.    54989             72
    ## 16 Mexico                    761.    45032             59
    ## 17 China                     714.    84484            118
    ## 18 Chile                     666.    41428             62
    ## 19 Pakistan                  645.    40151             62
    ## 20 Netherlands               608.    43870             72

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       73.3               5286.             72
    ##  2 Spain                         65.2               4961.             76
    ##  3 United States                 60.6               4543.             75
    ##  4 United Kingdom                52.7               3852.             73
    ##  5 Peru                          47.0               2825.             60
    ##  6 Italy                         44.3               3725.             84
    ##  7 Portugal                      41.4               2699.             65
    ##  8 Chile                         39.8               2474.             62
    ##  9 Netherlands                   36.5               2636.             72
    ## 10 Ecuador                       35.3               2127.             60
    ## 11 Canada                        33.7               2227.             66
    ## 12 Russia                        33.4               2002.             60
    ## 13 Turkey                        31.7               1903.             60
    ## 14 Saudi Arabia                  31.5               2021.             64
    ## 15 France                        28.4               2162.             76
    ## 16 Germany                       27.7               2131.             77
    ## 17 Iran                          19.0               1539.             81
    ## 18 Brazil                        16.9               1085.             64
    ## 19 Czech Republic                12.1                807.             66
    ## 20 Romania                       11.8                761.             64

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.7       27578   140008
    ##  2 Belgium                16.4        9005    54989
    ##  3 Yemen                  15.1          19      126
    ##  4 United Kingdom         14.4       34466   240165
    ##  5 Italy                  14.1       31763   224760
    ##  6 Netherlands            12.9        5670    43870
    ##  7 Spain                  11.9       27563   230698
    ##  8 Mexico                 10.6        4767    45032
    ##  9 Chad                   10.5          50      474
    ## 10 Ecuador                 8.24       2594    31467
    ## 11 Algeria                 7.95        542     6821
    ## 12 Canada                  7.46       5595    74993
    ## 13 Brazil                  6.79      14817   218223
    ## 14 Philippines             6.64        817    12305
    ## 15 Burkina Faso            6.52         51      782
    ## 16 Romania                 6.47       1081    16704
    ## 17 Indonesia               6.40       1089    17025
    ## 18 United States           6.09      85860  1409452
    ## 19 Kenya                   6.02         50      830
    ## 20 Iran                    5.86       6937   118392

EOL
