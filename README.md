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

Updated: 2020-12-04

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
    ##  1 United States           49144. 13563731            276
    ##  2 India                   36117.  9534964            264
    ##  3 Brazil                  24010.  6386787            266
    ##  4 Russia                   9136.  2375546            260
    ##  5 France                   7961.  2205212            277
    ##  6 Spain                    6035.  1665775            276
    ##  7 United Kingdom           6033.  1659260            275
    ##  8 Italy                    5780.  1641610            284
    ##  9 Argentina                5488.  1432570            261
    ## 10 Colombia                 5095.  1324792            260
    ## 11 Mexico                   4316.  1122362            260
    ## 12 Germany                  3981.  1106789            278
    ## 13 Poland                   3840.  1013747            264
    ## 14 Peru                     3698.   965228            261
    ## 15 Iran                     3509.   989572            282
    ## 16 South Africa             3051.   796472            261
    ## 17 Ukraine                  3042.   772760            254
    ## 18 Belgium                  2124.   582149            274
    ## 19 Chile                    2114.   553898            262
    ## 20 Iraq                     2108.   556728            264

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      204.               55960.            274
    ##  2 Czech Republic               191.               50882.            266
    ##  3 Israel                       174.               46012.            265
    ##  4 Switzerland                  160.               44098.            276
    ##  5 United States                158.               43721.            276
    ##  6 Jordan                       138.               35462.            256
    ##  7 Argentina                    133.               34651.            261
    ##  8 Austria                      130.               35058.            270
    ##  9 Spain                        130.               35819.            276
    ## 10 Chile                        126.               33075.            262
    ## 11 Peru                         124.               32274.            261
    ## 12 France                       123.               34048.            277
    ## 13 Brazil                       119.               31759.            266
    ## 14 Netherlands                  117.               31949.            272
    ## 15 Portugal                     107.               28461.            265
    ## 16 Colombia                     107.               27721.            260
    ## 17 Sweden                       103.               27853.            271
    ## 18 Serbia                       101.               26053.            259
    ## 19 Poland                        99.7              26331.            264
    ## 20 United Kingdom                96.8              26613.            275

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         606     2081
    ##  2 Mexico                  9.51     106765  1122362
    ##  3 Ecuador                 6.96      13562   194876
    ##  4 Sudan                   6.93       1265    18254
    ##  5 Bolivia                 6.19       8963   144810
    ##  6 Chad                    5.98        102     1705
    ##  7 Egypt                   5.73       6694   116724
    ##  8 Syria                   5.29        426     8059
    ##  9 China                   5.07       4751    93797
    ## 10 Iran                    4.95      48990   989572
    ## 11 Niger                   4.63         76     1640
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.88       1822    46980
    ## 14 Peru                    3.73      36031   965228
    ## 15 United Kingdom          3.60      59699  1659260
    ## 16 Italy                   3.47      57045  1641610
    ## 17 Nicaragua               3.45        161     4671
    ## 18 Guatemala               3.39       4191   123460
    ## 19 Tunisia                 3.38       3359    99280
    ## 20 Mali                    3.33        161     4837

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1626.      16911   10.4 
    ##  2 Peru                   1205.      36031   29.9 
    ##  3 Spain                   984.      45784   46.5 
    ##  4 United Kingdom          958.      59699   62.3 
    ##  5 Mexico                  949.     106765  112.  
    ##  6 Italy                   945.      57045   60.3 
    ##  7 Argentina               942.      38928   41.3 
    ##  8 Chile                   922.      15438   16.7 
    ##  9 Ecuador                 917.      13562   14.8 
    ## 10 Bolivia                 901.       8963    9.95
    ## 11 United States           865.     268482  310.  
    ## 12 Brazil                  864.     173817  201.  
    ## 13 France                  825.      53455   64.8 
    ## 14 Czech Republic          813.       8515   10.5 
    ## 15 Colombia                773.      36934   47.8 
    ## 16 Sweden                  730.       6972    9.56
    ## 17 Iran                    637.      48990   76.9 
    ## 18 Switzerland             614.       4652    7.58
    ## 19 Bulgaria                608.       4347    7.15
    ## 20 Netherlands             570.       9491   16.6

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
