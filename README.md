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

Updated: 2022-03-26

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
    ##  1 United States          105238. 79139385            752
    ##  2 India                   58052. 43016372            741
    ##  3 Brazil                  40067. 29729991            742
    ##  4 France                  31702. 23903547            754
    ##  5 United Kingdom          27412. 20613821            752
    ##  6 Germany                 26348. 19893028            755
    ##  7 Russia                  24037. 17715390            737
    ##  8 Turkey                  20027. 14760331            737
    ##  9 Italy                   18598. 14153098            761
    ## 10 Spain                   15154. 11410841            753
    ## 11 South Korea             14610. 11162232            764
    ## 12 Argentina               12156.  9019660            742
    ## 13 Vietnam                 11732.  8599751            733
    ## 14 Netherlands             10248.  7665726            748
    ## 15 Iran                     9415.  7145877            759
    ## 16 Colombia                 8253.  6082226            737
    ## 17 Japan                    8177.  6238879            763
    ## 18 Indonesia                8086.  5991687            741
    ## 19 Poland                   8007.  5933107            741
    ## 20 Mexico                   7591.  5640305            743

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       740.             552376.            746
    ##  2 Israel                        700.             520784.            744
    ##  3 Netherlands                   616.             460542.            748
    ##  4 Austria                       600.             447343.            746
    ##  5 Switzerland                   594.             446701.            752
    ##  6 France                        489.             369062.            754
    ##  7 Czech Republic                485.             360526.            743
    ##  8 Belgium                       483.             362514.            751
    ##  9 United Kingdom                440.             330623.            752
    ## 10 Portugal                      431.             319690.            742
    ## 11 Slovakia                      417.             306982.            737
    ## 12 Norway                        370.             278103.            751
    ## 13 Serbia                        363.             267416.            736
    ## 14 Jordan                        360.             263663.            733
    ## 15 Greece                        353.             262191.            743
    ## 16 Sweden                        347.             259707.            748
    ## 17 United States                 339.             255097.            752
    ## 18 Spain                         326.             245363.            753
    ## 19 Germany                       322.             243184.            755
    ## 20 Italy                         308.             234555.            761

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2142    11802
    ##  2 Sudan                 7.92       4901    61889
    ##  3 Peru                  5.98     211981  3543179
    ##  4 Mexico                5.71     322277  5640305
    ##  5 Syria                 5.63       3129    55610
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.86      24361   500889
    ##  8 Afghanistan           4.32       7657   177321
    ##  9 Ecuador               4.14      35413   855314
    ## 10 Niger                 3.50        308     8799
    ## 11 Bulgaria              3.22      36396  1131065
    ## 12 Myanmar               3.18      19428   610176
    ## 13 Malawi                3.07       2626    85586
    ## 14 Paraguay              2.87      18606   647538
    ## 15 Tunisia               2.72      28165  1033731
    ## 16 Haiti                 2.71        827    30511
    ## 17 South Africa          2.69      99932  3709209
    ## 18 Chad                  2.61        190     7288
    ## 19 Honduras              2.60      10869   418792
    ## 20 Algeria               2.59       6873   265599

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7088.     211981   29.9 
    ##  2 Bulgaria               5091.      36396    7.15
    ##  3 Hungary                4534.      45258    9.98
    ##  4 Czech Republic         3770.      39495   10.5 
    ##  5 Slovakia               3525.      19229    5.46
    ##  6 Chile                  3353.      56147   16.7 
    ##  7 Brazil                 3272.     657998  201.  
    ##  8 United States          3120.     967905  310.  
    ##  9 Argentina              3090.     127752   41.3 
    ## 10 Poland                 2980.     114736   38.5 
    ## 11 Romania                2952.      64826   22.0 
    ## 12 Belgium                2947.      30662   10.4 
    ## 13 Colombia               2919.     139508   47.8 
    ## 14 Paraguay               2918.      18606    6.38
    ## 15 Mexico                 2865.     322277  112.  
    ## 16 Tunisia                2660.      28165   10.6 
    ## 17 United Kingdom         2635.     164282   62.3 
    ## 18 Italy                  2626.     158436   60.3 
    ## 19 Russia                 2606.     366618  141.  
    ## 20 Greece                 2466.      27125   11

EOL
