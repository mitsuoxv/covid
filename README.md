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

Updated: 2020-10-17

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
    ##  1 United States           34359.  7833851            228
    ##  2 India                   34122.  7370468            216
    ##  3 Brazil                  23581.  5140863            218
    ##  4 Russia                   6458.  1369313            212
    ##  5 Colombia                 4387.   930159            212
    ##  6 Argentina                4375.   931967            213
    ##  7 Spain                    4041.   921374            228
    ##  8 Peru                     4023.   856951            213
    ##  9 Mexico                   3912.   829396            212
    ## 10 France                   3380.   780994            231
    ## 11 South Africa             3277.   698184            213
    ## 12 United Kingdom           2967.   673626            227
    ## 13 Chile                    2273.   486496            214
    ## 14 Iran                     2212.   517835            234
    ## 15 Bangladesh               1982.   384559            194
    ## 16 Iraq                     1929.   416802            216
    ## 17 Italy                    1616.   381602            236
    ## 18 Indonesia                1616.   349160            216
    ## 19 Philippines              1614.   348698            216
    ## 20 Turkey                   1613.   342143            212

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           186.               40404.            217
    ##  2 Chile                            136.               29051.            214
    ##  3 Peru                             135.               28654.            213
    ##  4 Brazil                           117.               25563.            218
    ##  5 United States                    111.               25252.            228
    ##  6 Argentina                        106.               22542.            213
    ##  7 Colombia                          91.8              19463.            212
    ##  8 Spain                             86.9              19812.            228
    ##  9 Belgium                           81.6              18443.            226
    ## 10 Bolivia                           70.2              13988.            199
    ## 11 South Africa                      66.9              14249.            213
    ## 12 Czech Republic                    65.2              14224.            218
    ## 13 Iraq                              65.0              14047.            216
    ## 14 Saudi Arabia                      61.1              13255.            217
    ## 15 Dominican Republic                58.9              12222.            207
    ## 16 Netherlands                       54.6              12239.            224
    ## 17 Honduras                          53.1              10696.            201
    ## 18 France                            52.2              12058.            231
    ## 19 Libya                             51.1               7224.            141
    ## 20 Sweden                            47.8              10717.            224

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         597     2057
    ##  2 Mexico                 10.2       84898   829396
    ##  3 Italy                   9.53      36372   381602
    ##  4 Ecuador                 8.18      12306   150360
    ##  5 Chad                    6.81         92     1350
    ##  6 United Kingdom          6.43      43293   673626
    ##  7 Sudan                   6.11        836    13691
    ##  8 Bolivia                 6.02       8377   139141
    ##  9 Egypt                   5.80       6088   105033
    ## 10 Sweden                  5.77       5910   102407
    ## 11 Niger                   5.73         69     1205
    ## 12 Iran                    5.72      29605   517835
    ## 13 Belgium                 5.38      10327   191866
    ## 14 China                   5.19       4746    91436
    ## 15 Canada                  5.10       9664   189387
    ## 16 Syria                   4.83        238     4931
    ## 17 France                  4.21      32868   780994
    ## 18 Tanzania                4.13         21      509
    ## 19 Mali                    3.92        132     3368
    ## 20 Peru                    3.91      33512   856951

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1121.      33512   29.9 
    ##  2 Belgium                 993.      10327   10.4 
    ##  3 Bolivia                 842.       8377    9.95
    ##  4 Ecuador                 832.      12306   14.8 
    ##  5 Chile                   802.      13434   16.7 
    ##  6 Mexico                  755.      84898  112.  
    ##  7 Brazil                  755.     151747  201.  
    ##  8 Spain                   721.      33553   46.5 
    ##  9 United Kingdom          694.      43293   62.3 
    ## 10 United States           694.     215199  310.  
    ## 11 Sweden                  618.       5910    9.56
    ## 12 Argentina               603.      24921   41.3 
    ## 13 Italy                   603.      36372   60.3 
    ## 14 Colombia                592.      28306   47.8 
    ## 15 France                  507.      32868   64.8 
    ## 16 Netherlands             402.       6683   16.6 
    ## 17 Iran                    385.      29605   76.9 
    ## 18 South Africa            374.      18309   49   
    ## 19 Iraq                    340.      10086   29.7 
    ## 20 Honduras                317.       2533    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
