WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-08-18

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
    ##  1 United States          102393. 91846336            897
    ##  2 India                   49984. 44286256            886
    ##  3 Brazil                  38619. 34178240            885
    ##  4 France                  36973. 33239261            899
    ##  5 Germany                 35146. 31666475            901
    ##  6 United Kingdom          26111. 23421278            897
    ##  7 South Korea             23853. 21682816            909
    ##  8 Italy                   23751. 21518365            906
    ##  9 Russia                  21501. 18964246            882
    ## 10 Turkey                  18739. 16528070            882
    ## 11 Japan                   17570. 15953318            908
    ## 12 Spain                   14818. 13306301            898
    ## 13 Vietnam                 12947. 11367479            878
    ## 14 Australia               11058.  9830293            889
    ## 15 Argentina               10849.  9633732            888
    ## 16 Netherlands              9371.  8368482            893
    ## 17 Iran                     8284.  7488493            904
    ## 18 Mexico                   7803.  6929003            888
    ## 19 Colombia                 7135.  6286392            881
    ## 20 Indonesia                7108.  6297484            886

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        706.             628046.            889
    ##  2 Austria                       668.             595375.            891
    ##  3 Denmark                       667.             594097.            891
    ##  4 Switzerland                   587.             526802.            897
    ##  5 France                        571.             513202.            899
    ##  6 Portugal                      569.             504084.            886
    ##  7 Netherlands                   563.             502763.            893
    ##  8 Australia                     514.             456888.            889
    ##  9 South Korea                   493.             447783.            909
    ## 10 Belgium                       479.             428778.            896
    ## 11 Greece                        477.             423158.            888
    ## 12 Czech Republic                432.             383538.            888
    ## 13 Germany                       430.             387110.            901
    ## 14 United Kingdom                419.             375651.            897
    ## 15 Italy                         394.             356617.            906
    ## 16 Slovakia                      380.             335314.            882
    ## 17 Serbia                        343.             302156.            881
    ## 18 United States                 330.             296056.            897
    ## 19 Norway                        325.             291124.            895
    ## 20 Spain                         319.             286120.            898

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11903
    ##  2 Sudan                 7.86       4961    63147
    ##  3 Syria                 5.56       3159    56772
    ##  4 Peru                  5.33     215028  4031007
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24786   515198
    ##  7 Mexico                4.74     328736  6929003
    ##  8 Afghanistan           4.09       7759   189477
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.40        311     9139
    ## 11 Myanmar               3.16      19435   614456
    ## 12 Bulgaria              3.05      37514  1229633
    ## 13 Malawi                3.05       2673    87718
    ## 14 Paraguay              2.72      19357   712907
    ## 15 Chad                  2.59        193     7456
    ## 16 Haiti                 2.56        838    32703
    ## 17 Tunisia               2.56      29189  1141135
    ## 18 Algeria               2.55       6878   269269
    ## 19 South Africa          2.54     101982  4008443
    ## 20 Indonesia             2.50     157296  6297484

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7190.     215028   29.9 
    ##  2 Bulgaria               5248.      37514    7.15
    ##  3 Hungary                4717.      47083    9.98
    ##  4 Czech Republic         3883.      40674   10.5 
    ##  5 Slovakia               3724.      20317    5.46
    ##  6 Chile                  3585.      60028   16.7 
    ##  7 Brazil                 3389.     681557  201.  
    ##  8 United States          3311.    1027094  310.  
    ##  9 Argentina              3134.     129566   41.3 
    ## 10 Belgium                3115.      32410   10.4 
    ## 11 Paraguay               3036.      19357    6.38
    ## 12 Poland                 3034.     116798   38.5 
    ## 13 Romania                3023.      66375   22.0 
    ## 14 United Kingdom         2985.     186087   62.3 
    ## 15 Colombia               2956.     141287   47.8 
    ## 16 Mexico                 2923.     328736  112.  
    ## 17 Greece                 2912.      32028   11   
    ## 18 Italy                  2886.     174172   60.3 
    ## 19 Tunisia                2757.      29189   10.6 
    ## 20 Russia                 2724.     383300  141.

EOL
