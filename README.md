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

Updated: 2022-04-12

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
    ##  1 United States          103540. 79622283            769
    ##  2 India                   56776. 43036132            758
    ##  3 Brazil                  39822. 30145192            757
    ##  4 France                  33950. 26175546            771
    ##  5 Germany                 29375. 22677986            772
    ##  6 United Kingdom          28023. 21549834            769
    ##  7 Russia                  23883. 18007915            754
    ##  8 Turkey                  19839. 14958974            754
    ##  9 South Korea             19750. 15424598            781
    ## 10 Italy                   19655. 15292048            778
    ## 11 Spain                   15100. 11627478            770
    ## 12 Vietnam                 13597. 10198236            750
    ## 13 Argentina               11911.  9052083            760
    ## 14 Netherlands             10421.  7971855            765
    ## 15 Iran                     9267.  7191643            776
    ## 16 Japan                    9025.  7039563            780
    ## 17 Colombia                 8085.  6087737            753
    ## 18 Indonesia                7960.  6033903            758
    ## 19 Poland                   7887.  5978596            758
    ## 20 Mexico                   7529.  5722541            760

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       737.             562574.            763
    ##  2 Israel                        715.             543826.            761
    ##  3 Austria                       645.             491990.            763
    ##  4 Netherlands                   626.             478934.            765
    ##  5 Switzerland                   602.             463277.            769
    ##  6 France                        524.             404141.            771
    ##  7 Belgium                       490.             376404.            768
    ##  8 Czech Republic                485.             368816.            760
    ##  9 Portugal                      453.             343498.            759
    ## 10 United Kingdom                449.             345635.            769
    ## 11 Slovakia                      426.             321093.            754
    ## 12 South Korea                   408.             318541.            781
    ## 13 Greece                        380.             288512.            760
    ## 14 Norway                        368.             282668.            768
    ## 15 Serbia                        360.             270859.            753
    ## 16 Germany                       359.             277229.            772
    ## 17 Jordan                        353.             264544.            750
    ## 18 Sweden                        341.             260779.            765
    ## 19 United States                 334.             256653.            769
    ## 20 Italy                         326.             253430.            778

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2147    11813
    ##  2 Sudan                 7.94       4925    62034
    ##  3 Peru                  5.98     212471  3551245
    ##  4 Mexico                5.66     323720  5722541
    ##  5 Syria                 5.64       3146    55742
    ##  6 Somalia               5.14       1361    26471
    ##  7 Egypt                 4.79      24522   511977
    ##  8 Afghanistan           4.31       7675   178141
    ##  9 Ecuador               4.11      35461   863398
    ## 10 Niger                 3.49        308     8823
    ## 11 Bulgaria              3.20      36700  1145408
    ## 12 Myanmar               3.17      19434   612383
    ## 13 Malawi                3.07       2628    85703
    ## 14 Paraguay              2.89      18734   648446
    ## 15 Tunisia               2.74      28425  1037358
    ## 16 Haiti                 2.72        833    30575
    ## 17 South Africa          2.68     100096  3732075
    ## 18 Chad                  2.61        192     7347
    ## 19 Algeria               2.59       6874   265724
    ## 20 Honduras              2.58      10888   421268

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7104.     212471   29.9 
    ##  2 Bulgaria               5134.      36700    7.15
    ##  3 Hungary                4586.      45781    9.98
    ##  4 Czech Republic         3808.      39894   10.5 
    ##  5 Slovakia               3592.      19595    5.46
    ##  6 Chile                  3406.      57041   16.7 
    ##  7 Brazil                 3288.     661220  201.  
    ##  8 United States          3152.     977980  310.  
    ##  9 Argentina              3101.     128197   41.3 
    ## 10 Poland                 3004.     115635   38.5 
    ## 11 Belgium                2980.      30997   10.4 
    ## 12 Romania                2969.      65207   22.0 
    ## 13 Paraguay               2938.      18734    6.38
    ## 14 Colombia               2923.     139713   47.8 
    ## 15 Mexico                 2878.     323720  112.  
    ## 16 United Kingdom         2723.     169759   62.3 
    ## 17 Tunisia                2684.      28425   10.6 
    ## 18 Italy                  2664.     160748   60.3 
    ## 19 Russia                 2644.     371964  141.  
    ## 20 Greece                 2557.      28130   11

EOL
