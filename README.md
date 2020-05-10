WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-11

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
    ##  1 United States           18319.  1245775             68
    ##  2 Russia                   3954.   209688             53
    ##  3 United Kingdom           3260.   215264             66
    ##  4 Spain                    3239.   223578             69
    ##  5 Italy                    2833.   218268             77
    ##  6 Turkey                   2583.   137115             53
    ##  7 Brazil                   2547.   145328             57
    ##  8 Germany                  2416.   169218             70
    ##  9 France                   1983.   137008             69
    ## 10 Iran                     1434.   106220             74
    ## 11 Peru                     1164.    61847             53
    ## 12 Canada                   1130.    66780             59
    ## 13 India                    1102.    62939             57
    ## 14 Belgium                   807.    52596             65
    ## 15 China                     758.    84430            111
    ## 16 Netherlands               650.    42382             65
    ## 17 Saudi Arabia              650.    37136             57
    ## 18 Mexico                    604.    31522             52
    ## 19 Ecuador                   541.    28818             53
    ## 20 Pakistan                  532.    29465             55

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       77.6               5056.             65
    ##  2 Spain                         69.6               4808.             69
    ##  3 United States                 59.0               4016.             68
    ##  4 United Kingdom                52.3               3453.             66
    ##  5 Italy                         47.0               3617.             77
    ##  6 Portugal                      44.1               2567.             58
    ##  7 Netherlands                   39.1               2546.             65
    ##  8 Peru                          38.9               2068.             53
    ##  9 Ecuador                       36.6               1948.             53
    ## 10 Canada                        33.5               1983.             59
    ## 11 Turkey                        33.2               1762.             53
    ## 12 France                        30.6               2115.             69
    ## 13 Germany                       29.5               2069.             70
    ## 14 Chile                         29.4               1625.             55
    ## 15 Russia                        28.1               1490.             53
    ## 16 Saudi Arabia                  25.2               1443.             57
    ## 17 Iran                          18.6               1381.             74
    ## 18 Czech Republic                12.9                773.             59
    ## 19 Brazil                        12.7                723.             57
    ## 20 Romania                       12.0                689.             57

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.2       26268   137008
    ##  2 Belgium                16.3        8581    52596
    ##  3 United Kingdom         14.7       31587   215264
    ##  4 Italy                  13.9       30395   218268
    ##  5 Netherlands            12.8        5422    42382
    ##  6 Spain                  11.8       26478   223578
    ##  7 Mexico                 10.0        3160    31522
    ##  8 Chad                    9.63         31      322
    ##  9 Algeria                 8.89        494     5558
    ## 10 Indonesia               7.03        959    13645
    ## 11 Canada                  6.93       4628    66780
    ## 12 Brazil                  6.81       9897   145328
    ## 13 Philippines             6.64        704    10610
    ## 14 Burkina Faso            6.42         48      748
    ## 15 Iran                    6.20       6589   106220
    ## 16 Romania                 6.12        926    15131
    ## 17 United States           6.05      75364  1245775
    ## 18 Ecuador                 5.91       1704    28818
    ## 19 Egypt                   5.73        514     8964
    ## 20 Greece                  5.57        151     2710

EOL
