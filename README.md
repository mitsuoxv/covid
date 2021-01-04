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

Updated: 2021-01-04

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
    ##  1 United States           65063. 19974413            307
    ##  2 India                   34996. 10323965            295
    ##  3 Brazil                  25928.  7700578            297
    ##  4 Russia                  11122.  3236787            291
    ##  5 United Kingdom           8496.  2599793            306
    ##  6 France                   8438.  2599127            308
    ##  7 Italy                    6797.  2141201            315
    ##  8 Spain                    6167.  1893502            307
    ##  9 Germany                  5714.  1765666            309
    ## 10 Colombia                 5687.  1654880            291
    ## 11 Argentina                5580.  1629594            292
    ## 12 Mexico                   4938.  1437185            291
    ## 13 Turkey                   4871.  1417697            291
    ## 14 Poland                   4469.  1318562            295
    ## 15 Iran                     3953.  1237474            313
    ## 16 Ukraine                  3768.  1074093            285
    ## 17 South Africa             3729.  1088889            292
    ## 18 Peru                     3483.  1017199            292
    ## 19 Netherlands              2687.   814361            303
    ## 20 Indonesia                2571.   758473            295

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                238.              70684.            297
    ##  2 United States                 210.              64385.            307
    ##  3 Belgium                       205.              62402.            305
    ##  4 Israel                        195.              57871.            296
    ##  5 Switzerland                   193.              59369.            307
    ##  6 Netherlands                   161.              48925.            303
    ##  7 Jordan                        161.              46303.            287
    ##  8 Serbia                        160.              46550.            290
    ##  9 Sweden                        152.              45771.            302
    ## 10 Austria                       147.              44237.            301
    ## 11 United Kingdom                136.              41698.            306
    ## 12 Argentina                     135.              39416.            292
    ## 13 Portugal                      134.              39703.            296
    ## 14 Spain                         133.              40715.            307
    ## 15 France                        130.              40130.            308
    ## 16 Brazil                        129.              38292.            297
    ## 17 Chile                         125.              36778.            293
    ## 18 Colombia                      119.              34628.            291
    ## 19 Slovakia                      118.              34365.            291
    ## 20 Peru                          116.              34012.            292

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2105
    ##  2 Mexico               8.80     126507  1437185
    ##  3 Ecuador              6.55      14059   214513
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.22        723    11616
    ##  6 Bolivia              5.67       9186   162055
    ##  7 Egypt                5.49       7741   140878
    ##  8 China                4.94       4791    96894
    ##  9 Chad                 4.79        104     2169
    ## 10 Iran                 4.48      55438  1237474
    ## 11 Afghanistan          4.21       2221    52709
    ## 12 Tanzania             4.13         21      509
    ## 13 Mali                 3.82        276     7226
    ## 14 Bulgaria             3.77       7644   202880
    ## 15 Peru                 3.71      37724  1017199
    ## 16 Italy                3.50      74985  2141201
    ## 17 Greece               3.50       4881   139447
    ## 18 Guatemala            3.49       4827   138316
    ## 19 Nicaragua            3.42        165     4829
    ## 20 Tunisia              3.36       4765   141979

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1888.      19644   10.4 
    ##  2 Peru                   1261.      37724   29.9 
    ##  3 Italy                  1243.      74985   60.3 
    ##  4 United Kingdom         1196.      74570   62.3 
    ##  5 Czech Republic         1142.      11960   10.5 
    ##  6 Mexico                 1125.     126507  112.  
    ##  7 United States          1113.     345253  310.  
    ##  8 Spain                  1085.      50442   46.5 
    ##  9 Bulgaria               1069.       7644    7.15
    ## 10 Argentina              1048.      43319   41.3 
    ## 11 Chile                   999.      16724   16.7 
    ## 12 France                  997.      64543   64.8 
    ## 13 Hungary                 990.       9884    9.98
    ## 14 Brazil                  972.     195411  201.  
    ## 15 Ecuador                 951.      14059   14.8 
    ## 16 Switzerland             930.       7049    7.58
    ## 17 Bolivia                 923.       9186    9.95
    ## 18 Sweden                  913.       8727    9.56
    ## 19 Colombia                910.      43495   47.8 
    ## 20 Austria                 757.       6214    8.20

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
