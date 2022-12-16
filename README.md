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

Updated: 2022-12-17

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
    ##  1 United States           96784. 98525870           1018
    ##  2 India                   44365. 44675609           1007
    ##  3 France                  36922. 37660476           1020
    ##  4 Germany                 36151. 36946574           1022
    ##  5 Brazil                  35538. 35751411           1006
    ##  6 South Korea             27245. 28062679           1030
    ##  7 Japan                   25917. 26668251           1029
    ##  8 Italy                   24060. 24709404           1027
    ##  9 United Kingdom          23663. 24089042           1018
    ## 10 Russia                  21636. 21701321           1003
    ## 11 Turkey                  16954. 17004677           1003
    ## 12 Spain                   13378. 13632635           1019
    ## 13 Vietnam                 11533. 11521708            999
    ## 14 Australia               10830. 10938096           1010
    ## 15 Argentina                9680.  9766975           1009
    ## 16 China                    9415. 10008444           1063
    ## 17 Netherlands              8435.  8553219           1014
    ## 18 Iran                     7376.  7560294           1025
    ## 19 Mexico                   7110.  7174464           1009
    ## 20 Indonesia                6661.  6707504           1007

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       679.             686770.           1012
    ##  2 Israel                        639.             645346.           1010
    ##  3 Denmark                       608.             614648.           1011
    ##  4 France                        570.             581464.           1020
    ##  5 Switzerland                   564.             574049.           1017
    ##  6 South Korea                   563.             579536.           1030
    ##  7 Portugal                      515.             518589.           1007
    ##  8 Netherlands                   507.             513861.           1014
    ##  9 Australia                     503.             508376.           1010
    ## 10 Greece                        496.             500067            1009
    ## 11 Germany                       442.             451657.           1022
    ## 12 Belgium                       441.             447784.           1016
    ## 13 Czech Republic                433.             436419.           1009
    ## 14 Italy                         399.             409501.           1027
    ## 15 United Kingdom                380.             386362.           1018
    ## 16 Slovakia                      340.             340562.           1003
    ## 17 Serbia                        331.             331241.           1002
    ## 18 United States                 312.             317587.           1018
    ## 19 Chile                         295.             296889.           1005
    ## 20 Norway                        289.             293829.           1017

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4992    63663
    ##  3 Syria                 5.51       3163    57422
    ##  4 Somalia               4.99       1361    27286
    ##  5 Peru                  4.96     217738  4390355
    ##  6 Egypt                 4.81      24800   515475
    ##  7 Mexico                4.61     330743  7174464
    ##  8 Afghanistan           3.79       7843   206802
    ##  9 Ecuador               3.50      35913  1024914
    ## 10 Niger                 3.32        314     9469
    ## 11 Myanmar               3.08      19488   633521
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38077  1289869
    ## 14 Paraguay              2.73      19646   719226
    ## 15 Tunisia               2.55      29272  1147282
    ## 16 Haiti                 2.54        860    33876
    ## 17 Algeria               2.54       6881   271147
    ## 18 Chad                  2.54        194     7648
    ## 19 South Africa          2.54     102550  4045262
    ## 20 Sri Lanka             2.50      16812   671793

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7281.     217738   29.9 
    ##  2 Bulgaria               5326.      38077    7.15
    ##  3 Hungary                4847.      48380    9.98
    ##  4 Czech Republic         4009.      42001   10.5 
    ##  5 Slovakia               3809.      20778    5.46
    ##  6 Chile                  3750.      62795   16.7 
    ##  7 United States          3472.    1077129  310.  
    ##  8 Brazil                 3438.     691449  201.  
    ##  9 Belgium                3187.      33155   10.4 
    ## 10 United Kingdom         3180.     198271   62.3 
    ## 11 Greece                 3147.      34614   11   
    ## 12 Argentina              3145.     130041   41.3 
    ## 13 Paraguay               3081.      19646    6.38
    ## 14 Poland                 3076.     118419   38.5 
    ## 15 Romania                3064.      67289   22.0 
    ## 16 Italy                  3023.     182419   60.3 
    ## 17 Colombia               2970.     141943   47.8 
    ## 18 Mexico                 2941.     330743  112.  
    ## 19 Russia                 2792.     392891  141.  
    ## 20 Tunisia                2764.      29272   10.6

EOL
