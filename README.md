WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-20

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
    ##  1 United States           14792.   695353             47
    ##  2 Spain                    3992.   191726             48
    ##  3 Italy                    3139.   175925             56
    ##  4 Germany                  2852.   139897             49
    ##  5 Turkey                   2567.    82329             32
    ##  6 United Kingdom           2536.   114221             45
    ##  7 France                   2303.   110721             48
    ##  8 Iran                     1523.    80868             53
    ##  9 Russia                   1335.    42853             32
    ## 10 China                     932.    84201             90
    ## 11 Brazil                    932.    33682             36
    ## 12 Canada                    849     32400             38
    ## 13 Belgium                   843.    37183             44
    ## 14 Netherlands               715.    31589             44
    ## 15 Portugal                  529     19685             37
    ## 16 India                     433.    15712             36
    ## 17 Peru                      417     13489             32
    ## 18 Chile                     282.     9730             34
    ## 19 Ecuador                   277.     9022             32
    ## 20 Poland                    240.     8742             36

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        85.8                4123.             48
    ##  2 Belgium                      81.0                3574.             44
    ##  3 Italy                        52.0                2916.             56
    ##  4 Portugal                     49.6                1844.             37
    ##  5 United States                47.7                2241.             47
    ##  6 Netherlands                  43.0                1898.             44
    ##  7 United Kingdom               40.7                1832.             45
    ##  8 France                       35.6                1709.             48
    ##  9 Germany                      34.9                1710.             49
    ## 10 Turkey                       33.0                1058.             32
    ## 11 Canada                       25.2                 962.             38
    ## 12 Iran                         19.8                1051.             53
    ## 13 Ecuador                      18.7                 610.             32
    ## 14 Chile                        16.8                 581.             34
    ## 15 Czech Republic               16.4                 635.             38
    ## 16 Peru                         13.9                 451.             32
    ## 17 Romania                      10.5                 383.             36
    ## 18 Russia                        9.49                305.             32
    ## 19 Saudi Arabia                  8.82                322.             36
    ## 20 Australia                     7.52                306.             40

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   17.4       19294   110721
    ##  2 Belgium                                  14.7        5453    37183
    ##  3 Algeria                                  14.5         367     2534
    ##  4 United Kingdom                           13.5       15464   114221
    ##  5 Italy                                    13.2       23227   175925
    ##  6 Netherlands                              11.4        3601    31589
    ##  7 Spain                                    10.5       20043   191726
    ##  8 Indonesia                                 8.56        535     6248
    ##  9 Mexico                                    7.94        546     6875
    ## 10 Democratic Republic of the Congo          7.65         25      327
    ## 11 Egypt                                     7.39        224     3032
    ## 12 Philippines                               6.52        397     6087
    ## 13 Brazil                                    6.36       2141    33682
    ## 14 Iran                                      6.22       5031    80868
    ## 15 Mali                                      6.02         13      216
    ## 16 Burkina Faso                              5.85         32      547
    ## 17 China                                     5.51       4642    84201
    ## 18 Iraq                                      5.42         82     1513
    ## 19 Morocco                                   5.10        137     2685
    ## 20 Ecuador                                   5.05        456     9022

EOL
