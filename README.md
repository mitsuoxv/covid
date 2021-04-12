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

Updated: 2021-04-12

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
    ##  1 United States           75971. 30692226            404
    ##  2 India                   33992. 13358805            393
    ##  3 Brazil                  33942. 13373174            394
    ##  4 France                  12180.  4945238            406
    ##  5 Russia                  11931.  4641390            389
    ##  6 United Kingdom          10812.  4368049            404
    ##  7 Turkey                   9764.  3798333            389
    ##  8 Italy                    9089.  3754077            413
    ##  9 Spain                    8238.  3336637            405
    ## 10 Germany                  7366.  2998268            407
    ## 11 Poland                   6551.  2574631            393
    ## 12 Argentina                6438.  2497881            388
    ## 13 Colombia                 6437.  2504206            389
    ## 14 Mexico                   5840.  2272064            389
    ## 15 Iran                     4985.  2049078            411
    ## 16 Ukraine                  4838.  1853249            383
    ## 17 Peru                     4175.  1628519            390
    ## 18 South Africa             4004.  1557527            389
    ## 19 Czech Republic           4000.  1580189            395
    ## 20 Indonesia                3987.  1562868            392

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                382.             150839.            395
    ##  2 Israel                        288.             113654.            394
    ##  3 Jordan                        268.             103385.            385
    ##  4 United States                 245.              98933.            404
    ##  5 Serbia                        224.              87065.            388
    ##  6 Sweden                        224.              89725.            400
    ##  7 Belgium                       220.              88675.            403
    ##  8 Netherlands                   202.              80652.            400
    ##  9 Switzerland                   201.              81087.            404
    ## 10 Portugal                      197.              77457.            394
    ## 11 France                        188.              76353.            406
    ## 12 Hungary                       186.              72146.            387
    ## 13 Spain                         177.              71746.            405
    ## 14 Slovakia                      175.              68022.            388
    ## 15 Austria                       175.              69690.            399
    ## 16 United Kingdom                173.              70059.            404
    ## 17 Poland                        170.              66874.            393
    ## 18 Brazil                        169.              66499.            394
    ## 19 Chile                         163.              63806.            391
    ## 20 Argentina                     156.              60418.            388

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.5        1032     5280
    ##  2 Mexico                9.11     207020  2272064
    ##  3 Syria                 6.80       1368    20118
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.92      12405   209677
    ##  6 Ecuador               5.01      17275   344877
    ##  7 Somalia               4.93        605    12271
    ##  8 China                 4.71       4853   103083
    ##  9 Bolivia               4.43      12428   280649
    ## 10 Afghanistan           4.41       2521    57160
    ## 11 Zimbabwe              4.13       1538    37273
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.86      14351   371531
    ## 14 Niger                 3.71        188     5072
    ## 15 Chad                  3.62        167     4616
    ## 16 Guatemala             3.47       6977   201295
    ## 17 Mali                  3.46        405    11705
    ## 18 South Africa          3.42      53256  1557527
    ## 19 Tunisia               3.42       9235   270297
    ## 20 Nicaragua             3.34        179     5366

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2654.      27808   10.5 
    ##  2 Hungary                2346.      23417    9.98
    ##  3 Belgium                2252.      23428   10.4 
    ##  4 United Kingdom         2038.     127080   62.3 
    ##  5 Bulgaria               2007.      14351    7.15
    ##  6 Slovakia               1937.      10565    5.46
    ##  7 Italy                  1888.     113923   60.3 
    ##  8 Mexico                 1841.     207020  112.  
    ##  9 Peru                   1815.      54285   29.9 
    ## 10 United States          1788.     554783  310.  
    ## 11 Brazil                 1734.     348718  201.  
    ## 12 Spain                  1638.      76179   46.5 
    ## 13 Portugal               1584.      16910   10.7 
    ## 14 Poland                 1517.      58421   38.5 
    ## 15 France                 1512.      97956   64.8 
    ## 16 Chile                  1446.      24213   16.7 
    ## 17 Sweden                 1425.      13621    9.56
    ## 18 Argentina              1387.      57350   41.3 
    ## 19 Colombia               1366.      65283   47.8 
    ## 20 Switzerland            1286.       9750    7.58

EOL
