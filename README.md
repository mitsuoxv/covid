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

Updated: 2022-03-02

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
    ##  1 United States          107435. 78212580            728
    ##  2 India                   59876. 42931045            717
    ##  3 Brazil                  40067. 28768104            718
    ##  4 France                  30182. 22032795            730
    ##  5 United Kingdom          25943. 18886705            728
    ##  6 Russia                  23135. 16495369            713
    ##  7 Germany                 20338. 14867218            731
    ##  8 Turkey                  19759. 14088565            713
    ##  9 Italy                   17344. 12782836            737
    ## 10 Spain                   15058. 10977527            729
    ## 11 Argentina               12501.  8900656            712
    ## 12 Iran                     9594.  7051429            735
    ## 13 Netherlands              8787.  6361626            724
    ## 14 Colombia                 8503.  6062701            713
    ## 15 Poland                   7922.  5680034            717
    ## 16 Indonesia                7795.  5589176            717
    ## 17 Mexico                   7658.  5506105            719
    ## 18 Ukraine                  6849.  4842143            707
    ## 19 Japan                    6774.  5005892            739
    ## 20 South Africa             5153.  3674042            713

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       698.             504164.            722
    ##  2 Israel                        687.             494495.            720
    ##  3 Netherlands                   528.             382194.            724
    ##  4 Switzerland                   505.             368012.            728
    ##  5 Czech Republic                476.             342485.            719
    ##  6 Belgium                       470.             341951.            727
    ##  7 France                        466.             340178.            730
    ##  8 Austria                       455.             328885.            722
    ##  9 Portugal                      426.             305603.            718
    ## 10 United Kingdom                416.             302922.            728
    ## 11 Slovakia                      375.             267301.            713
    ## 12 Serbia                        365.             260179.            712
    ## 13 Jordan                        359.             254672.            709
    ## 14 Sweden                        353.             255459.            724
    ## 15 United States                 346.             252109.            728
    ## 16 Norway                        339.             245903.            726
    ## 17 Spain                         324.             236046.            729
    ## 18 Greece                        306.             220151.            719
    ## 19 Argentina                     302.             215287.            712
    ## 20 Italy                         287.             211846.            737

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2135    11771
    ##  2 Sudan                 6.36       3909    61488
    ##  3 Peru                  5.99     210538  3516264
    ##  4 Mexico                5.78     318086  5506105
    ##  5 Syria                 5.63       3075    54575
    ##  6 Somalia               5.12       1348    26313
    ##  7 Egypt                 4.98      24074   483771
    ##  8 Afghanistan           4.38       7598   173659
    ##  9 Ecuador               4.26      35223   827760
    ## 10 Niger                 3.51        307     8754
    ## 11 Myanmar               3.29      19368   587891
    ## 12 Bulgaria              3.26      35581  1091279
    ## 13 Malawi                3.06       2615    85339
    ## 14 Paraguay              2.86      18359   641321
    ## 15 Tunisia               2.78      27784   998230
    ## 16 El Salvador           2.75       4071   147786
    ## 17 South Africa          2.71      99412  3674042
    ## 18 Haiti                 2.70        820    30340
    ## 19 Indonesia             2.66     148660  5589176
    ## 20 Chad                  2.62        190     7257

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7040.     210538   29.9 
    ##  2 Bulgaria               4977.      35581    7.15
    ##  3 Hungary                4413.      44051    9.98
    ##  4 Czech Republic         3693.      38685   10.5 
    ##  5 Slovakia               3397.      18530    5.46
    ##  6 Brazil                 3228.     649134  201.  
    ##  7 Argentina              3051.     126152   41.3 
    ##  8 United States          3034.     941112  310.  
    ##  9 Colombia               2902.     138693   47.8 
    ## 10 Belgium                2901.      30179   10.4 
    ## 11 Poland                 2898.     111586   38.5 
    ## 12 Romania                2888.      63414   22.0 
    ## 13 Paraguay               2879.      18359    6.38
    ## 14 Mexico                 2828.     318086  112.  
    ## 15 Tunisia                2624.      27784   10.6 
    ## 16 United Kingdom         2588.     161361   62.3 
    ## 17 Italy                  2565.     154767   60.3 
    ## 18 Chile                  2529.      42353   16.7 
    ## 19 Russia                 2505.     352446  141.  
    ## 20 Ecuador                2381.      35223   14.8

EOL
