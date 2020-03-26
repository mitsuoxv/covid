WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-03-27

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
“speed\_since\_100”, which is per day average newly confirmed cases
since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           2759.     63570             23
    ##  2 Italy                   2321.     74386             32
    ##  3 Spain                   1979      47610             24
    ##  4 Germany                 1455.     36508             25
    ##  5 China                   1238.     81961             66
    ##  6 France                  1030.     24920             24
    ##  7 Iran                     927.     27017             29
    ##  8 United Kingdom           448.      9533             21
    ##  9 Netherlands              314.      6412             20
    ## 10 Turkey                   280.      2433              8
    ## 11 South Korea              254.      9241             36
    ## 12 Belgium                  241.      4937             20
    ## 13 Canada                   234.      3409             14
    ## 14 Portugal                 222.      2995             13
    ## 15 Brazil                   193.      2433             12
    ## 16 Australia                168.      2799             16
    ## 17 Ecuador                  132       1211              8
    ## 18 Czech Republic           110.      1654             14
    ## 19 Malaysia                  98.8     1796             17
    ## 20 Chile                     98.6     1142             10

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million. Highest
“speed\_std\_since\_100”, which is per day growth of cumulative cases
per 1 million since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        42.6               1024.              24
    ##  2 Italy                        38.5               1233.              32
    ##  3 Belgium                      23.2                475.              20
    ##  4 Portugal                     20.8                281.              13
    ##  5 Netherlands                  18.9                385.              20
    ##  6 Germany                      17.8                446.              25
    ##  7 France                       15.9                385.              24
    ##  8 Iran                         12.0                351.              29
    ##  9 Czech Republic               10.5                158.              14
    ## 10 Ecuador                       8.92                81.9              8
    ## 11 United States                 8.89               205.              23
    ## 12 Australia                     7.81               130.              16
    ## 13 United Kingdom                7.19               153.              21
    ## 14 Canada                        6.94               101.              14
    ## 15 Chile                         5.89                68.2             10
    ## 16 South Korea                   5.24               191.              36
    ## 17 Greece                        4.49                74.6             12
    ## 18 Turkey                        3.60                31.3              8
    ## 19 Malaysia                      3.49                63.5             17
    ## 20 Romania                       2.97                41.3             12

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Italy                  10.1        7505    74386
    ##  2 Iraq                    8.38         29      346
    ##  3 Iran                    7.69       2077    27017
    ##  4 Indonesia               7.34         58      790
    ##  5 Spain                   7.21       3434    47610
    ##  6 Algeria                 6.44         17      264
    ##  7 Philippines             5.97         38      636
    ##  8 Netherlands             5.55        356     6412
    ##  9 France                  5.34       1331    24920
    ## 10 United Kingdom          4.86        463     9533
    ## 11 Egypt                   4.61         21      456
    ## 12 China                   4.02       3293    81961
    ## 13 Belgium                 3.61        178     4937
    ## 14 Japan                   3.49         45     1291
    ## 15 Greece                  2.68         22      821
    ## 16 Turkey                  2.42         59     2433
    ## 17 Ecuador                 2.39         29     1211
    ## 18 Brazil                  2.34         57     2433
    ## 19 India                   2.00         13      649
    ## 20 Portugal                1.44         43     2995

EOL
