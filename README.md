WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-03-28

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
    ##  1 United States            2843.    68334             24
    ##  2 Italy                    2437.    80539             33
    ##  3 Spain                    2243.    56188             25
    ##  4 Germany                  1622.    42288             26
    ##  5 China                    1221.    82078             67
    ##  6 France                   1144.    28786             25
    ##  7 Iran                      976.    29406             30
    ##  8 United Kingdom            525.    11662             22
    ##  9 Turkey                    382      3629              9
    ## 10 Netherlands               348.     7431             21
    ## 11 Belgium                   292.     6235             21
    ## 12 South Korea               249.     9332             37
    ## 13 Portugal                  245.     3544             14
    ## 14 Canada                    228.     3555             15
    ## 15 Brazil                    178.     2433             13
    ## 16 Australia                 169      2985             17
    ## 17 Czech Republic            130.     2062             15
    ## 18 Ecuador                   117.     1211              9
    ## 19 Malaysia                  106.     2031             18
    ## 20 Chile                     105.     1306             11

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million. Highest
“speed\_std\_since\_100”, which is per day growth of cumulative cases
per 1 million population since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        48.2               1208.              25
    ##  2 Italy                        40.4               1335.              33
    ##  3 Belgium                      28.0                599.              21
    ##  4 Portugal                     23.0                332.              14
    ##  5 Netherlands                  20.9                446.              21
    ##  6 Germany                      19.8                517.              26
    ##  7 France                       17.7                444.              25
    ##  8 Iran                         12.7                382.              30
    ##  9 Czech Republic               12.4                197.              15
    ## 10 United States                 9.16               220.              24
    ## 11 United Kingdom                8.42               187.              22
    ## 12 Ecuador                       7.93                81.9              9
    ## 13 Australia                     7.85               139.              17
    ## 14 Canada                        6.76               106.              15
    ## 15 Chile                         6.24                78.0             11
    ## 16 South Korea                   5.15               193.              37
    ## 17 Turkey                        4.91                46.6              9
    ## 18 Greece                        4.64                81.1             13
    ## 19 Malaysia                      3.76                71.8             18
    ## 20 Romania                       3.17                46.9             13

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Italy                  10.1        8165    80539
    ##  2 Iraq                    9.42         36      382
    ##  3 Indonesia               8.73         78      893
    ##  4 Iran                    7.60       2234    29406
    ##  5 Spain                   7.28       4089    56188
    ##  6 Algeria                 6.89         21      305
    ##  7 Philippines             6.36         45      707
    ##  8 France                  5.89       1695    28786
    ##  9 Netherlands             5.84        434     7431
    ## 10 United Kingdom          4.96        578    11662
    ## 11 Egypt                   4.85         24      495
    ## 12 China                   4.02       3298    82078
    ## 13 Belgium                 3.53        220     6235
    ## 14 Japan                   3.32         46     1387
    ## 15 Greece                  2.91         26      892
    ## 16 Ecuador                 2.39         29     1211
    ## 17 India                   2.35         17      724
    ## 18 Brazil                  2.34         57     2433
    ## 19 Turkey                  2.07         75     3629
    ## 20 Portugal                1.69         60     3544

EOL
