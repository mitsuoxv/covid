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

Updated: 2022-03-04

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
    ##  1 United States          107332. 78352602            730
    ##  2 India                   59729. 42945160            719
    ##  3 Brazil                  40015. 28811165            720
    ##  4 France                  30285. 22168722            732
    ##  5 United Kingdom          26067. 19029325            730
    ##  6 Russia                  23337. 16685850            715
    ##  7 Germany                 20824. 15264297            733
    ##  8 Turkey                  19867. 14205230            715
    ##  9 Italy                   17412. 12867918            739
    ## 10 Spain                   15123. 11054888            731
    ## 11 Argentina               12482.  8912317            714
    ## 12 Iran                     9589.  7066975            737
    ## 13 Netherlands              8879.  6446603            726
    ## 14 Colombia                 8483.  6065801            715
    ## 15 Poland                   7940.  5708827            719
    ## 16 Indonesia                7882.  5667355            719
    ## 17 Mexico                   7658.  5521744            721
    ## 18 Japan                    6935.  5139305            741
    ## 19 Ukraine                  6848.  4855558            709
    ## 20 Vietnam                  5217.  3709481            711

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       706.             511280.            724
    ##  2 Israel                        688.             496684.            722
    ##  3 Netherlands                   533.             387300.            726
    ##  4 Switzerland                   511.             373312.            730
    ##  5 Czech Republic                478.             344457.            721
    ##  6 Belgium                       471.             343322.            729
    ##  7 France                        468.             342277.            732
    ##  8 Austria                       466.             337088.            724
    ##  9 Portugal                      427.             307461.            720
    ## 10 United Kingdom                418.             305209.            730
    ## 11 Slovakia                      380.             271742.            715
    ## 12 Serbia                        365.             260959.            714
    ## 13 Jordan                        360.             255690.            711
    ## 14 Sweden                        353.             256539.            726
    ## 15 United States                 346.             252561.            730
    ## 16 Norway                        345.             250954.            728
    ## 17 Spain                         325.             237709.            731
    ## 18 Greece                        309.             223130.            721
    ## 19 Argentina                     302.             215569.            714
    ## 20 Italy                         289.             213256.            739

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2135    11771
    ##  2 Sudan                 6.35       3911    61554
    ##  3 Peru                  5.99     210744  3518721
    ##  4 Mexico                5.77     318531  5521744
    ##  5 Syria                 5.63       3082    54744
    ##  6 Somalia               5.12       1348    26351
    ##  7 Egypt                 4.96      24132   486381
    ##  8 Afghanistan           4.38       7617   174073
    ##  9 Ecuador               4.23      35249   833291
    ## 10 Niger                 3.50        307     8759
    ## 11 Myanmar               3.27      19375   592139
    ## 12 Bulgaria              3.26      35696  1096194
    ## 13 Malawi                3.07       2617    85362
    ## 14 Paraguay              2.86      18392   642184
    ## 15 Tunisia               2.78      27857  1000518
    ## 16 South Africa          2.70      99458  3677686
    ## 17 Haiti                 2.70        820    30340
    ## 18 Indonesia             2.63     149268  5667355
    ## 19 Chad                  2.62        190     7257
    ## 20 Honduras              2.61      10784   413555

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7047.     210744   29.9 
    ##  2 Bulgaria               4993.      35696    7.15
    ##  3 Hungary                4429.      44211    9.98
    ##  4 Czech Republic         3702.      38787   10.5 
    ##  5 Slovakia               3412.      18611    5.46
    ##  6 Brazil                 3230.     649630  201.  
    ##  7 Argentina              3057.     126390   41.3 
    ##  8 United States          3048.     945523  310.  
    ##  9 Poland                 2912.     112130   38.5 
    ## 10 Colombia               2906.     138854   47.8 
    ## 11 Belgium                2905.      30217   10.4 
    ## 12 Romania                2899.      63668   22.0 
    ## 13 Paraguay               2885.      18392    6.38
    ## 14 Mexico                 2832.     318531  112.  
    ## 15 Tunisia                2631.      27857   10.6 
    ## 16 United Kingdom         2594.     161704   62.3 
    ## 17 Italy                  2572.     155214   60.3 
    ## 18 Chile                  2533.      42411   16.7 
    ## 19 Russia                 2516.     354011  141.  
    ## 20 Ecuador                2383.      35249   14.8

EOL
