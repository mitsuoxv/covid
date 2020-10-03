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

Updated: 2020-10-04

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
    ##  1 United States           33519.  7206769            215
    ##  2 India                   31889.  6473544            203
    ##  3 Brazil                  23644.  4847092            205
    ##  4 Russia                   6022.  1204502            200
    ##  5 Colombia                 4197.   835339            199
    ##  6 Peru                     4091.   818297            200
    ##  7 Argentina                3825.   765002            200
    ##  8 Mexico                   3760.   748315            199
    ##  9 Spain                    3674.   789932            215
    ## 10 South Africa             3389.   677833            200
    ## 11 France                   2586.   563792            218
    ## 12 Chile                    2321.   466590            201
    ## 13 United Kingdom           2182.   467150            214
    ## 14 Iran                     2102.   464596            221
    ## 15 Bangladesh               2024.   366383            181
    ## 16 Iraq                     1833.   372259            203
    ## 17 Saudi Arabia             1644.   335578            204
    ## 18 Turkey                   1607.   321512            200
    ## 19 Pakistan                 1561.   313984            201
    ## 20 Philippines              1559.   316678            203

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           170.               34697.            204
    ##  2 Chile                            139.               27862.            201
    ##  3 Peru                             137.               27361.            200
    ##  4 Brazil                           118.               24102.            205
    ##  5 United States                    108.               23230.            215
    ##  6 Argentina                         92.5              18504.            200
    ##  7 Colombia                          87.8              17479.            199
    ##  8 Spain                             79.0              16986.            215
    ##  9 Bolivia                           73.3              13643.            186
    ## 10 South Africa                      69.2              13833.            200
    ## 11 Saudi Arabia                      63.9              13041.            204
    ## 12 Iraq                              61.8              12546.            203
    ## 13 Dominican Republic                59.3              11538.            194
    ## 14 Belgium                           56.0              11933.            213
    ## 15 Honduras                          51.6               9713.            188
    ## 16 Kazakhstan                        47.8               9189.            192
    ## 17 Ecuador                           47.1               9434.            200
    ## 18 Sweden                            46.7               9866.            211
    ## 19 Kyrgyzstan                        45.7               8565.            187
    ## 20 Belarus                           43.8               8200.            187

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         590     2044
    ##  2 Italy                  11.2       35941   319908
    ##  3 Mexico                 10.4       78078   748315
    ##  4 United Kingdom          9.05      42268   467150
    ##  5 Ecuador                 8.24      11495   139534
    ##  6 Belgium                 8.09      10037   124140
    ##  7 Chad                    7.02         85     1211
    ##  8 Sweden                  6.25       5895    94283
    ##  9 Sudan                   6.12        836    13653
    ## 10 Bolivia                 5.90       8001   135716
    ## 11 Canada                  5.80       9319   160535
    ## 12 Niger                   5.76         69     1197
    ## 13 Egypt                   5.76       5956   103466
    ## 14 Iran                    5.72      26567   464596
    ## 15 France                  5.66      31926   563792
    ## 16 China                   5.21       4746    91101
    ## 17 Netherlands             5.02       6419   127786
    ## 18 Syria                   4.73        203     4289
    ## 19 Mali                    4.15        131     3156
    ## 20 Tanzania                4.13         21      509

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1088.      32535   29.9 
    ##  2 Belgium                 965.      10037   10.4 
    ##  3 Bolivia                 804.       8001    9.95
    ##  4 Ecuador                 777.      11495   14.8 
    ##  5 Chile                   768.      12867   16.7 
    ##  6 Brazil                  719.     144680  201.  
    ##  7 Mexico                  694.      78078  112.  
    ##  8 Spain                   690.      32086   46.5 
    ##  9 United Kingdom          678.      42268   62.3 
    ## 10 United States           666.     206558  310.  
    ## 11 Sweden                  617.       5895    9.56
    ## 12 Italy                   596.      35941   60.3 
    ## 13 Colombia                548.      26196   47.8 
    ## 14 France                  493.      31926   64.8 
    ## 15 Argentina               491.      20288   41.3 
    ## 16 Netherlands             386.       6419   16.6 
    ## 17 Iran                    345.      26567   76.9 
    ## 18 South Africa            345.      16909   49   
    ## 19 Iraq                    313.       9298   29.7 
    ## 20 Honduras                298.       2380    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
