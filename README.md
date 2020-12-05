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

Updated: 2020-12-06

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
    ##  1 United States           50281. 13978171            278
    ##  2 India                   36121.  9608211            266
    ##  3 Brazil                  24205.  6487084            268
    ##  4 Russia                   9281.  2431731            262
    ##  5 France                   7989.  2228980            279
    ##  6 United Kingdom           6102.  1690436            277
    ##  7 Spain                    6059.  1684647            278
    ##  8 Italy                    5905.  1688939            286
    ##  9 Argentina                5504.  1447732            263
    ## 10 Colombia                 5127.  1343322            262
    ## 11 Mexico                   4368.  1144643            262
    ## 12 Germany                  4119.  1153555            280
    ## 13 Poland                   3916.  1041846            266
    ## 14 Peru                     3683.   968846            263
    ## 15 Iran                     3580.  1016835            284
    ## 16 Ukraine                  3131.   801716            256
    ## 17 South Africa             3063.   805804            263
    ## 18 Belgium                  2128.   587439            276
    ## 19 Indonesia                2119.   563680            266
    ## 20 Chile                    2110.   557135            264

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      205.               56468.            276
    ##  2 Czech Republic               193.               51776.            268
    ##  3 Israel                       173.               46227.            267
    ##  4 Switzerland                  163.               45258.            278
    ##  5 United States                162.               45057.            278
    ##  6 Jordan                       142.               36577.            258
    ##  7 Argentina                    133.               35017.            263
    ##  8 Austria                      132.               35962.            272
    ##  9 Spain                        130.               36224.            278
    ## 10 Chile                        126.               33269.            264
    ## 11 France                       123.               34415.            279
    ## 12 Peru                         123.               32395.            263
    ## 13 Brazil                       120.               32257.            268
    ## 14 Netherlands                  119.               32638.            274
    ## 15 Portugal                     110.               29276.            267
    ## 16 Serbia                       108.               28175.            261
    ## 17 Colombia                     107.               28109.            262
    ## 18 Sweden                       107.               29187.            273
    ## 19 Poland                       102.               27061.            266
    ## 20 United Kingdom                97.9              27113.            277

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         607     2081
    ##  2 Mexico                  9.45     108173  1144643
    ##  3 Ecuador                 6.95      13612   195884
    ##  4 Sudan                   6.86       1271    18535
    ##  5 Bolivia                 6.19       8982   145186
    ##  6 Chad                    5.93        102     1719
    ##  7 Egypt                   5.73       6732   117583
    ##  8 Syria                   5.31        437     8233
    ##  9 China                   5.05       4753    94038
    ## 10 Iran                    4.89      49695  1016835
    ## 11 Niger                   4.63         76     1640
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.90       1847    47388
    ## 14 Peru                    3.73      36104   968846
    ## 15 United Kingdom          3.59      60617  1690436
    ## 16 Italy                   3.48      58852  1688939
    ## 17 Nicaragua               3.45        161     4671
    ## 18 Tunisia                 3.42       3481   101900
    ## 19 Guatemala               3.38       4224   124805
    ## 20 Mali                    3.30        163     4938

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1648.      17142   10.4 
    ##  2 Peru                   1207.      36104   29.9 
    ##  3 Spain                   995.      46252   46.5 
    ##  4 Italy                   975.      58852   60.3 
    ##  5 United Kingdom          972.      60617   62.3 
    ##  6 Mexico                  962.     108173  112.  
    ##  7 Argentina               951.      39305   41.3 
    ##  8 Chile                   929.      15558   16.7 
    ##  9 Ecuador                 920.      13612   14.8 
    ## 10 Bolivia                 903.       8982    9.95
    ## 11 United States           883.     274077  310.  
    ## 12 Brazil                  872.     175270  201.  
    ## 13 France                  840.      54404   64.8 
    ## 14 Czech Republic          834.       8738   10.5 
    ## 15 Colombia                781.      37305   47.8 
    ## 16 Sweden                  740.       7067    9.56
    ## 17 Bulgaria                650.       4650    7.15
    ## 18 Iran                    646.      49695   76.9 
    ## 19 Switzerland             637.       4832    7.58
    ## 20 Netherlands             577.       9610   16.6

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
