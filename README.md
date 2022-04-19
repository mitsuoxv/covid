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

Updated: 2022-04-20

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
    ##  1 United States          102826. 79896146            777
    ##  2 India                   56195. 43045527            766
    ##  3 Brazil                  39546. 30252618            765
    ##  4 France                  34662. 27001702            779
    ##  5 Germany                 30076. 23459628            780
    ##  6 United Kingdom          27989. 21747642            777
    ##  7 Russia                  23744. 18092791            762
    ##  8 South Korea             20877. 16471940            789
    ##  9 Italy                   20013. 15730676            786
    ## 10 Turkey                  19684. 14999479            762
    ## 11 Spain                   14990. 11662214            778
    ## 12 Vietnam                 13820. 10475819            758
    ## 13 Argentina               11798.  9060923            768
    ## 14 Netherlands             10369.  8015576            773
    ## 15 Japan                    9394.  7402533            788
    ## 16 Iran                     9195.  7208968            784
    ## 17 Colombia                 8002.  6089662            761
    ## 18 Indonesia                7887.  6041269            766
    ## 19 Poland                   7814.  5985818            766
    ## 20 Mexico                   7458.  5727668            768

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       733.             565251.            771
    ##  2 Israel                        714.             548911.            769
    ##  3 Austria                       649.             500765.            771
    ##  4 Netherlands                   623.             481561.            773
    ##  5 Switzerland                   603.             468513.            777
    ##  6 France                        535.             416896.            779
    ##  7 Belgium                       492.             381906.            776
    ##  8 Czech Republic                483.             370683.            768
    ##  9 Portugal                      457.             350840.            767
    ## 10 United Kingdom                449.             348808.            777
    ## 11 South Korea                   431.             340170.            789
    ## 12 Slovakia                      425.             323733.            762
    ## 13 Greece                        384.             294731.            768
    ## 14 Germany                       368.             286785.            780
    ## 15 Norway                        366.             283427.            775
    ## 16 Serbia                        357.             271873.            761
    ## 17 Jordan                        349.             264618.            758
    ## 18 Sweden                        338.             261200.            773
    ## 19 Italy                         332.             260699.            786
    ## 20 United States                 331.             257536.            777

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2148    11818
    ##  2 Sudan                 7.94       4929    62079
    ##  3 Peru                  5.98     212630  3555739
    ##  4 Mexico                5.66     323944  5727668
    ##  5 Syria                 5.65       3150    55778
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.77      24613   515645
    ##  8 Afghanistan           4.30       7680   178513
    ##  9 Ecuador               4.10      35528   866884
    ## 10 Niger                 3.47        308     8883
    ## 11 Bulgaria              3.20      36810  1150342
    ## 12 Myanmar               3.17      19434   612602
    ## 13 Malawi                3.07       2632    85728
    ## 14 Paraguay              2.89      18734   648446
    ## 15 Tunisia               2.74      28509  1038668
    ## 16 Haiti                 2.73        835    30615
    ## 17 South Africa          2.68     100181  3742107
    ## 18 Chad                  2.61        193     7396
    ## 19 Algeria               2.59       6874   265741
    ## 20 Honduras              2.58      10888   421268

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7110.     212630   29.9 
    ##  2 Bulgaria               5149.      36810    7.15
    ##  3 Hungary                4605.      45971    9.98
    ##  4 Czech Republic         3818.      39997   10.5 
    ##  5 Slovakia               3625.      19773    5.46
    ##  6 Chile                  3420.      57270   16.7 
    ##  7 Brazil                 3292.     661960  201.  
    ##  8 United States          3163.     981415  310.  
    ##  9 Argentina              3104.     128344   41.3 
    ## 10 Poland                 3009.     115838   38.5 
    ## 11 Belgium                2996.      31165   10.4 
    ## 12 Romania                2976.      65340   22.0 
    ## 13 Paraguay               2938.      18734    6.38
    ## 14 Colombia               2924.     139749   47.8 
    ## 15 Mexico                 2880.     323944  112.  
    ## 16 United Kingdom         2749.     171396   62.3 
    ## 17 Tunisia                2692.      28509   10.6 
    ## 18 Italy                  2681.     161766   60.3 
    ## 19 Russia                 2658.     373948  141.  
    ## 20 Greece                 2605.      28652   11

EOL
