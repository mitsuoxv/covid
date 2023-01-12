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

Updated: 2023-01-13

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
    ##  1 United States           95587. 99888608           1045
    ##  2 India                   43211. 44680583           1034
    ##  3 France                  36611. 38331404           1047
    ##  4 Germany                 35826. 37581570           1049
    ##  5 Brazil                  35385. 36552432           1033
    ##  6 Japan                   29211. 30846732           1056
    ##  7 South Korea             28096. 29698043           1057
    ##  8 Italy                   23984. 25279682           1054
    ##  9 United Kingdom          23167. 24210131           1045
    ## 10 Russia                  21205. 21841644           1030
    ## 11 Turkey                  16509. 17004677           1030
    ## 12 Spain                   13091. 13693478           1046
    ## 13 Vietnam                 11234. 11525946           1026
    ## 14 Australia               10653. 11047174           1037
    ## 15 China                    9936. 10830804           1090
    ## 16 Argentina                9657. 10004679           1036
    ## 17 Netherlands              8239.  8576523           1041
    ## 18 Iran                     7188.  7562275           1052
    ## 19 Mexico                   7031.  7283849           1036
    ## 20 Indonesia                6504.  6725095           1034

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       673.             698882.           1039
    ##  2 Israel                        626.             649218.           1037
    ##  3 Denmark                       597.             619253.           1038
    ##  4 South Korea                   580.             613309.           1057
    ##  5 France                        565.             591823.           1047
    ##  6 Switzerland                   553.             578242.           1045
    ##  7 Portugal                      503.             520601.           1034
    ##  8 Australia                     495.             513446.           1037
    ##  9 Netherlands                   495.             515261.           1041
    ## 10 Greece                        487.             504408.           1036
    ## 11 Germany                       438.             459420.           1049
    ## 12 Belgium                       432.             450085.           1043
    ## 13 Czech Republic                422.             437603.           1036
    ## 14 Italy                         397.             418952.           1054
    ## 15 United Kingdom                372.             388304.           1045
    ## 16 Slovakia                      331.             340970.           1030
    ## 17 Serbia                        325.             334424.           1029
    ## 18 United States                 308.             321979.           1045
    ## 19 Chile                         294.             303039.           1032
    ## 20 Norway                        282.             294794.           1044

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
    ##  5 Peru                  4.89     218414  4470919
    ##  6 Egypt                 4.81      24803   515556
    ##  7 Mexico                4.55     331324  7283849
    ##  8 Afghanistan           3.78       7854   207900
    ##  9 Ecuador               3.45      35934  1040463
    ## 10 Niger                 3.31        315     9506
    ## 11 Myanmar               3.08      19490   633731
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38135  1293812
    ## 14 Paraguay              2.71      19716   728605
    ## 15 Tunisia               2.55      29288  1147729
    ## 16 Algeria               2.54       6881   271255
    ## 17 Chad                  2.54        194     7651
    ## 18 South Africa          2.53     102568  4050288
    ## 19 Haiti                 2.53        860    33969
    ## 20 Sri Lanka             2.50      16821   671948

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7303.     218414   29.9 
    ##  2 Bulgaria               5334.      38135    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4032.      42235   10.5 
    ##  5 Slovakia               3824.      20862    5.46
    ##  6 Chile                  3785.      63386   16.7 
    ##  7 United States          3497.    1084932  310.  
    ##  8 Brazil                 3456.     694985  201.  
    ##  9 United Kingdom         3224.     201028   62.3 
    ## 10 Belgium                3210.      33395   10.4 
    ## 11 Greece                 3185       35035   11   
    ## 12 Argentina              3150.     130249   41.3 
    ## 13 Paraguay               3092.      19716    6.38
    ## 14 Poland                 3081.     118633   38.5 
    ## 15 Italy                  3073.     185417   60.3 
    ## 16 Romania                3072.      67460   22.0 
    ## 17 Colombia               2977.     142259   47.8 
    ## 18 Mexico                 2946.     331324  112.  
    ## 19 Russia                 2802.     394262  141.  
    ## 20 Tunisia                2766.      29288   10.6

EOL
