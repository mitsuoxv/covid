WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-06

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
    ##  1 United States           18331.  1154985             63
    ##  2 Spain                    3405.   218011             64
    ##  3 Russia                   3234.   155370             48
    ##  4 United Kingdom           3122.   190588             61
    ##  5 Italy                    2942.   211938             72
    ##  6 Turkey                   2656.   127659             48
    ##  7 Germany                  2519.   163860             65
    ##  8 France                   2032.   130242             64
    ##  9 Brazil                   1943.   101147             52
    ## 10 Iran                     1428.    98647             69
    ## 11 Canada                   1106.    59844             54
    ## 12 Peru                      954.    45928             48
    ## 13 India                     891.    46433             52
    ## 14 Belgium                   836.    50267             60
    ## 15 China                     794.    84404            106
    ## 16 Netherlands               677.    40770             60
    ## 17 Ecuador                   661.    31881             48
    ## 18 Saudi Arabia              549.    28656             52
    ## 19 Mexico                    497.    23471             47
    ## 20 Portugal                  479.    25524             53

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      80.4                4832.             60
    ##  2 Spain                        73.2                4688.             64
    ##  3 United States                59.1                3723.             63
    ##  4 United Kingdom               50.1                3057.             61
    ##  5 Italy                        48.8                3512.             72
    ##  6 Portugal                     44.9                2391.             53
    ##  7 Ecuador                      44.7                2155.             48
    ##  8 Netherlands                  40.7                2449.             60
    ##  9 Turkey                       34.1                1641.             48
    ## 10 Canada                       32.8                1777.             54
    ## 11 Peru                         31.9                1536.             48
    ## 12 France                       31.4                2011.             64
    ## 13 Germany                      30.8                2003.             65
    ## 14 Chile                        24.5                1233.             50
    ## 15 Russia                       23.0                1104.             48
    ## 16 Saudi Arabia                 21.3                1114.             52
    ## 17 Iran                         18.6                1282.             69
    ## 18 Czech Republic               13.6                 746.             54
    ## 19 Romania                      11.7                 615.             52
    ## 20 Brazil                        9.66                503.             52

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.3       25165   130242
    ##  2 Belgium                15.8        7924    50267
    ##  3 United Kingdom         15.1       28734   190588
    ##  4 Italy                  13.7       29079   211938
    ##  5 Netherlands            12.5        5082    40770
    ##  6 Spain                  11.7       25428   218011
    ##  7 Algeria                10.0         465     4648
    ##  8 Mexico                  9.18       2154    23471
    ##  9 Indonesia               7.46        864    11587
    ## 10 Brazil                  6.95       7025   101147
    ## 11 Burkina Faso            6.85         46      672
    ## 12 Philippines             6.57        623     9485
    ## 13 Egypt                   6.40        436     6813
    ## 14 Iran                    6.36       6277    98647
    ## 15 Canada                  6.29       3766    59844
    ## 16 Sudan                   6.05         41      678
    ## 17 Romania                 5.94        803    13512
    ## 18 Greece                  5.55        146     2632
    ## 19 China                   5.50       4643    84404
    ## 20 United States           5.36      61906  1154985

EOL
