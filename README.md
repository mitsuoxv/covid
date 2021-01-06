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

Updated: 2021-01-06

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
    ##  1 United States           66246. 20470169            309
    ##  2 India                   34871. 10356844            297
    ##  3 Brazil                  25865.  7733746            299
    ##  4 Russia                  11209   3284384            293
    ##  5 United Kingdom           8810.  2713567            308
    ##  6 France                   8436.  2615185            310
    ##  7 Italy                    6833.  2166244            317
    ##  8 Spain                    6127.  1893502            309
    ##  9 Germany                  5747.  1787410            311
    ## 10 Colombia                 5719.  1675820            293
    ## 11 Argentina                5580.  1640718            294
    ## 12 Mexico                   4944.  1448755            293
    ## 13 Turkey                   4918.  1441269            293
    ## 14 Poland                   4480.  1330543            297
    ## 15 Iran                     3966.  1249507            315
    ## 16 South Africa             3786.  1113349            294
    ## 17 Ukraine                  3775.  1083585            287
    ## 18 Peru                     3467.  1019475            294
    ## 19 Netherlands              2722.   827726            304
    ## 20 Indonesia                2599.   772103            297

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                242.              72512.            299
    ##  2 United States                 214.              65983.            309
    ##  3 Belgium                       204.              62567.            307
    ##  4 Israel                        201.              59981.            298
    ##  5 Switzerland                   196.              60633.            309
    ##  6 Netherlands                   164.              49728.            304
    ##  7 Jordan                        162.              46797.            289
    ##  8 Serbia                        162.              47188.            292
    ##  9 Sweden                        151.              45771.            304
    ## 10 Austria                       147.              44671.            303
    ## 11 United Kingdom                141.              43523.            308
    ## 12 Portugal                      136.              40429.            298
    ## 13 Argentina                     135.              39685.            294
    ## 14 Spain                         132.              40715.            309
    ## 15 France                        130.              40377.            310
    ## 16 Brazil                        129.              38457.            299
    ## 17 Chile                         126.              37061.            295
    ## 18 Colombia                      120.              35066.            293
    ## 19 Slovakia                      119.              35030.            293
    ## 20 Poland                        116.              34560.            297

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2105
    ##  2 Mexico               8.78     127213  1448755
    ##  3 Ecuador              6.54      14069   215080
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.22        734    11799
    ##  6 Bolivia              5.66       9201   162661
    ##  7 Egypt                5.48       7863   143464
    ##  8 China                4.94       4794    97061
    ##  9 Chad                 4.67        104     2229
    ## 10 Iran                 4.45      55650  1249507
    ## 11 Afghanistan          4.22       2237    53011
    ## 12 Tanzania             4.13         21      509
    ## 13 Mali                 3.84        279     7260
    ## 14 Bulgaria             3.84       7835   204080
    ## 15 Peru                 3.71      37830  1019475
    ## 16 Greece               3.57       5011   140526
    ## 17 Italy                3.49      75680  2166244
    ## 18 Guatemala            3.49       4835   138656
    ## 19 Nicaragua            3.42        165     4829
    ## 20 Tunisia              3.36       4862   144796

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1898.      19750   10.4 
    ##  2 Peru                   1265.      37830   29.9 
    ##  3 Italy                  1254.      75680   60.3 
    ##  4 United Kingdom         1210.      75431   62.3 
    ##  5 Czech Republic         1170.      12257   10.5 
    ##  6 Mexico                 1131.     127213  112.  
    ##  7 United States          1125.     348962  310.  
    ##  8 Bulgaria               1096.       7835    7.15
    ##  9 Spain                  1085.      50442   46.5 
    ## 10 Argentina              1052.      43482   41.3 
    ## 11 Hungary                1010.      10080    9.98
    ## 12 France                 1004.      65035   64.8 
    ## 13 Chile                  1001.      16767   16.7 
    ## 14 Brazil                  975.     196018  201.  
    ## 15 Switzerland             955.       7238    7.58
    ## 16 Ecuador                 951.      14069   14.8 
    ## 17 Bolivia                 925.       9201    9.95
    ## 18 Colombia                920.      43965   47.8 
    ## 19 Sweden                  913.       8727    9.56
    ## 20 Austria                 771.       6326    8.20

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
