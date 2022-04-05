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

Updated: 2022-04-06

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
    ##  1 United States          104098. 79426860            763
    ##  2 India                   57220. 43029839            752
    ##  3 Brazil                  39840. 29999437            753
    ##  4 France                  33019. 25259737            765
    ##  5 Germany                 28523. 21849074            766
    ##  6 United Kingdom          27994. 21359685            763
    ##  7 Russia                  23965. 17926104            748
    ##  8 Turkey                  19929. 14907378            748
    ##  9 Italy                   19271. 14877144            772
    ## 10 South Korea             18409. 14267401            775
    ## 11 Spain                   15120. 11551574            764
    ## 12 Vietnam                 13262.  9867045            744
    ## 13 Argentina               12007.  9041124            753
    ## 14 Netherlands             10436.  7921088            759
    ## 15 Iran                     9313.  7171165            770
    ## 16 Japan                    8703.  6735920            774
    ## 17 Colombia                 8136.  6085926            748
    ## 18 Indonesia                8010.  6023924            752
    ## 19 Poland                   7941.  5971998            752
    ## 20 Mexico                   7515.  5666215            754

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       739.             559623.            757
    ##  2 Israel                        713.             538410.            755
    ##  3 Austria                       635.             481056.            757
    ##  4 Netherlands                   627.             475884.            759
    ##  5 Switzerland                   603.             460479.            763
    ##  6 France                        510.             390001.            765
    ##  7 Belgium                       490.             373116.            762
    ##  8 Czech Republic                486.             366444.            754
    ##  9 Portugal                      451.             339898.            753
    ## 10 United Kingdom                449.             342586.            763
    ## 11 Slovakia                      424.             317524.            748
    ## 12 South Korea                   380.             294643.            775
    ## 13 Greece                        373.             281467.            754
    ## 14 Norway                        369.             281494.            762
    ## 15 Serbia                        361.             269875.            747
    ## 16 Jordan                        355.             264429.            744
    ## 17 Germany                       349.             267096.            766
    ## 18 Sweden                        343.             260347.            759
    ## 19 United States                 336.             256023.            763
    ## 20 Spain                         325.             248389.            764

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2144    11808
    ##  2 Sudan                 7.92       4907    61987
    ##  3 Peru                  5.98     212328  3548559
    ##  4 Mexico                5.70     323223  5666215
    ##  5 Syria                 5.64       3145    55718
    ##  6 Somalia               5.14       1361    26471
    ##  7 Egypt                 4.81      24473   509177
    ##  8 Afghanistan           4.31       7671   177897
    ##  9 Ecuador               4.11      35449   862321
    ## 10 Niger                 3.49        308     8816
    ## 11 Bulgaria              3.21      36608  1141859
    ## 12 Myanmar               3.18      19433   611926
    ## 13 Malawi                3.07       2626    85664
    ## 14 Paraguay              2.89      18731   648353
    ## 15 Tunisia               2.73      28323  1035884
    ## 16 Haiti                 2.73        833    30567
    ## 17 South Africa          2.69     100052  3723639
    ## 18 Chad                  2.61        191     7310
    ## 19 Algeria               2.59       6874   265694
    ## 20 Honduras              2.58      10882   421121

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7100.     212328   29.9 
    ##  2 Bulgaria               5121.      36608    7.15
    ##  3 Hungary                4569.      45611    9.98
    ##  4 Czech Republic         3795.      39755   10.5 
    ##  5 Slovakia               3568.      19462    5.46
    ##  6 Chile                  3392.      56798   16.7 
    ##  7 Brazil                 3283.     660147  201.  
    ##  8 United States          3141.     974431  310.  
    ##  9 Argentina              3098.     128065   41.3 
    ## 10 Poland                 2997.     115395   38.5 
    ## 11 Belgium                2971.      30908   10.4 
    ## 12 Romania                2965.      65102   22.0 
    ## 13 Paraguay               2938.      18731    6.38
    ## 14 Colombia               2922.     139660   47.8 
    ## 15 Mexico                 2874.     323223  112.  
    ## 16 Tunisia                2675.      28323   10.6 
    ## 17 United Kingdom         2659.     165780   62.3 
    ## 18 Italy                  2650.     159909   60.3 
    ## 19 Russia                 2632.     370311  141.  
    ## 20 Greece                 2522.      27746   11

EOL
