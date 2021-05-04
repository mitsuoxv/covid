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

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2021-05-05

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
    ##  1 United States           75137. 32083656            427
    ##  2 India                   48757. 20282833            416
    ##  3 Brazil                  35383. 14754910            417
    ##  4 France                  12977.  5567300            429
    ##  5 Turkey                  11893.  4900121            412
    ##  6 Russia                  11746.  4839514            412
    ##  7 United Kingdom          10355.  4421854            427
    ##  8 Italy                    9290.  4050708            436
    ##  9 Spain                    8212.  3514942            428
    ## 10 Germany                  7985.  3433516            430
    ## 11 Argentina                7312.  3005259            411
    ## 12 Colombia                 7023.  2893655            412
    ## 13 Poland                   6750.  2808052            416
    ## 14 Iran                     5888.  2555587            434
    ## 15 Mexico                   5701.  2348873            412
    ## 16 Ukraine                  5144.  2088410            406
    ## 17 Peru                     4385.  1810998            413
    ## 18 Indonesia                4053.  1682004            415
    ## 19 Czech Republic           3916.  1636836            418
    ## 20 South Africa             3847.  1584961            412

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                374.             156246.            418
    ##  2 Israel                        273.             114042.            417
    ##  3 Jordan                        273.             111466.            408
    ##  4 United States                 242.             103418.            427
    ##  5 Sweden                        241.             101885.            423
    ##  6 Serbia                        230.              94375.            411
    ##  7 Belgium                       225.              95828.            426
    ##  8 Netherlands                   215.              91127.            423
    ##  9 Switzerland                   204.              87181.            427
    ## 10 France                        200.              85957.            429
    ## 11 Hungary                       192.              78625.            410
    ## 12 Portugal                      188.              78443.            417
    ## 13 Austria                       179.              75470.            422
    ## 14 Argentina                     177.              72691.            411
    ## 15 Spain                         177.              75580.            428
    ## 16 Brazil                        176.              73370.            417
    ## 17 Chile                         175.              72601.            414
    ## 18 Poland                        175.              72936.            416
    ## 19 Slovakia                      171.              70322.            411
    ## 20 United Kingdom                166.              70922.            427

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.5        1240     6367
    ##  2 Mexico                9.25     217233  2348873
    ##  3 Syria                 7.01       1610    22977
    ##  4 Sudan                 6.92       2349    33944
    ##  5 Egypt                 5.86      13531   230713
    ##  6 Somalia               5.12        713    13915
    ##  7 Ecuador               4.84      18765   388046
    ##  8 China                 4.68       4858   103694
    ##  9 Afghanistan           4.37       2648    60563
    ## 10 Bolivia               4.23      13021   307561
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.11       1573    38293
    ## 13 Bulgaria              4.08      16548   405825
    ## 14 Niger                 3.63        191     5261
    ## 15 Hungary               3.57      28045   784837
    ## 16 Mali                  3.52        491    13937
    ## 17 Chad                  3.52        170     4828
    ## 18 Tunisia               3.49      10915   312747
    ## 19 South Africa          3.44      54452  1584961
    ## 20 Peru                  3.43      62126  1810998

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2810.      28045    9.98
    ##  2 Czech Republic         2808.      29421   10.5 
    ##  3 Belgium                2338.      24322   10.4 
    ##  4 Bulgaria               2315.      16548    7.15
    ##  5 Slovakia               2173.      11855    5.46
    ##  6 Peru                   2077.      62126   29.9 
    ##  7 United Kingdom         2046.     127539   62.3 
    ##  8 Brazil                 2027.     407639  201.  
    ##  9 Italy                  2012.     121433   60.3 
    ## 10 Mexico                 1931.     217233  112.  
    ## 11 United States          1843.     571740  310.  
    ## 12 Poland                 1770.      68133   38.5 
    ## 13 Spain                  1679.      78080   46.5 
    ## 14 France                 1612.     104386   64.8 
    ## 15 Chile                  1592.      26659   16.7 
    ## 16 Portugal               1590.      16977   10.7 
    ## 17 Colombia               1563.      74700   47.8 
    ## 18 Argentina              1554.      64252   41.3 
    ## 19 Sweden                 1470.      14048    9.56
    ## 20 Jordan                 1393.       8925    6.41

EOL
