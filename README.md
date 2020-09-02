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

Updated: 2020-09-03

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
    ##  1 United States           32436.  5968380            184
    ##  2 Brazil                  22461.  3908272            174
    ##  3 India                   21915.  3769523            172
    ##  4 Russia                   5946.  1005000            169
    ##  5 Peru                     3857.   652037            169
    ##  6 South Africa             3717.   628259            169
    ##  7 Colombia                 3661.   615168            168
    ##  8 Mexico                   3568.   599560            168
    ##  9 Spain                    2559.   470973            184
    ## 10 Argentina                2471.   417735            169
    ## 11 Chile                    2429.   413145            170
    ## 12 Bangladesh               2099.   314946            150
    ## 13 Iran                     1983.   376894            190
    ## 14 United Kingdom           1842.   337172            183
    ## 15 Saudi Arabia             1830.   316670            173
    ## 16 Pakistan                 1744.   296590            170
    ## 17 Turkey                   1607.   271705            169
    ## 18 France                   1442.   269718            187
    ## 19 Italy                    1399.   270189            193
    ## 20 Iraq                     1385.   238338            172

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            145.               24671.            170
    ##  2 Peru                             129.               21802.            169
    ##  3 Brazil                           112.               19434.            174
    ##  4 United States                    105.               19238.            184
    ##  5 Israel                            89.5              15597.            174
    ##  6 Colombia                          76.6              12872.            168
    ##  7 South Africa                      75.9              12822.            169
    ##  8 Bolivia                           75.6              11721.            155
    ##  9 Saudi Arabia                      71.1              12307.            173
    ## 10 Argentina                         59.8              10104.            169
    ## 11 Dominican Republic                59.1               9668.            163
    ## 12 Spain                             55.0              10127.            184
    ## 13 Kazakhstan                        53.2               8579.            161
    ## 14 Kyrgyzstan                        51.1               7994.            156
    ## 15 Sweden                            49.1               8845.            180
    ## 16 Honduras                          48.6               7637.            157
    ## 17 Belarus                           47.2               7430.            157
    ## 18 Iraq                              46.7               8033.            172
    ## 19 Ecuador                           45.7               7728.            169
    ## 20 Belgium                           45.0               8208.            182

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         570     1966
    ##  2 Italy                  13.1       35491   270189
    ##  3 United Kingdom         12.3       41504   337172
    ##  4 Belgium                11.6        9897    85393
    ##  5 France                 11.3       30517   269718
    ##  6 Mexico                 10.7       64414   599560
    ##  7 Hungary                 9.84        616     6257
    ##  8 Netherlands             8.75       6221    71057
    ##  9 Chad                    7.57         77     1017
    ## 10 Canada                  7.08       9126   128948
    ## 11 Sweden                  6.88       5813    84521
    ## 12 Sudan                   6.24        823    13189
    ## 13 Spain                   6.19      29152   470973
    ## 14 Niger                   5.87         69     1176
    ## 15 Iran                    5.75      21672   376894
    ## 16 Ecuador                 5.75       6571   114309
    ## 17 Egypt                   5.49       5440    99115
    ## 18 China                   5.23       4731    90422
    ## 19 Mali                    4.54        126     2777
    ## 20 Peru                    4.44      28944   652037

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    968.      28944   29.9 
    ##  2 Belgium                 951.       9897   10.4 
    ##  3 Chile                   676.      11321   16.7 
    ##  4 United Kingdom          666.      41504   62.3 
    ##  5 Spain                   627.      29152   46.5 
    ##  6 Sweden                  608.       5813    9.56
    ##  7 Brazil                  604.     121381  201.  
    ##  8 United States           589.     182585  310.  
    ##  9 Italy                   588.      35491   60.3 
    ## 10 Mexico                  573.      64414  112.  
    ## 11 Bolivia                 505.       5027    9.95
    ## 12 France                  471.      30517   64.8 
    ## 13 Ecuador                 444.       6571   14.8 
    ## 14 Colombia                411.      19663   47.8 
    ## 15 Netherlands             374.       6221   16.6 
    ## 16 South Africa            291.      14263   49   
    ## 17 Iran                    282.      21672   76.9 
    ## 18 Canada                  271.       9126   33.7 
    ## 19 Iraq                    240.       7123   29.7 
    ## 20 Honduras                234.       1873    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
