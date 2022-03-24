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

Updated: 2022-03-25

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
    ##  1 United States          105315. 79091857            751
    ##  2 India                   58128. 43014687            740
    ##  3 Brazil                  40057. 29682615            741
    ##  4 France                  31553. 23759289            753
    ##  5 United Kingdom          27318. 20516002            751
    ##  6 Germany                 25990. 19596530            754
    ##  7 Russia                  24035. 17690008            736
    ##  8 Turkey                  20032. 14743437            736
    ##  9 Italy                   18514. 14070450            760
    ## 10 Spain                   15174. 11410841            752
    ## 11 South Korea             14184. 10822836            763
    ## 12 Argentina               12267.  9016057            735
    ## 13 Vietnam                 11584.  8479751            732
    ## 14 Netherlands             10210.  7626640            747
    ## 15 Iran                     9425.  7144532            758
    ## 16 Colombia                 8263.  6081933            736
    ## 17 Japan                    8123.  6189816            762
    ## 18 Indonesia                8090.  5986830            740
    ## 19 Poland                   8006.  5924876            740
    ## 20 Mexico                   7596.  5636054            742

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       740.             551389.            745
    ##  2 Israel                        699.             519016.            743
    ##  3 Netherlands                   613.             458194.            747
    ##  4 Austria                       594.             442604.            745
    ##  5 Switzerland                   591.             443757.            751
    ##  6 France                        487.             366835.            753
    ##  7 Czech Republic                485.             359838.            742
    ##  8 Belgium                       482.             361220.            750
    ##  9 United Kingdom                438.             329054.            751
    ## 10 Portugal                      431.             319690.            741
    ## 11 Slovakia                      415.             305496.            736
    ## 12 Norway                        370.             277498.            750
    ## 13 Serbia                        363.             267128.            735
    ## 14 Jordan                        360.             263663.            732
    ## 15 Greece                        351.             260181.            742
    ## 16 Sweden                        347.             259074.            747
    ## 17 United States                 339.             254944.            751
    ## 18 Spain                         326.             245363.            752
    ## 19 Germany                       318.             239560.            754
    ## 20 Italy                         307.             233185.            760

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2142    11802
    ##  2 Sudan                 7.92       4900    61862
    ##  3 Peru                  5.98     211944  3542602
    ##  4 Mexico                5.72     322119  5636054
    ##  5 Syria                 5.63       3129    55610
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.86      24361   500889
    ##  8 Afghanistan           4.32       7657   177321
    ##  9 Ecuador               4.15      35410   854252
    ## 10 Niger                 3.50        308     8799
    ## 11 Bulgaria              3.22      36375  1129641
    ## 12 Myanmar               3.18      19428   610176
    ## 13 Malawi                3.07       2626    85574
    ## 14 Paraguay              2.87      18603   647428
    ## 15 Tunisia               2.72      28165  1033731
    ## 16 Haiti                 2.71        827    30511
    ## 17 South Africa          2.69      99899  3707089
    ## 18 Chad                  2.61        190     7288
    ## 19 Honduras              2.60      10869   418792
    ## 20 Algeria               2.59       6873   265585

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7087.     211944   29.9 
    ##  2 Bulgaria               5088.      36375    7.15
    ##  3 Hungary                4530.      45220    9.98
    ##  4 Czech Republic         3767.      39467   10.5 
    ##  5 Slovakia               3521.      19209    5.46
    ##  6 Chile                  3344.      55992   16.7 
    ##  7 Brazil                 3270.     657696  201.  
    ##  8 United States          3116.     966570  310.  
    ##  9 Argentina              3088.     127675   41.3 
    ## 10 Poland                 2977.     114626   38.5 
    ## 11 Romania                2950.      64789   22.0 
    ## 12 Belgium                2945.      30635   10.4 
    ## 13 Colombia               2919.     139485   47.8 
    ## 14 Paraguay               2918.      18603    6.38
    ## 15 Mexico                 2864.     322119  112.  
    ## 16 Tunisia                2660.      28165   10.6 
    ## 17 United Kingdom         2632.     164123   62.3 
    ## 18 Italy                  2623.     158254   60.3 
    ## 19 Russia                 2603.     366220  141.  
    ## 20 Greece                 2462.      27083   11

EOL
