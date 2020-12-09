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

Updated: 2020-12-10

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
    ##  1 United States           52326. 14755996            282
    ##  2 India                   36058.  9735850            270
    ##  3 Brazil                  24352.  6623911            272
    ##  4 Russia                   9553.  2541199            266
    ##  5 France                   8020.  2269668            283
    ##  6 United Kingdom           6228.  1750245            281
    ##  7 Italy                    6060.  1757394            290
    ##  8 Spain                    6036.  1702328            282
    ##  9 Argentina                5491.  1466309            267
    ## 10 Colombia                 5177.  1377100            266
    ## 11 Mexico                   4444.  1182249            266
    ## 12 Germany                  4290.  1218524            284
    ## 13 Poland                   3985.  1076180            270
    ## 14 Iran                     3688.  1062397            288
    ## 15 Peru                     3652.   975116            267
    ## 16 Turkey                   3278.   872093            266
    ## 17 Ukraine                  3251.   845343            260
    ## 18 South Africa             3078.   821889            267
    ## 19 Indonesia                2173.   586842            270
    ## 20 Belgium                  2123.   594572            280

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       204.              57154.            280
    ##  2 Czech Republic                195.              53162.            272
    ##  3 Israel                        174.              47205.            271
    ##  4 United States                 169.              47564.            282
    ##  5 Switzerland                   167.              47107.            282
    ##  6 Jordan                        147.              38572.            262
    ##  7 Austria                       135.              37256.            276
    ##  8 Argentina                     133.              35467.            267
    ##  9 Spain                         130.              36605.            282
    ## 10 Chile                         126.              33651.            268
    ## 11 France                        124.              35043.            283
    ## 12 Netherlands                   123.              34229.            278
    ## 13 Peru                          122.              32605.            267
    ## 14 Brazil                        121.              32938.            272
    ## 15 Serbia                        120.              31863.            265
    ## 16 Sweden                        112.              31157.            277
    ## 17 Portugal                      112.              30449.            271
    ## 18 Colombia                      108.              28816.            266
    ## 19 Poland                        104.              27953.            270
    ## 20 Italy                         100.              29125.            290

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         607     2083
    ##  2 Mexico                  9.31     110074  1182249
    ##  3 Ecuador                 6.94      13794   198752
    ##  4 Sudan                   6.51       1307    20084
    ##  5 Bolivia                 6.18       8997   145657
    ##  6 Chad                    5.90        102     1728
    ##  7 Egypt                   5.71       6813   119281
    ##  8 Syria                   5.34        458     8580
    ##  9 China                   5.03       4753    94500
    ## 10 Iran                    4.79      50917  1062397
    ## 11 Niger                   4.15         77     1856
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.94       1908    48366
    ## 14 Peru                    3.73      36324   975116
    ## 15 United Kingdom          3.54      62033  1750245
    ## 16 Italy                   3.48      61240  1757394
    ## 17 Tunisia                 3.48       3668   105445
    ## 18 Nicaragua               3.44        162     4709
    ## 19 Guatemala               3.39       4286   126473
    ## 20 Mali                    3.31        180     5442

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1683.      17507   10.4 
    ##  2 Peru                   1215.      36324   29.9 
    ##  3 Italy                  1015.      61240   60.3 
    ##  4 Spain                  1003.      46646   46.5 
    ##  5 United Kingdom          995.      62033   62.3 
    ##  6 Mexico                  979.     110074  112.  
    ##  7 Argentina               965.      39888   41.3 
    ##  8 Chile                   936.      15680   16.7 
    ##  9 Ecuador                 933.      13794   14.8 
    ## 10 United States           907.     281442  310.  
    ## 11 Bolivia                 904.       8997    9.95
    ## 12 Brazil                  882.     177317  201.  
    ## 13 Czech Republic          872.       9136   10.5 
    ## 14 France                  864.      55986   64.8 
    ## 15 Colombia                795.      37995   47.8 
    ## 16 Sweden                  753.       7200    9.56
    ## 17 Bulgaria                721.       5156    7.15
    ## 18 Switzerland             673.       5099    7.58
    ## 19 Iran                    662.      50917   76.9 
    ## 20 Hungary                 629.       6280    9.98

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
