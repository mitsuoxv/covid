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

Updated: 2020-08-26

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
    ##  1 United States           32101.  5649928            176
    ##  2 Brazil                  21721.  3605783            166
    ##  3 India                   19312.  3167323            164
    ##  4 Russia                   6000.   966189            161
    ##  5 South Africa             3797.   611450            161
    ##  6 Peru                     3691.   594326            161
    ##  7 Mexico                   3500.   560164            160
    ##  8 Colombia                 3381.   541147            160
    ##  9 Chile                    2465.   399568            162
    ## 10 Spain                    2193.   386054            176
    ## 11 Argentina                2125.   342154            161
    ## 12 Bangladesh               2091.   297083            142
    ## 13 Iran                     1984.   361150            182
    ## 14 Saudi Arabia             1870.   308654            165
    ## 15 United Kingdom           1866.   326618            175
    ## 16 Pakistan                 1812.   293711            162
    ## 17 Turkey                   1612.   259692            161
    ## 18 Italy                    1406.   260298            185
    ## 19 Germany                  1319.   234853            178
    ## 20 France                   1285.   230066            179

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            147.               23860.            162
    ##  2 Peru                             123.               19872.            161
    ##  3 Brazil                           108.               17930.            166
    ##  4 United States                    103.               18212.            176
    ##  5 Israel                            84.3              14006.            166
    ##  6 South Africa                      77.5              12479.            161
    ##  7 Bolivia                           74.6              10973.            147
    ##  8 Saudi Arabia                      72.7              11995.            165
    ##  9 Colombia                          70.8              11323.            160
    ## 10 Dominican Republic                60.0               9325.            155
    ## 11 Kazakhstan                        54.2               8309.            153
    ## 12 Kyrgyzstan                        52.9               7850.            148
    ## 13 Sweden                            52.4               9075.            173
    ## 14 Argentina                         51.4               8276.            161
    ## 15 Belarus                           48.8               7294.            149
    ## 16 Spain                             47.2               8301.            176
    ## 17 Honduras                          45.7               6823.            149
    ## 18 Ecuador                           45.4               7321.            161
    ## 19 Belgium                           45.2               7882.            174
    ## 20 Iraq                              42.7               7010.            164

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         556     1920
    ##  2 Italy                  13.6       35441   260298
    ##  3 France                 13.2       30395   230066
    ##  4 United Kingdom         12.7       41433   326618
    ##  5 Belgium                12.2        9996    81998
    ##  6 Hungary                11.8         613     5191
    ##  7 Mexico                 10.8       60480   560164
    ##  8 Netherlands             9.23       6193    67062
    ##  9 Chad                    7.70         76      987
    ## 10 Spain                   7.47      28838   386054
    ## 11 Canada                  7.26       9073   124896
    ## 12 Sweden                  6.70       5813    86721
    ## 13 Sudan                   6.34        818    12903
    ## 14 Niger                   5.89         69     1172
    ## 15 Ecuador                 5.84       6322   108289
    ## 16 Iran                    5.75      20776   361150
    ## 17 Egypt                   5.42       5280    97478
    ## 18 China                   5.23       4718    90205
    ## 19 Peru                    4.65      27663   594326
    ## 20 Mali                    4.62        125     2708

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 961.       9996   10.4 
    ##  2 Peru                    925.      27663   29.9 
    ##  3 United Kingdom          665.      41433   62.3 
    ##  4 Chile                   652.      10916   16.7 
    ##  5 Spain                   620.      28838   46.5 
    ##  6 Sweden                  608.       5813    9.56
    ##  7 Italy                   587.      35441   60.3 
    ##  8 Brazil                  571.     114744  201.  
    ##  9 United States           567.     175813  310.  
    ## 10 Mexico                  538.      60480  112.  
    ## 11 France                  469.      30395   64.8 
    ## 12 Bolivia                 453.       4509    9.95
    ## 13 Ecuador                 427.       6322   14.8 
    ## 14 Netherlands             372.       6193   16.6 
    ## 15 Colombia                362.      17316   47.8 
    ## 16 Iran                    270.      20776   76.9 
    ## 17 Canada                  269.       9073   33.7 
    ## 18 South Africa            269.      13159   49   
    ## 19 Switzerland             227.       1720    7.58
    ## 20 Iraq                    220.       6519   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
