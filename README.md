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

Updated: 2021-05-13

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
    ##  1 United States           74539. 32424637            435
    ##  2 India                   55049. 23340938            424
    ##  3 Brazil                  35788. 15209990            425
    ##  4 France                  13059.  5706758            437
    ##  5 Turkey                  12046.  5059433            420
    ##  6 Russia                  11659.  4896842            420
    ##  7 United Kingdom          10206.  4439695            435
    ##  8 Italy                    9286.  4123230            444
    ##  9 Spain                    8225.  3586333            436
    ## 10 Germany                  8101.  3548285            438
    ## 11 Argentina                7554.  3165121            419
    ## 12 Colombia                 7179.  3015301            420
    ## 13 Poland                   6703.  2842339            424
    ## 14 Iran                     6089.  2691352            442
    ## 15 Mexico                   5634.  2366496            420
    ## 16 Ukraine                  5142.  2129073            414
    ## 17 Peru                     4402.  1853370            421
    ## 18 Indonesia                4074.  1723596            423
    ## 19 Czech Republic           3870.  1648667            426
    ## 20 South Africa             3807.  1599272            420

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                369.             157376.            426
    ##  2 Jordan                        271.             112665.            416
    ##  3 Israel                        268.             114091.            425
    ##  4 Sweden                        248.             106908.            431
    ##  5 United States                 240.             104517.            435
    ##  6 Serbia                        228.              95639.            419
    ##  7 Belgium                       226.              98081.            434
    ##  8 Netherlands                   219.              94407.            431
    ##  9 Switzerland                   204.              88722.            435
    ## 10 France                        202.              88110.            437
    ## 11 Hungary                       190.              79522.            418
    ## 12 Portugal                      185.              78682.            425
    ## 13 Argentina                     183.              76557.            419
    ## 14 Austria                       178.              76626.            430
    ## 15 Brazil                        178.              75633.            425
    ## 16 Chile                         178.              75033.            422
    ## 17 Spain                         177.              77116.            436
    ## 18 Poland                        174.              73827.            424
    ## 19 Slovakia                      169.              70860.            419
    ## 20 United Kingdom                164.              71208.            435

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1277     6496
    ##  2 Mexico                9.26     219089  2366496
    ##  3 Syria                 7.11       1670    23490
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.85      14033   239740
    ##  6 Somalia               5.20        753    14486
    ##  7 Ecuador               4.79      19286   402595
    ##  8 China                 4.68       4858   103870
    ##  9 Afghanistan           4.33       2713    62718
    ## 10 Bulgaria              4.15      17104   412157
    ## 11 Bolivia               4.14      13258   320209
    ## 12 Tanzania              4.13         21      509
    ## 13 Zimbabwe              4.11       1579    38448
    ## 14 Hungary               3.64      28888   793784
    ## 15 Niger                 3.61        192     5324
    ## 16 Mali                  3.58        506    14133
    ## 17 Tunisia               3.58      11556   322998
    ## 18 Chad                  3.52        172     4888
    ## 19 Peru                  3.47      64373  1853370
    ## 20 South Africa          3.43      54896  1599272

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2894.      28888    9.98
    ##  2 Czech Republic         2843.      29787   10.5 
    ##  3 Bulgaria               2393.      17104    7.15
    ##  4 Belgium                2366.      24609   10.4 
    ##  5 Slovakia               2217.      12096    5.46
    ##  6 Peru                   2152.      64373   29.9 
    ##  7 Brazil                 2105.     423229  201.  
    ##  8 United Kingdom         2047.     127629   62.3 
    ##  9 Italy                  2043.     123282   60.3 
    ## 10 Mexico                 1948.     219089  112.  
    ## 11 United States          1859.     576814  310.  
    ## 12 Poland                 1836.      70679   38.5 
    ## 13 Spain                  1701.      79100   46.5 
    ## 14 Argentina              1640.      67821   41.3 
    ## 15 Colombia               1639.      78342   47.8 
    ## 16 France                 1639.     106151   64.8 
    ## 17 Chile                  1634.      27356   16.7 
    ## 18 Portugal               1592.      16994   10.7 
    ## 19 Sweden                 1488.      14217    9.56
    ## 20 Jordan                 1428.       9151    6.41

EOL
