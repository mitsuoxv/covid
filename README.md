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

Updated: 2020-09-29

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
    ##  1 United States           33376.  7009110            210
    ##  2 India                   30680.  6074702            198
    ##  3 Brazil                  23589.  4717991            200
    ##  4 Russia                   5946.  1159573            195
    ##  5 Colombia                 4154.   806038            194
    ##  6 Peru                     4103.   800142            195
    ##  7 Mexico                   3744.   726431            194
    ##  8 Argentina                3602.   702484            195
    ##  9 South Africa             3439.   670766            195
    ## 10 Spain                    3411.   716481            210
    ## 11 France                   2416.   514781            213
    ## 12 Chile                    2335.   457901            196
    ## 13 United Kingdom           2081.   434973            209
    ## 14 Iran                     2066.   446448            216
    ## 15 Bangladesh               2040.   359148            176
    ## 16 Iraq                     1764.   349450            198
    ## 17 Saudi Arabia             1674.   333193            199
    ## 18 Turkey                   1611.   314433            195
    ## 19 Pakistan                 1585.   310841            196
    ## 20 Philippines              1536.   304226            198

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           155.               31118.            201
    ##  2 Chile                            139.               27343.            196
    ##  3 Peru                             137.               26754.            195
    ##  4 Brazil                           117.               23461.            200
    ##  5 United States                    108.               22593.            210
    ##  6 Argentina                         87.1              16992.            195
    ##  7 Colombia                          86.9              16866.            194
    ##  8 Bolivia                           74.1              13430.            181
    ##  9 Spain                             73.4              15406.            210
    ## 10 South Africa                      70.2              13689.            195
    ## 11 Saudi Arabia                      65.0              12949.            199
    ## 12 Dominican Republic                59.8              11338.            189
    ## 13 Iraq                              59.5              11777.            198
    ## 14 Belgium                           52.7              10967.            208
    ## 15 Honduras                          50.9               9331.            183
    ## 16 Ecuador                           49.8               9716.            195
    ## 17 Kazakhstan                        48.8               9144.            187
    ## 18 Kyrgyzstan                        46.1               8415.            182
    ## 19 Sweden                            46.1               9515.            206
    ## 20 Belarus                           43.7               8013.            183

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         588     2034
    ##  2 Italy                  11.6       35835   309870
    ##  3 Mexico                 10.5       76243   726431
    ##  4 United Kingdom          9.65      41988   434973
    ##  5 Belgium                 8.75       9980   114085
    ##  6 Ecuador                 7.85      11279   143703
    ##  7 Chad                    7.13         84     1178
    ##  8 Sweden                  6.47       5880    90923
    ##  9 Sudan                   6.14        836    13606
    ## 10 France                  6.13      31541   514781
    ## 11 Canada                  6.11       9262   151671
    ## 12 Bolivia                 5.86       7828   133592
    ## 13 Niger                   5.77         69     1196
    ## 14 Iran                    5.73      25589   446448
    ## 15 Egypt                   5.72       5883   102840
    ## 16 Netherlands             5.71       6365   111510
    ## 17 China                   5.22       4746    90993
    ## 18 Syria                   4.72        192     4072
    ## 19 Spain                   4.36      31232   716481
    ## 20 Mali                    4.21        130     3086

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1075.      32142   29.9 
    ##  2 Belgium                 959.       9980   10.4 
    ##  3 Bolivia                 787.       7828    9.95
    ##  4 Ecuador                 763.      11279   14.8 
    ##  5 Chile                   755.      12641   16.7 
    ##  6 Brazil                  703.     141406  201.  
    ##  7 Mexico                  678.      76243  112.  
    ##  8 United Kingdom          673.      41988   62.3 
    ##  9 Spain                   672.      31232   46.5 
    ## 10 United States           655.     203329  310.  
    ## 11 Sweden                  615.       5880    9.56
    ## 12 Italy                   594.      35835   60.3 
    ## 13 Colombia                529.      25296   47.8 
    ## 14 France                  487.      31541   64.8 
    ## 15 Netherlands             382.       6365   16.6 
    ## 16 Argentina               376.      15543   41.3 
    ## 17 South Africa            335.      16398   49   
    ## 18 Iran                    333.      25589   76.9 
    ## 19 Iraq                    303.       8990   29.7 
    ## 20 Honduras                286.       2288    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
