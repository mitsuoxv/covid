WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-16

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
    ##  1 United States           18650.  1361522             73
    ##  2 Russia                   4529.   262843             58
    ##  3 United Kingdom           3282.   233155             71
    ##  4 Spain                    3100.   229540             74
    ##  5 Brazil                   3046.   188974             62
    ##  6 Italy                    2719.   223096             82
    ##  7 Turkey                   2492.   144749             58
    ##  8 Germany                  2307.   173152             75
    ##  9 France                   1878.   139152             74
    ## 10 Iran                     1448    114533             79
    ## 11 India                    1320.    81970             62
    ## 12 Peru                     1313.    76306             58
    ## 13 Canada                   1131.    72536             64
    ## 14 Belgium                   774.    54288             70
    ## 15 Saudi Arabia              754.    46869             62
    ## 16 China                     726.    84469            116
    ## 17 Mexico                    703.    40186             57
    ## 18 Netherlands               619.    43481             70
    ## 19 Pakistan                  617.    37218             60
    ## 20 Chile                     615.    37040             60

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       74.4               5218.             70
    ##  2 Spain                         66.7               4936.             74
    ##  3 United States                 60.1               4389.             73
    ##  4 United Kingdom                52.6               3740.             71
    ##  5 Italy                         45.1               3697.             82
    ##  6 Peru                          43.9               2551.             58
    ##  7 Portugal                      41.9               2653.             63
    ##  8 Netherlands                   37.2               2612.             70
    ##  9 Chile                         36.7               2212.             60
    ## 10 Ecuador                       35.4               2062.             58
    ## 11 Canada                        33.6               2154.             64
    ## 12 Russia                        32.2               1868.             58
    ## 13 Turkey                        32.0               1860.             58
    ## 14 Saudi Arabia                  29.3               1821.             62
    ## 15 France                        29.0               2148.             74
    ## 16 Germany                       28.2               2117.             75
    ## 17 Iran                          18.8               1489.             79
    ## 18 Brazil                        15.1                940.             62
    ## 19 Czech Republic                12.3                797.             64
    ## 20 Romania                       11.8                740.             62

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.7       27378   139152
    ##  2 Belgium                16.4        8903    54288
    ##  3 Yemen                  14.9          13       87
    ##  4 United Kingdom         14.4       33614   233155
    ##  5 Italy                  14.1       31368   223096
    ##  6 Netherlands            12.9        5590    43481
    ##  7 Spain                  11.9       27321   229540
    ##  8 Chad                   11.5          46      399
    ##  9 Mexico                 10.5        4220    40186
    ## 10 Algeria                 8.21        529     6442
    ## 11 Ecuador                 7.67       2338    30502
    ## 12 Canada                  7.36       5337    72536
    ## 13 Brazil                  6.96      13149   188974
    ## 14 Philippines             6.65        790    11876
    ## 15 Burkina Faso            6.60         51      773
    ## 16 Indonesia               6.52       1043    16006
    ## 17 Romania                 6.44       1046    16247
    ## 18 United States           6.03      82119  1361522
    ## 19 Iran                    5.98       6854   114533
    ## 20 Mali                    5.91         46      779

EOL
