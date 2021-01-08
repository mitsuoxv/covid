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

Updated: 2021-01-08

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
    ##  1 United States           67109. 20870913            311
    ##  2 India                   34766. 10395278            299
    ##  3 Brazil                  25948.  7810400            301
    ##  4 Russia                  11295.  3332142            295
    ##  5 United Kingdom           9151.  2836805            310
    ##  6 France                   8528.  2660740            312
    ##  7 Italy                    6902.  2201945            319
    ##  8 Spain                    6374.  1982543            311
    ##  9 Germany                  5862.  1835038            313
    ## 10 Colombia                 5772.  1702966            295
    ## 11 Argentina                5617.  1662730            296
    ## 12 Turkey                   4981.  1469593            295
    ## 13 Mexico                   4971.  1466490            295
    ## 14 Poland                   4538.  1356882            299
    ## 15 Iran                     3980.  1261903            317
    ## 16 South Africa             3883.  1149591            296
    ## 17 Ukraine                  3804.  1099493            289
    ## 18 Peru                     3452.  1022018            296
    ## 19 Netherlands              2748.   841163            306
    ## 20 Czech Republic           2640.   794740            301

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                252.              75863.            301
    ##  2 United States                 216.              67275.            311
    ##  3 Israel                        207.              62241.            300
    ##  4 Belgium                       204.              63033.            309
    ##  5 Switzerland                   199.              61790.            311
    ##  6 Netherlands                   165.              50535.            306
    ##  7 Serbia                        163.              47941.            294
    ##  8 Jordan                        162.              47269.            291
    ##  9 Sweden                        161.              49158.            306
    ## 10 Austria                       148.              45296.            305
    ## 11 United Kingdom                147.              45499.            310
    ## 12 Portugal                      139.              41833.            300
    ## 13 Spain                         137.              42630.            311
    ## 14 Argentina                     136.              40218.            296
    ## 15 France                        132.              41081.            312
    ## 16 Brazil                        129.              38838.            301
    ## 17 Chile                         126.              37350.            297
    ## 18 Slovakia                      123.              36331.            295
    ## 19 Colombia                      121.              35634.            295
    ## 20 Poland                        118.              35244.            299

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2106
    ##  2 Mexico               8.78     128822  1466490
    ##  3 Ecuador              6.51      14146   217377
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.23        747    11988
    ##  6 Bolivia              5.59       9241   165268
    ##  7 Egypt                5.48       7975   145590
    ##  8 China                4.93       4795    97217
    ##  9 Chad                 4.51        105     2328
    ## 10 Iran                 4.42      55830  1261903
    ## 11 Afghanistan          4.23       2253    53207
    ## 12 Tanzania             4.13         21      509
    ## 13 Bulgaria             3.86       7961   206392
    ## 14 Mali                 3.85        285     7395
    ## 15 Peru                 3.71      37925  1022018
    ## 16 Greece               3.58       5099   142267
    ## 17 Guatemala            3.49       4899   140202
    ## 18 Italy                3.49      76877  2201945
    ## 19 Nicaragua            3.41        166     4867
    ## 20 Tunisia              3.34       5004   149881

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1911.      19883   10.4 
    ##  2 Italy                  1274.      76877   60.3 
    ##  3 Peru                   1268.      37925   29.9 
    ##  4 United Kingdom         1241.      77346   62.3 
    ##  5 Czech Republic         1205.      12621   10.5 
    ##  6 Mexico                 1145.     128822  112.  
    ##  7 United States          1142.     354286  310.  
    ##  8 Bulgaria               1114.       7961    7.15
    ##  9 Spain                  1106.      51430   46.5 
    ## 10 Argentina              1059.      43785   41.3 
    ## 11 Hungary                1034.      10325    9.98
    ## 12 France                 1022.      66184   64.8 
    ## 13 Chile                  1004.      16816   16.7 
    ## 14 Brazil                  983.     197732  201.  
    ## 15 Switzerland             976.       7400    7.58
    ## 16 Ecuador                 956.      14146   14.8 
    ## 17 Sweden                  940.       8985    9.56
    ## 18 Colombia                930.      44428   47.8 
    ## 19 Bolivia                 929.       9241    9.95
    ## 20 Austria                 787.       6454    8.20

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
