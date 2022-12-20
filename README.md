WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

- <a href="#summary" id="toc-summary">Summary</a>
- <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
  WHO</a>
- <a href="#newly-confirmed-cases-by-region"
  id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
  region</a>
- <a href="#fastest-spreading-areas"
  id="toc-fastest-spreading-areas">Fastest spreading areas</a>
- <a href="#highest-fatality-rate-areas"
  id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
- <a href="#highest-deaths-per-population-areas"
  id="toc-highest-deaths-per-population-areas">Highest deaths per
  population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-12-21

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
    ##  1 United States           96405. 98525870           1022
    ##  2 India                   44190. 44676199           1011
    ##  3 France                  36928. 37814858           1024
    ##  4 Germany                 36097. 37035898           1026
    ##  5 Brazil                  35546. 35901978           1010
    ##  6 South Korea             27372. 28302474           1034
    ##  7 Japan                   26319. 27187394           1033
    ##  8 Italy                   24136. 24884034           1031
    ##  9 United Kingdom          23570. 24089042           1022
    ## 10 Russia                  21577. 21728409           1007
    ## 11 Turkey                  16886. 17004677           1007
    ## 12 Spain                   13344. 13651239           1023
    ## 13 Vietnam                 11489. 11523161           1003
    ## 14 Australia               10787. 10938096           1014
    ## 15 Argentina                9703.  9829236           1013
    ## 16 China                    9455. 10088555           1067
    ## 17 Netherlands              8405.  8556131           1018
    ## 18 Iran                     7347.  7560519           1029
    ## 19 Mexico                   7096.  7188862           1013
    ## 20 Indonesia                6639.  6711703           1011

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       678.             688790.           1016
    ##  2 Israel                        637.             645945.           1014
    ##  3 Denmark                       606.             615316.           1015
    ##  4 France                        570.             583847.           1024
    ##  5 South Korea                   565.             584488.           1034
    ##  6 Switzerland                   562.             574049.           1021
    ##  7 Portugal                      514.             520162.           1011
    ##  8 Netherlands                   505.             514036.           1018
    ##  9 Australia                     501.             508376.           1014
    ## 10 Greece                        494.             500067            1013
    ## 11 Germany                       441.             452749.           1026
    ## 12 Belgium                       440.             448378.           1020
    ## 13 Czech Republic                431.             436651.           1013
    ## 14 Italy                         400.             412395.           1031
    ## 15 United Kingdom                378.             386362.           1022
    ## 16 Slovakia                      338.             340629.           1007
    ## 17 Serbia                        330.             331594.           1006
    ## 18 United States                 311.             317587.           1022
    ## 19 Chile                         295.             297715.           1009
    ## 20 Norway                        288.             293984.           1021

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4992    63677
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.99       1361    27286
    ##  5 Peru                  4.93     217894  4415971
    ##  6 Egypt                 4.81      24801   515493
    ##  7 Mexico                4.60     330795  7188862
    ##  8 Afghanistan           3.79       7845   207110
    ##  9 Ecuador               3.50      35913  1024914
    ## 10 Niger                 3.31        314     9473
    ## 11 Myanmar               3.08      19488   633568
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38082  1290470
    ## 14 Paraguay              2.73      19655   720204
    ## 15 Tunisia               2.55      29272  1147282
    ## 16 Haiti                 2.54        860    33876
    ## 17 Algeria               2.54       6881   271156
    ## 18 Chad                  2.54        194     7648
    ## 19 South Africa          2.54     102550  4045262
    ## 20 Sri Lanka             2.50      16814   671817

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7286.     217894   29.9 
    ##  2 Bulgaria               5327.      38082    7.15
    ##  3 Hungary                4847.      48380    9.98
    ##  4 Czech Republic         4012.      42026   10.5 
    ##  5 Slovakia               3811.      20788    5.46
    ##  6 Chile                  3756.      62903   16.7 
    ##  7 United States          3472.    1077129  310.  
    ##  8 Brazil                 3440.     691883  201.  
    ##  9 Belgium                3192.      33210   10.4 
    ## 10 United Kingdom         3180.     198271   62.3 
    ## 11 Greece                 3147.      34614   11   
    ## 12 Argentina              3146.     130080   41.3 
    ## 13 Paraguay               3083.      19655    6.38
    ## 14 Poland                 3076.     118436   38.5 
    ## 15 Romania                3067.      67341   22.0 
    ## 16 Italy                  3035.     183138   60.3 
    ## 17 Colombia               2971.     141996   47.8 
    ## 18 Mexico                 2941.     330795  112.  
    ## 19 Russia                 2794.     393107  141.  
    ## 20 Tunisia                2764.      29272   10.6

EOL
