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

Updated: 2023-01-06

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
    ##  1 United States           95784. 99423758           1038
    ##  2 India                   43505. 44679319           1027
    ##  3 France                  36808. 38280941           1040
    ##  4 Germany                 35965. 37475448           1042
    ##  5 Brazil                  35468. 36390423           1026
    ##  6 Japan                   28190. 29571931           1049
    ##  7 South Korea             27965. 29363272           1050
    ##  8 Italy                   24015. 25143705           1047
    ##  9 United Kingdom          23251. 24135084           1038
    ## 10 Russia                  21326. 21817113           1023
    ## 11 Turkey                  16622. 17004677           1023
    ## 12 Spain                   13170. 13684258           1039
    ## 13 Vietnam                 11310. 11524779           1019
    ## 14 Australia               10725. 11047174           1030
    ## 15 China                    9725. 10531982           1083
    ## 16 Argentina                9683.  9963697           1029
    ## 17 Netherlands              8290.  8572096           1034
    ## 18 Iran                     7236.  7561541           1045
    ## 19 Mexico                   7048.  7252944           1029
    ## 20 Indonesia                6545.  6722227           1027

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       675.             696681.           1032
    ##  2 Israel                        629.             648395.           1030
    ##  3 Denmark                       600.             618610.           1031
    ##  4 South Korea                   578.             606395.           1050
    ##  5 France                        568.             591044.           1040
    ##  6 Switzerland                   557.             577525.           1037
    ##  7 Portugal                      507.             520601.           1027
    ##  8 Australia                     498.             513446.           1030
    ##  9 Netherlands                   498.             514995.           1034
    ## 10 Greece                        490.             504408.           1029
    ## 11 Germany                       440.             458122.           1042
    ## 12 Belgium                       433.             448741.           1036
    ## 13 Czech Republic                425.             437389.           1029
    ## 14 Italy                         398.             416698.           1047
    ## 15 United Kingdom                373.             387100.           1038
    ## 16 Slovakia                      333.             340891.           1023
    ## 17 Serbia                        326.             333500.           1022
    ## 18 United States                 309.             320481.           1038
    ## 19 Chile                         294.             301441.           1025
    ## 20 Norway                        284.             294618.           1037

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4995    63702
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27310
    ##  5 Peru                  4.89     218284  4461129
    ##  6 Egypt                 4.81      24802   515533
    ##  7 Mexico                4.57     331197  7252944
    ##  8 Afghanistan           3.78       7850   207714
    ##  9 Ecuador               3.45      35934  1040463
    ## 10 Niger                 3.31        315     9504
    ## 11 Myanmar               3.08      19490   633696
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38116  1292778
    ## 14 Paraguay              2.71      19688   725365
    ## 15 Tunisia               2.55      29285  1147645
    ## 16 Haiti                 2.54        860    33893
    ## 17 Algeria               2.54       6881   271229
    ## 18 Chad                  2.54        194     7651
    ## 19 South Africa          2.53     102568  4049319
    ## 20 Sri Lanka             2.50      16818   671906

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7299.     218284   29.9 
    ##  2 Bulgaria               5332.      38116    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4026.      42178   10.5 
    ##  5 Slovakia               3819.      20833    5.46
    ##  6 Chile                  3776.      63243   16.7 
    ##  7 United States          3489.    1082265  310.  
    ##  8 Brazil                 3452.     694192  201.  
    ##  9 Belgium                3194.      33228   10.4 
    ## 10 United Kingdom         3191.     198937   62.3 
    ## 11 Greece                 3162.      34779   11   
    ## 12 Argentina              3149.     130171   41.3 
    ## 13 Paraguay               3088.      19688    6.38
    ## 14 Poland                 3080.     118567   38.5 
    ## 15 Romania                3070.      67408   22.0 
    ## 16 Italy                  3060.     184642   60.3 
    ## 17 Colombia               2975.     142179   47.8 
    ## 18 Mexico                 2945.     331197  112.  
    ## 19 Russia                 2800.     393945  141.  
    ## 20 Tunisia                2766.      29285   10.6

EOL
