WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-24

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
    ##  1 United States           15702.   800926             51
    ##  2 Spain                    4005.   208389             52
    ##  3 Italy                    3120.   187327             60
    ##  4 Germany                  2791.   148046             53
    ##  5 Turkey                   2736.    98674             36
    ##  6 United Kingdom           2722.   133499             49
    ##  7 France                   2265.   117961             52
    ##  8 Russia                   1740.    62773             36
    ##  9 Iran                     1506.    85996             57
    ## 10 Brazil                   1074.    43079             40
    ## 11 Canada                    923.    38923             42
    ## 12 China                     894.    84302             94
    ## 13 Belgium                   870.    41889             48
    ## 14 Netherlands               723.    34842             48
    ## 15 Portugal                  533.    21982             41
    ## 16 India                     532.    21393             40
    ## 17 Peru                      491.    17837             36
    ## 18 Saudi Arabia              317.    12772             40
    ## 19 Ecuador                   297.    10850             36
    ## 20 Chile                     293.    11296             38

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        86.1                4481.             52
    ##  2 Belgium                      83.7                4027.             48
    ##  3 Italy                        51.7                3105.             60
    ##  4 United States                50.6                2582.             51
    ##  5 Portugal                     50.0                2059.             41
    ##  6 United Kingdom               43.7                2141.             49
    ##  7 Netherlands                  43.4                2093.             48
    ##  8 Turkey                       35.2                1268.             36
    ##  9 France                       35.0                1821.             52
    ## 10 Germany                      34.1                1810.             53
    ## 11 Canada                       27.4                1156.             42
    ## 12 Ecuador                      20.1                 734.             36
    ## 13 Iran                         19.6                1118.             57
    ## 14 Chile                        17.5                 675.             38
    ## 15 Peru                         16.4                 596.             36
    ## 16 Czech Republic               16.0                 681.             42
    ## 17 Russia                       12.4                 446.             36
    ## 18 Saudi Arabia                 12.3                 496.             40
    ## 19 Romania                      10.9                 442.             40
    ## 20 Australia                     6.91                309.             44

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   18.1       21307   117961
    ##  2 Belgium                                  14.9        6262    41889
    ##  3 Algeria                                  13.8         402     2910
    ##  4 United Kingdom                           13.6       18100   133499
    ##  5 Italy                                    13.4       25085   187327
    ##  6 Netherlands                              11.6        4054    34842
    ##  7 Spain                                    10.4       21717   208389
    ##  8 Mexico                                    9.02        857     9501
    ##  9 Indonesia                                 8.56        635     7418
    ## 10 Sudan                                     8.02         13      162
    ## 11 Egypt                                     7.54        276     3659
    ## 12 Democratic Republic of the Congo          6.96         25      359
    ## 13 Philippines                               6.65        446     6710
    ## 14 Brazil                                    6.36       2741    43079
    ## 15 Burkina Faso                              6.33         38      600
    ## 16 Iran                                      6.27       5391    85996
    ## 17 Mali                                      5.80         17      293
    ## 18 China                                     5.51       4642    84302
    ## 19 Romania                                   5.23        508     9710
    ## 20 Iraq                                      5.09         83     1631

EOL
