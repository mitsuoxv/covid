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

Updated: 2020-10-20

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
    ##  1 United States           34715.  8019237            231
    ##  2 India                   34476.  7550273            219
    ##  3 Brazil                  23639.  5224362            221
    ##  4 Russia                   6582.  1415316            215
    ##  5 Argentina                4532.   979119            216
    ##  6 Colombia                 4429.   952371            215
    ##  7 Spain                    4054.   936560            231
    ##  8 Peru                     4006.   865549            216
    ##  9 Mexico                   3939.   847108            215
    ## 10 France                   3709.   867978            234
    ## 11 South Africa             3258.   703793            216
    ## 12 United Kingdom           3140.   722413            230
    ## 13 Chile                    2265.   491760            217
    ## 14 Iran                     2237.   530380            237
    ## 15 Bangladesh               1972.   388569            197
    ## 16 Iraq                     1948.   426634            219
    ## 17 Italy                    1733.   414241            239
    ## 18 Indonesia                1652.   361867            219
    ## 19 Philippines              1628.   356618            219
    ## 20 Turkey                   1615.   347493            215

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           186.               40933.            220
    ##  2 Chile                            135.               29365.            217
    ##  3 Peru                             134.               28941.            216
    ##  4 Brazil                           118.               25978.            221
    ##  5 United States                    112.               25849.            231
    ##  6 Argentina                        110.               23683.            216
    ##  7 Belgium                           92.8              21355.            230
    ##  8 Colombia                          92.7              19928.            215
    ##  9 Spain                             87.2              20138.            231
    ## 10 Czech Republic                    75.1              16598.            221
    ## 11 Bolivia                           69.5              14045.            202
    ## 12 South Africa                      66.5              14363.            216
    ## 13 Iraq                              65.6              14379.            219
    ## 14 Saudi Arabia                      60.4              13299.            220
    ## 15 Netherlands                       60.4              13712.            227
    ## 16 Dominican Republic                58.7              12352.            210
    ## 17 France                            57.3              13401.            234
    ## 18 Honduras                          53.7              10964.            204
    ## 19 Libya                             52.3               7551.            144
    ## 20 United Kingdom                    50.4              11587.            230

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         599     2060
    ##  2 Mexico                 10.2       86059   847108
    ##  3 Italy                   8.82      36543   414241
    ##  4 Ecuador                 8.08      12387   153289
    ##  5 Chad                    6.74         93     1379
    ##  6 Sudan                   6.11        836    13691
    ##  7 Bolivia                 6.06       8463   139710
    ##  8 United Kingdom          6.04      43646   722413
    ##  9 Egypt                   5.81       6120   105424
    ## 10 Sweden                  5.73       5918   103200
    ## 11 Iran                    5.73      30375   530380
    ## 12 Niger                   5.70         69     1210
    ## 13 China                   5.19       4746    91507
    ## 14 Canada                  4.96       9746   196321
    ## 15 Syria                   4.88        248     5077
    ## 16 Belgium                 4.69      10413   222160
    ## 17 Tanzania                4.13         21      509
    ## 18 Mali                    3.90        132     3388
    ## 19 Peru                    3.89      33702   865549
    ## 20 France                  3.83      33204   867978

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1127.      33702   29.9 
    ##  2 Belgium                1001.      10413   10.4 
    ##  3 Bolivia                 851.       8463    9.95
    ##  4 Ecuador                 837.      12387   14.8 
    ##  5 Chile                   814.      13635   16.7 
    ##  6 Mexico                  765.      86059  112.  
    ##  7 Brazil                  764.     153675  201.  
    ##  8 Spain                   726.      33775   46.5 
    ##  9 United States           702.     217659  310.  
    ## 10 United Kingdom          700.      43646   62.3 
    ## 11 Argentina               631.      26107   41.3 
    ## 12 Sweden                  619.       5918    9.56
    ## 13 Italy                   606.      36543   60.3 
    ## 14 Colombia                603.      28803   47.8 
    ## 15 France                  513.      33204   64.8 
    ## 16 Netherlands             406.       6751   16.6 
    ## 17 Iran                    395.      30375   76.9 
    ## 18 South Africa            377.      18471   49   
    ## 19 Iraq                    346.      10254   29.7 
    ## 20 Honduras                321.       2563    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
