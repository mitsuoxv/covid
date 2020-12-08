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

Updated: 2020-12-09

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
    ##  1 United States           51852. 14570523            281
    ##  2 India                   36073.  9703770            269
    ##  3 Brazil                  24367.  6603540            271
    ##  4 Russia                   9490.  2515009            265
    ##  5 France                   7999.  2255955            282
    ##  6 United Kingdom           6207.  1737964            280
    ##  7 Spain                    6058.  1702328            281
    ##  8 Italy                    6029.  1742557            289
    ##  9 Argentina                5500.  1463110            266
    ## 10 Colombia                 5174.  1371103            265
    ## 11 Mexico                   4437.  1175850            265
    ## 12 Germany                  4232.  1197709            283
    ## 13 Poland                   3969.  1067870            269
    ## 14 Iran                     3663.  1051374            287
    ## 15 Peru                     3661.   973912            266
    ## 16 Ukraine                  3215.   832758            259
    ## 17 Turkey                   3165.   838895            265
    ## 18 South Africa             3074.   817878            266
    ## 19 Indonesia                2161.   581550            269
    ## 20 Belgium                  2124.   592615            279

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      204.               56966.            279
    ##  2 Czech Republic               194.               52603.            271
    ##  3 Israel                       173.               46632.            270
    ##  4 United States                167.               46966.            281
    ##  5 Switzerland                  166.               46547.            281
    ##  6 Jordan                       146.               38094.            261
    ##  7 Austria                      134.               36948.            275
    ##  8 Argentina                    133.               35389.            266
    ##  9 Spain                        130.               36605.            281
    ## 10 Chile                        126.               33568.            267
    ## 11 France                       124.               34831.            282
    ## 12 Peru                         122.               32565.            266
    ## 13 Netherlands                  122.               33860.            277
    ## 14 Brazil                       121.               32837.            271
    ## 15 Serbia                       117.               30798.            264
    ## 16 Portugal                     113.               30449.            270
    ## 17 Colombia                     108.               28690.            265
    ## 18 Sweden                       106.               29187.            276
    ## 19 Poland                       103.               27737.            269
    ## 20 Italy                         99.9              28879.            289

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         607     2082
    ##  2 Mexico                  9.33     109717  1175850
    ##  3 Ecuador                 6.95      13780   198244
    ##  4 Sudan                   6.59       1301    19747
    ##  5 Bolivia                 6.18       8995   145560
    ##  6 Chad                    5.90        102     1728
    ##  7 Egypt                   5.71       6790   118847
    ##  8 Syria                   5.32        452     8490
    ##  9 China                   5.04       4753    94383
    ## 10 Iran                    4.81      50594  1051374
    ## 11 Niger                   4.30         77     1789
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.95       1902    48136
    ## 14 Peru                    3.72      36274   973912
    ## 15 United Kingdom          3.53      61434  1737964
    ## 16 Italy                   3.48      60606  1742557
    ## 17 Nicaragua               3.45        161     4671
    ## 18 Tunisia                 3.45       3596   104329
    ## 19 Guatemala               3.40       4274   125674
    ## 20 Mali                    3.31        175     5290

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1671.      17386   10.4 
    ##  2 Peru                   1213.      36274   29.9 
    ##  3 Italy                  1004.      60606   60.3 
    ##  4 Spain                  1003.      46646   46.5 
    ##  5 United Kingdom          985.      61434   62.3 
    ##  6 Mexico                  976.     109717  112.  
    ##  7 Argentina               962.      39770   41.3 
    ##  8 Chile                   935.      15663   16.7 
    ##  9 Ecuador                 932.      13780   14.8 
    ## 10 Bolivia                 904.       8995    9.95
    ## 11 United States           902.     279913  310.  
    ## 12 Brazil                  880.     176941  201.  
    ## 13 Czech Republic          863.       9036   10.5 
    ## 14 France                  852.      55158   64.8 
    ## 15 Colombia                791.      37808   47.8 
    ## 16 Sweden                  740.       7067    9.56
    ## 17 Bulgaria                701.       5010    7.15
    ## 18 Switzerland             660.       5007    7.58
    ## 19 Iran                    658.      50594   76.9 
    ## 20 Hungary                 613.       6120    9.98

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
