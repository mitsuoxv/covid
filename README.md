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

Updated: 2021-07-28

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           65877. 34256255            520
    ##  2 India                   62882. 31440951            500
    ##  3 Brazil                  39298. 19688663            501
    ##  4 Russia                  12445.  6172812            496
    ##  5 France                  11454.  5876269            513
    ##  6 Turkey                  11327.  5618417            496
    ##  7 United Kingdom          11198.  5722302            511
    ##  8 Argentina                9791.  4846615            495
    ##  9 Colombia                 9532.  4727846            496
    ## 10 Spain                    8480.  4342054            512
    ## 11 Italy                    8308.  4320530            520
    ## 12 Germany                  7312.  3758401            514
    ## 13 Iran                     7187.  3723246            518
    ## 14 Indonesia                6480.  3239936            500
    ## 15 Poland                   5764.  2882327            500
    ## 16 Mexico                   5541.  2748518            496
    ## 17 South Africa             4805.  2383490            496
    ## 18 Ukraine                  4590.  2249344            490
    ## 19 Peru                     4234.  2104394            497
    ## 20 Netherlands              3643.  1847372            507

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                318.             159676.            502
    ##  2 Jordan                        243.             119573.            492
    ##  3 Argentina                     237.             117229.            495
    ##  4 Israel                        233.             117444.            503
    ##  5 Sweden                        226.             114777.            507
    ##  6 Netherlands                   219.             110987.            507
    ##  7 United States                 212.             110421.            520
    ##  8 Belgium                       211.             107440.            510
    ##  9 Colombia                      199.              98930.            496
    ## 10 Serbia                        198.              98076.            495
    ## 11 Brazil                        195.              97903.            501
    ## 12 Chile                         193.              96160.            498
    ## 13 Switzerland                   184.              93818.            511
    ## 14 Spain                         182.              93366.            512
    ## 15 United Kingdom                180.              91779.            511
    ## 16 Portugal                      178.              89422.            501
    ## 17 France                        177.              90727.            513
    ## 18 Hungary                       164.              81075.            494
    ## 19 Austria                       157.              79484.            506
    ## 20 Poland                        150.              74866.            500

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1374     7012
    ##  2 Peru                 9.31     195890  2104394
    ##  3 Mexico               8.67     238424  2748518
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1908    25892
    ##  6 Ecuador              6.41      30797   480720
    ##  7 Egypt                5.81      16494   284059
    ##  8 Somalia              5.23        797    15251
    ##  9 China                4.68       5634   120295
    ## 10 Afghanistan          4.49       6515   145008
    ## 11 Bulgaria             4.29      18199   423879
    ## 12 Bolivia              3.77      17651   468423
    ## 13 Hungary              3.71      30021   809288
    ## 14 Mali                 3.65        531    14547
    ## 15 Chad                 3.50        174     4969
    ## 16 Niger                3.48        195     5600
    ## 17 Tanzania             3.45         21      609
    ## 18 Tunisia              3.28      18804   573394
    ## 19 Paraguay             3.26      14653   449341
    ## 20 Slovakia             3.19      12534   392406

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6550.     195890   29.9 
    ##  2 Hungary                3008.      30021    9.98
    ##  3 Czech Republic         2898.      30362   10.5 
    ##  4 Brazil                 2735.     549924  201.  
    ##  5 Bulgaria               2546.      18199    7.15
    ##  6 Argentina              2509.     103721   41.3 
    ##  7 Colombia               2487.     118868   47.8 
    ##  8 Belgium                2425.      25228   10.4 
    ##  9 Paraguay               2298.      14653    6.38
    ## 10 Slovakia               2298.      12534    5.46
    ## 11 Italy                  2121.     127971   60.3 
    ## 12 Mexico                 2120.     238424  112.  
    ## 13 Chile                  2097.      35119   16.7 
    ## 14 Ecuador                2082.      30797   14.8 
    ## 15 United Kingdom         2072.     129172   62.3 
    ## 16 Poland                 1955.      75249   38.5 
    ## 17 United States          1953.     605780  310.  
    ## 18 Tunisia                1776.      18804   10.6 
    ## 19 Bolivia                1774.      17651    9.95
    ## 20 Spain                  1747.      81268   46.5

EOL
