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

Updated: 2022-07-21

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
    ##  1 United States          101893. 88544725            869
    ##  2 India                   51053. 43803619            858
    ##  3 Brazil                  38903. 33339815            857
    ##  4 France                  36981. 32210617            871
    ##  5 Germany                 34358. 29994679            873
    ##  6 United Kingdom          26554. 23075360            869
    ##  7 Italy                   23119. 20299013            878
    ##  8 Russia                  21668. 18504729            854
    ##  9 South Korea             21496. 18937971            881
    ## 10 Turkey                  17913. 15297539            854
    ## 11 Spain                   15094. 13132159            870
    ## 12 Vietnam                 12662. 10762532            850
    ## 13 Japan                   11897. 10469440            880
    ## 14 Argentina               11007.  9465827            860
    ## 15 Australia               10279.  8850343            861
    ## 16 Netherlands              9586.  8292279            865
    ## 17 Iran                     8321.  7289542            876
    ## 18 Mexico                   7505.  6454263            860
    ## 19 Colombia                 7296.  6223497            853
    ## 20 Indonesia                7167.  6149084            858

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        715.             615803.            861
    ##  2 Denmark                       679.             585739.            863
    ##  3 Austria                       660.             569839.            863
    ##  4 Switzerland                   591.             513534.            869
    ##  5 Portugal                      578.             495908.            858
    ##  6 Netherlands                   576.             498184.            865
    ##  7 France                        571.             497320.            871
    ##  8 Belgium                       484.             419938.            868
    ##  9 Australia                     478.             411342.            861
    ## 10 Greece                        445.             382797.            860
    ## 11 South Korea                   444.             391097.            881
    ## 12 Czech Republic                439.             377893.            860
    ## 13 United Kingdom                426.             370103.            869
    ## 14 Germany                       420.             366673.            873
    ## 15 Slovakia                      388.             331510.            854
    ## 16 Italy                         383.             336409.            878
    ## 17 Norway                        335.             290083.            867
    ## 18 Serbia                        329.             280999.            853
    ## 19 United States                 328.             285414.            869
    ## 20 Spain                         325.             282376.            870

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2149    11849
    ##  2 Sudan                 7.88       4955    62914
    ##  3 Peru                  5.69     213840  3761445
    ##  4 Syria                 5.62       3150    56022
    ##  5 Mexico                5.06     326523  6454263
    ##  6 Somalia               5.06       1361    26912
    ##  7 Egypt                 4.81      24750   514413
    ##  8 Afghanistan           4.21       7736   183908
    ##  9 Ecuador               3.82      35774   935821
    ## 10 Niger                 3.42        311     9104
    ## 11 Myanmar               3.17      19434   613871
    ## 12 Bulgaria              3.14      37307  1189000
    ## 13 Malawi                3.05       2651    86823
    ## 14 Paraguay              2.77      19083   688820
    ## 15 Haiti                 2.61        837    32103
    ## 16 Chad                  2.60        193     7427
    ## 17 Tunisia               2.60      28942  1114370
    ## 18 Algeria               2.58       6875   266487
    ## 19 Indonesia             2.55     156875  6149084
    ## 20 South Africa          2.55     101922  4000631

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7150.     213840   29.9 
    ##  2 Bulgaria               5219.      37307    7.15
    ##  3 Hungary                4682.      46736    9.98
    ##  4 Czech Republic         3853.      40365   10.5 
    ##  5 Slovakia               3700.      20183    5.46
    ##  6 Chile                  3531.      59140   16.7 
    ##  7 Brazil                 3359.     675518  201.  
    ##  8 United States          3270.    1014343  310.  
    ##  9 Argentina              3125.     129202   41.3 
    ## 10 Belgium                3085.      32089   10.4 
    ## 11 Poland                 3026.     116486   38.5 
    ## 12 Romania                2998.      65824   22.0 
    ## 13 Paraguay               2993.      19083    6.38
    ## 14 Colombia               2937.     140365   47.8 
    ## 15 United Kingdom         2912.     181580   62.3 
    ## 16 Mexico                 2903.     326523  112.  
    ## 17 Italy                  2821.     170213   60.3 
    ## 18 Greece                 2792.      30707   11   
    ## 19 Tunisia                2733.      28942   10.6 
    ## 20 Russia                 2715.     381997  141.

EOL
