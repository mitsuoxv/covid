WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-03-31

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
    ##  1 United States            4539.   122653             27
    ##  2 Spain                    2810.    78797             28
    ##  3 Italy                    2710.    97689             36
    ##  4 Germany                  1971.    57298             29
    ##  5 France                   1409.    39642             28
    ##  6 China                    1174.    82447             70
    ##  7 Iran                     1157.    38309             33
    ##  8 United Kingdom            776.    19526             25
    ##  9 Turkey                    757.     9271             12
    ## 10 Netherlands               447.    10866             24
    ## 11 Belgium                   447.    10836             24
    ## 12 Portugal                  344.     5962             17
    ## 13 Canada                    306.     5655             18
    ## 14 South Korea               239.     9661             40
    ## 15 Brazil                    236.     3904             16
    ## 16 Australia                 193.     3966             20
    ## 17 Czech Republic            151.     2829             18
    ## 18 Ecuador                   140      1835             12
    ## 19 Chile                     125.     1909             14
    ## 20 Russia                    116.     1534             12

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        60.4               1694.              28
    ##  2 Italy                        44.9               1619.              36
    ##  3 Belgium                      43.0               1042.              24
    ##  4 Portugal                     32.2                558.              17
    ##  5 Netherlands                  26.9                653.              24
    ##  6 Germany                      24.1                700.              29
    ##  7 France                       21.8                612.              28
    ##  8 Iran                         15.0                498.              33
    ##  9 United States                14.6                395.              27
    ## 10 Czech Republic               14.4                270.              18
    ## 11 United Kingdom               12.5                313.              25
    ## 12 Turkey                        9.73               119.              12
    ## 13 Ecuador                       9.47               124.              12
    ## 14 Canada                        9.10               168.              18
    ## 15 Australia                     8.96               184.              20
    ## 16 Chile                         7.48               114.              14
    ## 17 Greece                        5.27               105.              16
    ## 18 South Korea                   4.93               200.              40
    ## 19 Romania                       4.66                80.1             16
    ## 20 Malaysia                      3.96                87.4             21

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Italy                  11.0       10781    97689
    ##  2 Indonesia               8.87        114     1285
    ##  3 Spain                   8.28       6528    78797
    ##  4 Iraq                    7.68         42      547
    ##  5 Netherlands             7.10        771    10866
    ##  6 Iran                    6.89       2640    38309
    ##  7 Egypt                   6.57         40      609
    ##  8 France                  6.56       2602    39642
    ##  9 Algeria                 6.39         29      454
    ## 10 United Kingdom          6.29       1228    19526
    ## 11 Morocco                 5.23         27      516
    ## 12 Philippines             5.01         71     1418
    ## 13 China                   4.01       3310    82447
    ## 14 Belgium                 3.98        431    10836
    ## 15 Greece                  3.29         38     1156
    ## 16 Brazil                  2.92        114     3904
    ## 17 Japan                   2.89         54     1866
    ## 18 India                   2.71         29     1071
    ## 19 Ecuador                 2.62         48     1835
    ## 20 Argentina               2.55         19      745

EOL
