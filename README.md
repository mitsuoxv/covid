WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)

Updated: 2020-03-25

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
    ##  1 Italy                   2127.     63927             30
    ##  2 United States           2003.     42164             21
    ##  3 Spain                   1499.     33089             22
    ##  4 China                   1273.     81747             64
    ##  5 Germany                 1264.     29212             23
    ##  6 France                   883.     19615             22
    ##  7 Iran                     848.     23049             27
    ##  8 United Kingdom           344       6654             19
    ##  9 South Korea              263.      9037             34
    ## 10 Netherlands              257.      4749             18
    ## 11 Turkey                   223       1529              6
    ## 12 Belgium                  202.      3743             18
    ## 13 Portugal                 177.      2060             11
    ## 14 Brazil                   142.      1546             10
    ## 15 Australia                114.      1709             14
    ## 16 Canada                   108.      1432             12
    ## 17 Ecuador                  106.       790              6
    ## 18 Malaysia                  93.4     1518             15
    ## 19 Czech Republic            93.3     1236             12
    ## 20 Pakistan                  87.5      887              8

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million. Highest
“speed\_std\_since\_100”, which is per day growth of cumulative cases
per 1 million since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Italy                        35.2               1059.              30
    ##  2 Spain                        32.2                712.              22
    ##  3 Belgium                      19.4                360.              18
    ##  4 Portugal                     16.6                193.              11
    ##  5 Germany                      15.5                357.              23
    ##  6 Netherlands                  15.4                285.              18
    ##  7 France                       13.6                303.              22
    ##  8 Iran                         11.0                300.              27
    ##  9 Czech Republic                8.91               118.              12
    ## 10 Ecuador                       7.16                53.4              6
    ## 11 United States                 6.46               136.              21
    ## 12 United Kingdom                5.52               107.              19
    ## 13 South Korea                   5.43               187.              34
    ## 14 Australia                     5.30                79.4             14
    ## 15 Chile                         4.40                44.5              8
    ## 16 Greece                        4.25                63.2             10
    ## 17 Malaysia                      3.30                53.7             15
    ## 18 Canada                        3.20                42.5             12
    ## 19 Turkey                        2.87                19.7              6
    ## 20 Romania                       2.06                26.2             10

EOL
