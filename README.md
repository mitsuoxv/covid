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

Updated: 2020-09-05

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
    ##  1 United States           32529.  6050444            186
    ##  2 Brazil                  22715.  3997865            176
    ##  3 India                   22624.  3936747            174
    ##  4 Russia                   5935.  1015105            171
    ##  5 Peru                     3879.   663437            171
    ##  6 Colombia                 3725.   633339            170
    ##  7 South Africa             3701.   633015            171
    ##  8 Mexico                   3593.   610957            170
    ##  9 Spain                    2626.   488513            186
    ## 10 Argentina                2568.   439172            171
    ## 11 Chile                    2421.   416501            172
    ## 12 Bangladesh               2102.   319686            152
    ## 13 Iran                     1982.   380746            192
    ## 14 United Kingdom           1839.   340415            185
    ## 15 Saudi Arabia             1818.   318319            175
    ## 16 Pakistan                 1729.   297512            172
    ## 17 Turkey                   1607.   274943            171
    ## 18 France                   1498.   283265            189
    ## 19 Iraq                     1419.   247039            174
    ## 20 Italy                    1399.   272912            195

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            145.               24871.            172
    ##  2 Peru                             130.               22183.            171
    ##  3 Brazil                           113.               19880.            176
    ##  4 United States                    105.               19503.            186
    ##  5 Israel                            95.0              16635.            175
    ##  6 Colombia                          77.9              13253.            170
    ##  7 South Africa                      75.5              12919.            171
    ##  8 Bolivia                           75.4              11855.            157
    ##  9 Saudi Arabia                      70.7              12371.            175
    ## 10 Argentina                         62.1              10623.            171
    ## 11 Dominican Republic                59.4               9836.            165
    ## 12 Spain                             56.5              10504.            186
    ## 13 Kazakhstan                        53.1               8665.            163
    ## 14 Kyrgyzstan                        50.7               8029.            158
    ## 15 Honduras                          49.1               7826.            159
    ## 16 Sweden                            48.6               8867.            182
    ## 17 Iraq                              47.8               8326.            174
    ## 18 Belarus                           46.9               7465.            159
    ## 19 Ecuador                           45.9               7867.            171
    ## 20 Belgium                           45.1               8310.            184

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         572     1983
    ##  2 Italy                  13.0       35507   272912
    ##  3 United Kingdom         12.2       41527   340415
    ##  4 Belgium                11.5        9899    86450
    ##  5 France                 10.8       30556   283265
    ##  6 Mexico                 10.8       65816   610957
    ##  7 Hungary                 8.96        620     6923
    ##  8 Netherlands             8.60       6226    72392
    ##  9 Chad                    7.56         77     1018
    ## 10 Canada                  7.03       9135   129923
    ## 11 Sweden                  6.88       5832    84729
    ## 12 Sudan                   6.24        823    13189
    ## 13 Spain                   5.98      29234   488513
    ## 14 Niger                   5.86         69     1177
    ## 15 Iran                    5.76      21926   380746
    ## 16 Ecuador                 5.71       6648   116360
    ## 17 Egypt                   5.51       5479    99425
    ## 18 China                   5.23       4735    90475
    ## 19 Mali                    4.49        126     2807
    ## 20 Bolivia                 4.41       5203   117928

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    978.      29259   29.9 
    ##  2 Belgium                 952.       9899   10.4 
    ##  3 Chile                   682.      11422   16.7 
    ##  4 United Kingdom          666.      41527   62.3 
    ##  5 Spain                   629.      29234   46.5 
    ##  6 Brazil                  616.     123780  201.  
    ##  7 Sweden                  610.       5832    9.56
    ##  8 United States           595.     184614  310.  
    ##  9 Italy                   588.      35507   60.3 
    ## 10 Mexico                  585.      65816  112.  
    ## 11 Bolivia                 523.       5203    9.95
    ## 12 France                  472.      30556   64.8 
    ## 13 Ecuador                 449.       6648   14.8 
    ## 14 Colombia                426.      20348   47.8 
    ## 15 Netherlands             374.       6226   16.6 
    ## 16 South Africa            294.      14389   49   
    ## 17 Iran                    285.      21926   76.9 
    ## 18 Canada                  271.       9135   33.7 
    ## 19 Iraq                    245.       7275   29.7 
    ## 20 Honduras                241.       1924    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
