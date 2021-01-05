WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2021-01-05

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

## Read data from WHO

WHO offers [Data Table in its Dashboard](https://covid19.who.int/table).
I use the data from
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

I also use the data, like area name and population, from
<https://countrycode.org/>.

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/). One exception
is “West Europe”, which I make by combining “Western”, “Northern” and
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           65775. 20258725            308
    ##  2 India                   34934. 10340469            296
    ##  3 Brazil                  25894.  7716405            298
    ##  4 Russia                  11164.  3260138            292
    ##  5 United Kingdom           8647.  2654783            307
    ##  6 France                   8451.  2611616            309
    ##  7 Italy                    6821.  2155446            316
    ##  8 Spain                    6147.  1893502            308
    ##  9 Germany                  5727.  1775513            310
    ## 10 Colombia                 5707.  1666408            292
    ## 11 Argentina                5579.  1634834            293
    ## 12 Mexico                   4943.  1443544            292
    ## 13 Turkey                   4888.  1427574            292
    ## 14 Poland                   4469.  1322947            296
    ## 15 Iran                     3960.  1243434            314
    ## 16 Ukraine                  3770.  1078251            286
    ## 17 South Africa             3756.  1100748            293
    ## 18 Peru                     3474.  1018099            293
    ## 19 Netherlands              2710.   821163            303
    ## 20 Indonesia                2585.   765350            296

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                239.              71279.            298
    ##  2 United States                 212.              65302.            308
    ##  3 Belgium                       204.              62483.            306
    ##  4 Israel                        195.              57871.            297
    ##  5 Switzerland                   193.              59369.            308
    ##  6 Netherlands                   163.              49334.            303
    ##  7 Jordan                        162.              46543.            288
    ##  8 Serbia                        161.              46818.            291
    ##  9 Sweden                        151.              45771.            303
    ## 10 Austria                       147.              44433.            302
    ## 11 United Kingdom                139.              42580.            307
    ## 12 Argentina                     135.              39543.            293
    ## 13 Portugal                      135.              40020.            297
    ## 14 Spain                         132.              40715.            308
    ## 15 France                        130.              40322.            309
    ## 16 Brazil                        129.              38370.            298
    ## 17 Chile                         126.              36915.            294
    ## 18 Colombia                      119.              34869.            292
    ## 19 Slovakia                      118.              34482.            292
    ## 20 Peru                          116.              34042.            293

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2105
    ##  2 Mexico               8.79     126851  1443544
    ##  3 Ecuador              6.55      14059   214614
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.23        729    11710
    ##  6 Bolivia              5.67       9186   162055
    ##  7 Egypt                5.49       7805   142187
    ##  8 China                4.94       4791    96972
    ##  9 Chad                 4.70        104     2213
    ## 10 Iran                 4.47      55540  1243434
    ## 11 Afghanistan          4.21       2230    52909
    ## 12 Tanzania             4.13         21      509
    ## 13 Mali                 3.83        278     7253
    ## 14 Bulgaria             3.78       7678   203051
    ## 15 Peru                 3.71      37773  1018099
    ## 16 Greece               3.54       4957   140099
    ## 17 Italy                3.49      75332  2155446
    ## 18 Guatemala            3.49       4833   138475
    ## 19 Nicaragua            3.42        165     4829
    ## 20 Tunisia              3.34       4800   143544

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1894.      19701   10.4 
    ##  2 Peru                   1263.      37773   29.9 
    ##  3 Italy                  1248.      75332   60.3 
    ##  4 United Kingdom         1203.      75024   62.3 
    ##  5 Czech Republic         1152.      12070   10.5 
    ##  6 Mexico                 1128.     126851  112.  
    ##  7 United States          1120.     347555  310.  
    ##  8 Spain                  1085.      50442   46.5 
    ##  9 Bulgaria               1074.       7678    7.15
    ## 10 Argentina              1049.      43375   41.3 
    ## 11 Chile                  1001.      16767   16.7 
    ## 12 Hungary                 999.       9977    9.98
    ## 13 France                  998.      64659   64.8 
    ## 14 Brazil                  973.     195725  201.  
    ## 15 Ecuador                 951.      14059   14.8 
    ## 16 Switzerland             930.       7049    7.58
    ## 17 Bolivia                 923.       9186    9.95
    ## 18 Colombia                916.      43765   47.8 
    ## 19 Sweden                  913.       8727    9.56
    ## 20 Austria                 762.       6253    8.20

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
