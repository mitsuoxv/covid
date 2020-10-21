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

Updated: 2020-10-22

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
    ##  1 United States           34869.  8124633            233
    ##  2 India                   34620.  7651107            221
    ##  3 Brazil                  23545.  5250727            223
    ##  4 Russia                   6669.  1447335            217
    ##  5 Argentina                4599.  1002662            218
    ##  6 Colombia                 4451.   965883            217
    ##  7 Spain                    4241.   988322            233
    ##  8 Peru                     3994.   870876            218
    ##  9 Mexico                   3939.   854926            217
    ## 10 France                   3819.   901346            236
    ## 11 United Kingdom           3286.   762546            232
    ## 12 South Africa             3239.   706304            218
    ## 13 Iran                     2257.   539670            239
    ## 14 Chile                    2257.   494478            219
    ## 15 Bangladesh               1967.   391586            199
    ## 16 Iraq                     1966.   434598            221
    ## 17 Italy                    1802.   434449            241
    ## 18 Indonesia                1668.   368842            221
    ## 19 Philippines              1632.   360775            221
    ## 20 Germany                  1620.   380762            235

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           186.               41303.            222
    ##  2 Chile                            135.               29527.            219
    ##  3 Peru                             134.               29119.            218
    ##  4 Brazil                           117.               26110.            223
    ##  5 United States                    112.               26189.            233
    ##  6 Argentina                        111.               24252.            218
    ##  7 Belgium                           99.8              23077.            231
    ##  8 Colombia                          93.1              20211.            217
    ##  9 Spain                             91.2              21252.            233
    ## 10 Czech Republic                    83.0              18513.            223
    ## 11 Bolivia                           68.9              14063.            204
    ## 12 Iraq                              66.3              14647.            221
    ## 13 South Africa                      66.1              14414.            218
    ## 14 Netherlands                       64.0              14665.            229
    ## 15 Saudi Arabia                      60.0              13329.            222
    ## 16 France                            59.0              13916.            236
    ## 17 Dominican Republic                58.4              12416.            212
    ## 18 Honduras                          54.2              11187.            206
    ## 19 Libya                             53.9               7878.            146
    ## 20 United Kingdom                    52.7              12230.            232

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         599     2061
    ##  2 Mexico                 10.1       86338   854926
    ##  3 Italy                   8.45      36705   434449
    ##  4 Ecuador                 8.05      12404   154115
    ##  5 Chad                    6.65         93     1399
    ##  6 Sudan                   6.09        836    13724
    ##  7 Bolivia                 6.08       8502   139890
    ##  8 Egypt                   5.81       6142   105705
    ##  9 United Kingdom          5.77      43967   762546
    ## 10 Iran                    5.75      31034   539670
    ## 11 Niger                   5.69         69     1212
    ## 12 Sweden                  5.57       5922   106380
    ## 13 China                   5.18       4746    91565
    ## 14 Syria                   4.90        254     5180
    ## 15 Canada                  4.85       9778   201437
    ## 16 Belgium                 4.37      10489   240066
    ## 17 Tanzania                4.13         21      509
    ## 18 Peru                    3.88      33820   870876
    ## 19 Mali                    3.87        132     3411
    ## 20 France                  3.73      33611   901346

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1131.      33820   29.9 
    ##  2 Belgium                1008.      10489   10.4 
    ##  3 Bolivia                 855.       8502    9.95
    ##  4 Ecuador                 839.      12404   14.8 
    ##  5 Chile                   818.      13702   16.7 
    ##  6 Mexico                  768.      86338  112.  
    ##  7 Brazil                  767.     154176  201.  
    ##  8 Spain                   736.      34210   46.5 
    ##  9 United Kingdom          705.      43967   62.3 
    ## 10 United States           705.     218641  310.  
    ## 11 Argentina               646.      26716   41.3 
    ## 12 Sweden                  620.       5922    9.56
    ## 13 Colombia                609.      29102   47.8 
    ## 14 Italy                   608.      36705   60.3 
    ## 15 France                  519.      33611   64.8 
    ## 16 Netherlands             409.       6804   16.6 
    ## 17 Iran                    403.      31034   76.9 
    ## 18 South Africa            381.      18656   49   
    ## 19 Iraq                    349.      10366   29.7 
    ## 20 Honduras                322.       2576    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
