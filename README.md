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

Updated: 2020-09-14

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
    ##  1 United States           32752.  6386832            195
    ##  2 India                   25979.  4754356            183
    ##  3 Brazil                  23146.  4282164            185
    ##  4 Russia                   5904.  1062811            180
    ##  5 Peru                     3981.   716670            180
    ##  6 Colombia                 3922.   702088            179
    ##  7 Mexico                   3677.   658299            179
    ##  8 South Africa             3601.   648214            180
    ##  9 Argentina                2976.   535705            180
    ## 10 Spain                    2904.   566326            195
    ## 11 Chile                    2390.   432666            181
    ## 12 Bangladesh               2086.   336044            161
    ## 13 Iran                     1989.   399940            201
    ## 14 United Kingdom           1882.   365178            194
    ## 15 France                   1787.   353986            198
    ## 16 Saudi Arabia             1766.   325050            184
    ## 17 Pakistan                 1665.   301481            181
    ## 18 Turkey                   1608    289635            180
    ## 19 Iraq                     1566.   286778            183
    ## 20 Philippines              1408.   257863            183

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            143.               25836.            181
    ##  2 Peru                             133.               23963.            180
    ##  3 Brazil                           115.               21293.            185
    ##  4 United States                    106.               20587.            195
    ##  5 Israel                           104.               19338.            186
    ##  6 Colombia                          82.1              14691.            179
    ##  7 Bolivia                           75.7              12583.            166
    ##  8 South Africa                      73.5              13229.            180
    ##  9 Argentina                         72.0              12958.            180
    ## 10 Saudi Arabia                      68.6              12632.            184
    ## 11 Spain                             62.4              12177.            195
    ## 12 Dominican Republic                59.6              10407.            174
    ## 13 Iraq                              52.8               9665.            183
    ## 14 Kazakhstan                        51.6               8891.            172
    ## 15 Honduras                          49.1               8267.            168
    ## 16 Kyrgyzstan                        48.7               8147.            167
    ## 17 Sweden                            47.3               9053.            191
    ## 18 Belgium                           45.5               8790.            193
    ## 19 Belarus                           45.4               7638.            168
    ## 20 Ecuador                           43.0               7757.            180

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         583     2013
    ##  2 Italy                  12.4       35603   286297
    ##  3 United Kingdom         11.4       41623   365178
    ##  4 Belgium                10.8        9919    91443
    ##  5 Mexico                 10.7       70183   658299
    ##  6 Ecuador                 9.44      10836   114732
    ##  7 France                  8.69      30749   353986
    ##  8 Netherlands             7.71       6244    80937
    ##  9 Chad                    7.39         80     1083
    ## 10 Sweden                  6.76       5846    86505
    ## 11 Canada                  6.76       9163   135626
    ## 12 Sudan                   6.19        834    13470
    ## 13 Niger                   5.86         69     1178
    ## 14 Bolivia                 5.79       7250   125172
    ## 15 Iran                    5.76      23029   399940
    ## 16 Egypt                   5.58       5627   100856
    ## 17 Hungary                 5.35        633    11825
    ## 18 Spain                   5.25      29747   566326
    ## 19 China                   5.23       4741    90666
    ## 20 Mali                    4.39        128     2916

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1019.      30470   29.9 
    ##  2 Belgium                 953.       9919   10.4 
    ##  3 Ecuador                 733.      10836   14.8 
    ##  4 Bolivia                 729.       7250    9.95
    ##  5 Chile                   710.      11895   16.7 
    ##  6 United Kingdom          668.      41623   62.3 
    ##  7 Brazil                  648.     130396  201.  
    ##  8 Spain                   640.      29747   46.5 
    ##  9 Mexico                  624.      70183  112.  
    ## 10 United States           618.     191809  310.  
    ## 11 Sweden                  612.       5846    9.56
    ## 12 Italy                   590.      35603   60.3 
    ## 13 France                  475.      30749   64.8 
    ## 14 Colombia                471.      22518   47.8 
    ## 15 Netherlands             375.       6244   16.6 
    ## 16 South Africa            315.      15427   49   
    ## 17 Iran                    299.      23029   76.9 
    ## 18 Canada                  272.       9163   33.7 
    ## 19 Argentina               271.      11206   41.3 
    ## 20 Iraq                    268.       7941   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
