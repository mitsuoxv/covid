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

Updated: 2022-04-22

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
    ##  1 United States          102704. 80006661            779
    ##  2 India                   56055. 43049974            768
    ##  3 Brazil                  39472. 30275219            767
    ##  4 France                  34805. 27182878            781
    ##  5 Germany                 30453. 23844536            783
    ##  6 United Kingdom          28100. 21890041            779
    ##  7 Russia                  23705. 18110861            764
    ##  8 South Korea             21080. 16674045            791
    ##  9 Italy                   20125. 15858442            788
    ## 10 Turkey                  19643. 15007364            764
    ## 11 Spain                   15047. 11736893            780
    ## 12 Vietnam                 13819. 10502590            760
    ## 13 Argentina               11767.  9060923            770
    ## 14 Netherlands             10361.  8029998            775
    ## 15 Japan                    9478.  7487624            790
    ## 16 Iran                     9176.  7212395            786
    ## 17 Colombia                 7982.  6089998            763
    ## 18 Indonesia                7868.  6042595            768
    ## 19 Poland                   7797.  5988518            768
    ## 20 Mexico                   7440.  5729270            770

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       732.             566008.            773
    ##  2 Israel                        714.             550305.            771
    ##  3 Austria                       650.             502349.            773
    ##  4 Netherlands                   622.             482427.            775
    ##  5 Switzerland                   606.             472217.            779
    ##  6 France                        537.             419694.            781
    ##  7 Belgium                       494.             384382.            778
    ##  8 Czech Republic                482.             371357.            770
    ##  9 Portugal                      459.             353183.            769
    ## 10 United Kingdom                451.             351092.            779
    ## 11 South Korea                   435.             344344.            791
    ## 12 Slovakia                      425.             324557.            764
    ## 13 Greece                        385.             296328.            770
    ## 14 Germany                       372.             291490.            783
    ## 15 Norway                        365.             283630.            777
    ## 16 Serbia                        357.             272133.            763
    ## 17 Jordan                        348.             264618.            760
    ## 18 Sweden                        337.             261200.            775
    ## 19 Italy                         334.             262817.            788
    ## 20 United States                 331.             257892.            779

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2148    11818
    ##  2 Sudan                 7.94       4929    62084
    ##  3 Peru                  5.98     212676  3557139
    ##  4 Mexico                5.65     323973  5729270
    ##  5 Syria                 5.65       3150    55785
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.77      24613   515645
    ##  8 Afghanistan           4.30       7680   178555
    ##  9 Ecuador               4.10      35543   867170
    ## 10 Niger                 3.46        308     8903
    ## 11 Bulgaria              3.20      36827  1151620
    ## 12 Myanmar               3.17      19434   612697
    ## 13 Malawi                3.07       2632    85735
    ## 14 Paraguay              2.90      18786   648682
    ## 15 Tunisia               2.74      28533  1039532
    ## 16 Haiti                 2.73        835    30615
    ## 17 South Africa          2.67     100211  3746424
    ## 18 Chad                  2.61        193     7396
    ## 19 Algeria               2.59       6874   265746
    ## 20 Indonesia             2.58     156015  6042595

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7111.     212676   29.9 
    ##  2 Bulgaria               5152.      36827    7.15
    ##  3 Hungary                4611.      46024    9.98
    ##  4 Czech Republic         3822.      40038   10.5 
    ##  5 Slovakia               3630.      19803    5.46
    ##  6 Chile                  3421.      57283   16.7 
    ##  7 Brazil                 3293.     662151  201.  
    ##  8 United States          3166.     982322  310.  
    ##  9 Argentina              3104.     128344   41.3 
    ## 10 Poland                 3010.     115899   38.5 
    ## 11 Belgium                3005.      31262   10.4 
    ## 12 Romania                2978.      65384   22.0 
    ## 13 Paraguay               2946.      18786    6.38
    ## 14 Colombia               2924.     139754   47.8 
    ## 15 Mexico                 2881.     323973  112.  
    ## 16 United Kingdom         2765.     172386   62.3 
    ## 17 Tunisia                2695.      28533   10.6 
    ## 18 Italy                  2686.     162098   60.3 
    ## 19 Russia                 2661.     374368  141.  
    ## 20 Greece                 2615       28765   11

EOL
