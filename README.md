WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-21

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
    ##  1 United States           15073.   723605             48
    ##  2 Spain                    3997.   195944             49
    ##  3 Italy                    3138.   178972             57
    ##  4 Germany                  2831.   141672             50
    ##  5 Turkey                   2610.    86306             33
    ##  6 United Kingdom           2608.   120071             46
    ##  7 France                   2271.   111463             49
    ##  8 Iran                     1520.    82211             54
    ##  9 Russia                   1294.    42853             33
    ## 10 Brazil                    986.    36599             37
    ## 11 China                     923.    84237             91
    ## 12 Canada                    866.    33909             39
    ## 13 Belgium                   853.    38496             45
    ## 14 Netherlands               723.    32655             45
    ## 15 Portugal                  529.    20206             38
    ## 16 India                     464.    17265             37
    ## 17 Peru                      433.    14420             33
    ## 18 Chile                     307.    10888             35
    ## 19 Ecuador                   282.     9468             33
    ## 20 Saudi Arabia              250.     9362             37

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        85.9                4213.             49
    ##  2 Belgium                      82.0                3700.             45
    ##  3 Italy                        52.0                2966.             57
    ##  4 Portugal                     49.5                1893.             38
    ##  5 United States                48.6                2332.             48
    ##  6 Netherlands                  43.4                1962.             45
    ##  7 United Kingdom               41.8                1926.             46
    ##  8 France                       35.1                1721.             49
    ##  9 Germany                      34.6                1732.             50
    ## 10 Turkey                       33.5                1109.             33
    ## 11 Canada                       25.7                1007.             39
    ## 12 Iran                         19.8                1069.             54
    ## 13 Ecuador                      19.1                 640.             33
    ## 14 Chile                        18.3                 650.             35
    ## 15 Czech Republic               16.3                 648.             39
    ## 16 Peru                         14.5                 482.             33
    ## 17 Romania                      10.6                 398.             37
    ## 18 Saudi Arabia                  9.73                364.             37
    ## 19 Russia                        9.20                305.             33
    ## 20 Australia                     7.37                307.             41

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   17.7       19689   111463
    ##  2 Belgium                                  14.8        5683    38496
    ##  3 Algeria                                  14.3         375     2629
    ##  4 United Kingdom                           13.4       16060   120071
    ##  5 Italy                                    13.2       23660   178972
    ##  6 Sudan                                    13.0          12       92
    ##  7 Netherlands                              11.3        3684    32655
    ##  8 Spain                                    10.4       20453   195944
    ##  9 Indonesia                                 8.85        582     6575
    ## 10 Mexico                                    8.67        650     7497
    ## 11 Egypt                                     7.60        239     3144
    ## 12 Democratic Republic of the Congo          7.53         25      332
    ## 13 Philippines                               6.53        409     6259
    ## 14 Brazil                                    6.41       2347    36599
    ## 15 Burkina Faso                              6.37         36      565
    ## 16 Mali                                      6.25         14      224
    ## 17 Iran                                      6.23       5118    82211
    ## 18 China                                     5.51       4642    84237
    ## 19 Iraq                                      5.33         82     1539
    ## 20 Kenya                                     5.19         14      270

EOL
