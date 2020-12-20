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

Updated: 2020-12-21

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
    ##  1 United States           59095. 17314834            293
    ##  2 India                   35698. 10031223            281
    ##  3 Brazil                  25311.  7162978            283
    ##  4 Russia                  10282.  2848377            277
    ##  5 France                   8226.  2418439            294
    ##  6 United Kingdom           6863.  2004223            292
    ##  7 Italy                    6438.  1938083            301
    ##  8 Spain                    6134.  1797236            293
    ##  9 Argentina                5508.  1531374            278
    ## 10 Colombia                 5350.  1482072            277
    ## 11 Germany                  5064.  1494009            295
    ## 12 Mexico                   4698.  1301546            277
    ## 13 Turkey                   4295.  1189947            277
    ## 14 Poland                   4280.  1202700            281
    ## 15 Iran                     3853.  1152072            299
    ## 16 Peru                     3574.   993760            278
    ## 17 Ukraine                  3558.   964448            271
    ## 18 South Africa             3282.   912477            278
    ## 19 Indonesia                2341.   657948            281
    ## 20 Netherlands              2341.   676589            289

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                210.              59578.            283
    ##  2 Belgium                       206.              59960.            291
    ##  3 United States                 190.              55812.            293
    ##  4 Switzerland                   181.              53062.            293
    ##  5 Israel                        175.              49342.            282
    ##  6 Jordan                        156.              42577.            273
    ##  7 Serbia                        146.              40372.            276
    ##  8 Austria                       142.              40784.            287
    ##  9 Netherlands                   141.              40648.            289
    ## 10 Sweden                        133.              38418.            288
    ## 11 Argentina                     133.              37041.            278
    ## 12 Spain                         132.              38645.            293
    ## 13 France                        127.              37340.            294
    ## 14 Brazil                        126.              35618.            283
    ## 15 Chile                         125.              34834.            279
    ## 16 Portugal                      123.              34731.            282
    ## 17 Peru                          120.              33228.            278
    ## 18 Colombia                      112.              31012.            277
    ## 19 Poland                        111.              31239.            281
    ## 20 United Kingdom                110.              32146.            292

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         607     2091
    ##  2 Mexico               9.01     117249  1301546
    ##  3 Ecuador              6.77      13948   205920
    ##  4 Sudan                6.30       1425    22621
    ##  5 Bolivia              6.06       9033   149149
    ##  6 Syria                5.98        601    10050
    ##  7 Egypt                5.66       7069   124891
    ##  8 Chad                 5.46        102     1867
    ##  9 China                4.98       4770    95716
    ## 10 Iran                 4.64      53448  1152072
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.06       2054    50536
    ## 13 Peru                 3.72      36969   993760
    ## 14 Mali                 3.57        220     6164
    ## 15 Italy                3.53      68447  1938083
    ## 16 Guatemala            3.49       4624   132595
    ## 17 Niger                3.47         82     2361
    ## 18 Tunisia              3.46       4126   119151
    ## 19 Nicaragua            3.43        163     4748
    ## 20 Bulgaria             3.43       6551   191029

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1783.      18545   10.4 
    ##  2 Peru                   1236.      36969   29.9 
    ##  3 Italy                  1134.      68447   60.3 
    ##  4 United Kingdom         1076.      67075   62.3 
    ##  5 Spain                  1052.      48926   46.5 
    ##  6 Mexico                 1043.     117249  112.  
    ##  7 Argentina              1008.      41672   41.3 
    ##  8 United States          1003.     311150  310.  
    ##  9 Czech Republic          986.      10331   10.5 
    ## 10 Chile                   961.      16101   16.7 
    ## 11 Ecuador                 943.      13948   14.8 
    ## 12 France                  927.      60043   64.8 
    ## 13 Brazil                  923.     185650  201.  
    ## 14 Bulgaria                916.       6551    7.15
    ## 15 Bolivia                 908.       9033    9.95
    ## 16 Colombia                837.      40019   47.8 
    ## 17 Sweden                  836.       7993    9.56
    ## 18 Hungary                 793.       7914    9.98
    ## 19 Switzerland             789.       5981    7.58
    ## 20 Iran                    695.      53448   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
