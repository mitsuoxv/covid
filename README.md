WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-15

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
    ##  1 United States           13184.   553822             42
    ##  2 Spain                    3939.   169496             43
    ##  3 Italy                    3125.   159516             51
    ##  4 Germany                  2840.   125098             44
    ##  5 Turkey                   2254     61049             27
    ##  6 France                   2253.    97050             43
    ##  7 United Kingdom           2213.    88625             40
    ##  8 Iran                     1524.    73303             48
    ##  9 China                     981.    83696             85
    ## 10 Belgium                   782.    30589             39
    ## 11 Russia                    776.    21102             27
    ## 12 Canada                    747.    24786             33
    ## 13 Brazil                    711.    22169             31
    ## 14 Netherlands               678.    26551             39
    ## 15 Portugal                  526.    16934             32
    ## 16 India                     331.    10363             31
    ## 17 Ecuador                   273.     7529             27
    ## 18 Peru                      273.     7519             27
    ## 19 Chile                     254.     7525             29
    ## 20 Poland                    220.     6934             31

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        84.7                3645.             43
    ##  2 Belgium                      75.1                2940.             39
    ##  3 Italy                        51.8                2644.             51
    ##  4 Portugal                     49.2                1586.             32
    ##  5 United States                42.5                1785.             42
    ##  6 Netherlands                  40.7                1595.             39
    ##  7 United Kingdom               35.5                1421.             40
    ##  8 France                       34.8                1498.             43
    ##  9 Germany                      34.7                1529.             44
    ## 10 Turkey                       29.0                 785.             27
    ## 11 Canada                       22.2                 736.             33
    ## 12 Iran                         19.8                 953.             48
    ## 13 Ecuador                      18.5                 509.             27
    ## 14 Czech Republic               17.2                 578.             33
    ## 15 Chile                        15.2                 449.             29
    ## 16 Romania                       9.56                302.             31
    ## 17 Peru                          9.13                251.             27
    ## 18 Australia                     8.30                296.             35
    ## 19 Saudi Arabia                  6.06                192.             31
    ## 20 Poland                        5.72                180.             31

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Algeria                                  15.8         313     1983
    ##  2 France                                   15.4       14946    97050
    ##  3 Italy                                    12.8       20465   159516
    ##  4 United Kingdom                           12.8       11329    88625
    ##  5 Belgium                                  12.8        3903    30589
    ##  6 Netherlands                              10.6        2823    26551
    ##  7 Spain                                    10.3       17489   169496
    ##  8 Indonesia                                 8.76        399     4557
    ##  9 Democratic Republic of the Congo          8.30         20      241
    ## 10 Egypt                                     7.49        164     2190
    ## 11 Morocco                                   7.15        126     1763
    ## 12 Philippines                               6.39        315     4932
    ## 13 Mexico                                    6.35        296     4661
    ## 14 Iran                                      6.25       4585    73303
    ## 15 Iraq                                      5.66         78     1378
    ## 16 Brazil                                    5.52       1223    22169
    ## 17 Burkina Faso                              5.43         27      497
    ## 18 Bangladesh                                4.86         39      803
    ## 19 Romania                                   4.79        318     6633
    ## 20 Ecuador                                   4.72        355     7529

EOL
