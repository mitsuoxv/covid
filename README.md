WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2020-07-04

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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

I later found [Johns Hopkins University, Coronavirus Resource
Center](https://coronavirus.jhu.edu/) and [Financial Times, Coronavirus
tracked](https://www.ft.com/content/a26fbf7e-48f8-11ea-aeb3-955839e06441)
are very informative, and that they provide some time-series charts of
the newly confirmed cases.

I added the United States page to [my Shiny
App](https://mitsuoxv.shinyapps.io/covid/) on May 25, 2020. I use data
from [USAFacts
page](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/).

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

    ## `summarise()` regrouping output by 'publish_date' (override with `.groups` argument)

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           21894.  2671220            122
    ##  2 Brazil                  13051.  1448753            111
    ##  3 Russia                   6241.   667883            107
    ##  4 India                    5635.   625544            111
    ##  5 Peru                     2695.   288477            107
    ##  6 Chile                    2609.   284541            109
    ##  7 United Kingdom           2364.   283761            120
    ##  8 Mexico                   2185.   231770            106
    ##  9 Pakistan                 2034.   221896            109
    ## 10 Spain                    2032.   250103            123
    ## 11 Turkey                   1889.   202284            107
    ## 12 Italy                    1838.   240961            131
    ## 13 Iran                     1818.   232863            128
    ## 14 Saudi Arabia             1779.   197608            111
    ## 15 Bangladesh               1740.   153277             88
    ## 16 Germany                  1577.   195674            124
    ## 17 South Africa             1570.   168061            107
    ## 18 France                   1285.   158286            123
    ## 19 Colombia                  961.   102009            106
    ## 20 Canada                    921.   104204            113

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            156.               16991.            109
    ##  2 Peru                              90.1               9646.            107
    ##  3 United States                     70.6               8610.            122
    ##  4 Saudi Arabia                      69.1               7680.            111
    ##  5 Belarus                           68.0               6474.             95
    ##  6 Brazil                            64.9               7204.            111
    ##  7 Sweden                            62.0               7392.            119
    ##  8 Belgium                           49.8               5934.            119
    ##  9 Russia                            44.4               4747.            107
    ## 10 Spain                             43.7               5378.            123
    ## 11 United Kingdom                    37.9               4551.            120
    ## 12 Ecuador                           37.5               4021.            107
    ## 13 Bolivia                           36.5               3441.             94
    ## 14 Portugal                          35.7               4007.            112
    ## 15 Switzerland                       35.1               4206.            119
    ## 16 Dominican Republic                33.9               3481.            102
    ## 17 Israel                            32.1               3584.            111
    ## 18 South Africa                      32.0               3430.            107
    ## 19 Italy                             30.5               3993.            131
    ## 20 Kazakhstan                        28.9               2873.             99

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.6         326     1225
    ##  2 France                 18.8       29791   158286
    ##  3 Belgium                15.8        9765    61727
    ##  4 United Kingdom         15.5       43995   283761
    ##  5 Italy                  14.4       34818   240961
    ##  6 Hungary                14.1         587     4166
    ##  7 Mexico                 12.3       28510   231770
    ##  8 Netherlands            12.1        6109    50357
    ##  9 Spain                  11.3       28368   250103
    ## 10 Chad                    8.53         74      868
    ## 11 Canada                  8.24       8591   104204
    ## 12 Ecuador                 7.80       4639    59468
    ## 13 Sweden                  7.66       5411    70639
    ## 14 Algeria                 6.33        928    14657
    ## 15 Niger                   6.29         68     1081
    ## 16 Sudan                   6.25        604     9663
    ## 17 Romania                 6.08       1687    27746
    ## 18 Greece                  5.55        192     3458
    ## 19 Burkina Faso            5.48         53      967
    ## 20 China                   5.45       4648    85278

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 939.       9765   10.4 
    ##  2 United Kingdom          706.      43995   62.3 
    ##  3 Spain                   610.      28368   46.5 
    ##  4 Italy                   577.      34818   60.3 
    ##  5 Sweden                  566.       5411    9.56
    ##  6 France                  460.      29791   64.8 
    ##  7 United States           412.     127858  310.  
    ##  8 Netherlands             367.       6109   16.6 
    ##  9 Chile                   354.       5920   16.7 
    ## 10 Peru                    330.       9860   29.9 
    ## 11 Ecuador                 314.       4639   14.8 
    ## 12 Brazil                  301.      60632  201.  
    ## 13 Canada                  255.       8591   33.7 
    ## 14 Mexico                  253.      28510  112.  
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Portugal                149.       1587   10.7 
    ## 17 Iran                    144.      11106   76.9 
    ## 18 Bolivia                 121.       1201    9.95
    ## 19 Denmark                 111.        606    5.48
    ## 20 Germany                 110.       9003   81.8

EOL
