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

Updated: 2022-04-21

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
    ##  1 United States          102756. 79944656            778
    ##  2 India                   56124. 43047594            767
    ##  3 Brazil                  39505. 30261088            766
    ##  4 France                  34650. 27027167            780
    ##  5 Germany                 30253. 23658211            782
    ##  6 United Kingdom          28103. 21863948            778
    ##  7 Russia                  23725. 18101986            763
    ##  8 South Korea             20991. 16583220            790
    ##  9 Italy                   20023. 15758002            787
    ## 10 Turkey                  19664. 15003696            763
    ## 11 Spain                   15066. 11736893            779
    ## 12 Vietnam                 13820. 10489319            759
    ## 13 Argentina               11783.  9060923            769
    ## 14 Netherlands             10370.  8026489            774
    ## 15 Japan                    9430.  7440164            789
    ## 16 Iran                     9186.  7210788            785
    ## 17 Colombia                 7992.  6089791            762
    ## 18 Indonesia                7877.  6042010            767
    ## 19 Poland                   7806.  5987341            767
    ## 20 Mexico                   7448.  5727832            769

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       733.             565579.            772
    ##  2 Israel                        714.             549751.            770
    ##  3 Austria                       650.             501451.            772
    ##  4 Netherlands                   623.             482216.            774
    ##  5 Switzerland                   607.             472217.            778
    ##  6 France                        535.             417289.            780
    ##  7 Belgium                       495.             384382.            777
    ##  8 Czech Republic                482.             371027.            769
    ##  9 Portugal                      458.             351966.            768
    ## 10 United Kingdom                451.             350673.            778
    ## 11 South Korea                   434.             342468.            790
    ## 12 Slovakia                      425.             324115.            763
    ## 13 Greece                        384.             295659.            769
    ## 14 Germany                       370.             289212.            782
    ## 15 Norway                        365.             283630.            777
    ## 16 Serbia                        357.             272008.            762
    ## 17 Jordan                        349.             264618.            759
    ## 18 Sweden                        337.             261200.            774
    ## 19 Italy                         332.             261152.            787
    ## 20 United States                 331.             257692.            778

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2148    11818
    ##  2 Sudan                 7.94       4929    62079
    ##  3 Peru                  5.98     212654  3556384
    ##  4 Mexico                5.66     323949  5727832
    ##  5 Syria                 5.65       3150    55782
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.77      24613   515645
    ##  8 Afghanistan           4.30       7680   178516
    ##  9 Ecuador               4.10      35528   866925
    ## 10 Niger                 3.46        308     8893
    ## 11 Bulgaria              3.20      36816  1151011
    ## 12 Myanmar               3.17      19434   612658
    ## 13 Malawi                3.07       2632    85728
    ## 14 Paraguay              2.90      18786   648682
    ## 15 Tunisia               2.74      28533  1039532
    ## 16 Haiti                 2.73        835    30615
    ## 17 South Africa          2.68     100195  3743582
    ## 18 Chad                  2.61        193     7396
    ## 19 Algeria               2.59       6874   265746
    ## 20 Indonesia             2.58     155974  6042010

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7111.     212654   29.9 
    ##  2 Bulgaria               5150.      36816    7.15
    ##  3 Hungary                4608.      46000    9.98
    ##  4 Czech Republic         3820.      40022   10.5 
    ##  5 Slovakia               3628.      19790    5.46
    ##  6 Chile                  3420.      57275   16.7 
    ##  7 Brazil                 3292.     662026  201.  
    ##  8 United States          3165.     981834  310.  
    ##  9 Argentina              3104.     128344   41.3 
    ## 10 Poland                 3010.     115869   38.5 
    ## 11 Belgium                3005.      31262   10.4 
    ## 12 Romania                2977.      65366   22.0 
    ## 13 Paraguay               2946.      18786    6.38
    ## 14 Colombia               2924.     139751   47.8 
    ## 15 Mexico                 2880.     323949  112.  
    ## 16 United Kingdom         2757.     171878   62.3 
    ## 17 Tunisia                2695.      28533   10.6 
    ## 18 Italy                  2683.     161893   60.3 
    ## 19 Russia                 2659.     374141  141.  
    ## 20 Greece                 2609.      28701   11

EOL
