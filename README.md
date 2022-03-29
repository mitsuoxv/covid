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

Updated: 2022-03-30

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
    ##  1 United States          104798. 79227083            756
    ##  2 India                   57747. 43021982            745
    ##  3 Brazil                  40003. 29842418            746
    ##  4 France                  32073. 24311608            758
    ##  5 United Kingdom          27653. 20905519            756
    ##  6 Germany                 27090. 20561131            759
    ##  7 Russia                  24026. 17803503            741
    ##  8 Turkey                  19993. 14815041            741
    ##  9 Italy                   18818. 14396283            765
    ## 10 South Korea             16081. 12350428            768
    ## 11 Spain                   15128. 11451676            757
    ## 12 Vietnam                 12584.  9274849            737
    ## 13 Argentina               12099.  9026075            746
    ## 14 Netherlands             10339.  7775389            752
    ## 15 Iran                     9376.  7154003            763
    ## 16 Japan                    8358.  6410635            767
    ## 17 Colombia                 8210.  6083643            741
    ## 18 Indonesia                8061.  6005646            745
    ## 19 Poland                   7989.  5952200            745
    ## 20 Mexico                   7565.  5650896            747

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       740.             555422.            750
    ##  2 Israel                        706.             527936.            748
    ##  3 Netherlands                   621.             467131.            752
    ##  4 Austria                       616.             462192.            750
    ##  5 Switzerland                   600.             453469.            756
    ##  6 France                        495.             375362.            758
    ##  7 Czech Republic                485.             362653.            747
    ##  8 Belgium                       485.             365995.            755
    ##  9 United Kingdom                444.             335301.            756
    ## 10 Portugal                      429.             319690.            746
    ## 11 Slovakia                      420.             311047.            741
    ## 12 Norway                        370.             279431.            755
    ## 13 Serbia                        363.             268328.            740
    ## 14 Greece                        360.             268892.            747
    ## 15 Jordan                        358.             264158.            737
    ## 16 Sweden                        345.             259707.            752
    ## 17 United States                 338.             255379.            756
    ## 18 South Korea                   332.             255055.            768
    ## 19 Germany                       331.             251352.            759
    ## 20 Spain                         325.             246241.            757

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2142    11803
    ##  2 Sudan                 7.92       4905    61929
    ##  3 Peru                  5.98     212128  3545403
    ##  4 Mexico                5.71     322750  5650896
    ##  5 Syria                 5.63       3137    55672
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.83      24417   505264
    ##  8 Afghanistan           4.31       7663   177602
    ##  9 Ecuador               4.13      35418   857299
    ## 10 Niger                 3.50        308     8801
    ## 11 Bulgaria              3.21      36480  1134906
    ## 12 Myanmar               3.18      19430   611021
    ## 13 Malawi                3.07       2626    85620
    ## 14 Paraguay              2.88      18664   647905
    ## 15 Haiti                 2.73        833    30528
    ## 16 Tunisia               2.72      28165  1033731
    ## 17 South Africa          2.69      99970  3713833
    ## 18 Chad                  2.61        191     7310
    ## 19 Algeria               2.59       6873   265641
    ## 20 Honduras              2.58      10871   420621

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7093.     212128   29.9 
    ##  2 Bulgaria               5103.      36480    7.15
    ##  3 Hungary                4547.      45390    9.98
    ##  4 Czech Republic         3781.      39610   10.5 
    ##  5 Slovakia               3540.      19311    5.46
    ##  6 Chile                  3371.      56446   16.7 
    ##  7 Brazil                 3276.     658879  201.  
    ##  8 United States          3126.     969917  310.  
    ##  9 Argentina              3094.     127909   41.3 
    ## 10 Poland                 2985.     114939   38.5 
    ## 11 Romania                2956.      64913   22.0 
    ## 12 Belgium                2956.      30747   10.4 
    ## 13 Paraguay               2927.      18664    6.38
    ## 14 Colombia               2921.     139573   47.8 
    ## 15 Mexico                 2870.     322750  112.  
    ## 16 Tunisia                2660.      28165   10.6 
    ## 17 United Kingdom         2641.     164671   62.3 
    ## 18 Italy                  2633.     158877   60.3 
    ## 19 Russia                 2616.     368025  141.  
    ## 20 Greece                 2486.      27341   11

EOL
