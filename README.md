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

Updated: 2022-03-15

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
    ##  1 United States          106312. 78777620            741
    ##  2 India                   58895. 42993494            730
    ##  3 Brazil                  40150. 29350134            731
    ##  4 France                  30709. 22816866            743
    ##  5 United Kingdom          26357. 19530489            741
    ##  6 Russia                  23934. 17376241            726
    ##  7 Germany                 23163. 17233729            744
    ##  8 Turkey                  20042. 14550774            726
    ##  9 Italy                   17831. 13373207            750
    ## 10 Spain                   15126. 11223977            742
    ## 11 Argentina               12374.  8971432            725
    ## 12 Netherlands              9726.  7168183            737
    ## 13 Iran                     9523.  7123093            748
    ## 14 South Korea              9118.  6866222            753
    ## 15 Vietnam                  8466.  6112648            722
    ## 16 Colombia                 8369.  6076333            726
    ## 17 Indonesia                8082.  5900124            730
    ## 18 Poland                   7978.  5823982            730
    ## 19 Japan                    7676.  5772396            752
    ## 20 Mexico                   7658.  5605636            732

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       732.             538039.            735
    ##  2 Israel                        690.             505876.            733
    ##  3 Netherlands                   584.             430651.            737
    ##  4 Switzerland                   544.             403486.            741
    ##  5 Austria                       528.             388056.            735
    ##  6 Czech Republic                481.             351849.            732
    ##  7 France                        474.             352284.            743
    ##  8 Belgium                       473.             349904.            740
    ##  9 Portugal                      437.             319690.            731
    ## 10 United Kingdom                423.             313247.            741
    ## 11 Slovakia                      398.             288998.            726
    ## 12 Norway                        365.             269882.            740
    ## 13 Serbia                        364.             264201.            725
    ## 14 Jordan                        363.             262238.            722
    ## 15 Sweden                        350.             258121.            737
    ## 16 United States                 343.             253931.            741
    ## 17 Greece                        327.             239601.            732
    ## 18 Spain                         325.             241345.            742
    ## 19 Argentina                     299.             216999.            725
    ## 20 Italy                         296.             221630.            750

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2139    11784
    ##  2 Sudan                 7.89       4872    61713
    ##  3 Peru                  5.98     211482  3535726
    ##  4 Mexico                5.73     321054  5605636
    ##  5 Syria                 5.63       3117    55366
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.90      24277   495373
    ##  8 Afghanistan           4.34       7643   176201
    ##  9 Ecuador               4.19      35316   843760
    ## 10 Niger                 3.51        308     8781
    ## 11 Bulgaria              3.24      36098  1112699
    ## 12 Myanmar               3.21      19409   605347
    ## 13 Malawi                3.07       2623    85499
    ## 14 Paraguay              2.87      18529   645768
    ## 15 Tunisia               2.73      28062  1029596
    ## 16 Haiti                 2.72        827    30433
    ## 17 South Africa          2.70      99725  3694504
    ## 18 El Salvador           2.62       4095   156364
    ## 19 Chad                  2.62        190     7260
    ## 20 Honduras              2.61      10812   414714

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7071.     211482   29.9 
    ##  2 Bulgaria               5050.      36098    7.15
    ##  3 Hungary                4473.      44653    9.98
    ##  4 Czech Republic         3738.      39155   10.5 
    ##  5 Slovakia               3474.      18950    5.46
    ##  6 Brazil                 3257.     654945  201.  
    ##  7 United States          3095.     960144  310.  
    ##  8 Argentina              3076.     127187   41.3 
    ##  9 Poland                 2947.     113444   38.5 
    ## 10 Romania                2931.      64361   22.0 
    ## 11 Belgium                2923.      30408   10.4 
    ## 12 Colombia               2914.     139283   47.8 
    ## 13 Paraguay               2906.      18529    6.38
    ## 14 Mexico                 2855.     321054  112.  
    ## 15 Tunisia                2650.      28062   10.6 
    ## 16 Chile                  2620.      43879   16.7 
    ## 17 United Kingdom         2610.     162738   62.3 
    ## 18 Italy                  2600.     156868   60.3 
    ## 19 Russia                 2568.     361344  141.  
    ## 20 Greece                 2415.      26562   11

EOL
