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

Updated: 2020-10-19

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
    ##  1 United States           34637.  7966729            230
    ##  2 India                   34378.  7494551            218
    ##  3 Brazil                  23637.  5200300            220
    ##  4 Russia                   6538.  1399334            214
    ##  5 Argentina                4491.   965609            215
    ##  6 Colombia                 4417.   945354            214
    ##  7 Spain                    4072.   936560            230
    ##  8 Peru                     4011.   862417            215
    ##  9 Mexico                   3932.   841661            214
    ## 10 France                   3597.   838145            233
    ## 11 South Africa             3265.   702131            215
    ## 12 United Kingdom           3080.   705432            229
    ## 13 Chile                    2268.   490003            216
    ## 14 Iran                     2230.   526490            236
    ## 15 Bangladesh               1975.   387295            196
    ## 16 Iraq                     1942.   423524            218
    ## 17 Italy                    1691.   402536            238
    ## 18 Indonesia                1641.   357762            218
    ## 19 Philippines              1625.   354338            218
    ## 20 Turkey                   1614.   345678            214

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           187.               40933.            219
    ##  2 Chile                            135.               29260.            216
    ##  3 Peru                             134.               28837.            215
    ##  4 Brazil                           118.               25859.            220
    ##  5 United States                    112.               25680.            230
    ##  6 Argentina                        109.               23356.            215
    ##  7 Colombia                          92.4              19781.            214
    ##  8 Belgium                           89.8              20477.            228
    ##  9 Spain                             87.5              20138.            230
    ## 10 Czech Republic                    73.2              16116.            220
    ## 11 Bolivia                           69.7              14030.            201
    ## 12 South Africa                      66.6              14329.            215
    ## 13 Iraq                              65.5              14274.            218
    ## 14 Saudi Arabia                      60.6              13285.            219
    ## 15 Dominican Republic                58.7              12309.            209
    ## 16 Netherlands                       58.4              13205.            226
    ## 17 France                            55.5              12941.            233
    ## 18 Honduras                          53.4              10851.            203
    ## 19 Libya                             51.7               7405.            143
    ## 20 United Kingdom                    49.4              11314.            229

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         597     2059
    ##  2 Mexico                 10.2       85704   841661
    ##  3 Italy                   9.06      36474   402536
    ##  4 Ecuador                 8.12      12375   152422
    ##  5 Chad                    6.81         93     1365
    ##  6 United Kingdom          6.18      43579   705432
    ##  7 Sudan                   6.11        836    13691
    ##  8 Bolivia                 6.05       8439   139562
    ##  9 Egypt                   5.80       6109   105297
    ## 10 Sweden                  5.73       5918   103200
    ## 11 Iran                    5.72      30123   526490
    ## 12 Niger                   5.71         69     1209
    ## 13 China                   5.19       4746    91490
    ## 14 Canada                  5.01       9722   194106
    ## 15 Belgium                 4.88      10392   213022
    ## 16 Syria                   4.87        245     5033
    ## 17 Tanzania                4.13         21      509
    ## 18 France                  3.95      33119   838145
    ## 19 Mali                    3.91        132     3379
    ## 20 Peru                    3.90      33648   862417

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1125.      33648   29.9 
    ##  2 Belgium                 999.      10392   10.4 
    ##  3 Bolivia                 848.       8439    9.95
    ##  4 Ecuador                 837.      12375   14.8 
    ##  5 Chile                   811.      13588   16.7 
    ##  6 Mexico                  762.      85704  112.  
    ##  7 Brazil                  762.     153214  201.  
    ##  8 Spain                   726.      33775   46.5 
    ##  9 United States           700.     217071  310.  
    ## 10 United Kingdom          699.      43579   62.3 
    ## 11 Argentina               622.      25723   41.3 
    ## 12 Sweden                  619.       5918    9.56
    ## 13 Italy                   604.      36474   60.3 
    ## 14 Colombia                599.      28616   47.8 
    ## 15 France                  511.      33119   64.8 
    ## 16 Netherlands             404.       6728   16.6 
    ## 17 Iran                    392.      30123   76.9 
    ## 18 South Africa            376.      18408   49   
    ## 19 Iraq                    344.      10198   29.7 
    ## 20 Honduras                320.       2556    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
