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

Updated: 2020-05-21

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
    ##  1 United States           18940.  1477459             78
    ##  2 Russia                   4898.   308705             63
    ##  3 Brazil                   3793.   254220             67
    ##  4 United Kingdom           3272.   248822             76
    ##  5 Spain                    2936.   232037             79
    ##  6 Italy                    2604.   226699             87
    ##  7 Turkey                   2404.   151615             63
    ##  8 Germany                  2198.   176007             80
    ##  9 France                   1782.   140959             79
    ## 10 India                    1592.   106750             67
    ## 11 Peru                     1505.    94933             63
    ## 12 Iran                     1482.   124603             84
    ## 13 Canada                   1136.    78499             69
    ## 14 Saudi Arabia              892.    59854             67
    ## 15 Mexico                    831.    51633             62
    ## 16 Belgium                   742.    55791             75
    ## 17 Chile                     706.    46059             65
    ## 18 China                     696.    84505            121
    ## 19 Pakistan                  692.    45184             65
    ## 20 Netherlands               588.    44249             75

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       71.4               5363.             75
    ##  2 Spain                         63.1               4989.             79
    ##  3 United States                 61.1               4762.             78
    ##  4 United Kingdom                52.5               3991.             76
    ##  5 Peru                          50.3               3174.             63
    ##  6 Italy                         43.2               3757.             87
    ##  7 Chile                         42.2               2750.             65
    ##  8 Portugal                      40.4               2757.             68
    ##  9 Ecuador                       36.5               2309.             63
    ## 10 Netherlands                   35.3               2658.             75
    ## 11 Russia                        34.8               2194.             63
    ## 12 Saudi Arabia                  34.7               2326.             67
    ## 13 Canada                        33.7               2331.             69
    ## 14 Turkey                        30.9               1949.             63
    ## 15 France                        27.5               2176.             79
    ## 16 Germany                       26.9               2152.             80
    ## 17 Iran                          19.3               1620.             84
    ## 18 Brazil                        18.9               1264.             67
    ## 19 Czech Republic                11.8                825.             69
    ## 20 Romania                       11.6                783.             67

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.8       27972   140959
    ##  2 Yemen                  17.0          29      171
    ##  3 Belgium                16.3        9108    55791
    ##  4 United Kingdom         14.2       35341   248822
    ##  5 Italy                  14.2       32169   226699
    ##  6 Netherlands            12.9        5715    44249
    ##  7 Spain                  12.0       27778   232037
    ##  8 Mexico                 10.3        5332    51633
    ##  9 Chad                   10.3          56      545
    ## 10 Ecuador                 8.31       2839    34151
    ## 11 Algeria                 7.60        561     7377
    ## 12 Canada                  7.46       5857    78499
    ## 13 Brazil                  6.61      16792   254220
    ## 14 Indonesia               6.60       1221    18496
    ## 15 Romania                 6.55       1126    17191
    ## 16 Philippines             6.47        837    12942
    ## 17 Burkina Faso            6.45         52      806
    ## 18 United States           6.04      89271  1477459
    ## 19 Niger                   6.02         55      914
    ## 20 Mali                    5.88         53      901

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                876.        9108    10.4
    ##  2 Spain                  597.       27778    46.5
    ##  3 United Kingdom         567.       35341    62.3
    ##  4 Italy                  533.       32169    60.3
    ##  5 France                 432.       27972    64.8
    ##  6 Netherlands            343.        5715    16.6
    ##  7 United States          288.       89271   310. 
    ##  8 Ecuador                192.        2839    14.8
    ##  9 Canada                 174.        5857    33.7
    ## 10 Portugal               117.        1247    10.7
    ## 11 Germany                 98.9       8090    81.8
    ## 12 Peru                    93.3       2789    29.9
    ## 13 Iran                    92.5       7119    76.9
    ## 14 Brazil                  83.5      16792   201. 
    ## 15 Turkey                  54.0       4199    77.8
    ## 16 Romania                 51.3       1126    22.0
    ## 17 Mexico                  47.4       5332   112. 
    ## 18 Czech Republic          28.8        302    10.5
    ## 19 Chile                   28.5        478    16.7
    ## 20 Poland                  24.6        948    38.5

EOL
