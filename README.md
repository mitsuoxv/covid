WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-19

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
    ##  1 United States           14461.   665330             46
    ##  2 Spain                    3999.   188068             47
    ##  3 Italy                    3133.   172434             55
    ##  4 Germany                  2861.   137439             48
    ##  5 Turkey                   2528.    78546             31
    ##  6 United Kingdom           2468.   108696             44
    ##  7 France                   2297.   108163             47
    ##  8 Iran                     1526.    79494             52
    ##  9 Russia                   1182.    36793             31
    ## 10 China                     943.    84180             89
    ## 11 Brazil                    866.    30425             35
    ## 12 Belgium                   838.    36138             43
    ## 13 Canada                    825.    30659             37
    ## 14 Netherlands               705.    30449             43
    ## 15 Portugal                  525.    19022             36
    ## 16 Peru                      430.    13489             31
    ## 17 India                     408.    14378             35
    ## 18 Chile                     276.     9252             33
    ## 19 Ecuador                   268.     8450             31
    ## 20 Poland                    236.     8379             35

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        86.0                4044.             47
    ##  2 Belgium                      80.5                3474.             43
    ##  3 Italy                        51.9                2858.             55
    ##  4 Portugal                     49.2                1782.             36
    ##  5 United States                46.6                2145.             46
    ##  6 Netherlands                  42.4                1829.             43
    ##  7 United Kingdom               39.6                1743.             44
    ##  8 France                       35.5                1670.             47
    ##  9 Germany                      35.0                1680.             48
    ## 10 Turkey                       32.5                1010.             31
    ## 11 Canada                       24.5                 910.             37
    ## 12 Iran                         19.8                1033.             52
    ## 13 Ecuador                      18.1                 571.             31
    ## 14 Czech Republic               16.6                 625.             37
    ## 15 Chile                        16.5                 552.             33
    ## 16 Peru                         14.4                 451.             31
    ## 17 Romania                      10.3                 367.             35
    ## 18 Russia                        8.40                261.             31
    ## 19 Saudi Arabia                  7.82                278.             35
    ## 20 Australia                     7.65                304.             39

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   17.3       18659   108163
    ##  2 Algeria                                  15.1         364     2418
    ##  3 Belgium                                  14.3        5163    36138
    ##  4 United Kingdom                           13.4       14576   108696
    ##  5 Italy                                    13.2       22747   172434
    ##  6 Netherlands                              11.4        3459    30449
    ##  7 Spain                                    10.4       19478   188068
    ##  8 Indonesia                                 8.78        520     5923
    ##  9 Democratic Republic of the Congo          8.01         23      287
    ## 10 Mexico                                    7.72        486     6297
    ## 11 Egypt                                     7.21        205     2844
    ## 12 Mali                                      6.84         13      190
    ## 13 Philippines                               6.58        387     5878
    ## 14 Brazil                                    6.32       1924    30425
    ## 15 Iran                                      6.24       4958    79494
    ## 16 Burkina Faso                              5.85         32      547
    ## 17 China                                     5.51       4642    84180
    ## 18 Iraq                                      5.47         81     1482
    ## 19 Morocco                                   5.27        135     2564
    ## 20 Ecuador                                   4.98        421     8450

EOL
