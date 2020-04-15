WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-16

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
    ##  1 United States           13446.   578268             43
    ##  2 Spain                    3919.   172541             44
    ##  3 Italy                    3122.   162488             52
    ##  4 Germany                  2832.   127584             45
    ##  5 France                   2326.   102533             44
    ##  6 Turkey                   2319.    65111             28
    ##  7 United Kingdom           2287.    93877             41
    ##  8 Iran                     1525.    74877             49
    ##  9 China                     971.    83745             86
    ## 10 Russia                    869.    24490             28
    ## 11 Belgium                   775.    31119             40
    ## 12 Canada                    765.    26146             34
    ## 13 Brazil                    728.    23430             32
    ## 14 Netherlands               682.    27419             40
    ## 15 Portugal                  525.    17448             33
    ## 16 India                     354.    11439             32
    ## 17 Ecuador                   266      7603             28
    ## 18 Peru                      263.     7519             28
    ## 19 Chile                     259.     7917             30
    ## 20 Poland                    222.     7202             32

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        84.3                3710.             44
    ##  2 Belgium                      74.5                2991.             40
    ##  3 Italy                        51.7                2693.             52
    ##  4 Portugal                     49.2                1634.             33
    ##  5 United States                43.3                1864.             43
    ##  6 Netherlands                  41.0                1647.             40
    ##  7 United Kingdom               36.7                1506.             41
    ##  8 France                       35.9                1583.             44
    ##  9 Germany                      34.6                1560.             45
    ## 10 Turkey                       29.8                 837.             28
    ## 11 Canada                       22.7                 776.             34
    ## 12 Iran                         19.8                 973.             49
    ## 13 Ecuador                      18.0                 514.             28
    ## 14 Czech Republic               16.9                 586.             34
    ## 15 Chile                        15.4                 473.             30
    ## 16 Romania                       9.61                313.             32
    ## 17 Peru                          8.81                251.             28
    ## 18 Australia                     8.14                298.             36
    ## 19 Saudi Arabia                  6.40                209.             32
    ## 20 Russia                        6.18                174.             28

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Algeria                                  15.7         326     2070
    ##  2 France                                   15.3       15708   102533
    ##  3 Belgium                                  13.4        4157    31119
    ##  4 Italy                                    13.0       21069   162488
    ##  5 United Kingdom                           12.9       12107    93877
    ##  6 Netherlands                              10.7        2945    27419
    ##  7 Spain                                    10.5       18056   172541
    ##  8 Indonesia                                 9.49        459     4839
    ##  9 Democratic Republic of the Congo          8.27         21      254
    ## 10 Egypt                                     7.57        178     2350
    ## 11 Morocco                                   6.67        126     1888
    ## 12 Mexico                                    6.62        332     5014
    ## 13 Philippines                               6.41        335     5223
    ## 14 Iran                                      6.25       4683    74877
    ## 15 Brazil                                    5.67       1328    23430
    ## 16 Iraq                                      5.57         78     1400
    ## 17 Burkina Faso                              5.44         28      515
    ## 18 Romania                                   5.00        344     6879
    ## 19 Ecuador                                   4.85        369     7603
    ## 20 Greece                                    4.65        101     2170

EOL
