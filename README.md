WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2021-05-12

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
    ##  1 United States           74645. 32396273            434
    ##  2 India                   54356. 22992517            423
    ##  3 Brazil                  35813. 15184790            424
    ##  4 France                  13047.  5688435            436
    ##  5 Turkey                  12040.  5044936            419
    ##  6 Russia                  11667.  4888727            419
    ##  7 United Kingdom          10224.  4437221            434
    ##  8 Italy                    9292.  4116287            443
    ##  9 Spain                    8233.  3581392            435
    ## 10 Germany                  8085.  3533376            437
    ## 11 Argentina                7530.  3147740            418
    ## 12 Colombia                 7166.  3002758            419
    ## 13 Poland                   6709.  2838180            423
    ## 14 Iran                     6061.  2673219            441
    ## 15 Mexico                   5646   2365792            419
    ## 16 Ukraine                  5144.  2124535            413
    ## 17 Peru                     4405.  1850290            420
    ## 18 Indonesia                4072.  1718575            422
    ## 19 Czech Republic           3875.  1646981            425
    ## 20 South Africa             3813.  1597724            419

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                370.             157215.            425
    ##  2 Jordan                        271.             112531.            415
    ##  3 Israel                        269.             114087.            424
    ##  4 Sweden                        245.             105463.            430
    ##  5 United States                 241.             104426.            434
    ##  6 Serbia                        228.              95485.            418
    ##  7 Belgium                       226.              97844.            433
    ##  8 Netherlands                   219.              94075.            430
    ##  9 Switzerland                   204.              88541.            434
    ## 10 France                        201.              87827.            436
    ## 11 Hungary                       190.              79431.            417
    ## 12 Portugal                      185.              78657.            424
    ## 13 Argentina                     182.              76137.            418
    ## 14 Austria                       178.              76508.            429
    ## 15 Brazil                        178.              75507.            424
    ## 16 Chile                         178.              74810.            421
    ## 17 Spain                         177.              77009.            435
    ## 18 Poland                        174.              73719.            423
    ## 19 Slovakia                      169.              70786.            418
    ## 20 United Kingdom                164.              71168.            434

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1276     6489
    ##  2 Mexico                9.26     218985  2365792
    ##  3 Syria                 7.10       1664    23439
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.86      13972   238560
    ##  6 Somalia               5.18        747    14415
    ##  7 Ecuador               4.79      19242   402060
    ##  8 China                 4.68       4858   103842
    ##  9 Afghanistan           4.34       2710    62403
    ## 10 Bolivia               4.15      13228   318610
    ## 11 Bulgaria              4.14      17045   411280
    ## 12 Tanzania              4.13         21      509
    ## 13 Zimbabwe              4.10       1576    38433
    ## 14 Hungary               3.63      28792   792879
    ## 15 Niger                 3.61        192     5322
    ## 16 Tunisia               3.56      11468   321837
    ## 17 Mali                  3.56        502    14115
    ## 18 Chad                  3.50        171     4882
    ## 19 Peru                  3.46      64103  1850290
    ## 20 South Africa          3.43      54825  1597724

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2884.      28792    9.98
    ##  2 Czech Republic         2840.      29749   10.5 
    ##  3 Bulgaria               2384.      17045    7.15
    ##  4 Belgium                2363.      24583   10.4 
    ##  5 Slovakia               2214.      12077    5.46
    ##  6 Peru                   2143.      64103   29.9 
    ##  7 Brazil                 2100.     422340  201.  
    ##  8 United Kingdom         2047.     127609   62.3 
    ##  9 Italy                  2039.     123031   60.3 
    ## 10 Mexico                 1947.     218985  112.  
    ## 11 United States          1858.     576403  310.  
    ## 12 Poland                 1827.      70336   38.5 
    ## 13 Spain                  1696.      78895   46.5 
    ## 14 France                 1636.     105949   64.8 
    ## 15 Chile                  1631.      27318   16.7 
    ## 16 Colombia               1629.      77854   47.8 
    ## 17 Argentina              1628.      67325   41.3 
    ## 18 Portugal               1592.      16993   10.7 
    ## 19 Sweden                 1483.      14173    9.56
    ## 20 Jordan                 1424.       9125    6.41

EOL
