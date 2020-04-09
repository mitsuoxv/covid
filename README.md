WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-10

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
    ##  1 United States           10674.   395030             37
    ##  2 Spain                    3857.   146690             38
    ##  3 Italy                    3028.   139422             46
    ##  4 Germany                  2771.   108202             39
    ##  5 France                   2129.    81095             38
    ##  6 United Kingdom           1732.    60737             35
    ##  7 Turkey                   1729.    38226             22
    ##  8 Iran                     1499.    64586             43
    ##  9 China                    1037.    83249             80
    ## 10 Belgium                   685.    23403             34
    ## 11 Canada                    653.    18433             28
    ## 12 Netherlands               601.    20549             34
    ## 13 Brazil                    523.    13717             26
    ## 14 Portugal                  483.    13141             27
    ## 15 Russia                    454.    10131             22
    ## 16 Chile                     225.     5546             24
    ## 17 India                     216.     5734             26
    ## 18 South Korea               206.    10423             50
    ## 19 Australia                 198      6052             30
    ## 20 Poland                    196.     5205             26

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        82.9                3154.             38
    ##  2 Belgium                      65.9                2250.             34
    ##  3 Italy                        50.2                2311.             46
    ##  4 Portugal                     45.2                1231.             27
    ##  5 Netherlands                  36.1                1235.             34
    ##  6 United States                34.4                1273.             37
    ##  7 Germany                      33.9                1323.             39
    ##  8 France                       32.9                1252.             38
    ##  9 United Kingdom               27.8                 974.             35
    ## 10 Turkey                       22.2                 491.             22
    ## 11 Iran                         19.5                 840.             43
    ## 12 Canada                       19.4                 547.             28
    ## 13 Czech Republic               17.7                 507.             28
    ## 14 Chile                        13.4                 331.             24
    ## 15 Ecuador                      13.2                 301.             22
    ## 16 Australia                     9.20                281.             30
    ## 17 Romania                       8.12                217.             26
    ## 18 Greece                        5.79                171.             26
    ## 19 Poland                        5.09                135.             26
    ## 20 Malaysia                      4.57                146.             31

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   13.4       10853    81095
    ##  2 Algeria                                  13.0         205     1572
    ##  3 Italy                                    12.7       17669   139422
    ##  4 United Kingdom                           11.7        7097    60737
    ##  5 Netherlands                              10.9        2248    20549
    ##  6 Spain                                     9.92      14555   146690
    ##  7 Democratic Republic of the Congo          9.66         20      207
    ##  8 Belgium                                   9.57       2240    23403
    ##  9 Bangladesh                                9.17         20      218
    ## 10 Indonesia                                 8.12        240     2956
    ## 11 Morocco                                   7.29         93     1275
    ## 12 Egypt                                     6.60        103     1560
    ## 13 Iran                                      6.18       3993    64586
    ## 14 Iraq                                      5.74         69     1202
    ## 15 Ecuador                                   5.44        242     4450
    ## 16 Mexico                                    5.06        141     2785
    ## 17 Burkina Faso                              4.95         19      384
    ## 18 Brazil                                    4.86        667    13717
    ## 19 Philippines                               4.70        182     3870
    ## 20 Greece                                    4.41         83     1884

EOL
