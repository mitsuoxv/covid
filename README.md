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

Updated: 2021-01-12

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
    ##  1 United States           69870. 22009275            315
    ##  2 India                   34543. 10466595            303
    ##  3 Brazil                  26478.  8075998            305
    ##  4 Russia                  11455.  3425269            299
    ##  5 United Kingdom           9784.  3072353            314
    ##  6 France                   8663.  2737501            316
    ##  7 Italy                    7048.  2276491            323
    ##  8 Spain                    6430.  2025560            315
    ##  9 Germany                  6060.  1921024            317
    ## 10 Colombia                 5924.  1771363            299
    ## 11 Argentina                5714.  1714409            300
    ## 12 Mexico                   5097.  1524036            299
    ## 13 Turkey                   5056.  1511918            299
    ## 14 Poland                   4588.  1390385            303
    ## 15 South Africa             4105.  1231597            300
    ## 16 Iran                     4007.  1286406            321
    ## 17 Ukraine                  3820.  1119314            293
    ## 18 Peru                     3440.  1032275            300
    ## 19 Netherlands              2815.   872847            310
    ## 20 Czech Republic           2739.   835454            305

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                261.              79749.            305
    ##  2 United States                 225.              70944.            315
    ##  3 Israel                        215.              65448.            304
    ##  4 Belgium                       204.              63853.            313
    ##  5 Switzerland                   199.              62736.            315
    ##  6 Netherlands                   169.              52439.            310
    ##  7 Sweden                        165.              51222.            310
    ##  8 Serbia                        164.              48972.            298
    ##  9 Jordan                        162.              47948.            295
    ## 10 United Kingdom                157.              49277.            314
    ## 11 Austria                       150.              46278.            309
    ## 12 Portugal                      149.              45306.            304
    ## 13 Spain                         138.              43555.            315
    ## 14 Argentina                     138.              41468.            300
    ## 15 France                        134.              42266.            316
    ## 16 Brazil                        132.              40158.            305
    ## 17 Slovakia                      128.              38326.            299
    ## 18 Chile                         127.              38332.            301
    ## 19 Colombia                      124.              37066.            299
    ## 20 Poland                        119.              36114.            303

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         612     2108
    ##  2 Mexico               8.74     133204  1524036
    ##  3 Ecuador              6.41      14177   221070
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.26        774    12364
    ##  6 Egypt                5.47       8197   149792
    ##  7 Bolivia              5.41       9351   172798
    ##  8 China                4.91       4799    97652
    ##  9 Iran                 4.37      56171  1286406
    ## 10 Afghanistan          4.27       2288    53538
    ## 11 Chad                 4.22        107     2537
    ## 12 Tanzania             4.13         21      509
    ## 13 Mali                 3.92        298     7600
    ## 14 Bulgaria             3.90       8126   208511
    ## 15 Peru                 3.70      38213  1032275
    ## 16 Greece               3.64       5263   144738
    ## 17 Guatemala            3.51       5025   143243
    ## 18 Italy                3.46      78755  2276491
    ## 19 Nicaragua            3.41        166     4867
    ## 20 Tunisia              3.27       5215   159276

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1930.      20078   10.4 
    ##  2 United Kingdom         1306.      81431   62.3 
    ##  3 Italy                  1305.      78755   60.3 
    ##  4 Peru                   1278.      38213   29.9 
    ##  5 Czech Republic         1267.      13272   10.5 
    ##  6 United States          1190.     369304  310.  
    ##  7 Mexico                 1184.     133204  112.  
    ##  8 Bulgaria               1137.       8126    7.15
    ##  9 Spain                  1111.      51690   46.5 
    ## 10 Hungary                1074.      10725    9.98
    ## 11 Argentina              1074.      44417   41.3 
    ## 12 France                 1040.      67368   64.8 
    ## 13 Chile                  1021.      17096   16.7 
    ## 14 Brazil                 1008.     202631  201.  
    ## 15 Switzerland             995.       7545    7.58
    ## 16 Sweden                  987.       9433    9.56
    ## 17 Ecuador                 959.      14177   14.8 
    ## 18 Colombia                958.      45784   47.8 
    ## 19 Bolivia                 940.       9351    9.95
    ## 20 Poland                  812.      31264   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
