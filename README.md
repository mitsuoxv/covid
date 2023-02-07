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

Updated: 2023-02-07

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
    ##    area           speed_since_100  cum_conf days_since_100
    ##    <chr>                    <dbl>     <dbl>          <int>
    ##  1 United States           94338. 100941827           1070
    ##  2 China                   88485.  98660944           1115
    ##  3 India                   42194.  44683454           1059
    ##  4 France                  35853.  38434876           1072
    ##  5 Germany                 35216.  37822577           1074
    ##  6 Brazil                  34818.  36837943           1058
    ##  7 Japan                   30291.  32744705           1081
    ##  8 South Korea             27970.  30263261           1082
    ##  9 Italy                   23622.  25488166           1079
    ## 10 United Kingdom          22704.  24293752           1070
    ## 11 Russia                  20858.  22004828           1055
    ## 12 Turkey                  16118.  17004677           1055
    ## 13 Spain                   12830.  13740531           1071
    ## 14 Vietnam                 10967.  11526566           1051
    ## 15 Australia               10649.  11309388           1062
    ## 16 Argentina                9460.  10037135           1061
    ## 17 Netherlands              8052.   8583669           1066
    ## 18 Iran                     7024.   7564756           1077
    ## 19 Mexico                   6953.   7377333           1061
    ## 20 Indonesia                6356.   6731304           1059

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       664.             707017.           1064
    ##  2 Israel                        613.             651161.           1062
    ##  3 Denmark                       583.             620036.           1063
    ##  4 South Korea                   578.             624982.           1082
    ##  5 France                        554.             593420.           1072
    ##  6 Switzerland                   541.             578625.           1070
    ##  7 Australia                     495.             525633.           1062
    ##  8 Portugal                      492.             521193.           1059
    ##  9 Greece                        490.             520338.           1061
    ## 10 Netherlands                   484.             515691.           1066
    ## 11 Germany                       431.             462366.           1074
    ## 12 Belgium                       423.             451351.           1068
    ## 13 Czech Republic                413.             438292.           1061
    ## 14 Italy                         391.             422407.           1079
    ## 15 United Kingdom                364.             389645.           1070
    ## 16 Slovakia                      323.             341178.           1055
    ## 17 Serbia                        320.             336921.           1054
    ## 18 United States                 304.             325374.           1070
    ## 19 Chile                         289.             305915.           1057
    ## 20 Norway                        276.             295068.           1069

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.85       5008    63759
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27322
    ##  5 Peru                  4.89     219004  4481873
    ##  6 Egypt                 4.81      24806   515635
    ##  7 Mexico                4.50     332324  7377333
    ##  8 Afghanistan           3.78       7896   208704
    ##  9 Ecuador               3.42      35942  1052007
    ## 10 Niger                 3.31        315     9510
    ## 11 Myanmar               3.07      19490   633842
    ## 12 Malawi                3.04       2686    88462
    ## 13 Bulgaria              2.95      38184  1295597
    ## 14 Paraguay              2.70      19820   733907
    ## 15 Tunisia               2.55      29308  1150356
    ## 16 Algeria               2.54       6881   271386
    ## 17 Chad                  2.54        194     7652
    ## 18 South Africa          2.53     102595  4055656
    ## 19 Haiti                 2.52        860    34076
    ## 20 Sri Lanka             2.50      16828   672000

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7323.     219004   29.9 
    ##  2 Bulgaria               5341.      38184    7.15
    ##  3 Hungary                4869.      48603    9.98
    ##  4 Czech Republic         4040.      42327   10.5 
    ##  5 Slovakia               3843.      20964    5.46
    ##  6 Chile                  3813.      63850   16.7 
    ##  7 United States          3537.    1097246  310.  
    ##  8 Brazil                 3467.     697200  201.  
    ##  9 United Kingdom         3286.     204898   62.3 
    ## 10 Greece                 3257.      35822   11   
    ## 11 Belgium                3228.      33582   10.4 
    ## 12 Argentina              3155.     130421   41.3 
    ## 13 Paraguay               3109.      19820    6.38
    ## 14 Italy                  3104.     187272   60.3 
    ## 15 Poland                 3084.     118748   38.5 
    ## 16 Romania                3077.      67576   22.0 
    ## 17 Colombia               2983.     142544   47.8 
    ## 18 Mexico                 2955.     332324  112.  
    ## 19 Russia                 2810.     395319  141.  
    ## 20 Tunisia                2768.      29308   10.6

    ## Warning: There was 1 warning in `summarize()`.
    ## ℹ In argument: `across(!c(area, region), sum, na.rm = TRUE)`.
    ## ℹ In group 1: `publish_date = 2020-01-03`.
    ## Caused by warning:
    ## ! The `...` argument of `across()` is deprecated as of dplyr 1.1.0.
    ## Supply arguments directly to `.fns` through an anonymous function instead.
    ## 
    ##   # Previously
    ##   across(a:b, mean, na.rm = TRUE)
    ## 
    ##   # Now
    ##   across(a:b, \(x) mean(x, na.rm = TRUE))

EOL
