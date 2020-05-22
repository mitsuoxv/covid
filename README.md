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

Updated: 2020-05-23

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
    ##  1 United States           19063.  1525186             80
    ##  2 Russia                   5020.   326448             65
    ##  3 Brazil                   4224.   291579             69
    ##  4 United Kingdom           3215.   250912             78
    ##  5 Spain                    2876.   233037             81
    ##  6 Italy                    2560.   228006             89
    ##  7 Turkey                   2359.   153548             65
    ##  8 Germany                  2160.   177212             82
    ##  9 France                   1746.   141590             81
    ## 10 India                    1715.   118447             69
    ## 11 Peru                     1598.   104020             65
    ## 12 Iran                     1502.   129341             86
    ## 13 Canada                   1133.    80555             71
    ## 14 Saudi Arabia              942.    65077             69
    ## 15 Mexico                    882.    56594             64
    ## 16 Chile                     798.    53617             67
    ## 17 Pakistan                  754.    50694             67
    ## 18 Belgium                   729.    56235             77
    ## 19 China                     685.    84520            123
    ## 20 Bangladesh                617.    28511             46

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       70.1               5406.             77
    ##  2 Spain                         61.8               5011.             81
    ##  3 United States                 61.4               4916.             80
    ##  4 Peru                          53.4               3478.             65
    ##  5 United Kingdom                51.6               4024.             78
    ##  6 Chile                         47.6               3202.             67
    ##  7 Italy                         42.4               3779.             89
    ##  8 Portugal                      39.9               2802.             70
    ##  9 Saudi Arabia                  36.6               2529.             69
    ## 10 Ecuador                       36.1               2356.             65
    ## 11 Russia                        35.7               2320.             65
    ## 12 Netherlands                   34.8               2685.             77
    ## 13 Canada                        33.6               2392.             71
    ## 14 Turkey                        30.3               1974.             65
    ## 15 France                        27.0               2186.             81
    ## 16 Germany                       26.4               2166.             82
    ## 17 Brazil                        21.0               1450.             69
    ## 18 Iran                          19.5               1681.             86
    ## 19 Czech Republic                11.6                836.             71
    ## 20 Romania                       11.5                801.             69

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.9       28164   141590
    ##  2 Yemen                  16.8          33      197
    ##  3 Belgium                16.3        9186    56235
    ##  4 United Kingdom         14.4       36042   250912
    ##  5 Italy                  14.2       32486   228006
    ##  6 Netherlands            12.9        5775    44700
    ##  7 Spain                  12.0       27940   233037
    ##  8 Mexico                 10.8        6090    56594
    ##  9 Chad                    9.86         58      588
    ## 10 Ecuador                 8.29       2888    34854
    ## 11 Canada                  7.53       6062    80555
    ## 12 Algeria                 7.44        575     7728
    ## 13 Romania                 6.55       1151    17585
    ## 14 Niger                   6.49         60      924
    ## 15 Brazil                  6.47      18859   291579
    ## 16 Burkina Faso            6.40         52      812
    ## 17 Indonesia               6.34       1278    20162
    ## 18 Philippines             6.30        846    13434
    ## 19 United States           6.00      91527  1525186
    ## 20 Mali                    5.91         55      931

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                883.        9186    10.4
    ##  2 Spain                  601.       27940    46.5
    ##  3 United Kingdom         578.       36042    62.3
    ##  4 Italy                  538.       32486    60.3
    ##  5 France                 435.       28164    64.8
    ##  6 Netherlands            347.        5775    16.6
    ##  7 United States          295.       91527   310. 
    ##  8 Ecuador                195.        2888    14.8
    ##  9 Canada                 180.        6062    33.7
    ## 10 Portugal               120.        1277    10.7
    ## 11 Peru                   101.        3024    29.9
    ## 12 Germany                 99.9       8174    81.8
    ## 13 Iran                    94.2       7249    76.9
    ## 14 Brazil                  93.8      18859   201. 
    ## 15 Turkey                  54.6       4249    77.8
    ## 16 Mexico                  54.1       6090   112. 
    ## 17 Romania                 52.4       1151    22.0
    ## 18 Chile                   32.5        544    16.7
    ## 19 Czech Republic          29.2        306    10.5
    ## 20 Poland                  25.2        972    38.5

EOL
