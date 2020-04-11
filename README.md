WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-11

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
    ##  1 United States           11205.   425889             38
    ##  2 Spain                    3906.   152446             39
    ##  3 Italy                    3053.   143626             47
    ##  4 Germany                  2835.   113525             40
    ##  5 France                   2184.    85351             39
    ##  6 Turkey                   1830.    42282             23
    ##  7 United Kingdom           1805.    65081             36
    ##  8 Iran                     1502.    66220             44
    ##  9 China                    1025.    83305             81
    ## 10 Belgium                   711.    24983             35
    ## 11 Canada                    677.    19759             29
    ## 12 Netherlands               618.    21762             35
    ## 13 Brazil                    585.    15927             27
    ## 14 Russia                    512.    11917             23
    ## 15 Portugal                  494.    13956             28
    ## 16 India                     234.     6412             27
    ## 17 Chile                     233.     5972             25
    ## 18 Ecuador                   209.     4965             23
    ## 19 South Korea               203.    10450             51
    ## 20 Poland                    202.     5575             27

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        84.0                3278.             39
    ##  2 Belgium                      68.3                2402.             35
    ##  3 Italy                        50.6                2380.             47
    ##  4 Portugal                     46.3                1307.             28
    ##  5 Netherlands                  37.1                1307.             35
    ##  6 United States                36.1                1373.             38
    ##  7 Germany                      34.7                1388.             40
    ##  8 France                       33.7                1318.             39
    ##  9 United Kingdom               28.9                1044.             36
    ## 10 Turkey                       23.5                 543.             23
    ## 11 Canada                       20.1                 587.             29
    ## 12 Iran                         19.5                 861.             44
    ## 13 Czech Republic               17.9                 532.             29
    ## 14 Ecuador                      14.1                 336.             23
    ## 15 Chile                        13.9                 357.             25
    ## 16 Australia                     9.06                286.             31
    ## 17 Romania                       8.57                237.             27
    ## 18 Peru                          6.10                145.             23
    ## 19 Greece                        5.81                178.             27
    ## 20 Poland                        5.26                145.             27

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   14.3       12192    85351
    ##  2 Algeria                                  14.1         235     1666
    ##  3 Italy                                    12.7       18281   143626
    ##  4 United Kingdom                           12.3        7978    65081
    ##  5 Netherlands                              11.0        2396    21762
    ##  6 Belgium                                  10.1        2523    24983
    ##  7 Spain                                    10.0       15238   152446
    ##  8 Democratic Republic of the Congo          9.30         20      215
    ##  9 Indonesia                                 8.71        306     3512
    ## 10 Morocco                                   7.04         97     1377
    ## 11 Egypt                                     6.95        118     1699
    ## 12 Bangladesh                                6.36         21      330
    ## 13 Iran                                      6.21       4110    66220
    ## 14 Iraq                                      5.60         69     1232
    ## 15 Ecuador                                   5.48        272     4965
    ## 16 Mexico                                    5.47        174     3181
    ## 17 Brazil                                    5.02        800    15927
    ## 18 Philippines                               4.98        203     4076
    ## 19 Burkina Faso                              4.59         19      414
    ## 20 Romania                                   4.40        229     5202

EOL
