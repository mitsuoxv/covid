WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-13

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
    ##  1 United States           12319.   492881             40
    ##  2 Spain                    3945.   161852             41
    ##  3 Italy                    3105.   152271             49
    ##  4 Germany                  2865.   120479             42
    ##  5 France                   2258.    92787             41
    ##  6 Turkey                   2079.    52167             25
    ##  7 United Kingdom           2076.    78995             38
    ##  8 Iran                     1519.    70029             46
    ##  9 China                    1002.    83482             83
    ## 10 Belgium                   754.    28018             37
    ## 11 Canada                    723.    22544             31
    ## 12 Brazil                    673     19638             29
    ## 13 Netherlands               656.    24413             37
    ## 14 Russia                    625.    15770             25
    ## 15 Portugal                  529.    15987             30
    ## 16 India                     284.     8356             29
    ## 17 Ecuador                   284.     7257             25
    ## 18 Chile                     251.     6927             27
    ## 19 Peru                      230.     5897             25
    ## 20 Poland                    215.     6356             29

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        84.8                3480.             41
    ##  2 Belgium                      72.5                2693.             37
    ##  3 Italy                        51.5                2524.             49
    ##  4 Portugal                     49.6                1497.             30
    ##  5 United States                39.7                1589.             40
    ##  6 Netherlands                  39.4                1467.             37
    ##  7 Germany                      35.0                1473.             42
    ##  8 France                       34.9                1433.             41
    ##  9 United Kingdom               33.3                1267.             38
    ## 10 Turkey                       26.7                 670.             25
    ## 11 Canada                       21.5                 669.             31
    ## 12 Iran                         19.8                 910.             46
    ## 13 Ecuador                      19.2                 491.             25
    ## 14 Czech Republic               17.8                 563.             31
    ## 15 Chile                        15.0                 414.             27
    ## 16 Romania                       9.21                273.             29
    ## 17 Australia                     8.70                292.             33
    ## 18 Peru                          7.69                197.             25
    ## 19 Greece                        5.81                189.             29
    ## 20 Poland                        5.59                165.             29

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Algeria                                  15.1         275     1825
    ##  2 France                                   14.9       13814    92787
    ##  3 Italy                                    12.8       19470   152271
    ##  4 United Kingdom                           12.5        9875    78995
    ##  5 Belgium                                  11.9        3346    28018
    ##  6 Netherlands                              10.8        2643    24413
    ##  7 Spain                                    10.1       16353   161852
    ##  8 Democratic Republic of the Congo          8.97         20      223
    ##  9 Indonesia                                 8.80        373     4241
    ## 10 Egypt                                     7.53        146     1939
    ## 11 Morocco                                   7.18        111     1545
    ## 12 Iran                                      6.22       4357    70029
    ## 13 Mexico                                    6.06        233     3844
    ## 14 Philippines                               5.58        247     4428
    ## 15 Bangladesh                                5.48         34      621
    ## 16 Iraq                                      5.46         72     1318
    ## 17 Brazil                                    5.38       1056    19638
    ## 18 Romania                                   4.71        282     5990
    ## 19 Greece                                    4.47         93     2081
    ## 20 Ecuador                                   4.34        315     7257

EOL
