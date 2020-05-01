WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-02

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
    ##  1 United States           17547.  1035353             59
    ##  2 Spain                    3555.   213435             60
    ##  3 Italy                    3020.   205463             68
    ##  4 United Kingdom           3002.   171257             57
    ##  5 Turkey                   2728.   120204             44
    ##  6 Germany                  2606.   159119             61
    ##  7 Russia                   2597.   114431             44
    ##  8 France                   2132.   128121             60
    ##  9 Brazil                   1626.    78162             48
    ## 10 Iran                     1454.    94640             65
    ## 11 Canada                   1038.    52056             50
    ## 12 Belgium                   864.    48519             56
    ## 13 China                     825.    84385            102
    ## 14 Peru                      768.    33931             44
    ## 15 India                     728.    35043             48
    ## 16 Netherlands               700.    39316             56
    ## 17 Ecuador                   563.    24934             44
    ## 18 Portugal                  509.    25056             49
    ## 19 Saudi Arabia              472.    22753             48
    ## 20 Mexico                    411.    17799             43

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      83.1                4664.             56
    ##  2 Spain                        76.4                4589.             60
    ##  3 United States                56.6                3337.             59
    ##  4 Italy                        50.0                3405.             68
    ##  5 United Kingdom               48.2                2747.             57
    ##  6 Portugal                     47.7                2347.             49
    ##  7 Netherlands                  42.0                2362.             56
    ##  8 Ecuador                      38.1                1686.             44
    ##  9 Turkey                       35.1                1545.             44
    ## 10 France                       32.9                1978.             60
    ## 11 Germany                      31.9                1945.             61
    ## 12 Canada                       30.8                1546.             50
    ## 13 Peru                         25.7                1135.             44
    ## 14 Chile                        20.6                 957.             46
    ## 15 Iran                         18.9                1230.             65
    ## 16 Russia                       18.5                 813.             44
    ## 17 Saudi Arabia                 18.3                 884.             48
    ## 18 Czech Republic               14.4                 733.             50
    ## 19 Romania                      11.5                 557.             48
    ## 20 Brazil                        8.08                389.             48

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   19.0       24342   128121
    ##  2 Belgium                                  15.7        7594    48519
    ##  3 United Kingdom                           15.6       26771   171257
    ##  4 Italy                                    13.6       27967   205463
    ##  5 Netherlands                              12.2        4795    39316
    ##  6 Spain                                    11.5       24543   213435
    ##  7 Algeria                                  11.2         450     4006
    ##  8 Mexico                                    9.73       1732    17799
    ##  9 Indonesia                                 7.83        792    10118
    ## 10 Egypt                                     7.08        392     5537
    ## 11 Sudan                                     7.01         31      442
    ## 12 Brazil                                    6.99       5466    78162
    ## 13 Philippines                               6.69        568     8488
    ## 14 Burkina Faso                              6.67         43      645
    ## 15 Iran                                      6.37       6028    94640
    ## 16 Canada                                    5.92       3082    52056
    ## 17 Romania                                   5.86        717    12240
    ## 18 China                                     5.50       4643    84385
    ## 19 Democratic Republic of the Congo          5.42         31      572
    ## 20 Greece                                    5.40        140     2591

EOL
