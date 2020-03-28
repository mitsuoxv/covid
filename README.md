WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-03-29

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
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States            3405.    85228             25
    ##  2 Italy                    2540.    86498             34
    ##  3 Spain                    2459.    64059             26
    ##  4 Germany                  1795.    48582             27
    ##  5 France                   1244.    32542             26
    ##  6 China                    1205.    82230             68
    ##  7 Iran                     1038.    32332             31
    ##  8 United Kingdom            627.    14547             23
    ##  9 Turkey                    551.     5698             10
    ## 10 Netherlands               385.     8603             22
    ## 11 Belgium                   326.     7284             22
    ## 12 Portugal                  277.     4268             15
    ## 13 South Korea               247.     9478             38
    ## 14 Canada                    242.     4018             16
    ## 15 Brazil                    200.     2915             14
    ## 16 Australia                 196.     3635             18
    ## 17 Ecuador                   144      1595             10
    ## 18 Czech Republic            135.     2279             16
    ## 19 Chile                     121.     1610             12
    ## 20 Russia                    112.     1264             10

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population. Highest
“speed\_std\_since\_100”, which is per day growth of cumulative cases
per 1 million population since cumulative cases became more than 100,
are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        52.9               1377.              26
    ##  2 Italy                        42.1               1434.              34
    ##  3 Belgium                      31.4                700.              22
    ##  4 Portugal                     26.0                400.              15
    ##  5 Netherlands                  23.1                517.              22
    ##  6 Germany                      21.9                594.              27
    ##  7 France                       19.2                502.              26
    ##  8 Iran                         13.5                420.              31
    ##  9 Czech Republic               12.9                218.              16
    ## 10 United States                11.0                275.              25
    ## 11 United Kingdom               10.1                233.              23
    ## 12 Ecuador                       9.74               108.              10
    ## 13 Australia                     9.10               169.              18
    ## 14 Chile                         7.24                96.1             12
    ## 15 Canada                        7.20               119.              16
    ## 16 Turkey                        7.08                73.2             10
    ## 17 South Korea                   5.09               196.              38
    ## 18 Greece                        4.79                87.8             14
    ## 19 Malaysia                      3.80                76.4             19
    ## 20 Romania                       3.80                58.8             14

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Italy                  10.6        9136    86498
    ##  2 Iraq                    8.73         40      458
    ##  3 Indonesia               8.32         87     1046
    ##  4 Spain                   7.58       4858    64059
    ##  5 Iran                    7.35       2378    32332
    ##  6 Algeria                 6.81         25      367
    ##  7 Philippines             6.72         54      803
    ##  8 Morocco                 6.42         23      358
    ##  9 Netherlands             6.35        546     8603
    ## 10 France                  6.12       1992    32542
    ## 11 Egypt                   5.60         30      536
    ## 12 United Kingdom          5.22        759    14547
    ## 13 China                   4.01       3301    82230
    ## 14 Belgium                 3.97        289     7284
    ## 15 Japan                   3.27         49     1499
    ## 16 Greece                  2.90         28      966
    ## 17 Brazil                  2.64         77     2915
    ## 18 India                   2.35         17      724
    ## 19 Ecuador                 2.26         36     1595
    ## 20 Argentina               2.04         12      589

EOL
