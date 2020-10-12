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

Updated: 2020-10-13

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
    ##  1 United States           34092.  7636803            224
    ##  2 India                   33587.  7120538            212
    ##  3 Brazil                  23750.  5082637            214
    ##  4 Russia                   6308.  1312310            208
    ##  5 Colombia                 4340.   902747            208
    ##  6 Argentina                4229.   883882            209
    ##  7 Peru                     4048.   846088            209
    ##  8 Mexico                   3914.   814328            208
    ##  9 Spain                    3844.   861112            224
    ## 10 South Africa             3313.   692471            209
    ## 11 France                   3116.   707469            227
    ## 12 United Kingdom           2707.   603720            223
    ## 13 Chile                    2291.   481371            210
    ## 14 Iran                     2174.   500075            230
    ## 15 Bangladesh               1990.   378266            190
    ## 16 Iraq                     1897.   402330            212
    ## 17 Turkey                   1612.   335533            208
    ## 18 Philippines              1600.   339341            212
    ## 19 Saudi Arabia             1592.   339267            213
    ## 20 Indonesia                1572.   333449            212

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           183.               38905.            213
    ##  2 Chile                            137.               28745.            210
    ##  3 Peru                             135.               28291.            209
    ##  4 Brazil                           118.               25274.            214
    ##  5 United States                    110.               24616.            224
    ##  6 Argentina                        102.               21379.            209
    ##  7 Colombia                          90.8              18890.            208
    ##  8 Spain                             82.7              18516.            224
    ##  9 Bolivia                           71.3              13919.            195
    ## 10 Belgium                           70.2              15588.            222
    ## 11 South Africa                      67.6              14132.            209
    ## 12 Iraq                              63.9              13559.            212
    ## 13 Saudi Arabia                      61.9              13185.            213
    ## 14 Dominican Republic                59.3              12060.            203
    ## 15 Honduras                          52.8              10407.            197
    ## 16 Czech Republic                    52.2              11179.            214
    ## 17 Libya                             48.1               6610.            137
    ## 18 France                            48.1              10923.            227
    ## 19 Netherlands                       47.6              10481.            220
    ## 20 Ecuador                           47.4               9927.            209

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         596     2056
    ##  2 Mexico                 10.3       83642   814328
    ##  3 Italy                  10.2       36166   354950
    ##  4 Ecuador                 8.30      12188   146828
    ##  5 United Kingdom          7.09      42825   603720
    ##  6 Chad                    7.06         92     1304
    ##  7 Belgium                 6.28      10191   162165
    ##  8 Sudan                   6.11        836    13685
    ##  9 Bolivia                 5.99       8292   138463
    ## 10 Sweden                  5.99       5894    98451
    ## 11 Egypt                   5.79       6052   104516
    ## 12 Niger                   5.75         69     1201
    ## 13 Iran                    5.71      28544   500075
    ## 14 Canada                  5.33       9608   180179
    ## 15 China                   5.20       4746    91333
    ## 16 Syria                   4.75        224     4718
    ## 17 France                  4.59      32495   707469
    ## 18 Tanzania                4.13         21      509
    ## 19 Mali                    4.02        132     3286
    ## 20 Peru                    3.93      33223   846088

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1111.      33223   29.9 
    ##  2 Belgium                 980.      10191   10.4 
    ##  3 Bolivia                 834.       8292    9.95
    ##  4 Ecuador                 824.      12188   14.8 
    ##  5 Chile                   795.      13318   16.7 
    ##  6 Brazil                  747.     150198  201.  
    ##  7 Mexico                  744.      83642  112.  
    ##  8 Spain                   708.      32929   46.5 
    ##  9 United Kingdom          687.      42825   62.3 
    ## 10 United States           686.     212804  310.  
    ## 11 Sweden                  617.       5894    9.56
    ## 12 Italy                   599.      36166   60.3 
    ## 13 Colombia                579.      27660   47.8 
    ## 14 Argentina               570.      23581   41.3 
    ## 15 France                  502.      32495   64.8 
    ## 16 Netherlands             395.       6575   16.6 
    ## 17 Iran                    371.      28544   76.9 
    ## 18 South Africa            363.      17780   49   
    ## 19 Iraq                    332.       9852   29.7 
    ## 20 Honduras                313.       2504    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
