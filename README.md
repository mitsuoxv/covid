WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-01

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
    ##  1 United States           17308.  1003974             58
    ##  2 Spain                    3607.   212917             59
    ##  3 Italy                    3037.   203591             67
    ##  4 United Kingdom           2948.   165225             56
    ##  5 Turkey                   2730.   117589             43
    ##  6 Germany                  2650.   159119             60
    ##  7 Russia                   2473.   106498             43
    ##  8 France                   2150.   127066             59
    ##  9 Brazil                   1527.    71886             47
    ## 10 Iran                     1461.    93657             64
    ## 11 Canada                   1025     50363             49
    ## 12 Belgium                   868.    47859             55
    ## 13 China                     833.    84373            101
    ## 14 Peru                      722.    31190             43
    ## 15 Netherlands               703.    38802             55
    ## 16 India                     701.    33050             47
    ## 17 Ecuador                   570.    24675             43
    ## 18 Portugal                  508.    24505             48
    ## 19 Saudi Arabia              453.    21402             47
    ## 20 Mexico                    396.    16752             42

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      83.5                4600.             55
    ##  2 Spain                        77.6                4578.             59
    ##  3 United States                55.8                3236.             58
    ##  4 Italy                        50.3                3374.             67
    ##  5 Portugal                     47.6                2295.             48
    ##  6 United Kingdom               47.3                2650.             56
    ##  7 Netherlands                  42.2                2331.             55
    ##  8 Ecuador                      38.6                1668.             43
    ##  9 Turkey                       35.1                1511.             43
    ## 10 France                       33.2                1962.             59
    ## 11 Germany                      32.4                1945.             60
    ## 12 Canada                       30.4                1495.             49
    ## 13 Peru                         24.1                1043.             43
    ## 14 Chile                        19.5                 889.             45
    ## 15 Iran                         19.0                1218.             64
    ## 16 Saudi Arabia                 17.6                 832.             47
    ## 17 Russia                       17.6                 757.             43
    ## 18 Czech Republic               14.5                 723.             49
    ## 19 Romania                      11.5                 545.             47
    ## 20 Brazil                        7.59                357.             47

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   18.9       24054   127066
    ##  2 United Kingdom                           15.8       26097   165225
    ##  3 Belgium                                  15.7        7501    47859
    ##  4 Italy                                    13.6       27682   203591
    ##  5 Netherlands                              12.1        4711    38802
    ##  6 Algeria                                  11.5         444     3848
    ##  7 Spain                                    11.4       24275   212917
    ##  8 Mexico                                    9.37       1569    16752
    ##  9 Indonesia                                 8.02        784     9771
    ## 10 Sudan                                     7.47         28      375
    ## 11 Egypt                                     7.21        380     5268
    ## 12 Brazil                                    6.98       5017    71886
    ## 13 Philippines                               6.79        558     8212
    ## 14 Burkina Faso                              6.58         42      638
    ## 15 Iran                                      6.36       5957    93657
    ## 16 Democratic Republic of the Congo          6.2          31      500
    ## 17 Canada                                    5.77       2904    50363
    ## 18 Romania                                   5.64        675    11978
    ## 19 China                                     5.50       4643    84373
    ## 20 Greece                                    5.40        139     2576

EOL
