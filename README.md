WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-13

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
    ##  1 United States           18545.  1298287             70
    ##  2 Russia                   4220.   232243             55
    ##  3 United Kingdom           3279.   223064             68
    ##  4 Spain                    3202.   227436             71
    ##  5 Italy                    2781.   219814             79
    ##  6 Brazil                   2756.   162699             59
    ##  7 Turkey                   2538.   139771             55
    ##  8 Germany                  2366.   170508             72
    ##  9 France                   1934.   137491             71
    ## 10 Iran                     1436.   109286             76
    ## 11 Peru                     1221.    67307             55
    ## 12 India                    1197.    70756             59
    ## 13 Canada                   1131.    69156             61
    ## 14 Belgium                   796.    53449             67
    ## 15 China                     745.    84451            113
    ## 16 Saudi Arabia              693.    41014             59
    ## 17 Mexico                    646.    35022             54
    ## 18 Netherlands               637.    42788             67
    ## 19 Pakistan                  560.    32081             57
    ## 20 Ecuador                   534.    29509             55

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       76.5               5138.             67
    ##  2 Spain                         68.8               4890.             71
    ##  3 United States                 59.8               4185.             70
    ##  4 United Kingdom                52.6               3578.             68
    ##  5 Italy                         46.1               3643.             79
    ##  6 Portugal                      43.0               2593.             60
    ##  7 Peru                          40.8               2251.             55
    ##  8 Netherlands                   38.3               2571.             67
    ##  9 Ecuador                       36.1               1995.             55
    ## 10 Canada                        33.6               2053.             61
    ## 11 Turkey                        32.6               1796.             55
    ## 12 Chile                         31.3               1795.             57
    ## 13 Russia                        30.0               1651.             55
    ## 14 France                        29.9               2123.             71
    ## 15 Germany                       28.9               2084.             72
    ## 16 Saudi Arabia                  26.9               1594.             59
    ## 17 Iran                          18.7               1421.             76
    ## 18 Brazil                        13.7                809.             59
    ## 19 Czech Republic                12.6                780.             61
    ## 20 Romania                       11.9                710.             59

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.3       26600   137491
    ##  2 Belgium                16.3        8707    53449
    ##  3 United Kingdom         14.4       32065   223064
    ##  4 Italy                  14.0       30739   219814
    ##  5 Netherlands            12.8        5456    42788
    ##  6 Spain                  11.8       26744   227436
    ##  7 Mexico                  9.89       3465    35022
    ##  8 Chad                    9.63         31      322
    ##  9 Algeria                 8.61        507     5891
    ## 10 Ecuador                 7.27       2145    29509
    ## 11 Canada                  7.09       4906    69156
    ## 12 Indonesia               6.95        991    14265
    ## 13 Brazil                  6.84      11123   162699
    ## 14 Burkina Faso            6.58         50      760
    ## 15 Philippines             6.55        726    11086
    ## 16 Romania                 6.24        972    15588
    ## 17 Iran                    6.12       6685   109286
    ## 18 United States           6.06      78652  1298287
    ## 19 Greece                  5.54        151     2726
    ## 20 Niger                   5.53         46      832

EOL
