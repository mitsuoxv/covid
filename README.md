WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2020-05-24

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
    ##  1 United States           19109.  1547973             81
    ##  2 Russia                   5087.   335882             66
    ##  3 Brazil                   4428.   310087             70
    ##  4 United Kingdom           3216.   254199             79
    ##  5 Spain                    2862.   234824             82
    ##  6 Italy                    2539.   228658             90
    ##  7 Turkey                   2338.   154500             66
    ##  8 Germany                  2141.   177850             83
    ##  9 India                    1786.   125101             70
    ## 10 France                   1729.   141949             82
    ## 11 Peru                     1646.   108769             66
    ## 12 Iran                     1512.   131652             87
    ## 13 Canada                   1134.    81765             72
    ## 14 Saudi Arabia              966.    67719             70
    ## 15 Mexico                    915.    59567             65
    ## 16 Chile                     907.    61857             68
    ## 17 Pakistan                  768.    52437             68
    ## 18 Belgium                   723.    56511             78
    ## 19 China                     679.    84522            124
    ## 20 Bangladesh                640.    30205             47

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       69.5               5432.             78
    ##  2 United States                 61.6               4990.             81
    ##  3 Spain                         61.5               5049.             82
    ##  4 Peru                          55.0               3637.             66
    ##  5 Chile                         54.2               3694.             68
    ##  6 United Kingdom                51.6               4077.             79
    ##  7 Italy                         42.1               3789.             90
    ##  8 Portugal                      39.7               2829.             71
    ##  9 Saudi Arabia                  37.5               2632.             70
    ## 10 Ecuador                       36.5               2422.             66
    ## 11 Russia                        36.2               2387.             66
    ## 12 Netherlands                   34.5               2697.             78
    ## 13 Canada                        33.7               2428.             72
    ## 14 Turkey                        30.1               1986.             66
    ## 15 France                        26.7               2192.             82
    ## 16 Germany                       26.2               2174.             83
    ## 17 Brazil                        22.0               1542.             70
    ## 18 Iran                          19.7               1711.             87
    ## 19 Czech Republic                11.5                841.             72
    ## 20 Romania                       11.4                807.             70

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.9       28238   141949
    ##  2 Belgium                16.3        9212    56511
    ##  3 Yemen                  16.3          34      209
    ##  4 United Kingdom         14.3       36393   254199
    ##  5 Italy                  14.3       32616   228658
    ##  6 Netherlands            12.9        5788    44888
    ##  7 Spain                  12.2       28628   234824
    ##  8 Mexico                 10.9        6510    59567
    ##  9 Chad                    9.66         59      611
    ## 10 Ecuador                 8.53       3056    35828
    ## 11 Canada                  7.56       6180    81765
    ## 12 Algeria                 7.35        582     7918
    ## 13 Romania                 6.54       1159    17712
    ## 14 Brazil                  6.46      20047   310087
    ## 15 Niger                   6.40         60      937
    ## 16 Mali                    6.40         62      969
    ## 17 Burkina Faso            6.39         52      814
    ## 18 Indonesia               6.38       1326    20796
    ## 19 Philippines             6.30        857    13597
    ## 20 United States           6.00      92923  1547973

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                886.        9212    10.4
    ##  2 Spain                  616.       28628    46.5
    ##  3 United Kingdom         584.       36393    62.3
    ##  4 Italy                  541.       32616    60.3
    ##  5 France                 436.       28238    64.8
    ##  6 Netherlands            348.        5788    16.6
    ##  7 United States          300.       92923   310. 
    ##  8 Ecuador                207.        3056    14.8
    ##  9 Canada                 183.        6180    33.7
    ## 10 Portugal               121.        1289    10.7
    ## 11 Peru                   105.        3148    29.9
    ## 12 Germany                100.        8216    81.8
    ## 13 Brazil                  99.7      20047   201. 
    ## 14 Iran                    94.9       7300    76.9
    ## 15 Mexico                  57.9       6510   112. 
    ## 16 Turkey                  55.0       4276    77.8
    ## 17 Romania                 52.8       1159    22.0
    ## 18 Chile                   37.6        630    16.7
    ## 19 Czech Republic          29.8        312    10.5
    ## 20 Poland                  25.5        982    38.5

EOL
