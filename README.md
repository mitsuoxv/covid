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

Updated: 2020-08-24

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
    ##  1 United States           31995.  5567217            174
    ##  2 Brazil                  21538.  3532330            164
    ##  3 India                   18795.  3044940            162
    ##  4 Russia                   6016.   956749            159
    ##  5 South Africa             3817.   607045            159
    ##  6 Peru                     3622.   576067            159
    ##  7 Mexico                   3479.   549734            158
    ##  8 Colombia                 3304.   522138            158
    ##  9 Chile                    2472.   395708            160
    ## 10 Spain                    2218.   386054            174
    ## 11 Bangladesh               2089.   292625            140
    ## 12 Argentina                2069.   329043            159
    ## 13 Iran                     1981.   356792            180
    ## 14 Saudi Arabia             1879.   306370            163
    ## 15 United Kingdom           1876.   324605            173
    ## 16 Pakistan                 1829.   292765            160
    ## 17 Turkey                   1615.   257032            159
    ## 18 Italy                    1410.   258136            183
    ## 19 Germany                  1322.   232864            176
    ## 20 France                   1262.   223419            177

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            148.               23629.            160
    ##  2 Peru                             121.               19262.            159
    ##  3 Brazil                           107.               17565.            164
    ##  4 United States                    103.               17945.            174
    ##  5 Israel                            82.7              13575.            164
    ##  6 South Africa                      77.9              12389.            159
    ##  7 Bolivia                           74.4              10800.            145
    ##  8 Saudi Arabia                      73.0              11906.            163
    ##  9 Colombia                          69.1              10926.            158
    ## 10 Dominican Republic                60.0               9219.            153
    ## 11 Kazakhstan                        54.9               8292.            151
    ## 12 Kyrgyzstan                        53.4               7810.            146
    ## 13 Sweden                            52.6               9007.            171
    ## 14 Argentina                         50.0               7959.            159
    ## 15 Belarus                           49.3               7257.            147
    ## 16 Spain                             47.7               8301.            174
    ## 17 Ecuador                           45.5               7240.            159
    ## 18 Belgium                           45.4               7822.            172
    ## 19 Honduras                          45.4               6681.            147
    ## 20 Russia                            42.8               6800.            159

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.6         547     1911
    ##  2 Italy                  13.7       35430   258136
    ##  3 France                 13.6       30376   223419
    ##  4 United Kingdom         12.8       41423   324605
    ##  5 Belgium                12.3        9988    81374
    ##  6 Hungary                11.9         611     5133
    ##  7 Mexico                 10.8       59610   549734
    ##  8 Netherlands             9.38       6191    66034
    ##  9 Chad                    7.74         76      982
    ## 10 Spain                   7.47      28838   386054
    ## 11 Canada                  7.29       9064   124372
    ## 12 Sweden                  6.75       5810    86068
    ## 13 Sudan                   6.43        815    12682
    ## 14 Niger                   5.89         69     1172
    ## 15 Ecuador                 5.86       6277   107089
    ## 16 Iran                    5.75      20502   356792
    ## 17 Egypt                   5.39       5243    97237
    ## 18 China                   5.23       4717    90141
    ## 19 Peru                    4.73      27245   576067
    ## 20 Mali                    4.63        125     2699

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 960.       9988   10.4 
    ##  2 Peru                    911.      27245   29.9 
    ##  3 United Kingdom          664.      41423   62.3 
    ##  4 Chile                   644.      10792   16.7 
    ##  5 Spain                   620.      28838   46.5 
    ##  6 Sweden                  608.       5810    9.56
    ##  7 Italy                   587.      35430   60.3 
    ##  8 Brazil                  564.     113358  201.  
    ##  9 United States           562.     174246  310.  
    ## 10 Mexico                  530.      59610  112.  
    ## 11 France                  469.      30376   64.8 
    ## 12 Bolivia                 439.       4366    9.95
    ## 13 Ecuador                 424.       6277   14.8 
    ## 14 Netherlands             372.       6191   16.6 
    ## 15 Colombia                347.      16568   47.8 
    ## 16 Canada                  269.       9064   33.7 
    ## 17 Iran                    267.      20502   76.9 
    ## 18 South Africa            265.      12987   49   
    ## 19 Switzerland             227.       1719    7.58
    ## 20 Iraq                    214.       6353   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
