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

Updated: 2022-03-19

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          105949. 78932322            745
    ##  2 India                   58588. 43004005            734
    ##  3 Brazil                  40106. 29478039            735
    ##  4 France                  30985. 23145857            747
    ##  5 United Kingdom          26848. 20001631            745
    ##  6 Germany                 24449. 18287986            748
    ##  7 Russia                  23998. 17518699            730
    ##  8 Turkey                  20059. 14643491            730
    ##  9 Italy                   18098. 13645834            754
    ## 10 Spain                   15152. 11303625            746
    ## 11 Argentina               12332.  8990413            729
    ## 12 South Korea             11437.  8657609            757
    ## 13 Netherlands              9961.  7380902            741
    ## 14 Vietnam                  9882.  7174423            726
    ## 15 Iran                     9489.  7135719            752
    ## 16 Colombia                 8327.  6078487            730
    ## 17 Indonesia                8104.  5948610            734
    ## 18 Poland                   8004.  5875072            734
    ## 19 Japan                    7893.  5966960            756
    ## 20 Mexico                   7635.  5619780            736

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       737.             544558.            739
    ##  2 Israel                        691.             509543.            737
    ##  3 Netherlands                   598.             443431.            741
    ##  4 Switzerland                   571.             425584.            745
    ##  5 Austria                       556.             410997.            739
    ##  6 Czech Republic                483.             355514.            736
    ##  7 France                        478.             357363.            747
    ##  8 Belgium                       478.             355288.            744
    ##  9 Portugal                      435.             319690.            735
    ## 10 United Kingdom                431.             320804.            745
    ## 11 Slovakia                      406.             296691.            730
    ## 12 Norway                        368.             273133.            743
    ## 13 Serbia                        364.             265486.            729
    ## 14 Jordan                        361.             262238.            726
    ## 15 Sweden                        349.             258867.            741
    ## 16 United States                 342.             254429.            745
    ## 17 Greece                        338.             248442.            736
    ## 18 Spain                         326.             243058.            746
    ## 19 Italy                         300.             226148.            754
    ## 20 Germany                       299.             223563.            748

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2140    11797
    ##  2 Sudan                 7.91       4888    61775
    ##  3 Peru                  5.98     211661  3538453
    ##  4 Mexico                5.72     321619  5619780
    ##  5 Syria                 5.63       3120    55460
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.90      24277   495373
    ##  8 Afghanistan           4.32       7651   176918
    ##  9 Ecuador               4.16      35348   849699
    ## 10 Niger                 3.50        308     8788
    ## 11 Bulgaria              3.23      36248  1121194
    ## 12 Myanmar               3.20      19418   607399
    ## 13 Malawi                3.07       2624    85539
    ## 14 Paraguay              2.87      18555   646495
    ## 15 Tunisia               2.73      28065  1029762
    ## 16 Haiti                 2.71        827    30478
    ## 17 South Africa          2.70      99829  3700484
    ## 18 El Salvador           2.62       4104   156364
    ## 19 Chad                  2.61        190     7269
    ## 20 Honduras              2.60      10842   417201

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7077.     211661   29.9 
    ##  2 Bulgaria               5071.      36248    7.15
    ##  3 Hungary                4504.      44961    9.98
    ##  4 Czech Republic         3753.      39318   10.5 
    ##  5 Slovakia               3496.      19073    5.46
    ##  6 Brazil                 3262.     655940  201.  
    ##  7 United States          3097.     960935  310.  
    ##  8 Argentina              3081.     127363   41.3 
    ##  9 Poland                 2963.     114087   38.5 
    ## 10 Romania                2941.      64581   22.0 
    ## 11 Belgium                2933.      30510   10.4 
    ## 12 Colombia               2916.     139361   47.8 
    ## 13 Paraguay               2910.      18555    6.38
    ## 14 Mexico                 2860.     321619  112.  
    ## 15 Tunisia                2650.      28065   10.6 
    ## 16 Chile                  2642.      44246   16.7 
    ## 17 United Kingdom         2621.     163386   62.3 
    ## 18 Italy                  2609.     157442   60.3 
    ## 19 Russia                 2584.     363563  141.  
    ## 20 Greece                 2436.      26792   11

EOL
