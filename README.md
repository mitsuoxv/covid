WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2021-04-06

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

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
“Southern Europe”. “West Europe” is basically Europe other than “Eastern
Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           76311. 30372016            398
    ##  2 Brazil                  33385. 12953597            388
    ##  3 India                   32530. 12589067            387
    ##  4 Russia                  11983.  4589540            383
    ##  5 France                  11866.  4746588            400
    ##  6 United Kingdom          10953.  4359392            398
    ##  7 Turkey                   9104.  3487050            383
    ##  8 Italy                    9013.  3668264            407
    ##  9 Spain                    8249.  3291394            399
    ## 10 Germany                  7216.  2893883            401
    ## 11 Colombia                 6363.  2437197            383
    ## 12 Poland                   6327.  2448463            387
    ## 13 Argentina                6239.  2383537            382
    ## 14 Mexico                   5872.  2249195            383
    ## 15 Iran                     4770.  1932074            405
    ## 16 Ukraine                  4657.  1755888            377
    ## 17 Peru                     4099.  1573961            384
    ## 18 South Africa             4052.  1551964            383
    ## 19 Czech Republic           3994.  1553820            389
    ## 20 Indonesia                3974.  1534255            386

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             148322.            389
    ##  2 Israel                        292.             113299.            388
    ##  3 Jordan                        261.              98782.            379
    ##  4 United States                 246.              97901.            398
    ##  5 Serbia                        220.              84096.            382
    ##  6 Belgium                       218.              86609.            397
    ##  7 Sweden                        216.              85098.            394
    ##  8 Switzerland                   200.              79485.            398
    ##  9 Portugal                      199.              77120.            388
    ## 10 Netherlands                   199.              78230.            394
    ## 11 France                        183.              73286.            400
    ## 12 Hungary                       180.              68722.            381
    ## 13 Spain                         177.              70774.            399
    ## 14 United Kingdom                176.              69920.            398
    ## 15 Slovakia                      175.              66984.            382
    ## 16 Austria                       172.              67692.            393
    ## 17 Brazil                        166.              64413.            388
    ## 18 Poland                        164.              63596.            387
    ## 19 Chile                         159.              61313.            385
    ## 20 Argentina                     151.              57652.            382

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7         947     4802
    ##  2 Mexico                9.07     204011  2249195
    ##  3 Syria                 6.77       1313    19404
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.93      12163   204965
    ##  6 Ecuador               5.05      16956   335681
    ##  7 China                 4.71       4851   102908
    ##  8 Somalia               4.70        546    11623
    ##  9 Bolivia               4.49      12316   274467
    ## 10 Afghanistan           4.42       2508    56717
    ## 11 Zimbabwe              4.13       1525    36923
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.85      13589   352999
    ## 14 Mali                  3.73        392    10501
    ## 15 Niger                 3.73        188     5041
    ## 16 Chad                  3.59        165     4595
    ## 17 Guatemala             3.53       6884   195239
    ## 18 Tunisia               3.45       8965   260044
    ## 19 South Africa          3.41      52987  1551964
    ## 20 Peru                  3.34      52625  1573961

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2583.      27057   10.5 
    ##  2 Belgium                2227.      23169   10.4 
    ##  3 Hungary                2175.      21715    9.98
    ##  4 United Kingdom         2034.     126836   62.3 
    ##  5 Bulgaria               1901.      13589    7.15
    ##  6 Slovakia               1850.      10094    5.46
    ##  7 Italy                  1840.     111030   60.3 
    ##  8 Mexico                 1814.     204011  112.  
    ##  9 United States          1777.     551391  310.  
    ## 10 Peru                   1760.      52625   29.9 
    ## 11 Brazil                 1642.     330193  201.  
    ## 12 Spain                  1624.      75541   46.5 
    ## 13 Portugal               1581.      16879   10.7 
    ## 14 France                 1483.      96032   64.8 
    ## 15 Poland                 1429.      55005   38.5 
    ## 16 Sweden                 1413.      13498    9.56
    ## 17 Chile                  1412.      23644   16.7 
    ## 18 Argentina              1357.      56106   41.3 
    ## 19 Colombia               1338.      63932   47.8 
    ## 20 Switzerland            1276.       9677    7.58

EOL
