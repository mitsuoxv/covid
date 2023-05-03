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

Updated: 2023-05-04

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
<https://covid19.who.int/WHO-COVID-19-global-data.csv>. Starting from
the week of 20 February 2023, it will be updated once per week on
Wednesdays.

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
    ##  1 United States           89331. 103266404           1156
    ##  2 China                   82638.  99248443           1201
    ##  3 India                   39260.  44952996           1145
    ##  4 France                  33619.  38930489           1158
    ##  5 Germany                 33107.  38403667           1160
    ##  6 Brazil                  32735.  37449418           1144
    ##  7 Japan                   28895.  33720739           1167
    ##  8 South Korea             26692.  31176660           1168
    ##  9 Italy                   22136.  25788387           1165
    ## 10 United Kingdom          21264.  24581706           1156
    ## 11 Russia                  20034.  22858855           1141
    ## 12 Turkey                  14903.  17004677           1141
    ## 13 Spain                   11949.  13825052           1157
    ## 14 Vietnam                 10169.  11561848           1137
    ## 15 Australia                9765.  11210651           1148
    ## 16 Argentina                8758.  10044957           1147
    ## 17 Netherlands              7474.   8610372           1152
    ## 18 Mexico                   6615.   7587447           1147
    ## 19 Iran                     6541.   7607744           1163
    ## 20 Indonesia                5919.   6776984           1145

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       643.             739270.           1150
    ##  2 Israel                        571.             655741.           1148
    ##  3 South Korea                   551.             643845.           1168
    ##  4 Denmark                       541.             622157.           1149
    ##  5 France                        519.             601072.           1158
    ##  6 Switzerland                   502.             580719.           1156
    ##  7 Greece                        477.             547140.           1147
    ##  8 Portugal                      457.             522819.           1145
    ##  9 Australia                     454.             521044.           1148
    ## 10 Netherlands                   449.             517295.           1152
    ## 11 Germany                       405.             469470.           1160
    ## 12 Belgium                       399.             460773.           1154
    ## 13 Czech Republic                386.             442951.           1147
    ## 14 Italy                         367.             427382.           1165
    ## 15 United Kingdom                341.             394263.           1156
    ## 16 Serbia                        303.             345124.           1140
    ## 17 Slovakia                      300.             342158.           1141
    ## 18 United States                 288.             332867.           1156
    ## 19 Chile                         276.             315523.           1143
    ## 20 Spain                         257.             297275.           1157

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.89       5046    63993
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27334
    ##  5 Peru                  4.89     220122  4501130
    ##  6 Egypt                 4.81      24826   515970
    ##  7 Mexico                4.40     333908  7587447
    ##  8 Afghanistan           3.67       7892   214880
    ##  9 Ecuador               3.39      36019  1061100
    ## 10 Niger                 3.31        315     9513
    ## 11 Myanmar               3.07      19492   635102
    ## 12 Malawi                3.03       2686    88638
    ## 13 Bulgaria              2.94      38328  1304393
    ## 14 Paraguay              2.70      19880   735759
    ## 15 Tunisia               2.55      29387  1152612
    ## 16 Algeria               2.53       6881   271719
    ## 17 South Africa          2.52     102595  4072533
    ## 18 Haiti                 2.51        860    34228
    ## 19 Sri Lanka             2.51      16843   672177
    ## 20 Chad                  2.48        194     7820

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7360.     220122   29.9 
    ##  2 Bulgaria               5361.      38328    7.15
    ##  3 Hungary                4885.      48762    9.98
    ##  4 Czech Republic         4082.      42767   10.5 
    ##  5 Slovakia               3880.      21167    5.46
    ##  6 Chile                  3665.      61384   16.7 
    ##  7 United States          3623.    1124063  310.  
    ##  8 United Kingdom         3594.     224106   62.3 
    ##  9 Brazil                 3488.     701494  201.  
    ## 10 Greece                 3341.      36754   11   
    ## 11 Belgium                3291.      34237   10.4 
    ## 12 Argentina              3156.     130472   41.3 
    ## 13 Italy                  3144.     189738   60.3 
    ## 14 Paraguay               3118.      19880    6.38
    ## 15 Poland                 3105.     119555   38.5 
    ## 16 Romania                3101.      68089   22.0 
    ## 17 Colombia               2986.     142713   47.8 
    ## 18 Mexico                 2969.     333908  112.  
    ## 19 Russia                 2831.     398366  141.  
    ## 20 Tunisia                2775.      29387   10.6

EOL
