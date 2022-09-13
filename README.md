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

Updated: 2022-09-14

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
    ##  1 United States          101733. 94001259            924
    ##  2 India                   48746. 44504949            913
    ##  3 Brazil                  37857. 34526148            912
    ##  4 France                  36252. 33569467            926
    ##  5 Germany                 35029. 32507180            928
    ##  6 South Korea             25747. 24099134            936
    ##  7 United Kingdom          25492. 23554971            924
    ##  8 Italy                   23638. 22054443            933
    ##  9 Russia                  22175. 20157143            909
    ## 10 Japan                   21627. 20221686            935
    ## 11 Turkey                  18539. 16852382            909
    ## 12 Spain                   14451. 13367647            925
    ## 13 Vietnam                 12643. 11441626            905
    ## 14 Australia               11039. 10112229            916
    ## 15 Argentina               10599.  9697763            915
    ## 16 Netherlands              9127.  8396979            920
    ## 17 Iran                     8098.  7539698            931
    ## 18 Mexico                   7715.  7059348            915
    ## 19 China                    7097.  6876898            969
    ## 20 Indonesia                7007.  6397236            913

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        689.             631569.            916
    ##  2 Austria                       665.             610542.            918
    ##  3 Denmark                       652.             598440.            918
    ##  4 Switzerland                   577.             532949.            924
    ##  5 France                        560.             518300.            926
    ##  6 Portugal                      559.             510022.            913
    ##  7 Netherlands                   548.             504475.            920
    ##  8 South Korea                   532.             497683.            936
    ##  9 Australia                     513.             469992.            916
    ## 10 Greece                        477.             436817.            915
    ## 11 Belgium                       469.             432962.            923
    ## 12 Germany                       428.             397387.            928
    ## 13 Czech Republic                424.             387814.            915
    ## 14 United Kingdom                409.             377796.            924
    ## 15 Italy                         392.             365501.            933
    ## 16 Slovakia                      371.             336870.            909
    ## 17 Serbia                        348.             315688.            908
    ## 18 United States                 328.             303002.            924
    ## 19 Norway                        316.             291664.            922
    ## 20 Spain                         311.             287439.            925

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11932
    ##  2 Sudan                 7.84       4961    63275
    ##  3 Syria                 5.53       3163    57172
    ##  4 Peru                  5.24     216125  4126021
    ##  5 Somalia               5.00       1361    27197
    ##  6 Egypt                 4.81      24796   515348
    ##  7 Mexico                4.67     329761  7059348
    ##  8 Afghanistan           3.97       7789   196182
    ##  9 Ecuador               3.59      35876   998202
    ## 10 Niger                 3.32        312     9385
    ## 11 Myanmar               3.15      19442   617056
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.01      37655  1249052
    ## 14 Paraguay              2.73      19530   715806
    ## 15 Tunisia               2.55      29238  1144824
    ## 16 Chad                  2.55        193     7558
    ## 17 South Africa          2.54     102129  4014405
    ## 18 Haiti                 2.54        857    33702
    ## 19 Algeria               2.54       6879   270551
    ## 20 Sri Lanka             2.50      16731   670471

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7227.     216125   29.9 
    ##  2 Bulgaria               5267.      37655    7.15
    ##  3 Hungary                4745.      47367    9.98
    ##  4 Czech Republic         3906.      40918   10.5 
    ##  5 Slovakia               3743.      20417    5.46
    ##  6 Chile                  3631.      60812   16.7 
    ##  7 Brazil                 3405.     684853  201.  
    ##  8 United States          3351.    1039578  310.  
    ##  9 Argentina              3140.     129830   41.3 
    ## 10 Belgium                3134.      32605   10.4 
    ## 11 Paraguay               3063.      19530    6.38
    ## 12 Poland                 3046.     117280   38.5 
    ## 13 Romania                3045.      66856   22.0 
    ## 14 United Kingdom         3032.     189026   62.3 
    ## 15 Greece                 2978.      32757   11   
    ## 16 Colombia               2965.     141708   47.8 
    ## 17 Mexico                 2932.     329761  112.  
    ## 18 Italy                  2921.     176242   60.3 
    ## 19 Tunisia                2761.      29238   10.6 
    ## 20 Russia                 2740.     385530  141.

EOL
