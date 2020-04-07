WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-08

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
    ##  1 United States            9534.   333811             35
    ##  2 Spain                    3748.   135032             36
    ##  3 Italy                    3010.   132547             44
    ##  4 Germany                  2678.    99225             37
    ##  5 France                   2036.    73488             36
    ##  6 United Kingdom           1560.    51612             33
    ##  7 Turkey                   1501.    30217             20
    ##  8 Iran                     1472.    60500             41
    ##  9 China                    1061.    83071             78
    ## 10 Belgium                   647.    20814             32
    ## 11 Canada                    603.    15806             26
    ## 12 Netherlands               584.    18803             32
    ## 13 Portugal                  465.    11730             25
    ## 14 Brazil                    459.    11130             24
    ## 15 Russia                    310.     6343             20
    ## 16 South Korea               213.    10331             48
    ## 17 Chile                     212.     4815             22
    ## 18 Australia                 205.     5844             28
    ## 19 Czech Republic            181      4822             26
    ## 20 Ecuador                   180.     3747             20

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        80.6                2904.             36
    ##  2 Belgium                      62.2                2001.             32
    ##  3 Italy                        49.9                2197.             44
    ##  4 Portugal                     43.5                1099.             25
    ##  5 Netherlands                  35.1                1130.             32
    ##  6 Germany                      32.7                1213.             37
    ##  7 France                       31.4                1135.             36
    ##  8 United States                30.7                1076.             35
    ##  9 United Kingdom               25.0                 828.             33
    ## 10 Turkey                       19.3                 388.             20
    ## 11 Iran                         19.1                 786.             41
    ## 12 Canada                       17.9                 469.             26
    ## 13 Czech Republic               17.3                 460.             26
    ## 14 Chile                        12.6                 288.             22
    ## 15 Ecuador                      12.1                 253.             20
    ## 16 Australia                     9.51                272.             28
    ## 17 Romania                       7.46                185.             24
    ## 18 Greece                        5.78                160.             24
    ## 19 Poland                        4.66                115.             24
    ## 20 Malaysia                      4.48                134.             29

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Italy                                    12.5       16525   132547
    ##  2 Algeria                                  12.2         173     1423
    ##  3 France                                   12.1        8896    73488
    ##  4 Democratic Republic of the Congo         11.2          18      161
    ##  5 United Kingdom                           10.4        5373    51612
    ##  6 Netherlands                               9.93       1867    18803
    ##  7 Bangladesh                                9.76         12      123
    ##  8 Spain                                     9.67      13055   135032
    ##  9 Indonesia                                 8.39        209     2491
    ## 10 Belgium                                   7.84       1632    20814
    ## 11 Morocco                                   7.27         83     1141
    ## 12 Egypt                                     6.43         85     1322
    ## 13 Iraq                                      6.21         64     1031
    ## 14 Iran                                      6.18       3739    60500
    ## 15 Ecuador                                   5.10        191     3747
    ## 16 Burkina Faso                              4.93         17      345
    ## 17 Greece                                    4.50         79     1755
    ## 18 Philippines                               4.45        163     3660
    ## 19 Mexico                                    4.39         94     2143
    ## 20 Brazil                                    4.37        486    11130

EOL
