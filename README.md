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

Updated: 2020-10-30

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
    ##  1 United States           36030.  8683298            241
    ##  2 India                   35110.  8040203            229
    ##  3 Brazil                  23548.  5439641            231
    ##  4 Russia                   7029.  1581693            225
    ##  5 France                   4971.  1203068            242
    ##  6 Argentina                4940.  1116609            226
    ##  7 Spain                    4715.  1136503            241
    ##  8 Colombia                 4592.  1033218            225
    ##  9 Mexico                   4005.   901268            225
    ## 10 Peru                     3948.   892497            226
    ## 11 United Kingdom           3926.   942279            240
    ## 12 South Africa             3184.   719714            226
    ## 13 Iran                     2383.   588648            247
    ## 14 Italy                    2368.   589766            249
    ## 15 Chile                    2226.   505530            227
    ## 16 Iraq                     2025.   463951            229
    ## 17 Germany                  1979.   481013            243
    ## 18 Bangladesh               1947.   403079            207
    ## 19 Indonesia                1748.   400483            229
    ## 20 Ukraine                  1691.   370417            219

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           183.               42168.            230
    ##  2 Belgium                          148.               35398.            239
    ##  3 Chile                            133.               30187.            227
    ##  4 Peru                             132.               29842.            226
    ##  5 Czech Republic                   123.               28352.            231
    ##  6 Argentina                        119.               27008.            226
    ##  7 Brazil                           117.               27049.            231
    ##  8 United States                    116.               27990.            241
    ##  9 Spain                            101.               24438.            241
    ## 10 Colombia                          96.1              21620.            225
    ## 11 Netherlands                       83.4              19785.            237
    ## 12 France                            76.7              18575.            242
    ## 13 Switzerland                       73.9              17834.            241
    ## 14 Iraq                              68.3              15636.            229
    ## 15 Bolivia                           66.9              14187.            212
    ## 16 South Africa                      65.0              14688.            226
    ## 17 United Kingdom                    63.0              15113.            240
    ## 18 Libya                             59.1               9112.            154
    ## 19 Saudi Arabia                      58.5              13448.            230
    ## 20 Dominican Republic                58.0              12782.            220

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         600     2065
    ##  2 Mexico                  9.97      89814   901268
    ##  3 Ecuador                 7.65      12608   164908
    ##  4 Chad                    6.61         97     1468
    ##  5 Italy                   6.43      37905   589766
    ##  6 Bolivia                 6.14       8672   141124
    ##  7 Sudan                   6.08        837    13765
    ##  8 Egypt                   5.82       6234   107030
    ##  9 Iran                    5.73      33714   588648
    ## 10 Niger                   5.67         69     1218
    ## 11 China                   5.17       4746    91821
    ## 12 Sweden                  5.03       5927   117913
    ## 13 Syria                   4.98        278     5580
    ## 14 United Kingdom          4.85      45675   942279
    ## 15 Canada                  4.49      10001   222887
    ## 16 Tanzania                4.13         21      509
    ## 17 Mali                    3.85        136     3530
    ## 18 Peru                    3.84      34257   892497
    ## 19 Afghanistan             3.72       1529    41145
    ## 20 Nicaragua               3.53        156     4424

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1145.      34257   29.9 
    ##  2 Belgium                1074.      11170   10.4 
    ##  3 Bolivia                 872.       8672    9.95
    ##  4 Ecuador                 852.      12608   14.8 
    ##  5 Chile                   838.      14032   16.7 
    ##  6 Mexico                  799.      89814  112.  
    ##  7 Brazil                  785.     157946  201.  
    ##  8 Spain                   763.      35466   46.5 
    ##  9 United Kingdom          733.      45675   62.3 
    ## 10 United States           725.     225073  310.  
    ## 11 Argentina               719.      29730   41.3 
    ## 12 Colombia                640.      30565   47.8 
    ## 13 Italy                   628.      37905   60.3 
    ## 14 Sweden                  620.       5927    9.56
    ## 15 France                  548.      35484   64.8 
    ## 16 Iran                    438.      33714   76.9 
    ## 17 Netherlands             432.       7192   16.6 
    ## 18 South Africa            390.      19111   49   
    ## 19 Iraq                    363.      10770   29.7 
    ## 20 Israel                  331.       2435    7.35

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
