WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-17

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
    ##  1 United States           13726.   604070             44
    ##  2 Spain                    3945.   177633             45
    ##  3 Italy                    3114.   165155             53
    ##  4 Germany                  2833.   130450             46
    ##  5 Turkey                   2386.    69392             29
    ##  6 United Kingdom           2342.    98480             42
    ##  7 France                   2333.   105155             45
    ##  8 Iran                     1525.    76389             50
    ##  9 China                     960.    83797             87
    ## 10 Russia                    958.    27938             29
    ## 11 Belgium                   816.    33573             41
    ## 12 Canada                    783.    27540             35
    ## 13 Brazil                    762.    25262             33
    ## 14 Netherlands               684.    28153             41
    ## 15 Portugal                  529.    18091             34
    ## 16 India                     372.    12380             33
    ## 17 Peru                      350.    10303             29
    ## 18 Ecuador                   266.     7858             29
    ## 19 Chile                     262.     8273             31
    ## 20 Poland                    226.     7582             33

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        84.8                3820.             45
    ##  2 Belgium                      78.5                3227.             41
    ##  3 Italy                        51.6                2737.             53
    ##  4 Portugal                     49.5                1695.             34
    ##  5 United States                44.2                1947.             44
    ##  6 Netherlands                  41.1                1691.             41
    ##  7 United Kingdom               37.6                1580.             42
    ##  8 France                       36.0                1624.             45
    ##  9 Germany                      34.6                1595.             46
    ## 10 Turkey                       30.7                 892.             29
    ## 11 Canada                       23.2                 818.             35
    ## 12 Iran                         19.8                 993.             50
    ## 13 Ecuador                      18.0                 531.             29
    ## 14 Czech Republic               16.9                 602.             35
    ## 15 Chile                        15.6                 494.             31
    ## 16 Peru                         11.7                 345.             29
    ## 17 Romania                       9.79                329.             33
    ## 18 Australia                     7.97                300.             37
    ## 19 Russia                        6.81                199.             29
    ## 20 Saudi Arabia                  6.78                228.             33

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   16.3       17146   105155
    ##  2 Algeria                                  15.6         336     2160
    ##  3 Belgium                                  13.2        4440    33573
    ##  4 Italy                                    13.1       21647   165155
    ##  5 United Kingdom                           13.1       12868    98480
    ##  6 Netherlands                              11.1        3134    28153
    ##  7 Spain                                    10.5       18579   177633
    ##  8 Indonesia                                 9.13        469     5136
    ##  9 Mali                                      9.03         13      144
    ## 10 Democratic Republic of the Congo          8.24         22      267
    ## 11 Mexico                                    7.52        406     5399
    ## 12 Egypt                                     7.31        183     2505
    ## 13 Philippines                               6.40        349     5453
    ## 14 Morocco                                   6.27        127     2024
    ## 15 Iran                                      6.25       4777    76389
    ## 16 Brazil                                    6.06       1532    25262
    ## 17 Iraq                                      5.58         79     1415
    ## 18 Burkina Faso                              5.30         28      528
    ## 19 Romania                                   5.16        372     7216
    ## 20 Ecuador                                   4.94        388     7858

EOL
