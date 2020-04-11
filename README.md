WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-12

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
    ##  1 United States           11825.   461275             39
    ##  2 Spain                    3923.   157022             40
    ##  3 Italy                    3072.   147577             48
    ##  4 Germany                  2867.   117658             41
    ##  5 France                   2237.    89683             40
    ##  6 Turkey                   1952.    47029             24
    ##  7 United Kingdom           1896.    70276             37
    ##  8 Iran                     1512.    68192             45
    ##  9 China                    1013.    83369             82
    ## 10 Belgium                   738.    26667             36
    ## 11 Canada                    703.    21226             30
    ## 12 Netherlands               638.    23097             36
    ## 13 Brazil                    633.    17857             28
    ## 14 Russia                    560.    13584             24
    ## 15 Portugal                  530.    15472             29
    ## 16 Ecuador                   292.     7161             24
    ## 17 India                     262.     7447             28
    ## 18 Chile                     244.     6501             26
    ## 19 Peru                      213.     5256             24
    ## 20 Poland                    209.     5955             28

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        84.3                3376.             40
    ##  2 Belgium                      70.9                2563.             36
    ##  3 Italy                        50.9                2446.             48
    ##  4 Portugal                     49.6                1449.             29
    ##  5 Netherlands                  38.3                1388.             36
    ##  6 United States                38.1                1487.             39
    ##  7 Germany                      35.0                1438.             41
    ##  8 France                       34.5                1385.             40
    ##  9 United Kingdom               30.4                1127.             37
    ## 10 Turkey                       25.1                 604.             24
    ## 11 Canada                       20.9                 630.             30
    ## 12 Ecuador                      19.7                 484.             24
    ## 13 Iran                         19.7                 886.             45
    ## 14 Czech Republic               17.9                 547.             30
    ## 15 Chile                        14.6                 388.             26
    ## 16 Australia                     8.90                290.             32
    ## 17 Romania                       8.69                249.             28
    ## 18 Peru                          7.12                176.             24
    ## 19 Greece                        5.79                183.             28
    ## 20 Poland                        5.42                155.             28

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   14.7       13179    89683
    ##  2 Algeria                                  14.5         256     1761
    ##  3 Italy                                    12.8       18851   147577
    ##  4 United Kingdom                           12.7        8958    70276
    ##  5 Belgium                                  11.3        3019    26667
    ##  6 Netherlands                              10.9        2511    23097
    ##  7 Spain                                    10.1       15843   157022
    ##  8 Democratic Republic of the Congo          9.30         20      215
    ##  9 Indonesia                                 8.71        306     3512
    ## 10 Egypt                                     7.53        135     1794
    ## 11 Morocco                                   7.39        107     1448
    ## 12 Bangladesh                                6.37         27      424
    ## 13 Iran                                      6.21       4232    68192
    ## 14 Mexico                                    5.64        194     3441
    ## 15 Iraq                                      5.55         71     1280
    ## 16 Brazil                                    5.27        941    17857
    ## 17 Philippines                               5.27        221     4195
    ## 18 Romania                                   4.70        257     5467
    ## 19 Greece                                    4.48         90     2011
    ## 20 Burkina Faso                              4.29         19      443

EOL
