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

Updated: 2022-05-11

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
    ##  1 United States          101531. 81021753            798
    ##  2 India                   54775. 43107689            787
    ##  3 Brazil                  38886. 30564536            786
    ##  4 France                  35145. 28116331            800
    ##  5 Germany                 31679. 25406868            802
    ##  6 United Kingdom          27745. 22140291            798
    ##  7 Russia                  23291. 18237227            783
    ##  8 South Korea             21747. 17614895            810
    ##  9 Italy                   20838. 16816419            807
    ## 10 Turkey                  19214. 15044921            783
    ## 11 Spain                   15030. 12009059            799
    ## 12 Vietnam                 13708. 10678359            779
    ## 13 Argentina               11535.  9101319            789
    ## 14 Netherlands             10153.  8061446            794
    ## 15 Japan                   10053.  8133197            809
    ## 16 Iran                     8976.  7225759            805
    ## 17 Australia                7952.  6282370            790
    ## 18 Colombia                 7792.  6093645            782
    ## 19 Indonesia                7686.  6049141            787
    ## 20 Poland                   7625.  6001327            787

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       719.             569638.            792
    ##  2 Israel                        705.             557081.            790
    ##  3 Austria                       650.             515113.            792
    ##  4 Netherlands                   610.             484316.            794
    ##  5 Switzerland                   598.             477383.            798
    ##  6 France                        543.             434106.            800
    ##  7 Belgium                       495.             394317.            797
    ##  8 Czech Republic                473.             373554.            789
    ##  9 Portugal                      472.             371914.            788
    ## 10 South Korea                   449.             363774.            810
    ## 11 United Kingdom                445.             355106.            798
    ## 12 Slovakia                      418.             327321.            783
    ## 13 Greece                        388.             305873.            789
    ## 14 Germany                       387.             310589.            802
    ## 15 Australia                     370.             291989.            790
    ## 16 Norway                        358.             285080.            796
    ## 17 Serbia                        350.             273729.            782
    ## 18 Italy                         345.             278693.            807
    ## 19 Jordan                        340.             264715.            779
    ## 20 Sweden                        330.             261942.            794

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4936    62161
    ##  3 Peru                  5.97     212946  3569782
    ##  4 Mexico                5.65     324465  5745652
    ##  5 Syria                 5.64       3150    55858
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.80      24669   513846
    ##  8 Afghanistan           4.29       7685   179010
    ##  9 Ecuador               4.09      35602   871029
    ## 10 Niger                 3.44        309     8986
    ## 11 Bulgaria              3.19      36994  1159925
    ## 12 Myanmar               3.17      19434   613056
    ## 13 Malawi                3.07       2634    85816
    ## 14 Paraguay              2.90      18872   649718
    ## 15 Tunisia               2.74      28575  1041197
    ## 16 Haiti                 2.72        835    30707
    ## 17 South Africa          2.61     100533  3844625
    ## 18 Chad                  2.60        193     7412
    ## 19 Algeria               2.59       6875   265800
    ## 20 Indonesia             2.59     156416  6049141

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7120.     212946   29.9 
    ##  2 Bulgaria               5175.      36994    7.15
    ##  3 Hungary                4635.      46266    9.98
    ##  4 Czech Republic         3840.      40229   10.5 
    ##  5 Slovakia               3665.      19994    5.46
    ##  6 Chile                  3442.      57639   16.7 
    ##  7 Brazil                 3302.     664139  201.  
    ##  8 United States          3192.     990260  310.  
    ##  9 Argentina              3114.     128729   41.3 
    ## 10 Belgium                3036.      31580   10.4 
    ## 11 Poland                 3017.     116150   38.5 
    ## 12 Romania                2986.      65566   22.0 
    ## 13 Paraguay               2960.      18872    6.38
    ## 14 Colombia               2925.     139809   47.8 
    ## 15 Mexico                 2885.     324465  112.  
    ## 16 United Kingdom         2830.     176424   62.3 
    ## 17 Italy                  2727.     164573   60.3 
    ## 18 Tunisia                2699.      28575   10.6 
    ## 19 Russia                 2680.     377150  141.  
    ## 20 Greece                 2674.      29417   11

EOL
