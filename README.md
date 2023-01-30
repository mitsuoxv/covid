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

Updated: 2023-01-31

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
    ##  1 United States           94686. 100651473           1063
    ##  2 China                   88874.  98472396           1108
    ##  3 India                   42474.  44682719           1052
    ##  4 France                  36062.  38406556           1065
    ##  5 Germany                 35370.  37739472           1067
    ##  6 Brazil                  34984.  36768677           1051
    ##  7 Japan                   30227.  32464361           1074
    ##  8 South Korea             28053.  30157017           1075
    ##  9 Italy                   23744.  25453789           1072
    ## 10 United Kingdom          22836.  24274361           1063
    ## 11 Russia                  20939.  21944400           1048
    ## 12 Turkey                  16226.  17004677           1048
    ## 13 Spain                   12905.  13731478           1064
    ## 14 Vietnam                 11041.  11526408           1044
    ## 15 Australia               10702.  11290997           1055
    ## 16 Argentina                9519.  10032709           1054
    ## 17 Netherlands              8103.   8581421           1059
    ## 18 Iran                     7069.   7564146           1070
    ## 19 Mexico                   6977.   7353630           1054
    ## 20 Indonesia                6397.   6729756           1052

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       666.             703800.           1057
    ##  2 Israel                        617.             650708.           1055
    ##  3 Denmark                       587.             619838.           1056
    ##  4 South Korea                   579.             622787.           1075
    ##  5 France                        557.             592983.           1065
    ##  6 Switzerland                   544.             578512.           1063
    ##  7 Australia                     497.             524778.           1055
    ##  8 Portugal                      495.             521100.           1052
    ##  9 Greece                        492.             518936.           1054
    ## 10 Netherlands                   487.             515555.           1059
    ## 11 Germany                       432.             461350.           1067
    ## 12 Belgium                       425.             450976.           1061
    ## 13 Czech Republic                416.             438032.           1054
    ## 14 Italy                         394.             421837.           1072
    ## 15 United Kingdom                366.             389334.           1063
    ## 16 Slovakia                      325.             341112.           1048
    ## 17 Serbia                        321.             336218.           1047
    ## 18 United States                 305.             324438.           1063
    ## 19 Chile                         291.             305207.           1050
    ## 20 Norway                        278.             295008.           1062

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.85       5001    63742
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27318
    ##  5 Peru                  4.88     218686  4480009
    ##  6 Egypt                 4.81      24805   515609
    ##  7 Mexico                4.52     332026  7353630
    ##  8 Afghanistan           3.78       7876   208452
    ##  9 Ecuador               3.42      35942  1051239
    ## 10 Niger                 3.31        315     9509
    ## 11 Myanmar               3.08      19490   633819
    ## 12 Malawi                3.04       2686    88408
    ## 13 Bulgaria              2.95      38174  1295275
    ## 14 Paraguay              2.70      19778   733429
    ## 15 Tunisia               2.55      29302  1150278
    ## 16 Algeria               2.54       6881   271364
    ## 17 Chad                  2.54        194     7652
    ## 18 South Africa          2.53     102595  4054206
    ## 19 Haiti                 2.53        860    34008
    ## 20 Sri Lanka             2.50      16828   671987

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7312.     218686   29.9 
    ##  2 Bulgaria               5340.      38174    7.15
    ##  3 Hungary                4866.      48572    9.98
    ##  4 Czech Republic         4038.      42304   10.5 
    ##  5 Slovakia               3839.      20940    5.46
    ##  6 Chile                  3806.      63730   16.7 
    ##  7 United States          3525.    1093540  310.  
    ##  8 Brazil                 3464.     696603  201.  
    ##  9 United Kingdom         3275.     204171   62.3 
    ## 10 Greece                 3239.      35630   11   
    ## 11 Belgium                3226.      33557   10.4 
    ## 12 Argentina              3154.     130394   41.3 
    ## 13 Paraguay               3102.      19778    6.38
    ## 14 Italy                  3096.     186833   60.3 
    ## 15 Poland                 3084.     118715   38.5 
    ## 16 Romania                3076.      67542   22.0 
    ## 17 Colombia               2982.     142486   47.8 
    ## 18 Mexico                 2952.     332026  112.  
    ## 19 Russia                 2808.     395022  141.  
    ## 20 Tunisia                2767.      29302   10.6

EOL
