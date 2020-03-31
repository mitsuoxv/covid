WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-01

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
    ##  1 United States            5019    140640             28
    ##  2 Spain                    2934.    85195             29
    ##  3 Italy                    2746.   101739             37
    ##  4 Germany                  2059.    61913             30
    ##  5 France                   1510.    43977             29
    ##  6 Iran                     1216.    41495             34
    ##  7 China                    1159.    82545             71
    ##  8 United Kingdom            847.    22145             26
    ##  9 Turkey                    818.    10827             13
    ## 10 Belgium                   472.    11899             25
    ## 11 Netherlands               465.    11750             25
    ## 12 Portugal                  350.     6408             18
    ## 13 Canada                    325.     6317             19
    ## 14 Brazil                    243.     4256             17
    ## 15 South Korea               236.     9786             41
    ## 16 Australia                 202.     4359             21
    ## 17 Chile                     153.     2449             15
    ## 18 Czech Republic            152.     3002             19
    ## 19 Ecuador                   139      1962             13
    ## 20 Russia                    130      1837             13

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        63.1               1832.              29
    ##  2 Italy                        45.5               1686.              37
    ##  3 Belgium                      45.3               1144.              25
    ##  4 Portugal                     32.8                600.              18
    ##  5 Netherlands                  27.9                706.              25
    ##  6 Germany                      25.2                757.              30
    ##  7 France                       23.3                679.              29
    ##  8 United States                16.2                453.              28
    ##  9 Iran                         15.8                539.              34
    ## 10 Czech Republic               14.5                287.              19
    ## 11 United Kingdom               13.6                355.              26
    ## 12 Turkey                       10.5                139.              13
    ## 13 Canada                        9.66               188.              19
    ## 14 Australia                     9.40               203.              21
    ## 15 Ecuador                       9.40               133.              13
    ## 16 Chile                         9.13               146.              15
    ## 17 Greece                        5.26               110.              17
    ## 18 Romania                       4.90                88.9             17
    ## 19 South Korea                   4.88               202.              41
    ## 20 Malaysia                      4.03                92.9             22

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Italy                  11.4       11591   101739
    ##  2 Indonesia               8.63        122     1414
    ##  3 Spain                   8.62       7340    85195
    ##  4 Netherlands             7.35        864    11750
    ##  5 Iraq                    7.30         46      630
    ##  6 France                  6.86       3017    43977
    ##  7 Iran                    6.64       2757    41495
    ##  8 United Kingdom          6.36       1408    22145
    ##  9 Egypt                   6.25         41      656
    ## 10 Algeria                 6.07         31      511
    ## 11 Morocco                 5.75         33      574
    ## 12 Philippines             5.05         78     1546
    ## 13 Burkina Faso            4.88         12      246
    ## 14 Belgium                 4.31        513    11899
    ## 15 China                   4.01       3314    82545
    ## 16 Greece                  3.55         43     1212
    ## 17 Brazil                  3.20        136     4256
    ## 18 Ecuador                 3.06         60     1962
    ## 19 Japan                   2.87         56     1953
    ## 20 India                   2.71         29     1071

EOL
