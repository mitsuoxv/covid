WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-29

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
    ##  1 United States           17157.   960916             56
    ##  2 Spain                    3673.   209465             57
    ##  3 Italy                    3066    199414             65
    ##  4 United Kingdom           2908.   157153             54
    ##  5 Turkey                   2733.   112261             41
    ##  6 Germany                  2693.   156337             58
    ##  7 Russia                   2278.    93558             41
    ##  8 France                   2225.   127008             57
    ##  9 Iran                     1473.    91472             62
    ## 10 Brazil                   1373.    61888             45
    ## 11 Canada                   1004.    47316             47
    ## 12 Belgium                   879.    46687             53
    ## 13 China                     849.    84347             99
    ## 14 Netherlands               719.    38245             53
    ## 15 Peru                      668.    27517             41
    ## 16 India                     652.    29435             45
    ## 17 Ecuador                   563.    23240             41
    ## 18 Portugal                  520.    24027             46
    ## 19 Saudi Arabia              416.    18811             45
    ## 20 Mexico                    364.    14677             40

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      84.5                4488.             53
    ##  2 Spain                        79.0                4504.             57
    ##  3 United States                55.3                3097.             56
    ##  4 Italy                        50.8                3305.             65
    ##  5 Portugal                     48.7                2251.             46
    ##  6 United Kingdom               46.6                2521.             54
    ##  7 Netherlands                  43.2                2298.             53
    ##  8 Ecuador                      38.1                1571.             41
    ##  9 Turkey                       35.1                1443.             41
    ## 10 France                       34.4                1961.             57
    ## 11 Germany                      32.9                1911.             58
    ## 12 Canada                       29.8                1405.             47
    ## 13 Peru                         22.3                 920.             41
    ## 14 Iran                         19.1                1189.             62
    ## 15 Chile                        19.0                 825.             43
    ## 16 Russia                       16.2                 665.             41
    ## 17 Saudi Arabia                 16.2                 731.             45
    ## 18 Czech Republic               14.9                 711.             47
    ## 19 Romania                      11.4                 516.             45
    ## 20 Brazil                        6.83                308.             45

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   18.3       23261   127008
    ##  2 Belgium                                  15.4        7207    46687
    ##  3 Italy                                    13.5       26977   199414
    ##  4 United Kingdom                           13.4       21092   157153
    ##  5 Algeria                                  12.3         432     3517
    ##  6 Netherlands                              11.8        4518    38245
    ##  7 Spain                                    11.1       23190   209465
    ##  8 Mexico                                    9.20       1351    14677
    ##  9 Indonesia                                 8.41        765     9096
    ## 10 Sudan                                     8            22      275
    ## 11 Egypt                                     7.05        337     4782
    ## 12 Brazil                                    6.79       4205    61888
    ## 13 Burkina Faso                              6.65         42      632
    ## 14 Philippines                               6.57        511     7777
    ## 15 Democratic Republic of the Congo          6.37         30      471
    ## 16 Iran                                      6.35       5806    91472
    ## 17 Mali                                      5.64         23      408
    ## 18 Romania                                   5.56        631    11339
    ## 19 Canada                                    5.53       2617    47316
    ## 20 China                                     5.50       4643    84347

EOL
