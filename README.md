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

Updated: 2022-05-12

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
    ##  1 United States          101599. 81178013            799
    ##  2 India                   54709. 43110586            788
    ##  3 Brazil                  38849. 30574245            787
    ##  4 France                  35172. 28172780            801
    ##  5 Germany                 31761. 25503878            803
    ##  6 United Kingdom          27715. 22144632            799
    ##  7 Russia                  23267. 18241329            784
    ##  8 South Korea             21774. 17658794            811
    ##  9 Italy                   20882. 16872618            808
    ## 10 Turkey                  19192. 15046779            784
    ## 11 Spain                   15073. 12058888            800
    ## 12 Vietnam                 13694. 10681214            780
    ## 13 Argentina               11521.  9101319            790
    ## 14 Netherlands             10142.  8063029            795
    ## 15 Japan                   10089.  8172238            810
    ## 16 Iran                     8965.  7226219            806
    ## 17 Australia                8000.  6328508            791
    ## 18 Colombia                 7782.  6093645            783
    ## 19 Indonesia                7677.  6049541            788
    ## 20 Poland                   7616.  6001893            788

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       718.             569821.            793
    ##  2 Israel                        705.             557359.            790
    ##  3 Austria                       650.             515667.            793
    ##  4 Netherlands                   609.             484411.            795
    ##  5 Switzerland                   600.             479077.            799
    ##  6 France                        543.             434977.            801
    ##  7 Belgium                       494.             394317.            798
    ##  8 Portugal                      474.             373833.            789
    ##  9 Czech Republic                473.             373627.            790
    ## 10 South Korea                   450.             364680.            811
    ## 11 United Kingdom                445.             355175.            799
    ## 12 Slovakia                      418.             327402.            784
    ## 13 Germany                       388.             311775.            803
    ## 14 Greece                        388.             306459.            790
    ## 15 Australia                     372.             294134.            791
    ## 16 Norway                        358.             285145.            797
    ## 17 Serbia                        350.             273792.            783
    ## 18 Italy                         346.             279624.            808
    ## 19 Jordan                        339.             264715.            780
    ## 20 Sweden                        329.             261942.            795

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4936    62161
    ##  3 Peru                  5.97     212957  3570075
    ##  4 Mexico                5.65     324465  5745652
    ##  5 Syria                 5.64       3150    55863
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.80      24669   513846
    ##  8 Afghanistan           4.29       7686   179066
    ##  9 Ecuador               4.09      35602   871029
    ## 10 Niger                 3.44        309     8986
    ## 11 Bulgaria              3.19      37007  1160347
    ## 12 Myanmar               3.17      19434   613066
    ## 13 Malawi                3.07       2634    85816
    ## 14 Paraguay              2.90      18872   649718
    ## 15 Tunisia               2.74      28575  1041197
    ## 16 Haiti                 2.72        835    30707
    ## 17 South Africa          2.61     100533  3844625
    ## 18 Chad                  2.60        193     7412
    ## 19 Algeria               2.59       6875   265800
    ## 20 Indonesia             2.59     156424  6049541

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7121.     212957   29.9 
    ##  2 Bulgaria               5177.      37007    7.15
    ##  3 Hungary                4643.      46343    9.98
    ##  4 Czech Republic         3840.      40233   10.5 
    ##  5 Slovakia               3667.      20002    5.46
    ##  6 Chile                  3442.      57642   16.7 
    ##  7 Brazil                 3303.     664192  201.  
    ##  8 United States          3193.     990599  310.  
    ##  9 Argentina              3114.     128729   41.3 
    ## 10 Belgium                3036.      31580   10.4 
    ## 11 Poland                 3017.     116164   38.5 
    ## 12 Romania                2986.      65581   22.0 
    ## 13 Paraguay               2960.      18872    6.38
    ## 14 Colombia               2925.     139809   47.8 
    ## 15 Mexico                 2885.     324465  112.  
    ## 16 United Kingdom         2834.     176687   62.3 
    ## 17 Italy                  2730.     164731   60.3 
    ## 18 Tunisia                2699.      28575   10.6 
    ## 19 Russia                 2681.     377248  141.  
    ## 20 Greece                 2677.      29444   11

EOL
