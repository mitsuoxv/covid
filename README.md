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

Updated: 2022-04-02

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
    ##  1 United States          104536. 79342899            759
    ##  2 India                   57521. 43025775            748
    ##  3 Brazil                  39942. 29916334            749
    ##  4 France                  32674. 24864733            761
    ##  5 Germany                 28027. 21357039            762
    ##  6 United Kingdom          27862. 21147429            759
    ##  7 Russia                  24008. 17862089            744
    ##  8 Turkey                  19974. 14860560            744
    ##  9 Italy                   19065. 14642354            768
    ## 10 South Korea             17348. 13375818            771
    ## 11 Spain                   15174. 11532099            760
    ## 12 Vietnam                 12925.  9564609            740
    ## 13 Argentina               12063.  9035127            749
    ## 14 Netherlands             10409.  7859274            755
    ## 15 Iran                     9350.  7162220            766
    ## 16 Japan                    8510.  6552920            770
    ## 17 Colombia                 8178.  6084551            744
    ## 18 Indonesia                8042.  6015748            748
    ## 19 Poland                   7977.  5966970            748
    ## 20 Mexico                   7543.  5657077            750

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       741.             557763.            753
    ##  2 Israel                        710.             533021.            751
    ##  3 Austria                       628.             472915.            753
    ##  4 Netherlands                   625.             472170.            755
    ##  5 Switzerland                   605.             459191.            759
    ##  6 France                        504.             383902.            761
    ##  7 Belgium                       488.             370186.            758
    ##  8 Czech Republic                486.             364837.            750
    ##  9 Portugal                      450.             337163.            749
    ## 10 United Kingdom                447.             339181.            759
    ## 11 Slovakia                      423.             314691.            744
    ## 12 Norway                        370.             280328.            757
    ## 13 Greece                        367.             275494.            750
    ## 14 Serbia                        362.             269109.            743
    ## 15 South Korea                   358.             276231.            771
    ## 16 Jordan                        357.             264158.            740
    ## 17 Sweden                        345.             260347.            755
    ## 18 Germany                       343.             261081.            762
    ## 19 United States                 337.             255753.            759
    ## 20 Spain                         326.             247970.            760

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2143    11805
    ##  2 Sudan                 7.92       4907    61955
    ##  3 Peru                  5.98     212207  3546696
    ##  4 Mexico                5.71     322948  5657077
    ##  5 Syria                 5.64       3140    55688
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.83      24417   505264
    ##  8 Afghanistan           4.32       7670   177747
    ##  9 Ecuador               4.12      35421   859890
    ## 10 Niger                 3.50        308     8801
    ## 11 Bulgaria              3.21      36529  1138923
    ## 12 Myanmar               3.18      19430   611587
    ## 13 Malawi                3.07       2626    85640
    ## 14 Paraguay              2.88      18664   647905
    ## 15 Tunisia               2.73      28323  1035884
    ## 16 Haiti                 2.73        833    30545
    ## 17 South Africa          2.69     100032  3718953
    ## 18 Chad                  2.61        191     7310
    ## 19 Algeria               2.59       6874   265671
    ## 20 Honduras              2.58      10880   421062

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7096.     212207   29.9 
    ##  2 Bulgaria               5110.      36529    7.15
    ##  3 Hungary                4559.      45510    9.98
    ##  4 Czech Republic         3789.      39692   10.5 
    ##  5 Slovakia               3551.      19368    5.46
    ##  6 Chile                  3379.      56580   16.7 
    ##  7 Brazil                 3279.     659504  201.  
    ##  8 United States          3136.     972830  310.  
    ##  9 Argentina              3096.     127997   41.3 
    ## 10 Poland                 2993.     115247   38.5 
    ## 11 Belgium                2963.      30826   10.4 
    ## 12 Romania                2961.      65015   22.0 
    ## 13 Paraguay               2927.      18664    6.38
    ## 14 Colombia               2921.     139607   47.8 
    ## 15 Mexico                 2871.     322948  112.  
    ## 16 Tunisia                2675.      28323   10.6 
    ## 17 United Kingdom         2652.     165379   62.3 
    ## 18 Italy                  2641.     159383   60.3 
    ## 19 Russia                 2623.     369064  141.  
    ## 20 Greece                 2501.      27510   11

EOL
