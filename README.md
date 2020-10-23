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

Updated: 2020-10-24

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
    ##  1 United States           35098.  8248149            235
    ##  2 India                   34804.  7761312            223
    ##  3 Brazil                  23550.  5298772            225
    ##  4 Russia                   6760.  1480646            219
    ##  5 Argentina                4715.  1037325            220
    ##  6 Colombia                 4482.   981700            219
    ##  7 Spain                    4367.  1026281            235
    ##  8 France                   4104.   968729            236
    ##  9 Peru                     3985.   876885            220
    ## 10 Mexico                   3961.   867559            219
    ## 11 United Kingdom           3463.   810471            234
    ## 12 South Africa             3229.   710515            220
    ## 13 Iran                     2285.   550757            241
    ## 14 Chile                    2249.   497131            221
    ## 15 Iraq                     1982.   442164            223
    ## 16 Bangladesh               1964.   394827            201
    ## 17 Italy                    1916.   465726            243
    ## 18 Germany                  1701.   403291            237
    ## 19 Indonesia                1692.   377541            223
    ## 20 Philippines              1631.   363888            223

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           187.               41826.            224
    ##  2 Chile                            134.               29686.            221
    ##  3 Peru                             133.               29320.            220
    ##  4 Brazil                           117.               26349.            225
    ##  5 Argentina                        114.               25091.            220
    ##  6 United States                    113.               26587.            235
    ##  7 Belgium                          111.               25958.            233
    ##  8 Czech Republic                    94.6              21293.            225
    ##  9 Spain                             93.9              22068.            235
    ## 10 Colombia                          93.8              20542.            219
    ## 11 Bolivia                           68.4              14097.            206
    ## 12 Netherlands                       68.1              15747.            231
    ## 13 Iraq                              66.8              14902.            223
    ## 14 South Africa                      65.9              14500.            220
    ## 15 France                            63.4              14957.            236
    ## 16 Saudi Arabia                      59.6              13360.            224
    ## 17 Dominican Republic                58.3              12508.            214
    ## 18 United Kingdom                    55.5              12999.            234
    ## 19 Libya                             54.9               8144.            148
    ## 20 Honduras                          54.7              11400.            208

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         599     2061
    ##  2 Mexico                 10.1       87415   867559
    ##  3 Ecuador                 7.99      12500   156451
    ##  4 Italy                   7.94      36968   465726
    ##  5 Chad                    6.81         96     1410
    ##  6 Bolivia                 6.10       8558   140228
    ##  7 Sudan                   6.09        836    13724
    ##  8 Egypt                   5.81       6166   106060
    ##  9 Iran                    5.75      31650   550757
    ## 10 Niger                   5.68         69     1215
    ## 11 United Kingdom          5.47      44347   810471
    ## 12 Sweden                  5.44       5930   108969
    ## 13 China                   5.18       4746    91621
    ## 14 Syria                   4.94        260     5267
    ## 15 Canada                  4.76       9829   206360
    ## 16 Tanzania                4.13         21      509
    ## 17 Belgium                 3.92      10588   270038
    ## 18 Peru                    3.87      33937   876885
    ## 19 Mali                    3.84        132     3440
    ## 20 Afghanistan             3.70       1505    40626

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1135.      33937   29.9 
    ##  2 Belgium                1018.      10588   10.4 
    ##  3 Bolivia                 860.       8558    9.95
    ##  4 Ecuador                 845.      12500   14.8 
    ##  5 Chile                   824.      13792   16.7 
    ##  6 Mexico                  777.      87415  112.  
    ##  7 Brazil                  773.     155403  201.  
    ##  8 Spain                   742.      34521   46.5 
    ##  9 United Kingdom          711.      44347   62.3 
    ## 10 United States           711.     220563  310.  
    ## 11 Argentina               666.      27519   41.3 
    ## 12 Sweden                  621.       5930    9.56
    ## 13 Colombia                617.      29464   47.8 
    ## 14 Italy                   613.      36968   60.3 
    ## 15 France                  524.      33928   64.8 
    ## 16 Netherlands             415.       6909   16.6 
    ## 17 Iran                    411.      31650   76.9 
    ## 18 South Africa            385.      18843   49   
    ## 19 Iraq                    353.      10465   29.7 
    ## 20 Honduras                325.       2596    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
