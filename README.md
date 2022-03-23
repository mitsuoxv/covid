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

Updated: 2022-03-24

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
    ##  1 United States          105419. 79064472            750
    ##  2 India                   58204. 43012749            739
    ##  3 Brazil                  40056. 29641594            740
    ##  4 France                  31402. 23614306            752
    ##  5 United Kingdom          27218. 20413735            750
    ##  6 Germany                 25602. 19278143            753
    ##  7 Russia                  24033. 17664621            735
    ##  8 Turkey                  20035. 14726276            735
    ##  9 Italy                   18435. 13992092            759
    ## 10 Spain                   15151. 11378784            751
    ## 11 South Korea             13684. 10427247            762
    ## 12 Argentina               12283.  9016057            734
    ## 13 Vietnam                 11407.  8338914            731
    ## 14 Netherlands             10166.  7583852            746
    ## 15 Iran                     9436.  7143409            757
    ## 16 Colombia                 8274.  6081639            735
    ## 17 Indonesia                8093.  5981022            739
    ## 18 Japan                    8086.  6153211            761
    ## 19 Poland                   8005.  5915888            739
    ## 20 Mexico                   7605.  5635500            741

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       740.             550242.            744
    ##  2 Israel                        697.             517154.            742
    ##  3 Netherlands                   611.             455623.            746
    ##  4 Switzerland                   587.             440333.            750
    ##  5 Austria                       586.             435656.            744
    ##  6 France                        485.             364596.            752
    ##  7 Czech Republic                485.             359027.            741
    ##  8 Belgium                       480.             359667.            749
    ##  9 United Kingdom                437.             327414.            750
    ## 10 Portugal                      432.             319690.            740
    ## 11 Slovakia                      413.             303727.            735
    ## 12 Norway                        370.             276631.            748
    ## 13 Serbia                        363.             266813.            734
    ## 14 Jordan                        361.             263663.            731
    ## 15 Greece                        348.             258081             741
    ## 16 Sweden                        347.             259074.            746
    ## 17 United States                 340.             254855.            750
    ## 18 Spain                         326.             244674.            751
    ## 19 Germany                       313.             235668.            753
    ## 20 Italy                         306.             231886.            759

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2142    11802
    ##  2 Sudan                 7.92       4900    61862
    ##  3 Peru                  5.98     211924  3541994
    ##  4 Mexico                5.72     322107  5635500
    ##  5 Syria                 5.63       3128    55595
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.86      24361   500889
    ##  8 Afghanistan           4.32       7656   177255
    ##  9 Ecuador               4.15      35410   854252
    ## 10 Niger                 3.50        308     8797
    ## 11 Bulgaria              3.22      36350  1128089
    ## 12 Myanmar               3.19      19428   609915
    ## 13 Malawi                3.07       2626    85566
    ## 14 Paraguay              2.87      18599   647268
    ## 15 Tunisia               2.72      28165  1033731
    ## 16 Haiti                 2.71        827    30511
    ## 17 South Africa          2.70      99893  3705696
    ## 18 Chad                  2.61        190     7288
    ## 19 Honduras              2.60      10863   418460
    ## 20 Algeria               2.59       6873   265573

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7086.     211924   29.9 
    ##  2 Bulgaria               5085.      36350    7.15
    ##  3 Hungary                4527.      45185    9.98
    ##  4 Czech Republic         3765.      39441   10.5 
    ##  5 Slovakia               3517.      19185    5.46
    ##  6 Chile                  3343.      55976   16.7 
    ##  7 Brazil                 3268.     657302  201.  
    ##  8 United States          3116.     966780  310.  
    ##  9 Argentina              3088.     127675   41.3 
    ## 10 Poland                 2974.     114480   38.5 
    ## 11 Romania                2949.      64749   22.0 
    ## 12 Belgium                2942.      30605   10.4 
    ## 13 Colombia               2918.     139471   47.8 
    ## 14 Paraguay               2917.      18599    6.38
    ## 15 Mexico                 2864.     322107  112.  
    ## 16 Tunisia                2660.      28165   10.6 
    ## 17 United Kingdom         2629.     163929   62.3 
    ## 18 Italy                  2620.     158101   60.3 
    ## 19 Russia                 2600.     365802  141.  
    ## 20 Greece                 2457.      27029   11

EOL
