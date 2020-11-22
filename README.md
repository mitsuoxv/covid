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

Updated: 2020-11-23

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
    ##  1 United States           44486. 11789012            265
    ##  2 India                   35951.  9095806            253
    ##  3 Brazil                  23608.  6020164            255
    ##  4 Russia                   8390.  2089329            249
    ##  5 France                   7854.  2089353            266
    ##  6 Spain                    5874.  1556730            265
    ##  7 United Kingdom           5656.  1493387            264
    ##  8 Argentina                5436.  1359042            250
    ##  9 Italy                    5056.  1380531            273
    ## 10 Colombia                 4953.  1233444            249
    ## 11 Mexico                   4120.  1025969            249
    ## 12 Peru                     3784.   946087            250
    ## 13 Germany                  3439.   918269            267
    ## 14 Poland                   3333.   843475            253
    ## 15 Iran                     3104.   841308            271
    ## 16 South Africa             3061.   765409            250
    ## 17 Ukraine                  2570.   624744            243
    ## 18 Chile                    2147.   539143            251
    ## 19 Belgium                  2117.   556808            263
    ## 20 Iraq                     2108.   533555            253

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      203.               53524.            263
    ##  2 Czech Republic               184.               46845.            255
    ##  3 Israel                       174.               44510.            255
    ##  4 Switzerland                  144.               38185.            265
    ##  5 United States                143.               38001.            265
    ##  6 Argentina                    131.               32872.            250
    ##  7 Chile                        128.               32194.            251
    ##  8 Peru                         127.               31634.            250
    ##  9 Spain                        126.               33474.            265
    ## 10 France                       121.               32259.            266
    ## 11 Brazil                       117.               29936.            255
    ## 12 Jordan                       113.               27807.            245
    ## 13 Austria                      113.               29361.            259
    ## 14 Netherlands                  110.               28758.            261
    ## 15 Colombia                     104.               25810.            249
    ## 16 Portugal                      94.4              23976.            254
    ## 17 United Kingdom                90.7              23952.            264
    ## 18 Poland                        86.6              21908.            253
    ## 19 Italy                         83.8              22879.            273
    ## 20 Sweden                        83.8              21798.            260

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         605     2073
    ##  2 Mexico                  9.83     100823  1025969
    ##  3 Sudan                   7.53       1193    15839
    ##  4 Ecuador                 7.11      13139   184876
    ##  5 Bolivia                 6.19       8900   143854
    ##  6 Chad                    6.18        101     1633
    ##  7 Egypt                   5.80       6535   112676
    ##  8 Iran                    5.27      44327   841308
    ##  9 Syria                   5.20        372     7154
    ## 10 Niger                   5.18         70     1351
    ## 11 China                   5.13       4749    92648
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.76       1675    44503
    ## 14 Peru                    3.75      35484   946087
    ## 15 United Kingdom          3.66      54626  1493387
    ## 16 Italy                   3.57      49261  1380531
    ## 17 Canada                  3.53      11334   320719
    ## 18 Nicaragua               3.47        159     4583
    ## 19 Guatemala               3.44       4074   118417
    ## 20 Mali                    3.40        143     4206

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1492.      15522   10.4 
    ##  2 Peru                   1186.      35484   29.9 
    ##  3 Spain                   916.      42619   46.5 
    ##  4 Chile                   898.      15030   16.7 
    ##  5 Mexico                  896.     100823  112.  
    ##  6 Bolivia                 895.       8900    9.95
    ##  7 Argentina               890.      36790   41.3 
    ##  8 Ecuador                 888.      13139   14.8 
    ##  9 United Kingdom          876.      54626   62.3 
    ## 10 Brazil                  838.     168613  201.  
    ## 11 Italy                   816.      49261   60.3 
    ## 12 United States           814.     252460  310.  
    ## 13 France                  744.      48170   64.8 
    ## 14 Colombia                731.      34929   47.8 
    ## 15 Czech Republic          677.       7095   10.5 
    ## 16 Sweden                  670.       6406    9.56
    ## 17 Iran                    576.      44327   76.9 
    ## 18 Netherlands             532.       8858   16.6 
    ## 19 Switzerland             471.       3567    7.58
    ## 20 Romania                 452.       9916   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
