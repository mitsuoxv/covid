WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-09

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
    ##  1 United States           18416.  1215571             66
    ##  2 Russia                   3681.   187859             51
    ##  3 Spain                    3303.   221447             67
    ##  4 United Kingdom           3228.   206719             64
    ##  5 Italy                    2876.   215858             75
    ##  6 Turkey                   2618.   133721             51
    ##  7 Germany                  2458.   167300             68
    ##  8 Brazil                   2274.   125218             55
    ##  9 France                   2027.   135980             67
    ## 10 Iran                     1430.   103135             72
    ## 11 Canada                   1119.    63895             57
    ## 12 Peru                     1072     54817             51
    ## 13 India                    1022.    56342             55
    ## 14 Belgium                   814.    51420             63
    ## 15 China                     772.    84415            109
    ## 16 Netherlands               661.    41774             63
    ## 17 Saudi Arabia              611.    33731             55
    ## 18 Ecuador                   591.    30298             51
    ## 19 Mexico                    550.    27634             50
    ## 20 Pakistan                  484.    25837             53

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       78.3               4943.             63
    ##  2 Spain                         71.0               4762.             67
    ##  3 United States                 59.4               3918.             66
    ##  4 United Kingdom                51.8               3316.             64
    ##  5 Italy                         47.7               3577.             75
    ##  6 Portugal                      44.5               2502.             56
    ##  7 Ecuador                       40.0               2048.             51
    ##  8 Netherlands                   39.7               2510.             63
    ##  9 Peru                          35.8               1833.             51
    ## 10 Turkey                        33.7               1719.             51
    ## 11 Canada                        33.2               1897.             57
    ## 12 France                        31.3               2099.             67
    ## 13 Germany                       30.1               2045.             68
    ## 14 Chile                         27.5               1468.             53
    ## 15 Russia                        26.2               1335.             51
    ## 16 Saudi Arabia                  23.8               1311.             55
    ## 17 Iran                          18.6               1341.             72
    ## 18 Czech Republic                13.3                767.             57
    ## 19 Romania                       11.9                660.             55
    ## 20 Brazil                        11.3                623.             55

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.1       25946   135980
    ##  2 Belgium                16.4        8415    51420
    ##  3 United Kingdom         14.8       30615   206719
    ##  4 Italy                  13.9       29958   215858
    ##  5 Netherlands            12.7        5288    41774
    ##  6 Spain                  11.8       26070   221447
    ##  7 Chad                   10.7          27      253
    ##  8 Mexico                  9.79       2704    27634
    ##  9 Algeria                 9.32        483     5182
    ## 10 Indonesia               7.28        930    12776
    ## 11 Brazil                  6.82       8536   125218
    ## 12 Canada                  6.70       4280    63895
    ## 13 Philippines             6.62        685    10343
    ## 14 Burkina Faso            6.52         48      736
    ## 15 Iran                    6.29       6486   103135
    ## 16 Romania                 6.04        876    14499
    ## 17 Egypt                   6.04        482     7981
    ## 18 Sudan                   5.59         52      930
    ## 19 Greece                  5.53        148     2678
    ## 20 United States           5.52      67146  1215571

EOL
