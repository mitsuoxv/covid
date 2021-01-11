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

Updated: 2021-01-11

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
    ##  1 United States           69303. 21761186            314
    ##  2 India                   34603. 10450284            302
    ##  3 Brazil                  26361.  8013708            304
    ##  4 Russia                  11415.  3401954            298
    ##  5 United Kingdom           9640.  3017413            313
    ##  6 France                   8640.  2721692            315
    ##  7 Italy                    7012.  2257866            322
    ##  8 Spain                    6450.  2025560            314
    ##  9 Germany                  6039.  1908527            316
    ## 10 Colombia                 5891.  1755568            298
    ## 11 Argentina                5696.  1703352            299
    ## 12 Mexico                   5060.  1507931            298
    ## 13 Turkey                   5042.  1502780            298
    ## 14 Poland                   4587.  1385522            302
    ## 15 South Africa             4060.  1214176            299
    ## 16 Iran                     4001.  1280438            320
    ## 17 Ukraine                  3818.  1115026            292
    ## 18 Peru                     3443.  1029471            299
    ## 19 Netherlands              2803.   866235            309
    ## 20 Czech Republic           2734.   831165            304

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                261.              79340.            304
    ##  2 United States                 223.              70145.            314
    ##  3 Israel                        216.              65448.            303
    ##  4 Belgium                       204.              63702.            312
    ##  5 Switzerland                   200.              62736.            314
    ##  6 Netherlands                   168.              52042.            309
    ##  7 Sweden                        166.              51222.            309
    ##  8 Serbia                        164.              48727.            297
    ##  9 Jordan                        162.              47753.            294
    ## 10 United Kingdom                155.              48396.            313
    ## 11 Austria                       150.              46083.            308
    ## 12 Portugal                      147.              44604.            303
    ## 13 Spain                         139.              43555.            314
    ## 14 Argentina                     138.              41200.            299
    ## 15 France                        133.              42022.            315
    ## 16 Brazil                        131.              39849.            304
    ## 17 Slovakia                      128.              38168.            298
    ## 18 Chile                         127.              38082.            300
    ## 19 Colombia                      123.              36735.            298
    ## 20 Poland                        119.              35988.            302

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2108
    ##  2 Mexico               8.76     132069  1507931
    ##  3 Ecuador              6.43      14177   220349
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.26        768    12274
    ##  6 Egypt                5.47       8142   148799
    ##  7 Bolivia              5.45       9328   171154
    ##  8 China                4.92       4798    97518
    ##  9 Iran                 4.38      56100  1280438
    ## 10 Chad                 4.26        107     2510
    ## 11 Afghanistan          4.26       2277    53489
    ## 12 Tanzania             4.13         21      509
    ## 13 Mali                 3.90        295     7565
    ## 14 Bulgaria             3.89       8097   208406
    ## 15 Peru                 3.71      38145  1029471
    ## 16 Greece               3.62       5227   144293
    ## 17 Guatemala            3.49       4999   143127
    ## 18 Italy                3.47      78394  2257866
    ## 19 Nicaragua            3.41        166     4867
    ## 20 Tunisia              3.27       5153   157514

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1926.      20038   10.4 
    ##  2 Italy                  1299.      78394   60.3 
    ##  3 United Kingdom         1297.      80868   62.3 
    ##  4 Peru                   1275.      38145   29.9 
    ##  5 Czech Republic         1252.      13115   10.5 
    ##  6 United States          1179.     365886  310.  
    ##  7 Mexico                 1174.     132069  112.  
    ##  8 Bulgaria               1133.       8097    7.15
    ##  9 Spain                  1111.      51690   46.5 
    ## 10 Argentina              1071.      44273   41.3 
    ## 11 Hungary                1067.      10648    9.98
    ## 12 France                 1038.      67217   64.8 
    ## 13 Chile                  1017.      17037   16.7 
    ## 14 Brazil                 1002.     201460  201.  
    ## 15 Switzerland             995.       7545    7.58
    ## 16 Sweden                  987.       9433    9.56
    ## 17 Ecuador                 959.      14177   14.8 
    ## 18 Colombia                951.      45431   47.8 
    ## 19 Bolivia                 938.       9328    9.95
    ## 20 Poland                  810.      31189   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
