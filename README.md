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
-   [Save data](#save-data)

Updated: 2021-03-14

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
    ##  1 United States           77334. 29000561            375
    ##  2 India                   31136. 11333728            364
    ##  3 Brazil                  30898. 11277717            365
    ##  4 Russia                  12168.  4380525            360
    ##  5 United Kingdom          11328.  4248290            375
    ##  6 France                  10468.  3946733            377
    ##  7 Spain                    8467.  3183704            376
    ##  8 Italy                    8270.  3175807            384
    ##  9 Turkey                   7919.  2850930            360
    ## 10 Germany                  6768.  2558455            378
    ## 11 Colombia                 6362.  2290539            360
    ## 12 Argentina                6088.  2185747            359
    ## 13 Mexico                   5975.  2151028            360
    ## 14 Poland                   5190.  1889360            364
    ## 15 Iran                     4532.  1731558            382
    ## 16 South Africa             4264.  1526873            358
    ## 17 Ukraine                  4101.  1451744            354
    ## 18 Indonesia                3874.  1410134            364
    ## 19 Peru                     3863.  1394571            361
    ## 20 Czech Republic           3803.  1392108            366

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                363.             132885.            366
    ##  2 Israel                        300.             109635.            365
    ##  3 United States                 249.              93480.            375
    ##  4 Portugal                      209.              76166.            365
    ##  5 Belgium                       206.              77067.            374
    ##  6 Jordan                        204.              72553.            356
    ##  7 Sweden                        201.              74564.            371
    ##  8 Switzerland                   200.              74920.            375
    ##  9 Serbia                        193.              69159.            359
    ## 10 Netherlands                   185.              68779.            371
    ## 11 Spain                         182.              68458.            376
    ## 12 United Kingdom                182.              68138.            375
    ## 13 Slovakia                      172.              61638.            359
    ## 14 France                        162.              60936.            377
    ## 15 Austria                       160.              59072.            370
    ## 16 Brazil                        154.              56079.            365
    ## 17 Argentina                     147.              52868.            359
    ## 18 Chile                         145.              52518.            362
    ## 19 Hungary                       142.              50854.            358
    ## 20 Italy                         137.              52632.            384

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               24.9         680     2733
    ##  2 Mexico               8.98     193142  2151028
    ##  3 Syria                6.68       1090    16328
    ##  4 Sudan                6.28       1940    30873
    ##  5 Egypt                5.91      11214   189639
    ##  6 Ecuador              5.41      16193   299216
    ##  7 China                4.74       4849   102276
    ##  8 Bolivia              4.63      11903   257240
    ##  9 Afghanistan          4.39       2454    55959
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.11       1496    36423
    ## 12 Mali                 4.08        360     8813
    ## 13 Bulgaria             4.06      11196   275859
    ## 14 Somalia              3.83        338     8820
    ## 15 Niger                3.71        180     4853
    ## 16 Guatemala            3.60       6546   181974
    ## 17 Chad                 3.56        152     4274
    ## 18 Iran                 3.53      61069  1731558
    ## 19 Peru                 3.48      48484  1394571
    ## 20 Tunisia              3.46       8329   240617

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2203.      23083   10.5 
    ##  2 Belgium                2153.      22397   10.4 
    ##  3 United Kingdom         2010.     125343   62.3 
    ##  4 Mexico                 1717.     193142  112.  
    ##  5 United States          1699.     527068  310.  
    ##  6 Italy                  1683.     101564   60.3 
    ##  7 Hungary                1682.      16790    9.98
    ##  8 Peru                   1621.      48484   29.9 
    ##  9 Bulgaria               1566.      11196    7.15
    ## 10 Portugal               1560.      16650   10.7 
    ## 11 Spain                  1554.      72258   46.5 
    ## 12 Slovakia               1547.       8440    5.46
    ## 13 France                 1384.      89632   64.8 
    ## 14 Sweden                 1376.      13146    9.56
    ## 15 Brazil                 1357.     272889  201.  
    ## 16 Argentina              1296.      53578   41.3 
    ## 17 Chile                  1281.      21451   16.7 
    ## 18 Colombia               1273.      60858   47.8 
    ## 19 Switzerland            1235.       9359    7.58
    ## 20 Poland                 1223.      47068   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
