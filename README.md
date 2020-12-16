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

Updated: 2020-12-17

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
    ##  1 United States           56212. 16245376            289
    ##  2 India                   35857.  9932547            277
    ##  3 Brazil                  24828.  6927145            279
    ##  4 Russia                  10016.  2734454            273
    ##  5 France                   8104.  2350207            290
    ##  6 United Kingdom           6556.  1888120            288
    ##  7 Italy                    6298.  1870576            297
    ##  8 Spain                    6097.  1762212            289
    ##  9 Argentina                5486.  1503222            274
    ## 10 Colombia                 5254.  1434516            273
    ## 11 Germany                  4739.  1379238            291
    ## 12 Mexico                   4600.  1255974            273
    ## 13 Poland                   4187.  1159901            277
    ## 14 Turkey                   3970.  1084109            273
    ## 15 Iran                     3808.  1123474            295
    ## 16 Peru                     3598.   986130            274
    ## 17 Ukraine                  3444.   919704            267
    ## 18 South Africa             3188.   873679            274
    ## 19 Indonesia                2272.   629429            277
    ## 20 Netherlands              2204.   628242            285

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       205.              58774.            287
    ##  2 Czech Republic                203.              56715.            279
    ##  3 United States                 181.              52365.            289
    ##  4 Switzerland                   177.              51074.            289
    ##  5 Israel                        175.              48630.            278
    ##  6 Jordan                        154.              41364.            269
    ##  7 Austria                       140.              39672.            283
    ##  8 Serbia                        139.              37747.            272
    ##  9 Argentina                     133.              36360.            274
    ## 10 Netherlands                   132.              37744.            285
    ## 11 Spain                         131.              37892.            289
    ## 12 Sweden                        126.              35688.            284
    ## 13 France                        125.              36286.            290
    ## 14 Chile                         125.              34355.            275
    ## 15 Brazil                        123.              34446.            279
    ## 16 Peru                          120.              32973.            274
    ## 17 Portugal                      119.              33119.            278
    ## 18 Colombia                      110.              30017.            273
    ## 19 Poland                        109.              30127.            277
    ## 20 Hungary                       107.              28909.            271

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         607     2089
    ##  2 Mexico                  9.10     114298  1255974
    ##  3 Ecuador                 6.87      13896   202356
    ##  4 Sudan                   6.28       1372    21864
    ##  5 Bolivia                 6.12       9024   147345
    ##  6 Syria                   5.74        543     9452
    ##  7 Chad                    5.72        102     1784
    ##  8 Egypt                   5.68       6966   122609
    ##  9 China                   5.00       4764    95279
    ## 10 Iran                    4.69      52670  1123474
    ## 11 Tanzania                4.13         21      509
    ## 12 Afghanistan             4.03       2001    49703
    ## 13 Peru                    3.73      36754   986130
    ## 14 Niger                   3.71         77     2078
    ## 15 Italy                   3.52      65857  1870576
    ## 16 Tunisia                 3.49       3956   113241
    ## 17 Mali                    3.49        205     5878
    ## 18 Guatemala               3.44       4476   130082
    ## 19 Nicaragua               3.44        162     4709
    ## 20 United Kingdom          3.44      64908  1888120

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1747.      18178   10.4 
    ##  2 Peru                   1229.      36754   29.9 
    ##  3 Italy                  1091.      65857   60.3 
    ##  4 United Kingdom         1041.      64908   62.3 
    ##  5 Spain                  1041.      48401   46.5 
    ##  6 Mexico                 1016.     114298  112.  
    ##  7 Argentina               993.      41041   41.3 
    ##  8 United States           962.     298594  310.  
    ##  9 Chile                   952.      15949   16.7 
    ## 10 Czech Republic          943.       9882   10.5 
    ## 11 Ecuador                 940.      13896   14.8 
    ## 12 Bolivia                 907.       9024    9.95
    ## 13 France                  906.      58700   64.8 
    ## 14 Brazil                  904.     181835  201.  
    ## 15 Bulgaria                840.       6005    7.15
    ## 16 Colombia                820.      39195   47.8 
    ## 17 Sweden                  802.       7667    9.56
    ## 18 Switzerland             748.       5674    7.58
    ## 19 Hungary                 739.       7381    9.98
    ## 20 Iran                    685.      52670   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
