WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-07

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
    ##  1 United States           18298.  1171185             64
    ##  2 Russia                   3383.   165929             49
    ##  3 Spain                    3373.   219329             65
    ##  4 United Kingdom           3143.   194994             62
    ##  5 Italy                    2916.   213013             73
    ##  6 Turkey                   2639.   129491             49
    ##  7 Germany                  2496.   164897             66
    ##  8 Brazil                   2031.   107780             53
    ##  9 France                   2017.   131292             65
    ## 10 Iran                     1426.    99970             70
    ## 11 Canada                   1109.    61159             55
    ## 12 Peru                      964.    47372             49
    ## 13 India                     930.    49391             53
    ## 14 Belgium                   826.    50509             61
    ## 15 China                     786.    84406            107
    ## 16 Netherlands               671.    41087             61
    ## 17 Ecuador                   647.    31881             49
    ## 18 Saudi Arabia              569.    30251             53
    ## 19 Mexico                    516.    24905             48
    ## 20 Portugal                  474.    25702             54

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       79.4               4855.             61
    ##  2 Spain                         72.5               4716.             65
    ##  3 United States                 59.0               3775.             64
    ##  4 United Kingdom                50.4               3127.             62
    ##  5 Italy                         48.3               3530.             73
    ##  6 Portugal                      44.4               2407.             54
    ##  7 Ecuador                       43.8               2155.             49
    ##  8 Netherlands                   40.3               2468.             61
    ##  9 Turkey                        33.9               1664.             49
    ## 10 Canada                        32.9               1816.             55
    ## 11 Peru                          32.2               1584.             49
    ## 12 France                        31.1               2027.             65
    ## 13 Germany                       30.5               2016.             66
    ## 14 Chile                         25.6               1315.             51
    ## 15 Russia                        24.0               1179.             49
    ## 16 Saudi Arabia                  22.1               1176.             53
    ## 17 Iran                          18.5               1300.             70
    ## 18 Czech Republic                13.5                754.             55
    ## 19 Romania                       11.8                630.             53
    ## 20 Brazil                        10.1                536.             53

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.4       25491   131292
    ##  2 Belgium                15.9        8016    50509
    ##  3 United Kingdom         15.1       29427   194994
    ##  4 Italy                  13.8       29315   213013
    ##  5 Netherlands            12.6        5168    41087
    ##  6 Spain                  11.7       25613   219329
    ##  7 Chad                   10            17      170
    ##  8 Algeria                 9.71        470     4838
    ##  9 Mexico                  9.12       2271    24905
    ## 10 Indonesia               7.22        872    12071
    ## 11 Burkina Faso            6.97         48      689
    ## 12 Brazil                  6.79       7321   107780
    ## 13 Philippines             6.58        637     9684
    ## 14 Canada                  6.40       3915    61159
    ## 15 Iran                    6.34       6340    99970
    ## 16 Egypt                   6.28        452     7201
    ## 17 Romania                 5.98        827    13837
    ## 18 Sudan                   5.78         45      778
    ## 19 Greece                  5.53        146     2642
    ## 20 China                   5.50       4643    84406

EOL
