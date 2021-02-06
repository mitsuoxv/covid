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

Updated: 2021-02-07

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
    ##  1 United States           77472. 26418016            341
    ##  2 India                   32870. 10814304            329
    ##  3 Brazil                  28387.  9396293            331
    ##  4 Russia                  12157.  3951233            325
    ##  5 United Kingdom          11504.  3911577            340
    ##  6 France                   9479.  3241919            342
    ##  7 Spain                    8518.  2913425            342
    ##  8 Turkey                   7744.  2516889            325
    ##  9 Italy                    7483.  2611659            349
    ## 10 Germany                  6633.  2275394            343
    ## 11 Colombia                 6570.  2135412            325
    ## 12 Argentina                6017.  1961635            326
    ## 13 Mexico                   5845.  1899820            325
    ## 14 Poland                   4697.  1545530            329
    ## 15 South Africa             4510.  1470516            326
    ## 16 Iran                     4185.  1452387            347
    ## 17 Ukraine                  3891.  1241479            319
    ## 18 Peru                     3573.  1165052            326
    ## 19 Indonesia                3449.  1134854            329
    ## 20 Czech Republic           3112.  1030112            331

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                297.              98331.            331
    ##  2 Israel                        266.              87788.            330
    ##  3 United States                 250.              85155.            341
    ##  4 Portugal                      214.              70792.            330
    ##  5 Switzerland                   205.              69817.            340
    ##  6 Belgium                       205.              69348.            339
    ##  7 United Kingdom                185.              62737.            340
    ##  8 Spain                         183.              62646.            342
    ##  9 Sweden                        183.              61539.            336
    ## 10 Netherlands                   178.              59943.            336
    ## 11 Serbia                        170.              55095.            324
    ## 12 Jordan                        162.              51972.            321
    ## 13 Austria                       152.              50929.            335
    ## 14 Slovakia                      148.              47988.            325
    ## 15 France                        146.              50054.            342
    ## 16 Argentina                     146.              47448.            326
    ## 17 Brazil                        141.              46724.            331
    ## 18 Colombia                      137.              44683.            325
    ## 19 Chile                         136.              44428.            327
    ## 20 Italy                         124.              43282.            349

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2127
    ##  2 Mexico               8.58     162922  1899820
    ##  3 Syria                6.58        943    14338
    ##  4 Sudan                6.18       1831    29634
    ##  5 Ecuador              5.87      14982   255412
    ##  6 Egypt                5.67       9560   168597
    ##  7 China                4.77       4831   101241
    ##  8 Bolivia              4.74      10633   224234
    ##  9 Afghanistan          4.35       2408    55330
    ## 10 Bulgaria             4.17       9302   223059
    ## 11 Tanzania             4.13         21      509
    ## 12 Mali                 4.13        336     8145
    ## 13 Iran                 4.02      58336  1452387
    ## 14 Zimbabwe             3.80       1303    34331
    ## 15 Greece               3.65       5922   162107
    ## 16 Chad                 3.59        124     3450
    ## 17 Niger                3.58        164     4575
    ## 18 Peru                 3.58      41753  1165052
    ## 19 Guatemala            3.58       5816   162295
    ## 20 Hungary              3.47      13026   375125

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2047.      21295   10.4 
    ##  2 United Kingdom         1785.     111264   62.3 
    ##  3 Czech Republic         1635.      17129   10.5 
    ##  4 Italy                  1502.      90618   60.3 
    ##  5 United States          1458.     452186  310.  
    ##  6 Mexico                 1449.     162922  112.  
    ##  7 Peru                   1396.      41753   29.9 
    ##  8 Spain                  1307.      60802   46.5 
    ##  9 Hungary                1305.      13026    9.98
    ## 10 Bulgaria               1301.       9302    7.15
    ## 11 Portugal               1287.      13740   10.7 
    ## 12 Sweden                 1268.      12115    9.56
    ## 13 France                 1207.      78198   64.8 
    ## 14 Argentina              1178.      48700   41.3 
    ## 15 Switzerland            1164.       8822    7.58
    ## 16 Colombia               1154.      55131   47.8 
    ## 17 Brazil                 1138.     228795  201.  
    ## 18 Chile                  1123.      18808   16.7 
    ## 19 Bolivia                1069.      10633    9.95
    ## 20 Ecuador                1013.      14982   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
