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

Updated: 2022-03-10

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
    ##  1 United States          106813. 78614707            736
    ##  2 India                   59277. 42975883            725
    ##  3 Brazil                  40040. 29069469            726
    ##  4 France                  30456. 22476428            738
    ##  5 United Kingdom          26232. 19307018            736
    ##  6 Russia                  23772. 17140069            721
    ##  7 Germany                 21978. 16242070            739
    ##  8 Turkey                  20006. 14424747            721
    ##  9 Italy                   17597. 13109527            745
    ## 10 Spain                   15142. 11159574            737
    ## 11 Argentina               12429.  8949362            720
    ## 12 Iran                     9559.  7102159            743
    ## 13 Netherlands              9341.  6837874            732
    ## 14 Colombia                 8422.  6072656            721
    ## 15 Indonesia                8037.  5826589            725
    ## 16 Poland                   7965.  5774938            725
    ## 17 Mexico                   7657.  5566669            727
    ## 18 Japan                    7341.  5483524            747
    ## 19 South Korea              6968.  5212118            748
    ## 20 Ukraine                  6828.  4882361            715

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       722.             527309.            730
    ##  2 Israel                        689.             501511.            728
    ##  3 Netherlands                   561.             410806.            732
    ##  4 Switzerland                   531.             390644.            736
    ##  5 Austria                       493.             359584.            730
    ##  6 Czech Republic                480.             348706.            727
    ##  7 Belgium                       472.             346931.            735
    ##  8 France                        470.             347028.            738
    ##  9 Portugal                      433.             314057.            726
    ## 10 United Kingdom                421.             309663.            736
    ## 11 Slovakia                      390.             281291.            721
    ## 12 Serbia                        365.             262829.            720
    ## 13 Jordan                        360.             258257.            717
    ## 14 Norway                        358.             262658.            734
    ## 15 Sweden                        352.             257515.            732
    ## 16 United States                 344.             253405.            736
    ## 17 Spain                         326.             239960.            737
    ## 18 Greece                        317.             230743.            727
    ## 19 Argentina                     301.             216465.            720
    ## 20 Italy                         292.             217260.            745

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2138    11781
    ##  2 Sudan                 7.89       4865    61643
    ##  3 Peru                  5.99     211155  3528038
    ##  4 Mexico                5.75     319901  5566669
    ##  5 Syria                 5.63       3102    55140
    ##  6 Somalia               5.15       1359    26400
    ##  7 Egypt                 4.92      24244   492774
    ##  8 Afghanistan           4.35       7630   175353
    ##  9 Ecuador               4.20      35309   841575
    ## 10 Niger                 3.50        307     8767
    ## 11 Bulgaria              3.25      35964  1105968
    ## 12 Myanmar               3.22      19398   602321
    ## 13 Malawi                3.07       2619    85440
    ## 14 Paraguay              2.87      18482   644199
    ## 15 Tunisia               2.75      27989  1017907
    ## 16 Haiti                 2.72        827    30430
    ## 17 South Africa          2.70      99609  3685120
    ## 18 Chad                  2.62        190     7260
    ## 19 El Salvador           2.62       4092   156364
    ## 20 Honduras              2.61      10812   414714

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7060.     211155   29.9 
    ##  2 Bulgaria               5031.      35964    7.15
    ##  3 Hungary                4463.      44549    9.98
    ##  4 Czech Republic         3726.      39032   10.5 
    ##  5 Slovakia               3444.      18786    5.46
    ##  6 Brazil                 3244.     652341  201.  
    ##  7 United States          3072.     953133  310.  
    ##  8 Argentina              3069.     126901   41.3 
    ##  9 Poland                 2935.     113002   38.5 
    ## 10 Romania                2919.      64094   22.0 
    ## 11 Belgium                2914.      30313   10.4 
    ## 12 Colombia               2911.     139120   47.8 
    ## 13 Paraguay               2899.      18482    6.38
    ## 14 Mexico                 2844.     319901  112.  
    ## 15 Tunisia                2643.      27989   10.6 
    ## 16 United Kingdom         2604.     162359   62.3 
    ## 17 Italy                  2589.     156201   60.3 
    ## 18 Chile                  2583.      43260   16.7 
    ## 19 Russia                 2546.     358246  141.  
    ## 20 Greece                 2391.      26303   11

EOL
