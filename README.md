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

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-07-19

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
    ##  1 United States          101531. 88027926            867
    ##  2 India                   51130. 43767534            856
    ##  3 Brazil                  38686. 33076779            855
    ##  4 France                  36873. 32042643            869
    ##  5 Germany                 34091. 29692989            871
    ##  6 United Kingdom          26615. 23075360            867
    ##  7 Italy                   22997. 20145859            876
    ##  8 Russia                  21707. 18494844            852
    ##  9 South Korea             21374. 18788056            879
    ## 10 Turkey                  17955. 15297539            852
    ## 11 Spain                   15081. 13090476            868
    ## 12 Vietnam                 12686. 10758189            848
    ## 13 Japan                   11741. 10308445            878
    ## 14 Argentina               10986.  9426171            858
    ## 15 Australia               10113.  8687125            859
    ## 16 Netherlands              9588.  8274234            863
    ## 17 Iran                     8328.  7278478            874
    ## 18 Mexico                   7388.  6338991            858
    ## 19 Colombia                 7284.  6198848            851
    ## 20 Indonesia                7171.  6138346            856

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        714.             613686.            859
    ##  2 Denmark                       678.             584197.            861
    ##  3 Austria                       659.             567420.            861
    ##  4 Switzerland                   585.             506997.            867
    ##  5 Portugal                      578.             494969.            856
    ##  6 Netherlands                   576.             497100.            863
    ##  7 France                        569.             494727.            869
    ##  8 Belgium                       483.             418057.            866
    ##  9 Australia                     470.             403756.            859
    ## 10 South Korea                   441.             388001.            879
    ## 11 Czech Republic                440.             377305.            858
    ## 12 United Kingdom                427.             370103.            867
    ## 13 Germany                       417.             362985.            871
    ## 14 Greece                        407.             349377.            858
    ## 15 Slovakia                      389.             331118.            852
    ## 16 Italy                         381.             333871.            876
    ## 17 Norway                        335.             289904.            865
    ## 18 Serbia                        329.             280018.            851
    ## 19 United States                 327.             283748.            867
    ## 20 Spain                         324.             281480.            868

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2149    11848
    ##  2 Sudan                 7.88       4955    62872
    ##  3 Peru                  5.77     213731  3703751
    ##  4 Syria                 5.63       3150    55985
    ##  5 Mexico                5.15     326261  6338991
    ##  6 Somalia               5.06       1361    26912
    ##  7 Egypt                 4.81      24750   514413
    ##  8 Afghanistan           4.21       7732   183617
    ##  9 Ecuador               3.87      35763   924884
    ## 10 Niger                 3.42        311     9096
    ## 11 Myanmar               3.17      19434   613838
    ## 12 Bulgaria              3.15      37294  1184846
    ## 13 Malawi                3.05       2649    86750
    ## 14 Paraguay              2.83      19036   673829
    ## 15 Tunisia               2.65      28823  1087030
    ## 16 Haiti                 2.62        837    31980
    ## 17 Chad                  2.60        193     7427
    ## 18 Algeria               2.58       6875   266424
    ## 19 Indonesia             2.56     156859  6138346
    ## 20 South Africa          2.55     101918  3999751

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7147.     213731   29.9 
    ##  2 Bulgaria               5217.      37294    7.15
    ##  3 Hungary                4678.      46696    9.98
    ##  4 Czech Republic         3852.      40355   10.5 
    ##  5 Slovakia               3698.      20172    5.46
    ##  6 Chile                  3520.      58955   16.7 
    ##  7 Brazil                 3354.     674482  201.  
    ##  8 United States          3265.    1012816  310.  
    ##  9 Argentina              3124.     129145   41.3 
    ## 10 Belgium                3081.      32051   10.4 
    ## 11 Poland                 3025.     116470   38.5 
    ## 12 Romania                2997.      65813   22.0 
    ## 13 Paraguay               2986.      19036    6.38
    ## 14 Colombia               2934.     140202   47.8 
    ## 15 United Kingdom         2912.     181580   62.3 
    ## 16 Mexico                 2901.     326261  112.  
    ## 17 Italy                  2816.     169925   60.3 
    ## 18 Greece                 2771.      30476   11   
    ## 19 Tunisia                2722.      28823   10.6 
    ## 20 Russia                 2714.     381916  141.

EOL
