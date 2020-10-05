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

Updated: 2020-10-06

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
    ##  1 United States           33664.  7305270            217
    ##  2 India                   32311.  6623815            205
    ##  3 Brazil                  23704.  4906833            207
    ##  4 Russia                   6068.  1225889            202
    ##  5 Colombia                 4219.   848147            201
    ##  6 Peru                     4083.   824985            202
    ##  7 Argentina                3914.   790818            202
    ##  8 Mexico                   3770.   757953            201
    ##  9 Spain                    3640.   789932            217
    ## 10 South Africa             3372.   681289            202
    ## 11 France                   2696.   593248            220
    ## 12 United Kingdom           2328.   502982            216
    ## 13 Chile                    2315.   470179            203
    ## 14 Iran                     2115.   471772            223
    ## 15 Bangladesh               2014.   368690            183
    ## 16 Iraq                     1849.   379141            205
    ## 17 Saudi Arabia             1632.   336387            206
    ## 18 Turkey                   1605.   324443            202
    ## 19 Philippines              1572.   322497            205
    ## 20 Pakistan                 1549.   314616            203

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           175.               36008.            206
    ##  2 Chile                            138.               28076.            203
    ##  3 Peru                             137.               27585.            202
    ##  4 Brazil                           118.               24400.            207
    ##  5 United States                    109.               23548.            217
    ##  6 Argentina                         94.7              19128.            202
    ##  7 Colombia                          88.3              17747.            201
    ##  8 Spain                             78.3              16986.            217
    ##  9 Bolivia                           73.0              13729.            188
    ## 10 South Africa                      68.8              13904.            202
    ## 11 Saudi Arabia                      63.4              13073.            206
    ## 12 Iraq                              62.3              12778.            205
    ## 13 Dominican Republic                59.3              11653.            196
    ## 14 Belgium                           58.1              12510.            215
    ## 15 Honduras                          51.8               9862.            190
    ## 16 Kazakhstan                        47.6               9247.            194
    ## 17 Ecuador                           47.2               9535.            202
    ## 18 Sweden                            46.2               9866.            213
    ## 19 Kyrgyzstan                        45.7               8647.            189
    ## 20 Belarus                           43.8               8291.            189

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         592     2045
    ##  2 Italy                  11.1       35986   325329
    ##  3 Mexico                 10.4       78880   757953
    ##  4 United Kingdom          8.42      42350   502982
    ##  5 Ecuador                 8.26      11647   141034
    ##  6 Belgium                 7.73      10064   130141
    ##  7 Chad                    7.07         86     1217
    ##  8 Sweden                  6.25       5895    94283
    ##  9 Sudan                   6.12        836    13653
    ## 10 Bolivia                 5.91       8073   136569
    ## 11 Egypt                   5.77       5981   103683
    ## 12 Canada                  5.75       9462   164471
    ## 13 Niger                   5.75         69     1200
    ## 14 Iran                    5.71      26957   471772
    ## 15 France                  5.39      32001   593248
    ## 16 China                   5.21       4746    91146
    ## 17 Netherlands             4.75       6445   135749
    ## 18 Syria                   4.70        205     4366
    ## 19 Tanzania                4.13         21      509
    ## 20 Mali                    4.11        131     3184

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1092.      32665   29.9 
    ##  2 Belgium                 967.      10064   10.4 
    ##  3 Bolivia                 812.       8073    9.95
    ##  4 Ecuador                 787.      11647   14.8 
    ##  5 Chile                   775.      12979   16.7 
    ##  6 Brazil                  726.     145987  201.  
    ##  7 Mexico                  701.      78880  112.  
    ##  8 Spain                   690.      32086   46.5 
    ##  9 United Kingdom          679.      42350   62.3 
    ## 10 United States           671.     208064  310.  
    ## 11 Sweden                  617.       5895    9.56
    ## 12 Italy                   596.      35986   60.3 
    ## 13 Colombia                556.      26556   47.8 
    ## 14 Argentina               503.      20795   41.3 
    ## 15 France                  494.      32001   64.8 
    ## 16 Netherlands             387.       6445   16.6 
    ## 17 Iran                    350.      26957   76.9 
    ## 18 South Africa            346.      16976   49   
    ## 19 Iraq                    317.       9399   29.7 
    ## 20 Honduras                300.       2399    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
