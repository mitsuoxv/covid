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

Updated: 2022-04-09

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
    ##  1 United States          103844. 79544396            766
    ##  2 India                   56997. 43033067            755
    ##  3 Brazil                  39877. 30067249            754
    ##  4 France                  33569. 25781400            768
    ##  5 Germany                 29182. 22441051            769
    ##  6 United Kingdom          28079. 21508550            766
    ##  7 Russia                  23927. 17969431            751
    ##  8 Turkey                  19892. 14939259            751
    ##  9 Italy                   19492. 15106066            775
    ## 10 South Korea             19259. 14983694            778
    ## 11 Spain                   15096. 11578653            767
    ## 12 Vietnam                 13481. 10070692            747
    ## 13 Argentina               11952.  9047408            757
    ## 14 Netherlands             10447.  7960982            762
    ## 15 Iran                     9288.  7180008            773
    ## 16 Japan                    8864.  6887421            777
    ## 17 Colombia                 8116.  6086811            750
    ## 18 Indonesia                7987.  6030168            755
    ## 19 Poland                   7916.  5976364            755
    ## 20 Mexico                   7507.  5683288            757

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       739.             561323.            760
    ##  2 Israel                        715.             541702.            758
    ##  3 Austria                       641.             487280.            760
    ##  4 Netherlands                   628.             478281.            762
    ##  5 Switzerland                   605.             463277.            766
    ##  6 France                        518.             398055.            768
    ##  7 Belgium                       492.             376404.            765
    ##  8 Czech Republic                486.             368070.            757
    ##  9 Portugal                      453.             342618.            756
    ## 10 United Kingdom                450.             344973.            766
    ## 11 Slovakia                      426.             319939.            751
    ## 12 South Korea                   398.             309436.            778
    ## 13 Greece                        377.             285247.            757
    ## 14 Norway                        369.             282077.            764
    ## 15 Serbia                        361.             270453.            750
    ## 16 Germany                       357.             274333.            769
    ## 17 Jordan                        354.             264429.            747
    ## 18 Sweden                        342.             260779.            762
    ## 19 United States                 335.             256402.            766
    ## 20 Spain                         325.             248971.            767

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2144    11812
    ##  2 Sudan                 7.92       4907    61987
    ##  3 Peru                  5.98     212396  3549511
    ##  4 Mexico                5.69     323403  5683288
    ##  5 Syria                 5.64       3145    55727
    ##  6 Somalia               5.14       1361    26471
    ##  7 Egypt                 4.81      24473   509177
    ##  8 Afghanistan           4.31       7671   177974
    ##  9 Ecuador               4.11      35461   863398
    ## 10 Niger                 3.49        308     8822
    ## 11 Bulgaria              3.21      36672  1144107
    ## 12 Myanmar               3.17      19434   612132
    ## 13 Malawi                3.07       2628    85683
    ## 14 Paraguay              2.89      18731   648353
    ## 15 Tunisia               2.74      28425  1037358
    ## 16 Haiti                 2.72        833    30575
    ## 17 South Africa          2.68     100075  3728689
    ## 18 Chad                  2.61        192     7349
    ## 19 Algeria               2.59       6874   265707
    ## 20 Honduras              2.58      10888   421268

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7102.     212396   29.9 
    ##  2 Bulgaria               5130.      36672    7.15
    ##  3 Hungary                4580.      45721    9.98
    ##  4 Czech Republic         3803.      39844   10.5 
    ##  5 Slovakia               3579.      19523    5.46
    ##  6 Chile                  3398.      56912   16.7 
    ##  7 Brazil                 3285.     660723  201.  
    ##  8 United States          3148.     976516  310.  
    ##  9 Argentina              3100.     128144   41.3 
    ## 10 Poland                 3002.     115594   38.5 
    ## 11 Belgium                2980.      30997   10.4 
    ## 12 Romania                2968.      65170   22.0 
    ## 13 Paraguay               2938.      18731    6.38
    ## 14 Colombia               2923.     139687   47.8 
    ## 15 Mexico                 2875.     323403  112.  
    ## 16 United Kingdom         2717.     169412   62.3 
    ## 17 Tunisia                2684.      28425   10.6 
    ## 18 Italy                  2658.     160402   60.3 
    ## 19 Russia                 2638.     371169  141.  
    ## 20 Greece                 2543.      27968   11

EOL
