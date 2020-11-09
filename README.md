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

Updated: 2020-11-10

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
    ##  1 United States           38745.  9763730            252
    ##  2 India                   35640.  8553657            240
    ##  3 Brazil                  23361.  5653561            242
    ##  4 Russia                   7610.  1796132            236
    ##  5 France                   6928.  1752980            253
    ##  6 Spain                    5273.  1328832            252
    ##  7 Argentina                5218.  1236851            237
    ##  8 Colombia                 4815.  1136447            236
    ##  9 United Kingdom           4749.  1192017            251
    ## 10 Mexico                   4076.   961938            236
    ## 11 Peru                     3881.   920010            237
    ## 12 Italy                    3596.   935104            260
    ## 13 South Africa             3110.   737278            237
    ## 14 Iran                     2645.   682486            258
    ## 15 Germany                  2645.   671868            254
    ## 16 Poland                   2276.   546425            240
    ## 17 Chile                    2191.   521558            238
    ## 18 Iraq                     2077.   498549            240
    ## 19 Ukraine                  2039.   469018            230
    ## 20 Belgium                  2002.   500694            250

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      192.               48130.            250
    ##  2 Israel                       179.               43252.            242
    ##  3 Czech Republic               164.               39598.            242
    ##  4 Chile                        131.               31144.            238
    ##  5 Peru                         130.               30762.            237
    ##  6 Argentina                    126.               29917.            237
    ##  7 United States                125.               31472.            252
    ##  8 Brazil                       116.               28113.            242
    ##  9 Spain                        113.               28573.            252
    ## 10 Switzerland                  110.               27854.            252
    ## 11 France                       107.               27065.            253
    ## 12 Colombia                     101.               23780.            236
    ## 13 Netherlands                   99.2              24606.            248
    ## 14 United Kingdom                76.2              19119.            251
    ## 15 Austria                       75.5              18587.            246
    ## 16 Jordan                        73.5              17063.            232
    ## 17 Iraq                          70.0              16802.            240
    ## 18 Portugal                      69.7              16797.            241
    ## 19 Bolivia                       64.2              14318.            223
    ## 20 Libya                         63.8              10542.            165

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2070
    ##  2 Mexico                  9.86      94808   961938
    ##  3 Sudan                   7.88       1116    14155
    ##  4 Ecuador                 7.34      12830   174907
    ##  5 Chad                    6.40         99     1547
    ##  6 Bolivia                 6.17       8790   142427
    ##  7 Egypt                   5.83       6368   109201
    ##  8 Iran                    5.61      38291   682486
    ##  9 Niger                   5.55         69     1243
    ## 10 China                   5.15       4748    92242
    ## 11 Syria                   5.10        317     6215
    ## 12 Italy                   4.43      41394   935104
    ## 13 Tanzania                4.13         21      509
    ## 14 United Kingdom          4.11      49044  1192017
    ## 15 Sweden                  4.11       6022   146461
    ## 16 Canada                  4.03      10490   260055
    ## 17 Peru                    3.79      34840   920010
    ## 18 Afghanistan             3.71       1562    42159
    ## 19 Mali                    3.70        137     3706
    ## 20 Nicaragua               3.50        157     4480

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1255.      13055   10.4 
    ##  2 Peru                   1165.      34840   29.9 
    ##  3 Bolivia                 884.       8790    9.95
    ##  4 Chile                   868.      14543   16.7 
    ##  5 Ecuador                 867.      12830   14.8 
    ##  6 Mexico                  843.      94808  112.  
    ##  7 Spain                   835.      38833   46.5 
    ##  8 Brazil                  807.     162269  201.  
    ##  9 Argentina               807.      33348   41.3 
    ## 10 United Kingdom          787.      49044   62.3 
    ## 11 United States           759.     235562  310.  
    ## 12 Italy                   686.      41394   60.3 
    ## 13 Colombia                682.      32595   47.8 
    ## 14 Sweden                  630.       6022    9.56
    ## 15 France                  619.      40119   64.8 
    ## 16 Iran                    498.      38291   76.9 
    ## 17 Netherlands             480.       7994   16.6 
    ## 18 Czech Republic          464.       4858   10.5 
    ## 19 South Africa            404.      19809   49   
    ## 20 Iraq                    382.      11327   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
