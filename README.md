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

Updated: 2020-10-12

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
    ##  1 United States           34007.  7583748            223
    ##  2 India                   33430.  7053806            211
    ##  3 Brazil                  23736.  5055888            213
    ##  4 Russia                   6273.  1298718            207
    ##  5 Colombia                 4320.   894300            207
    ##  6 Argentina                4189.   871468            208
    ##  7 Peru                     4054.   843355            208
    ##  8 Mexico                   3911.   809751            207
    ##  9 Spain                    3861.   861112            223
    ## 10 South Africa             3321.   690896            208
    ## 11 France                   3059.   691368            226
    ## 12 United Kingdom           2661.   590848            222
    ## 13 Chile                    2294.   479595            209
    ## 14 Iran                     2166.   496253            229
    ## 15 Bangladesh               1994.   377073            189
    ## 16 Iraq                     1896.   400124            211
    ## 17 Turkey                   1613.   334031            207
    ## 18 Saudi Arabia             1598.   338944            212
    ## 19 Philippines              1596.   336926            211
    ## 20 Indonesia                1558.   328952            211

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           183.               38905.            212
    ##  2 Chile                            137.               28639.            209
    ##  3 Peru                             136.               28199.            208
    ##  4 Brazil                           118.               25141.            213
    ##  5 United States                    110.               24445.            223
    ##  6 Argentina                        101.               21079.            208
    ##  7 Colombia                          90.4              18713.            207
    ##  8 Spain                             83.0              18516.            223
    ##  9 Bolivia                           71.6              13896.            194
    ## 10 Belgium                           68.2              15076.            221
    ## 11 South Africa                      67.8              14100.            208
    ## 12 Iraq                              63.9              13485.            211
    ## 13 Saudi Arabia                      62.1              13172.            212
    ## 14 Dominican Republic                59.3              12013.            202
    ## 15 Honduras                          52.6              10333.            196
    ## 16 Czech Republic                    49.0              10440.            213
    ## 17 Ecuador                           47.7               9927.            208
    ## 18 Libya                             47.3               6451.            136
    ## 19 France                            47.2              10674.            226
    ## 20 Sweden                            47.0              10303.            219

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         596     2055
    ##  2 Italy                  10.3       36140   349494
    ##  3 Mexico                 10.3       83507   809751
    ##  4 Ecuador                 8.30      12188   146828
    ##  5 United Kingdom          7.24      42760   590848
    ##  6 Chad                    7.13         92     1291
    ##  7 Belgium                 6.49      10175   156838
    ##  8 Sudan                   6.12        836    13670
    ##  9 Sweden                  5.99       5894    98451
    ## 10 Bolivia                 5.98       8262   138226
    ## 11 Egypt                   5.79       6040   104387
    ## 12 Niger                   5.75         69     1200
    ## 13 Iran                    5.70      28293   496253
    ## 14 Canada                  5.38       9585   178117
    ## 15 China                   5.20       4746    91305
    ## 16 Syria                   4.73        221     4673
    ## 17 France                  4.69      32449   691368
    ## 18 Tanzania                4.13         21      509
    ## 19 Mali                    4.03        132     3273
    ## 20 Peru                    3.93      33158   843355

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1109.      33158   29.9 
    ##  2 Belgium                 978.      10175   10.4 
    ##  3 Bolivia                 831.       8262    9.95
    ##  4 Ecuador                 824.      12188   14.8 
    ##  5 Chile                   793.      13272   16.7 
    ##  6 Brazil                  744.     149639  201.  
    ##  7 Mexico                  742.      83507  112.  
    ##  8 Spain                   708.      32929   46.5 
    ##  9 United Kingdom          686.      42760   62.3 
    ## 10 United States           684.     212229  310.  
    ## 11 Sweden                  617.       5894    9.56
    ## 12 Italy                   599.      36140   60.3 
    ## 13 Colombia                575.      27495   47.8 
    ## 14 Argentina               562.      23225   41.3 
    ## 15 France                  501.      32449   64.8 
    ## 16 Netherlands             394.       6558   16.6 
    ## 17 Iran                    368.      28293   76.9 
    ## 18 South Africa            361.      17673   49   
    ## 19 Iraq                    330.       9790   29.7 
    ## 20 Honduras                312.       2492    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
