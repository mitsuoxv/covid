WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-03

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
    ##  1 United States            6240.   187302             30
    ##  2 Spain                    3291.   102136             31
    ##  3 Italy                    2832.   110574             39
    ##  4 Germany                  2294.    73522             32
    ##  5 France                   1809.    56261             31
    ##  6 Iran                     1318.    47593             36
    ##  7 China                    1129.    82724             73
    ##  8 United Kingdom           1049.    29478             28
    ##  9 Turkey                   1033.    15679             15
    ## 10 Belgium                   513.    13964             27
    ## 11 Netherlands               499.    13614             27
    ## 12 Canada                    422.     9005             21
    ## 13 Portugal                  407.     8251             20
    ## 14 Brazil                    295.     5717             19
    ## 15 South Korea               230.     9976             43
    ## 16 Australia                 211.     4976             23
    ## 17 Russia                    175.     2777             15
    ## 18 Chile                     169.     3031             17
    ## 19 Czech Republic            165.     3589             21
    ## 20 Ecuador                   148.     2372             15

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        70.8                2196.             31
    ##  2 Belgium                      49.3                1342.             27
    ##  3 Italy                        46.9                1833.             39
    ##  4 Portugal                     38.1                 773.             20
    ##  5 Netherlands                  30.0                 818.             27
    ##  6 Germany                      28.0                 899.             32
    ##  7 France                       27.9                 869.             31
    ##  8 United States                20.1                 604.             30
    ##  9 Iran                         17.1                 619.             36
    ## 10 United Kingdom               16.8                 473.             28
    ## 11 Czech Republic               15.8                 343.             21
    ## 12 Turkey                       13.3                 202.             15
    ## 13 Canada                       12.5                 267.             21
    ## 14 Chile                        10.1                 181.             17
    ## 15 Ecuador                       9.99                160.             15
    ## 16 Australia                     9.83                231.             23
    ## 17 Romania                       5.60                112.             19
    ## 18 Greece                        5.49                125              19
    ## 19 South Korea                   4.74                206.             43
    ## 20 Malaysia                      4.11                103.             24

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Italy                                    11.9       13157   110574
    ##  2 Indonesia                                 9.36        157     1677
    ##  3 Democratic Republic of the Congo          8.94         11      123
    ##  4 Spain                                     8.86       9053   102136
    ##  5 Netherlands                               8.62       1173    13614
    ##  6 United Kingdom                            8.59       2532    29478
    ##  7 France                                    7.14       4019    56261
    ##  8 Iraq                                      7.14         52      728
    ##  9 Algeria                                   6.85         58      847
    ## 10 Egypt                                     6.68         52      779
    ## 11 Iran                                      6.38       3036    47593
    ## 12 Ecuador                                   6.16        146     2372
    ## 13 Belgium                                   5.93        828    13964
    ## 14 Morocco                                   5.77         39      676
    ## 15 Burkina Faso                              5.36         14      261
    ## 16 Philippines                               4.15         96     2311
    ## 17 China                                     4.02       3327    82724
    ## 18 Greece                                    3.64         50     1375
    ## 19 Brazil                                    3.52        201     5717
    ## 20 Romania                                   3.46         85     2460

EOL
