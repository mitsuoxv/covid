WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-30

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
    ##  1 United States           17252.   983457             57
    ##  2 Spain                    3632.   210773             58
    ##  3 Italy                    3051.   201505             66
    ##  4 United Kingdom           2928.   161149             55
    ##  5 Turkey                   2725.   114653             42
    ##  6 Germany                  2670.   157641             59
    ##  7 Russia                   2363.    99399             42
    ##  8 France                   2160.   125464             58
    ##  9 Iran                     1467.    92584             63
    ## 10 Brazil                   1443.    66501             46
    ## 11 Canada                   1018.    49014             48
    ## 12 Belgium                   875.    47334             54
    ## 13 China                     841.    84369            100
    ## 14 Netherlands               709.    38416             54
    ## 15 Peru                      680.    28699             42
    ## 16 India                     679.    31332             46
    ## 17 Ecuador                   574.    24258             42
    ## 18 Portugal                  515.    24322             47
    ## 19 Saudi Arabia              434.    20077             46
    ## 20 Mexico                    376.    15529             41

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      84.1                4550.             54
    ##  2 Spain                        78.1                4532.             58
    ##  3 United States                55.6                3170.             57
    ##  4 Italy                        50.6                3339.             66
    ##  5 Portugal                     48.2                2278.             47
    ##  6 United Kingdom               47.0                2585.             55
    ##  7 Netherlands                  42.6                2308.             54
    ##  8 Ecuador                      38.8                1640.             42
    ##  9 Turkey                       35.0                1474.             42
    ## 10 France                       33.3                1937.             58
    ## 11 Germany                      32.6                1927.             59
    ## 12 Canada                       30.2                1455.             48
    ## 13 Peru                         22.7                 960.             42
    ## 14 Chile                        19.3                 858.             44
    ## 15 Iran                         19.1                1204.             63
    ## 16 Saudi Arabia                 16.9                 780.             46
    ## 17 Russia                       16.8                 706.             42
    ## 18 Czech Republic               14.7                 716.             48
    ## 19 Romania                      11.4                 529.             46
    ## 20 Brazil                        7.18                331.             46

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   18.8       23627   125464
    ##  2 Belgium                                  15.5        7331    47334
    ##  3 Italy                                    13.6       27359   201505
    ##  4 United Kingdom                           13.5       21678   161149
    ##  5 Algeria                                  12.0         437     3649
    ##  6 Netherlands                              11.9        4566    38416
    ##  7 Spain                                    11.3       23822   210773
    ##  8 Mexico                                    9.23       1434    15529
    ##  9 Indonesia                                 8.13        773     9511
    ## 10 Sudan                                     7.86         25      318
    ## 11 Egypt                                     7.12        359     5042
    ## 12 Brazil                                    6.83       4543    66501
    ## 13 Philippines                               6.66        530     7958
    ## 14 Burkina Faso                              6.58         42      638
    ## 15 Iran                                      6.35       5877    92584
    ## 16 Democratic Republic of the Congo          6.11         30      491
    ## 17 Mali                                      5.66         24      424
    ## 18 Canada                                    5.64       2766    49014
    ## 19 Romania                                   5.60        650    11616
    ## 20 China                                     5.50       4643    84369

EOL
