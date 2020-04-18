WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-18

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
    ##  1 United States           14059.   632781             45
    ##  2 Spain                    3972.   182816             46
    ##  3 Italy                    3126.   168941             54
    ##  4 Germany                  2845.   133830             47
    ##  5 Turkey                   2467.    74193             30
    ##  6 United Kingdom           2395.   103097             43
    ##  7 France                   2339.   107778             46
    ##  8 Iran                     1527.    77995             51
    ##  9 Russia                   1062.    32008             30
    ## 10 China                     953.    84149             88
    ## 11 Brazil                    829.    28320             34
    ## 12 Belgium                   826.    34809             42
    ## 13 Canada                    798.    28884             36
    ## 14 Netherlands               693.    29214             42
    ## 15 Portugal                  535.    18841             35
    ## 16 India                     391.    13387             34
    ## 17 Peru                      378.    11475             30
    ## 18 Chile                     270.     8807             32
    ## 19 Ecuador                   269      8225             30
    ## 20 Poland                    230.     7918             34

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        85.4                3931.             46
    ##  2 Belgium                      79.4                3346.             42
    ##  3 Italy                        51.8                2800.             54
    ##  4 Portugal                     50.1                1765.             35
    ##  5 United States                45.3                2040.             45
    ##  6 Netherlands                  41.6                1755.             42
    ##  7 United Kingdom               38.4                1654.             43
    ##  8 France                       36.1                1664.             46
    ##  9 Germany                      34.8                1636.             47
    ## 10 Turkey                       31.7                 954.             30
    ## 11 Canada                       23.7                 858.             36
    ## 12 Iran                         19.8                1014.             51
    ## 13 Ecuador                      18.2                 556.             30
    ## 14 Czech Republic               16.7                 614.             36
    ## 15 Chile                        16.1                 526.             32
    ## 16 Peru                         12.6                 384.             30
    ## 17 Romania                      10.2                 351.             34
    ## 18 Australia                     7.77                301.             38
    ## 19 Russia                        7.55                227.             30
    ## 20 Saudi Arabia                  7.17                248.             34

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   16.6       17899   107778
    ##  2 Algeria                                  15.3         348     2268
    ##  3 Belgium                                  14.0        4857    34809
    ##  4 United Kingdom                           13.3       13729   103097
    ##  5 Italy                                    13.1       22172   168941
    ##  6 Netherlands                              11.3        3315    29214
    ##  7 Spain                                    10.5       19130   182816
    ##  8 Indonesia                                 8.99        496     5516
    ##  9 Democratic Republic of the Congo          8.01         23      287
    ## 10 Mexico                                    7.68        449     5847
    ## 11 Mali                                      7.60         13      171
    ## 12 Egypt                                     7.33        196     2673
    ## 13 Philippines                               6.40        362     5660
    ## 14 Iran                                      6.24       4869    77995
    ## 15 Brazil                                    6.13       1736    28320
    ## 16 Burkina Faso                              5.89         32      543
    ## 17 Morocco                                   5.69        130     2283
    ## 18 Iraq                                      5.58         80     1434
    ## 19 China                                     5.52       4642    84149
    ## 20 Romania                                   5.02        387     7707

EOL
