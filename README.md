WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-25

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
    ##  1 United States           15960.   830053             52
    ##  2 Spain                    4017.   213024             53
    ##  3 Italy                    3112.   189973             61
    ##  4 Germany                  2782.   150383             54
    ##  5 United Kingdom           2759.   138082             50
    ##  6 Turkey                   2746.   101790             37
    ##  7 France                   2253.   119583             53
    ##  8 Russia                   1851.    68622             37
    ##  9 Iran                     1498.    87026             58
    ## 10 Brazil                   1113.    45757             41
    ## 11 Canada                    946.    40813             43
    ## 12 China                     885.    84311             95
    ## 13 Belgium                   871.    42797             49
    ## 14 Netherlands               727.    35729             49
    ## 15 India                     560.    23077             41
    ## 16 Portugal                  530.    22353             42
    ## 17 Peru                      516.    19250             37
    ## 18 Saudi Arabia              337.    13930             41
    ## 19 Chile                     299.    11812             39
    ## 20 Ecuador                   298.    11183             37

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        86.4                4581.             53
    ##  2 Belgium                      83.7                4114.             49
    ##  3 Italy                        51.6                3148.             61
    ##  4 United States                51.4                2676.             52
    ##  5 Portugal                     49.6                2094.             42
    ##  6 United Kingdom               44.3                2215.             50
    ##  7 Netherlands                  43.6                2147.             49
    ##  8 Turkey                       35.3                1308.             37
    ##  9 France                       34.8                1846.             53
    ## 10 Germany                      34.0                1838.             54
    ## 11 Canada                       28.1                1212.             43
    ## 12 Ecuador                      20.2                 756.             37
    ## 13 Iran                         19.5                1131.             58
    ## 14 Chile                        17.8                 705.             39
    ## 15 Peru                         17.3                 644.             37
    ## 16 Czech Republic               15.7                 686.             43
    ## 17 Russia                       13.2                 488.             37
    ## 18 Saudi Arabia                 13.1                 541.             41
    ## 19 Romania                      11.1                 460.             41
    ## 20 Australia                     6.77                310.             45

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   18.2       21823   119583
    ##  2 Belgium                                  15.2        6490    42797
    ##  3 United Kingdom                           13.6       18738   138082
    ##  4 Algeria                                  13.5         407     3007
    ##  5 Italy                                    13.4       25549   189973
    ##  6 Netherlands                              11.7        4177    35729
    ##  7 Spain                                    10.4       22157   213024
    ##  8 Mexico                                    9.20        970    10544
    ##  9 Sudan                                     9.20         16      174
    ## 10 Indonesia                                 8.32        647     7775
    ## 11 Egypt                                     7.38        287     3891
    ## 12 Mali                                      6.80         21      309
    ## 13 Philippines                               6.62        462     6981
    ## 14 Brazil                                    6.35       2906    45757
    ## 15 Democratic Republic of the Congo          6.35         25      394
    ## 16 Burkina Faso                              6.33         38      600
    ## 17 Iran                                      6.30       5481    87026
    ## 18 China                                     5.51       4642    84311
    ## 19 Romania                                   5.22        527    10096
    ## 20 United States                             5.10      42311   830053

EOL
