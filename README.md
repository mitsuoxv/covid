WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-22

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
    ##  1 United States           15330.   751273             49
    ##  2 Spain                    4002.   200210             50
    ##  3 Italy                    3122.   181228             58
    ##  4 Germany                  2810.   143457             51
    ##  5 Turkey                   2670.    90980             34
    ##  6 United Kingdom           2652.   124747             47
    ##  7 France                   2266.   113513             50
    ##  8 Russia                   1548.    52763             34
    ##  9 Iran                     1516.    83505             55
    ## 10 Brazil                   1014.    38654             38
    ## 11 China                     913.    84250             92
    ## 12 Canada                    881.    35383             40
    ## 13 Belgium                   867.    39983             46
    ## 14 Netherlands               723.    33405             46
    ## 15 Portugal                  532.    20863             39
    ## 16 India                     487.    18601             38
    ## 17 Peru                      455.    15628             34
    ## 18 Ecuador                   293.    10128             34
    ## 19 Chile                     288.    10507             36
    ## 20 Saudi Arabia              273.    10484             38

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        86.1                4305.             50
    ##  2 Belgium                      83.3                3843.             46
    ##  3 Italy                        51.7                3003.             58
    ##  4 Portugal                     49.8                1954.             39
    ##  5 United States                49.4                2422.             49
    ##  6 Netherlands                  43.5                2007.             46
    ##  7 United Kingdom               42.5                2001.             47
    ##  8 France                       35.0                1753.             50
    ##  9 Germany                      34.4                1754.             51
    ## 10 Turkey                       34.3                1169.             34
    ## 11 Canada                       26.2                1051.             40
    ## 12 Ecuador                      19.8                 685.             34
    ## 13 Iran                         19.7                1086.             55
    ## 14 Chile                        17.2                 627.             36
    ## 15 Czech Republic               16.2                 660.             40
    ## 16 Peru                         15.2                 523.             34
    ## 17 Russia                       11.0                 375.             34
    ## 18 Saudi Arabia                 10.6                 407.             38
    ## 19 Romania                      10.6                 407.             38
    ## 20 Australia                     7.21                308.             42

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   17.8       20233   113513
    ##  2 Belgium                                  14.6        5828    39983
    ##  3 Algeria                                  14.1         384     2718
    ##  4 Italy                                    13.3       24114   181228
    ##  5 United Kingdom                           13.2       16509   124747
    ##  6 Netherlands                              11.2        3751    33405
    ##  7 Sudan                                    11.2          12      107
    ##  8 Spain                                    10.4       20852   200210
    ##  9 Indonesia                                 8.73        590     6760
    ## 10 Mexico                                    8.30        686     8261
    ## 11 Egypt                                     7.50        250     3333
    ## 12 Democratic Republic of the Congo          7.14         25      350
    ## 13 Philippines                               6.63        428     6459
    ## 14 Brazil                                    6.37       2462    38654
    ## 15 Burkina Faso                              6.25         36      576
    ## 16 Iran                                      6.24       5209    83505
    ## 17 Mali                                      5.69         14      246
    ## 18 China                                     5.51       4642    84250
    ## 19 Iraq                                      5.21         82     1574
    ## 20 Greece                                    5.17        116     2245

EOL
