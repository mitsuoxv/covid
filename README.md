WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-05

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
    ##  1 United States           18155.  1125719             62
    ##  2 Spain                    3450.   217466             63
    ##  3 United Kingdom           3108.   186603             60
    ##  4 Russia                   3088.   145268             47
    ##  5 Italy                    2966.   210717             71
    ##  6 Turkey                   2678.   126045             47
    ##  7 Germany                  2548.   163175             64
    ##  8 France                   2056.   129708             63
    ##  9 Brazil                   1891.    96559             51
    ## 10 Iran                     1431.    97424             68
    ## 11 Canada                   1117.    59365             53
    ## 12 Peru                      902.    42534             47
    ## 13 Belgium                   844.    49906             59
    ## 14 India                     832.    42533             51
    ## 15 China                     801.    84400            105
    ## 16 Netherlands               685.    40571             59
    ## 17 Ecuador                   625.    29538             47
    ## 18 Saudi Arabia              528.    27011             51
    ## 19 Portugal                  484.    25282             52
    ## 20 Mexico                    478.    22088             46

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      81.1                4797.             59
    ##  2 Spain                        74.2                4676.             63
    ##  3 United States                58.5                3629.             62
    ##  4 United Kingdom               49.9                2993.             60
    ##  5 Italy                        49.2                3492.             71
    ##  6 Portugal                     45.3                2368.             52
    ##  7 Ecuador                      42.3                1997.             47
    ##  8 Netherlands                  41.2                2437.             59
    ##  9 Turkey                       34.4                1620.             47
    ## 10 Canada                       33.2                1763.             53
    ## 11 France                       31.7                2003.             63
    ## 12 Germany                      31.1                1995.             64
    ## 13 Peru                         30.2                1422.             47
    ## 14 Chile                        23.8                1174.             49
    ## 15 Russia                       21.9                1032.             47
    ## 16 Saudi Arabia                 20.5                1050.             51
    ## 17 Iran                         18.6                1267.             68
    ## 18 Czech Republic               13.8                 743.             53
    ## 19 Romania                      11.6                 599.             51
    ## 20 Brazil                        9.40                480.             51

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.2       24859   129708
    ##  2 Belgium                15.7        7844    49906
    ##  3 United Kingdom         15.2       28446   186603
    ##  4 Italy                  13.7       28884   210717
    ##  5 Netherlands            12.5        5056    40571
    ##  6 Spain                  11.6       25264   217466
    ##  7 Algeria                10.3         463     4474
    ##  8 Mexico                  9.33       2061    22088
    ##  9 Indonesia               7.55        845    11192
    ## 10 Brazil                  6.99       6750    96559
    ## 11 Sudan                   6.93         41      592
    ## 12 Burkina Faso            6.80         45      662
    ## 13 Egypt                   6.64        429     6465
    ## 14 Philippines             6.58        607     9223
    ## 15 Iran                    6.37       6203    97424
    ## 16 Canada                  6.20       3681    59365
    ## 17 Romania                 5.93        780    13163
    ## 18 China                   5.50       4643    84400
    ## 19 Greece                  5.48        144     2626
    ## 20 United States           5.39      60710  1125719

EOL
