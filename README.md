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

Updated: 2020-12-23

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
    ##  1 United States           60041. 17712290            295
    ##  2 India                   35601. 10075116            283
    ##  3 Brazil                  25398.  7238600            285
    ##  4 Russia                  10417.  2906503            279
    ##  5 France                   8232.  2436873            296
    ##  6 United Kingdom           7052.  2073515            294
    ##  7 Italy                    6482.  1964054            303
    ##  8 Spain                    6167.  1819249            295
    ##  9 Argentina                5504.  1541285            280
    ## 10 Colombia                 5402.  1507222            279
    ## 11 Germany                  5152.  1530180            297
    ## 12 Mexico                   4733.  1320545            279
    ## 13 Turkey                   4406.  1229366            279
    ## 14 Poland                   4291.  1214525            283
    ## 15 Iran                     3868.  1164535            301
    ## 16 Ukraine                  3588.   979506            273
    ## 17 Peru                     3562.   997517            280
    ## 18 South Africa             3324.   930711            280
    ## 19 Netherlands              2408.   700867            291
    ## 20 Indonesia                2373.   671778            283

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                213.              60654.            285
    ##  2 Belgium                       206.              60263.            293
    ##  3 United States                 194.              57094.            295
    ##  4 Israel                        180.              51174.            284
    ##  5 Switzerland                   180.              53062.            295
    ##  6 Jordan                        157.              43303.            275
    ##  7 Serbia                        149.              41355.            278
    ##  8 Netherlands                   145.              42107.            291
    ##  9 Austria                       142.              41126.            289
    ## 10 Argentina                     133.              37280.            280
    ## 11 Spain                         133.              39119.            295
    ## 12 Sweden                        132.              38418.            290
    ## 13 France                        127.              37624.            296
    ## 14 Brazil                        126.              35994.            285
    ## 15 Chile                         125.              35081.            281
    ## 16 Portugal                      124.              35240.            284
    ## 17 Peru                          119.              33354.            280
    ## 18 United Kingdom                113.              33257.            294
    ## 19 Colombia                      113.              31538.            279
    ## 20 Poland                        111.              31546.            283

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         607     2091
    ##  2 Mexico               8.95     118202  1320545
    ##  3 Ecuador              6.76      13949   206329
    ##  4 Sudan                6.32       1461    23100
    ##  5 Bolivia              6.02       9036   150023
    ##  6 Syria                6.02        621    10318
    ##  7 Egypt                5.65       7130   126273
    ##  8 Chad                 5.36        102     1902
    ##  9 China                4.98       4772    95916
    ## 10 Iran                 4.62      53816  1164535
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.11       2089    50888
    ## 13 Peru                 3.72      37103   997517
    ## 14 Mali                 3.61        225     6232
    ## 15 Guatemala            3.53       4688   132867
    ## 16 Italy                3.52      69214  1964054
    ## 17 Bulgaria             3.51       6765   192472
    ## 18 Niger                3.47         82     2361
    ## 19 Tunisia              3.45       4199   121718
    ## 20 Nicaragua            3.43        163     4748

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1797.      18697   10.4 
    ##  2 Peru                   1241.      37103   29.9 
    ##  3 Italy                  1147.      69214   60.3 
    ##  4 United Kingdom         1084.      67616   62.3 
    ##  5 Spain                  1059.      49260   46.5 
    ##  6 Mexico                 1051.     118202  112.  
    ##  7 United States          1016.     315318  310.  
    ##  8 Argentina              1011.      41813   41.3 
    ##  9 Czech Republic         1008.      10562   10.5 
    ## 10 Chile                   967.      16197   16.7 
    ## 11 Bulgaria                946.       6765    7.15
    ## 12 Ecuador                 943.      13949   14.8 
    ## 13 France                  934.      60525   64.8 
    ## 14 Brazil                  929.     186764  201.  
    ## 15 Bolivia                 908.       9036    9.95
    ## 16 Hungary                 848.       8462    9.98
    ## 17 Colombia                847.      40475   47.8 
    ## 18 Sweden                  836.       7993    9.56
    ## 19 Switzerland             789.       5981    7.58
    ## 20 Iran                    700.      53816   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
