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

Updated: 2022-04-23

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
    ##  1 United States          102572. 80006661            780
    ##  2 India                   55985. 43052425            769
    ##  3 Brazil                  39469. 30311969            768
    ##  4 France                  34875. 27272068            782
    ##  5 Germany                 30620. 24006254            784
    ##  6 United Kingdom          28089. 21909513            780
    ##  7 Russia                  23686. 18119862            765
    ##  8 South Korea             21155. 16755055            792
    ##  9 Italy                   20196. 15934437            789
    ## 10 Turkey                  19622. 15010718            765
    ## 11 Spain                   15028. 11736893            781
    ## 12 Vietnam                 13841. 10533164            761
    ## 13 Argentina               11752.  9060923            771
    ## 14 Netherlands             10352.  8032986            776
    ## 15 Japan                    9526.  7535033            791
    ## 16 Iran                     9164.  7212395            787
    ## 17 Colombia                 7971.  6090246            764
    ## 18 Indonesia                7858.  6042595            769
    ## 19 Poland                   7789.  5989614            769
    ## 20 Mexico                   7432.  5730560            771

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       732.             566380.            774
    ##  2 Israel                        713.             550408.            772
    ##  3 Austria                       651.             503656.            774
    ##  4 Netherlands                   622.             482607.            776
    ##  5 Switzerland                   605.             472217.            780
    ##  6 France                        538.             421071.            782
    ##  7 Belgium                       496.             386022.            779
    ##  8 Czech Republic                482.             371564.            771
    ##  9 Portugal                      460.             354174.            770
    ## 10 United Kingdom                451.             351404.            780
    ## 11 South Korea                   437.             346017.            792
    ## 12 Slovakia                      425.             324876.            765
    ## 13 Greece                        385.             296943.            771
    ## 14 Germany                       374.             293467.            784
    ## 15 Norway                        365.             283818.            778
    ## 16 Serbia                        356.             272266.            764
    ## 17 Jordan                        348.             264618.            761
    ## 18 Sweden                        337.             261450.            776
    ## 19 Italy                         335.             264076.            789
    ## 20 United States                 331.             257892.            780

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2148    11818
    ##  2 Sudan                 7.94       4930    62093
    ##  3 Peru                  5.98     212704  3557869
    ##  4 Mexico                5.65     324004  5730560
    ##  5 Syria                 5.65       3150    55785
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.77      24613   515645
    ##  8 Afghanistan           4.30       7680   178611
    ##  9 Ecuador               4.10      35543   867170
    ## 10 Niger                 3.47        309     8908
    ## 11 Bulgaria              3.20      36838  1152251
    ## 12 Myanmar               3.17      19434   612697
    ## 13 Malawi                3.07       2633    85741
    ## 14 Paraguay              2.90      18786   648682
    ## 15 Tunisia               2.74      28533  1039532
    ## 16 Haiti                 2.73        835    30615
    ## 17 South Africa          2.67     100276  3750830
    ## 18 Chad                  2.61        193     7396
    ## 19 Algeria               2.59       6874   265754
    ## 20 Indonesia             2.58     156015  6042595

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7112.     212704   29.9 
    ##  2 Bulgaria               5153.      36838    7.15
    ##  3 Hungary                4613.      46048    9.98
    ##  4 Czech Republic         3824.      40058   10.5 
    ##  5 Slovakia               3633.      19817    5.46
    ##  6 Chile                  3423.      57325   16.7 
    ##  7 Brazil                 3294.     662414  201.  
    ##  8 United States          3166.     982322  310.  
    ##  9 Argentina              3104.     128344   41.3 
    ## 10 Poland                 3011.     115926   38.5 
    ## 11 Belgium                3011.      31319   10.4 
    ## 12 Romania                2978.      65403   22.0 
    ## 13 Paraguay               2946.      18786    6.38
    ## 14 Colombia               2924.     139755   47.8 
    ## 15 Mexico                 2881.     324004  112.  
    ## 16 United Kingdom         2775.     173032   62.3 
    ## 17 Tunisia                2695.      28533   10.6 
    ## 18 Italy                  2689.     162264   60.3 
    ## 19 Russia                 2662.     374563  141.  
    ## 20 Greece                 2619.      28808   11

EOL
