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

Updated: 2020-05-22

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
    ##  1 United States           19010.  1501876             79
    ##  2 Russia                   4959.   317554             64
    ##  3 Brazil                   3993.   271628             68
    ##  4 United Kingdom           3223.   248297             77
    ##  5 Spain                    2906.   232555             80
    ##  6 Italy                    2582.   227364             88
    ##  7 Turkey                   2381.   152587             64
    ##  8 Germany                  2181.   176752             81
    ##  9 France                   1764.   141312             80
    ## 10 India                    1651.   112359             68
    ## 11 Peru                     1552.    99483             64
    ## 12 Iran                     1492.   126949             85
    ## 13 Canada                   1134.    79502             70
    ## 14 Saudi Arabia              918.    62545             68
    ## 15 Mexico                    861.    54346             63
    ## 16 Chile                     810.    53617             66
    ## 17 Belgium                   735.    55983             76
    ## 18 Pakistan                  726.    48091             66
    ## 19 China                     690.    84507            122
    ## 20 Bangladesh                591.    26738             45

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       70.7               5381.             76
    ##  2 Spain                         62.5               5001.             80
    ##  3 United States                 61.3               4841.             79
    ##  4 Peru                          51.9               3326.             64
    ##  5 United Kingdom                51.7               3982.             77
    ##  6 Chile                         48.4               3202.             66
    ##  7 Italy                         42.8               3768.             88
    ##  8 Portugal                      40.1               2778.             69
    ##  9 Ecuador                       35.9               2309.             64
    ## 10 Saudi Arabia                  35.7               2431.             68
    ## 11 Russia                        35.2               2257.             64
    ## 12 Netherlands                   35.0               2670.             76
    ## 13 Canada                        33.7               2361.             70
    ## 14 Turkey                        30.6               1961.             64
    ## 15 France                        27.2               2182.             80
    ## 16 Germany                       26.7               2161.             81
    ## 17 Brazil                        19.9               1351.             68
    ## 18 Iran                          19.4               1650.             85
    ## 19 Czech Republic                11.7                832.             70
    ## 20 Romania                       11.6                792.             68

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.9       28081   141312
    ##  2 Belgium                16.3        9150    55983
    ##  3 Yemen                  16.3          30      184
    ##  4 United Kingdom         14.4       35704   248297
    ##  5 Italy                  14.2       32330   227364
    ##  6 Netherlands            12.9        5748    44447
    ##  7 Spain                  12.0       27888   232555
    ##  8 Mexico                 10.4        5666    54346
    ##  9 Chad                   10.1          57      565
    ## 10 Ecuador                 8.31       2839    34151
    ## 11 Algeria                 7.53        568     7542
    ## 12 Canada                  7.49       5955    79502
    ## 13 Brazil                  6.62      17971   271628
    ## 14 Romania                 6.56       1141    17387
    ## 15 Indonesia               6.47       1242    19189
    ## 16 Burkina Faso            6.43         52      809
    ## 17 Philippines             6.37        842    13221
    ## 18 Niger                   6.30         58      920
    ## 19 United States           6.01      90203  1501876
    ## 20 Mali                    5.91         55      931

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                880.        9150    10.4
    ##  2 Spain                  600.       27888    46.5
    ##  3 United Kingdom         573.       35704    62.3
    ##  4 Italy                  536.       32330    60.3
    ##  5 France                 434.       28081    64.8
    ##  6 Netherlands            345.        5748    16.6
    ##  7 United States          291.       90203   310. 
    ##  8 Ecuador                192.        2839    14.8
    ##  9 Canada                 177.        5955    33.7
    ## 10 Portugal               118.        1263    10.7
    ## 11 Germany                 99.6       8147    81.8
    ## 12 Peru                    97.4       2914    29.9
    ## 13 Iran                    93.4       7183    76.9
    ## 14 Brazil                  89.4      17971   201. 
    ## 15 Turkey                  54.3       4222    77.8
    ## 16 Romania                 52.0       1141    22.0
    ## 17 Mexico                  50.4       5666   112. 
    ## 18 Chile                   32.5        544    16.7
    ## 19 Czech Republic          29.0        304    10.5
    ## 20 Poland                  25.0        962    38.5

EOL
