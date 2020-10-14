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

Updated: 2020-10-15

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
    ##  1 United States           34196.  7728436            226
    ##  2 India                   33828.  7239389            214
    ##  3 Brazil                  23626.  5103408            216
    ##  4 Russia                   6382.  1340409            210
    ##  5 Colombia                 4376.   919083            210
    ##  6 Argentina                4283.   903730            211
    ##  7 Peru                     4033.   851171            211
    ##  8 Mexico                   3909.   821045            210
    ##  9 Spain                    3810.   861112            226
    ## 10 South Africa             3291.   694537            211
    ## 11 France                   3182.   728745            229
    ## 12 United Kingdom           2821.   634924            225
    ## 13 Chile                    2284.   484280            212
    ## 14 Iran                     2191.   508389            232
    ## 15 Bangladesh               1985.   381275            192
    ## 16 Iraq                     1912.   409358            214
    ## 17 Turkey                   1612.   338779            210
    ## 18 Philippines              1610.   344713            214
    ## 19 Indonesia                1591.   340622            214
    ## 20 Saudi Arabia             1581.   340089            215

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           184.               39655.            215
    ##  2 Chile                            136.               28918.            212
    ##  3 Peru                             135.               28461.            211
    ##  4 Brazil                           117.               25377.            216
    ##  5 United States                    110.               24912.            226
    ##  6 Argentina                        104.               21859.            211
    ##  7 Colombia                          91.6              19232.            210
    ##  8 Spain                             81.9              18516.            226
    ##  9 Belgium                           74.2              16644.            224
    ## 10 Bolivia                           70.7              13943.            197
    ## 11 South Africa                      67.2              14174.            211
    ## 12 Iraq                              64.4              13796.            214
    ## 13 Saudi Arabia                      61.5              13217.            215
    ## 14 Dominican Republic                58.9              12114.            205
    ## 15 Czech Republic                    57.3              12385.            216
    ## 16 Honduras                          53.0              10566.            199
    ## 17 Netherlands                       51.0              11334.            222
    ## 18 Libya                             50.0               6962.            139
    ## 19 France                            49.1              11252.            229
    ## 20 Ecuador                           47.4              10018.            211

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         597     2057
    ##  2 Mexico                 10.2       83945   821045
    ##  3 Italy                   9.92      36246   365467
    ##  4 Ecuador                 8.26      12235   148171
    ##  5 Chad                    6.96         92     1321
    ##  6 United Kingdom          6.78      43018   634924
    ##  7 Sudan                   6.11        836    13691
    ##  8 Bolivia                 6.00       8326   138695
    ##  9 Belgium                 5.92      10244   173147
    ## 10 Sweden                  5.86       5899   100654
    ## 11 Egypt                   5.79       6071   104787
    ## 12 Niger                   5.75         69     1201
    ## 13 Iran                    5.72      29070   508389
    ## 14 Canada                  5.27       9627   182839
    ## 15 China                   5.19       4746    91388
    ## 16 Syria                   4.79        231     4826
    ## 17 France                  4.48      32679   728745
    ## 18 Tanzania                4.13         21      509
    ## 19 Mali                    4.00        132     3297
    ## 20 Peru                    3.92      33357   851171

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1115.      33357   29.9 
    ##  2 Belgium                 985.      10244   10.4 
    ##  3 Bolivia                 837.       8326    9.95
    ##  4 Ecuador                 827.      12235   14.8 
    ##  5 Chile                   800.      13396   16.7 
    ##  6 Brazil                  749.     150689  201.  
    ##  7 Mexico                  746.      83945  112.  
    ##  8 Spain                   708.      32929   46.5 
    ##  9 United Kingdom          690.      43018   62.3 
    ## 10 United States           689.     213626  310.  
    ## 11 Sweden                  617.       5899    9.56
    ## 12 Italy                   601.      36246   60.3 
    ## 13 Colombia                586.      27985   47.8 
    ## 14 Argentina               585.      24186   41.3 
    ## 15 France                  505.      32679   64.8 
    ## 16 Netherlands             398.       6622   16.6 
    ## 17 Iran                    378.      29070   76.9 
    ## 18 South Africa            368.      18028   49   
    ## 19 Iraq                    336.       9970   29.7 
    ## 20 Honduras                316.       2521    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
