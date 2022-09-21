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

Updated: 2022-09-22

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
    ##  1 United States          101364. 94471064            932
    ##  2 India                   48369. 44547599            921
    ##  3 Brazil                  37600. 34592027            920
    ##  4 France                  36337. 33938648            934
    ##  5 Germany                 35040. 32797308            936
    ##  6 South Korea             25956. 24502968            944
    ##  7 United Kingdom          25306. 23585309            932
    ##  8 Italy                   23589. 22197658            941
    ##  9 Russia                  22451. 20588102            917
    ## 10 Japan                   22056. 20799307            943
    ## 11 Turkey                  18378. 16852382            917
    ## 12 Spain                   14355. 13393196            933
    ## 13 Vietnam                 12556. 11463404            913
    ## 14 Australia               11022. 10184443            924
    ## 15 Argentina               10513.  9703938            923
    ## 16 Netherlands              9062.  8410076            928
    ## 17 Iran                     8035.  7544540            939
    ## 18 Mexico                   7661.  7070902            923
    ## 19 China                    7400.  7230178            977
    ## 20 Indonesia                6965.  6415328            921

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        685.             632798.            924
    ##  2 Austria                       663.             613504.            926
    ##  3 Denmark                       647.             599571.            926
    ##  4 Switzerland                   576.             536556.            932
    ##  5 France                        561.             524000.            934
    ##  6 Portugal                      555.             511604.            921
    ##  7 Netherlands                   544.             505261.            928
    ##  8 South Korea                   536.             506023.            944
    ##  9 Australia                     512.             473348.            924
    ## 10 Greece                        480.             443201.            923
    ## 11 Belgium                       466.             434222.            931
    ## 12 Germany                       428.             400934.            936
    ## 13 Czech Republic                422.             389585.            923
    ## 14 United Kingdom                406.             378282.            932
    ## 15 Italy                         391.             367874.            941
    ## 16 Slovakia                      368.             337315.            917
    ## 17 Serbia                        348.             318432.            916
    ## 18 United States                 327.             304517.            932
    ## 19 Norway                        314.             291784.            930
    ## 20 Spain                         309.             287989.            933

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11932
    ##  2 Sudan                 7.84       4961    63280
    ##  3 Syria                 5.53       3163    57236
    ##  4 Peru                  5.23     216350  4132929
    ##  5 Somalia               5.00       1361    27207
    ##  6 Egypt                 4.81      24797   515361
    ##  7 Mexico                4.67     329899  7070902
    ##  8 Afghanistan           3.95       7796   197608
    ##  9 Ecuador               3.58      35887  1002057
    ## 10 Niger                 3.33        313     9395
    ## 11 Myanmar               3.14      19451   620035
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.01      37688  1253233
    ## 14 Paraguay              2.73      19564   716009
    ## 15 Tunisia               2.55      29246  1145345
    ## 16 Chad                  2.55        193     7571
    ## 17 South Africa          2.54     102146  4016157
    ## 18 Haiti                 2.54        857    33702
    ## 19 Algeria               2.54       6879   270606
    ## 20 Sri Lanka             2.50      16748   670641

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7234.     216350   29.9 
    ##  2 Bulgaria               5272.      37688    7.15
    ##  3 Hungary                4754.      47457    9.98
    ##  4 Czech Republic         3912.      40980   10.5 
    ##  5 Slovakia               3747.      20439    5.46
    ##  6 Chile                  3640.      60950   16.7 
    ##  7 Brazil                 3408.     685428  201.  
    ##  8 United States          3361.    1042812  310.  
    ##  9 Argentina              3141.     129855   41.3 
    ## 10 Belgium                3137.      32636   10.4 
    ## 11 Paraguay               3068.      19564    6.38
    ## 12 Poland                 3049.     117391   38.5 
    ## 13 Romania                3048.      66937   22.0 
    ## 14 United Kingdom         3039.     189484   62.3 
    ## 15 Greece                 3001.      33010   11   
    ## 16 Colombia               2966.     141746   47.8 
    ## 17 Mexico                 2933.     329899  112.  
    ## 18 Italy                  2928.     176669   60.3 
    ## 19 Tunisia                2762.      29246   10.6 
    ## 20 Russia                 2746.     386341  141.

EOL
