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

Updated: 2020-07-31

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

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/).

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           29014.  4323160            149
    ##  2 Brazil                  17993.  2483191            138
    ##  3 India                   11476.  1583792            138
    ##  4 Russia                   6227.   834499            134
    ##  5 South Africa             3515.   471123            134
    ##  6 Mexico                   3027.   402697            133
    ##  7 Peru                     2947.   395005            134
    ##  8 Chile                    2584.   351575            136
    ##  9 United Kingdom           2050.   301459            147
    ## 10 Pakistan                 2038.   277402            136
    ## 11 Bangladesh               2018.   232194            115
    ## 12 Colombia                 2010.   267385            133
    ## 13 Saudi Arabia             1975.   272590            138
    ## 14 Iran                     1928.   298909            155
    ## 15 Spain                    1884.   282641            150
    ## 16 Turkey                   1707.   228924            134
    ## 17 Italy                    1561.   246776            158
    ## 18 Germany                  1370.   206926            151
    ## 19 Argentina                1312.   173355            132
    ## 20 France                   1155.   173455            150

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            154.               20994.            136
    ##  2 Peru                              98.5              13208.            134
    ##  3 United States                     93.5              13935.            149
    ##  4 Brazil                            89.5              12348.            138
    ##  5 Saudi Arabia                      76.7              10594.            138
    ##  6 South Africa                      71.7               9615.            134
    ##  7 Israel                            65.4               9046.            138
    ##  8 Bolivia                           60.0               7271.            121
    ##  9 Belarus                           57.1               6987.            122
    ## 10 Sweden                            57.1               8349.            146
    ## 11 Kyrgyzstan                        52.1               6380.            122
    ## 12 Dominican Republic                52.0               6737.            129
    ## 13 Kazakhstan                        45.3               5715.            126
    ## 14 Russia                            44.3               5931.            134
    ## 15 Belgium                           44.2               6464.            146
    ## 16 Colombia                          42.1               5595.            133
    ## 17 Ecuador                           41.9               5625.            134
    ## 18 Honduras                          41.1               5064.            123
    ## 19 Spain                             40.5               6078.            150
    ## 20 Portugal                          34.0               4741.            139

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.3         486     1715
    ##  2 France                 17.4       30120   173455
    ##  3 United Kingdom         15.2       45961   301459
    ##  4 Belgium                14.6        9836    67242
    ##  5 Italy                  14.2       35129   246776
    ##  6 Hungary                13.3         596     4484
    ##  7 Netherlands            11.5        6147    53621
    ##  8 Mexico                 11.1       44876   402697
    ##  9 Spain                  10.1       28441   282641
    ## 10 Chad                    8.10         75      926
    ## 11 Canada                  7.75       8912   114994
    ## 12 Sweden                  7.18       5730    79782
    ## 13 Ecuador                 6.76       5623    83193
    ## 14 Sudan                   6.31        725    11496
    ## 15 Niger                   6.08         69     1134
    ## 16 Syria                   5.58         40      717
    ## 17 Iran                    5.47      16343   298909
    ## 18 China                   5.32       4665    87680
    ## 19 Egypt                   5.06       4728    93356
    ## 20 Mali                    4.92        124     2521

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 945.       9836   10.4 
    ##  2 United Kingdom          737.      45961   62.3 
    ##  3 Peru                    622.      18612   29.9 
    ##  4 Spain                   612.      28441   46.5 
    ##  5 Sweden                  600.       5730    9.56
    ##  6 Italy                   582.      35129   60.3 
    ##  7 Chile                   554.       9278   16.7 
    ##  8 United States           479.     148640  310.  
    ##  9 France                  465.      30120   64.8 
    ## 10 Brazil                  440.      88539  201.  
    ## 11 Mexico                  399.      44876  112.  
    ## 12 Ecuador                 380.       5623   14.8 
    ## 13 Netherlands             369.       6147   16.6 
    ## 14 Bolivia                 273.       2720    9.95
    ## 15 Canada                  265.       8912   33.7 
    ## 16 Kyrgyzstan              248.       1364    5.51
    ## 17 Switzerland             225.       1702    7.58
    ## 18 Iran                    212.      16343   76.9 
    ## 19 Colombia                190.       9074   47.8 
    ## 20 Portugal                162.       1725   10.7

EOL
