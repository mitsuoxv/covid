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

Updated: 2020-09-01

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
    ##  1 United States           32414.  5899504            182
    ##  2 Brazil                  22361.  3846153            172
    ##  3 India                   21301.  3621245            170
    ##  4 Russia                   5959.   995319            167
    ##  5 Peru                     3828.   639435            167
    ##  6 South Africa             3742.   625056            167
    ##  7 Colombia                 3613.   599914            166
    ##  8 Mexico                   3564.   591712            166
    ##  9 Chile                    2439.   409974            168
    ## 10 Spain                    2413.   439286            182
    ## 11 Argentina                2402.   401239            167
    ## 12 Bangladesh               2099.   310822            148
    ## 13 Iran                     1986.   373570            188
    ## 14 United Kingdom           1847.   334471            181
    ## 15 Saudi Arabia             1840.   314821            171
    ## 16 Pakistan                 1760.   295849            168
    ## 17 Turkey                   1607.   268546            167
    ## 18 France                   1415.   261955            185
    ## 19 Italy                    1404.   268218            191
    ## 20 Iraq                     1359.   231177            170

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            146.               24481.            168
    ##  2 Peru                             128.               21381.            167
    ##  3 Brazil                           111.               19125.            172
    ##  4 United States                    104.               19016.            182
    ##  5 Israel                            89.7              15446.            172
    ##  6 South Africa                      76.4              12756.            167
    ##  7 Bolivia                           75.7              11596.            153
    ##  8 Colombia                          75.6              12553.            166
    ##  9 Saudi Arabia                      71.5              12235.            171
    ## 10 Dominican Republic                59.4               9592.            161
    ## 11 Argentina                         58.1               9705.            167
    ## 12 Kazakhstan                        53.5               8518.            159
    ## 13 Spain                             51.9               9446.            182
    ## 14 Kyrgyzstan                        51.6               7969.            154
    ## 15 Sweden                            49.6               8786.            177
    ## 16 Honduras                          48.1               7466.            155
    ## 17 Belarus                           47.7               7402.            155
    ## 18 Ecuador                           45.9               7684.            167
    ## 19 Iraq                              45.8               7791.            170
    ## 20 Belgium                           45.3               8166.            180

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         565     1957
    ##  2 Italy                  13.2       35477   268218
    ##  3 United Kingdom         12.4       41499   334471
    ##  4 Belgium                11.6        9894    84948
    ##  5 France                 11.6       30467   261955
    ##  6 Mexico                 10.8       63819   591712
    ##  7 Hungary                10.3         614     5961
    ##  8 Netherlands             8.87       6215    70071
    ##  9 Chad                    7.61         77     1012
    ## 10 Canada                  7.14       9113   127673
    ## 11 Sweden                  6.93       5821    83958
    ## 12 Spain                   6.60      29011   439286
    ## 13 Sudan                   6.24        823    13189
    ## 14 Niger                   5.87         69     1175
    ## 15 Ecuador                 5.77       6555   113648
    ## 16 Iran                    5.75      21462   373570
    ## 17 Egypt                   5.47       5399    98727
    ## 18 China                   5.23       4729    90383
    ## 19 Mali                    4.54        126     2773
    ## 20 Peru                    4.47      28607   639435

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    957.      28607   29.9 
    ##  2 Belgium                 951.       9894   10.4 
    ##  3 Chile                   671.      11244   16.7 
    ##  4 United Kingdom          666.      41499   62.3 
    ##  5 Spain                   624.      29011   46.5 
    ##  6 Sweden                  609.       5821    9.56
    ##  7 Brazil                  599.     120462  201.  
    ##  8 Italy                   588.      35477   60.3 
    ##  9 United States           586.     181689  310.  
    ## 10 Mexico                  567.      63819  112.  
    ## 11 Bolivia                 496.       4938    9.95
    ## 12 France                  470.      30467   64.8 
    ## 13 Ecuador                 443.       6555   14.8 
    ## 14 Colombia                399.      19064   47.8 
    ## 15 Netherlands             373.       6215   16.6 
    ## 16 South Africa            286.      14028   49   
    ## 17 Iran                    279.      21462   76.9 
    ## 18 Canada                  271.       9113   33.7 
    ## 19 Iraq                    235.       6959   29.7 
    ## 20 Honduras                231.       1842    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
