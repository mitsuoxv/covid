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

Updated: 2022-09-06

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
    ##  1 United States          101891. 93332054            916
    ##  2 India                   49130. 44462445            905
    ##  3 Brazil                  38086. 34429853            904
    ##  4 France                  36551. 33553905            918
    ##  5 Germany                 35052. 32247828            920
    ##  6 United Kingdom          25679. 23522244            916
    ##  7 South Korea             25438. 23606740            928
    ##  8 Italy                   23717. 21938269            925
    ##  9 Russia                  21943. 19771113            901
    ## 10 Japan                   20982. 19450222            927
    ## 11 Netherlands             18986.  6380982            336
    ## 12 Turkey                  18643. 16797750            901
    ## 13 Spain                   14560. 13352019            917
    ## 14 Vietnam                 12730. 11418894            897
    ## 15 Australia               11072. 10053456            908
    ## 16 Argentina               10670.  9678225            907
    ## 17 Iran                     8161.  7533087            923
    ## 18 Mexico                   7734.  7014510            907
    ## 19 Indonesia                7044.  6374882            905
    ## 20 Colombia                 6999.  6299595            900

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Netherlands                  1141.             383357.            336
    ##  2 Israel                        694.             630447.            908
    ##  3 Austria                       667.             606683.            910
    ##  4 Denmark                       656.             597116.            910
    ##  5 Switzerland                   580.             531048.            916
    ##  6 France                        564.             518060.            918
    ##  7 Portugal                      561.             508137.            905
    ##  8 South Korea                   525.             487514.            928
    ##  9 Australia                     515.             467260.            908
    ## 10 Greece                        477.             432984.            907
    ## 11 Belgium                       471.             431419.            915
    ## 12 Germany                       428.             394217.            920
    ## 13 Czech Republic                426.             386288.            907
    ## 14 United Kingdom                412.             377271.            916
    ## 15 Italy                         393.             363576.            925
    ## 16 Slovakia                      373.             336449.            901
    ## 17 Serbia                        347.             312329.            900
    ## 18 United States                 328.             300845.            916
    ## 19 Norway                        319.             291515.            914
    ## 20 Spain                         313.             287103.            917

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11931
    ##  2 Sudan                 7.84       4961    63266
    ##  3 Syria                 5.54       3163    57085
    ##  4 Peru                  5.26     215762  4103874
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24796   515335
    ##  7 Mexico                4.70     329390  7014510
    ##  8 Afghanistan           4.01       7782   194163
    ##  9 Ecuador               3.60      35843   995968
    ## 10 Niger                 3.33        312     9357
    ## 11 Myanmar               3.16      19440   615559
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.02      37613  1244733
    ## 14 Paraguay              2.72      19478   715162
    ## 15 Chad                  2.56        193     7536
    ## 16 Tunisia               2.56      29234  1143862
    ## 17 South Africa          2.54     102108  4012812
    ## 18 Algeria               2.54       6879   270443
    ## 19 Haiti                 2.52        841    33381
    ## 20 Sri Lanka             2.49      16711   670176

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7214.     215762   29.9 
    ##  2 Bulgaria               5261.      37613    7.15
    ##  3 Hungary                4738.      47291    9.98
    ##  4 Czech Republic         3899.      40851   10.5 
    ##  5 Slovakia               3733.      20365    5.46
    ##  6 Chile                  3613.      60508   16.7 
    ##  7 Brazil                 3401.     683965  201.  
    ##  8 United States          3338.    1035674  310.  
    ##  9 Argentina              3137.     129711   41.3 
    ## 10 Belgium                3127.      32534   10.4 
    ## 11 Paraguay               3055.      19478    6.38
    ## 12 Poland                 3043.     117153   38.5 
    ## 13 Romania                3041.      66772   22.0 
    ## 14 United Kingdom         3019.     188242   62.3 
    ## 15 Colombia               2961.     141519   47.8 
    ## 16 Greece                 2959.      32552   11   
    ## 17 Mexico                 2929.     329390  112.  
    ## 18 Italy                  2914.     175832   60.3 
    ## 19 Tunisia                2761.      29234   10.6 
    ## 20 Russia                 2735.     384787  141.

EOL
