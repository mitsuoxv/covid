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

Updated: 2022-09-13

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
    ##  1 United States          101649. 93822524            923
    ##  2 India                   48794. 44500580            912
    ##  3 Brazil                  37870. 34499823            911
    ##  4 France                  36401. 33670653            925
    ##  5 Germany                 35008. 32452250            927
    ##  6 South Korea             25713. 24041825            935
    ##  7 United Kingdom          25520. 23554971            923
    ##  8 Italy                   23657. 22048032            932
    ##  9 Russia                  22151. 20113098            908
    ## 10 Japan                   21581. 20156992            934
    ## 11 Turkey                  18535. 16829941            908
    ## 12 Spain                   14467. 13367647            924
    ## 13 Vietnam                 12654. 11439613            904
    ## 14 Australia               11051. 10112229            915
    ## 15 Argentina               10601.  9689861            914
    ## 16 Netherlands              9137.  8396979            919
    ## 17 Iran                     8106.  7538821            930
    ## 18 Mexico                   7709.  7046220            914
    ## 19 China                    7075.  6849080            968
    ## 20 Indonesia                7009.  6392492            912

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        690.             631381.            915
    ##  2 Austria                       665.             610225.            917
    ##  3 Denmark                       652.             598113.            917
    ##  4 Switzerland                   577.             532949.            923
    ##  5 France                        562.             519862.            925
    ##  6 Portugal                      559.             509578.            912
    ##  7 Netherlands                   549.             504475.            919
    ##  8 South Korea                   531.             496500.            935
    ##  9 Australia                     514.             469992.            915
    ## 10 Greece                        478.             436817.            914
    ## 11 Belgium                       469.             432298.            922
    ## 12 Germany                       428.             396716.            927
    ## 13 Czech Republic                424.             387499.            914
    ## 14 United Kingdom                409.             377796.            923
    ## 15 Italy                         392.             365395.            932
    ## 16 Slovakia                      371.             336805.            908
    ## 17 Serbia                        348.             315260.            907
    ## 18 United States                 328.             302426.            923
    ## 19 Norway                        317.             291631.            921
    ## 20 Spain                         311.             287439.            924

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11932
    ##  2 Sudan                 7.84       4961    63275
    ##  3 Syria                 5.53       3163    57166
    ##  4 Peru                  5.24     215982  4118792
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24796   515348
    ##  7 Mexico                4.68     329652  7046220
    ##  8 Afghanistan           3.97       7787   196012
    ##  9 Ecuador               3.60      35873   997791
    ## 10 Niger                 3.32        312     9384
    ## 11 Myanmar               3.15      19442   616852
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.02      37646  1248200
    ## 14 Paraguay              2.72      19494   715569
    ## 15 Chad                  2.56        193     7547
    ## 16 Tunisia               2.55      29238  1144824
    ## 17 South Africa          2.54     102129  4014405
    ## 18 Algeria               2.54       6879   270539
    ## 19 Haiti                 2.51        841    33551
    ## 20 Sri Lanka             2.50      16728   670444

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7222.     215982   29.9 
    ##  2 Bulgaria               5266.      37646    7.15
    ##  3 Hungary                4745.      47367    9.98
    ##  4 Czech Republic         3905.      40910   10.5 
    ##  5 Slovakia               3742.      20411    5.46
    ##  6 Chile                  3624.      60696   16.7 
    ##  7 Brazil                 3404.     684637  201.  
    ##  8 United States          3347.    1038273  310.  
    ##  9 Argentina              3139.     129769   41.3 
    ## 10 Belgium                3131.      32575   10.4 
    ## 11 Paraguay               3057.      19494    6.38
    ## 12 Poland                 3046.     117252   38.5 
    ## 13 Romania                3044.      66853   22.0 
    ## 14 United Kingdom         3032.     189026   62.3 
    ## 15 Greece                 2978.      32757   11   
    ## 16 Colombia               2964.     141646   47.8 
    ## 17 Mexico                 2931.     329652  112.  
    ## 18 Italy                  2920.     176209   60.3 
    ## 19 Tunisia                2761.      29238   10.6 
    ## 20 Russia                 2739.     385429  141.

EOL
