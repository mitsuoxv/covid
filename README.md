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

Updated: 2020-09-12

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
    ##  1 United States           32664.  6304181            193
    ##  2 India                   25206.  4562414            181
    ##  3 Brazil                  22939.  4197889            183
    ##  4 Russia                   5909.  1051874            178
    ##  5 Peru                     3947.   702776            178
    ##  6 Colombia                 3880.   686851            177
    ##  7 Mexico                   3658.   647507            177
    ##  8 South Africa             3620.   644438            178
    ##  9 Argentina                2877.   512293            178
    ## 10 Spain                    2871.   554143            193
    ## 11 Chile                    2394.   428669            179
    ## 12 Bangladesh               2093.   332970            159
    ## 13 Iran                     1987.   395488            199
    ## 14 United Kingdom           1865.   358142            192
    ## 15 Saudi Arabia             1778.   323720            182
    ## 16 France                   1709.   335085            196
    ## 17 Pakistan                 1677.   300371            179
    ## 18 Turkey                   1608.   286455            178
    ## 19 Iraq                     1538.   278418            181
    ## 20 Italy                    1401.   283180            202

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            143.               25598.            179
    ##  2 Peru                             132.               23499.            178
    ##  3 Brazil                           114.               20874.            183
    ##  4 United States                    105.               20321.            193
    ##  5 Israel                           105.               19338.            184
    ##  6 Colombia                          81.2              14372.            177
    ##  7 Bolivia                           75.5              12400.            164
    ##  8 South Africa                      73.9              13152.            178
    ##  9 Argentina                         69.6              12391.            178
    ## 10 Saudi Arabia                      69.1              12581.            182
    ## 11 Spain                             61.7              11916.            193
    ## 12 Dominican Republic                60.0              10354.            172
    ## 13 Kazakhstan                        51.9               8839.            170
    ## 14 Iraq                              51.8               9383.            181
    ## 15 Honduras                          49.4               8210.            166
    ## 16 Kyrgyzstan                        49.1               8126.            165
    ## 17 Sweden                            47.6               9020.            189
    ## 18 Belarus                           45.7               7598.            166
    ## 19 Belgium                           45.2               8697.            192
    ## 20 Ecuador                           42.9               7654.            178

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         581     2007
    ##  2 Italy                  12.6       35587   283180
    ##  3 United Kingdom         11.6       41608   358142
    ##  4 Belgium                11.0        9917    90474
    ##  5 Mexico                 10.7       69095   647507
    ##  6 Ecuador                 9.50      10749   113206
    ##  7 France                  9.15      30654   335085
    ##  8 Netherlands             7.96       6240    78438
    ##  9 Chad                    7.52         79     1051
    ## 10 Canada                  6.82       9155   134294
    ## 11 Sweden                  6.78       5843    86194
    ## 12 Sudan                   6.20        833    13437
    ## 13 Hungary                 6.18        630    10191
    ## 14 Niger                   5.86         69     1178
    ## 15 Bolivia                 5.79       7146   123345
    ## 16 Iran                    5.76      22798   395488
    ## 17 Egypt                   5.56       5590   100557
    ## 18 Spain                   5.36      29699   554143
    ## 19 China                   5.23       4740    90623
    ## 20 Mali                    4.40        128     2909

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1011.      30236   29.9 
    ##  2 Belgium                 953.       9917   10.4 
    ##  3 Ecuador                 727.      10749   14.8 
    ##  4 Bolivia                 718.       7146    9.95
    ##  5 Chile                   703.      11781   16.7 
    ##  6 United Kingdom          667.      41608   62.3 
    ##  7 Brazil                  639.     128539  201.  
    ##  8 Spain                   639.      29699   46.5 
    ##  9 Mexico                  614.      69095  112.  
    ## 10 United States           612.     189709  310.  
    ## 11 Sweden                  611.       5843    9.56
    ## 12 Italy                   590.      35587   60.3 
    ## 13 France                  473.      30654   64.8 
    ## 14 Colombia                461.      22053   47.8 
    ## 15 Netherlands             375.       6240   16.6 
    ## 16 South Africa            312.      15265   49   
    ## 17 Iran                    296.      22798   76.9 
    ## 18 Canada                  272.       9155   33.7 
    ## 19 Iraq                    263.       7814   29.7 
    ## 20 Argentina               259.      10713   41.3

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
