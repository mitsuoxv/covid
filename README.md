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

Updated: 2022-11-24

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
    ##  1 United States           97518. 97030505            995
    ##  2 India                   45396. 44670075            984
    ##  3 France                  36479. 36369920            997
    ##  4 Germany                 36317. 36280371            999
    ##  5 Brazil                  35641. 35035294            983
    ##  6 South Korea             26539. 26725053           1007
    ##  7 United Kingdom          24098. 23977637            995
    ##  8 Italy                   23936. 24031538           1004
    ##  9 Japan                   23793. 23935445           1006
    ## 10 Russia                  21991. 21550982            980
    ## 11 Turkey                  17265. 16919638            980
    ## 12 Spain                   13628. 13573721            996
    ## 13 Vietnam                 11795. 11512138            976
    ## 14 Australia               10671. 10532366            987
    ## 15 Argentina                9862.  9723924            986
    ## 16 China                    9157.  9523014           1040
    ## 17 Netherlands              8614.  8536849            991
    ## 18 Iran                     7544.  7559368           1002
    ## 19 Mexico                   7220.  7118933            986
    ## 20 Indonesia                6735.  6627538            984

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       681.             673331.            989
    ##  2 Israel                        649.             640443.            987
    ##  3 Denmark                       617.             610427.            989
    ##  4 Switzerland                   570.             566947.            995
    ##  5 France                        563.             561538.            997
    ##  6 South Korea                   548.             551912.           1007
    ##  7 Portugal                      527.             518589.            984
    ##  8 Netherlands                   518.             512878.            991
    ##  9 Australia                     496.             489519.            987
    ## 10 Greece                        494.             487319.            986
    ## 11 Belgium                       448.             445021.            994
    ## 12 Germany                       444.             443513.            999
    ## 13 Czech Republic                404.             398004.            986
    ## 14 Italy                         397.             398267.           1004
    ## 15 United Kingdom                387.             384575.            995
    ## 16 Slovakia                      347.             340092.            980
    ## 17 Serbia                        336.             329343.            979
    ## 18 United States                 314.             312767.            995
    ## 19 Chile                         297.             291618.            982
    ## 20 Norway                        295.             293019.            994

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4986    63625
    ##  3 Syria                 5.51       3163    57389
    ##  4 Peru                  5.18     217279  4192300
    ##  5 Somalia               4.99       1361    27254
    ##  6 Egypt                 4.81      24798   515431
    ##  7 Mexico                4.64     330444  7118933
    ##  8 Afghanistan           3.82       7832   205260
    ##  9 Ecuador               3.56      35940  1009958
    ## 10 Niger                 3.33        314     9434
    ## 11 Myanmar               3.08      19487   633075
    ## 12 Malawi                3.05       2685    88045
    ## 13 Bulgaria              2.96      38015  1285855
    ## 14 Paraguay              2.73      19611   718071
    ## 15 Tunisia               2.55      29266  1146799
    ## 16 Haiti                 2.54        860    33837
    ## 17 Chad                  2.54        194     7641
    ## 18 Algeria               2.54       6881   271028
    ## 19 South Africa          2.54     102395  4038121
    ## 20 Sri Lanka             2.50      16795   671563

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7265.     217279   29.9 
    ##  2 Bulgaria               5318.      38015    7.15
    ##  3 Hungary                4833.      48245    9.98
    ##  4 Czech Republic         3988.      41774   10.5 
    ##  5 Slovakia               3798.      20719    5.46
    ##  6 Chile                  3715.      62217   16.7 
    ##  7 United States          3440.    1067123  310.  
    ##  8 Brazil                 3426.     689039  201.  
    ##  9 Belgium                3175.      33027   10.4 
    ## 10 United Kingdom         3147.     196241   62.3 
    ## 11 Argentina              3145.     130017   41.3 
    ## 12 Greece                 3107.      34178   11   
    ## 13 Paraguay               3076.      19611    6.38
    ## 14 Poland                 3073.     118292   38.5 
    ## 15 Romania                3063.      67253   22.0 
    ## 16 Italy                  2992.     180518   60.3 
    ## 17 Colombia               2969.     141881   47.8 
    ## 18 Mexico                 2938.     330444  112.  
    ## 19 Russia                 2783.     391622  141.  
    ## 20 Tunisia                2764.      29266   10.6

EOL
