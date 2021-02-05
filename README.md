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

Updated: 2021-02-06

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
    ##  1 United States           76977. 26172274            340
    ##  2 India                   32934. 10802591            328
    ##  3 Brazil                  28301.  9339420            330
    ##  4 Russia                  12143.  3934606            324
    ##  5 United Kingdom          11482.  3892463            339
    ##  6 France                   9446.  3221178            341
    ##  7 Spain                    8543.  2913425            341
    ##  8 Turkey                   7743.  2508988            324
    ##  9 Italy                    7464.  2597446            348
    ## 10 Germany                  6622.  2264909            342
    ## 11 Colombia                 6560.  2125622            324
    ## 12 Argentina                6008.  1952744            325
    ## 13 Mexico                   5821.  1886245            324
    ## 14 Poland                   4693.  1539564            328
    ## 15 South Africa             4513.  1466767            325
    ## 16 Iran                     4177.  1445326            346
    ## 17 Ukraine                  3890.  1237169            318
    ## 18 Peru                     3564.  1158337            325
    ## 19 Indonesia                3424.  1123105            328
    ## 20 Czech Republic           3095.  1021477            330

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                295.              97506.            330
    ##  2 Israel                        267.              87788.            329
    ##  3 United States                 248.              84363.            340
    ##  4 Portugal                      213.              70144.            329
    ##  5 Switzerland                   205.              69609.            339
    ##  6 Belgium                       204.              69100.            338
    ##  7 United Kingdom                184.              62431.            339
    ##  8 Spain                         184.              62646.            341
    ##  9 Sweden                        183.              61185.            335
    ## 10 Netherlands                   178.              59683.            335
    ## 11 Serbia                        170.              54828.            323
    ## 12 Jordan                        162.              51781.            320
    ## 13 Austria                       152.              50746.            334
    ## 14 Slovakia                      147.              47577.            324
    ## 15 France                        146.              49734.            341
    ## 16 Argentina                     145.              47233.            325
    ## 17 Brazil                        141.              46441.            330
    ## 18 Colombia                      137.              44478.            324
    ## 19 Chile                         136.              44203.            326
    ## 20 Italy                         124.              43047.            348

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2126
    ##  2 Mexico               8.55     161240  1886245
    ##  3 Syria                6.57        938    14267
    ##  4 Sudan                6.18       1831    29634
    ##  5 Ecuador              5.91      14968   253339
    ##  6 Egypt                5.66       9512   168057
    ##  7 China                4.77       4831   101187
    ##  8 Bolivia              4.75      10571   222447
    ##  9 Afghanistan          4.36       2407    55265
    ## 10 Bulgaria             4.17       9272   222149
    ## 11 Tanzania             4.13         21      509
    ## 12 Mali                 4.10        333     8130
    ## 13 Iran                 4.03      58256  1445326
    ## 14 Zimbabwe             3.77       1288    34171
    ## 15 Greece               3.67       5903   160935
    ## 16 Peru                 3.59      41538  1158337
    ## 17 Niger                3.58        164     4575
    ## 18 Guatemala            3.58       5785   161665
    ## 19 Chad                 3.52        121     3433
    ## 20 Italy                3.47      90241  2597446

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2044.      21260   10.4 
    ##  2 United Kingdom         1768.     110250   62.3 
    ##  3 Czech Republic         1620.      16976   10.5 
    ##  4 Italy                  1496.      90241   60.3 
    ##  5 Mexico                 1434.     161240  112.  
    ##  6 United States          1429.     443256  310.  
    ##  7 Peru                   1389.      41538   29.9 
    ##  8 Spain                  1307.      60802   46.5 
    ##  9 Bulgaria               1297.       9272    7.15
    ## 10 Hungary                1295.      12930    9.98
    ## 11 Portugal               1263.      13482   10.7 
    ## 12 Sweden                 1259.      12028    9.56
    ## 13 France                 1197.      77548   64.8 
    ## 14 Argentina              1174.      48539   41.3 
    ## 15 Switzerland            1159.       8790    7.58
    ## 16 Colombia               1148.      54877   47.8 
    ## 17 Brazil                 1132.     227563  201.  
    ## 18 Chile                  1119.      18731   16.7 
    ## 19 Bolivia                1063.      10571    9.95
    ## 20 Ecuador                1012.      14968   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
