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

Updated: 2023-02-16

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
    ##  1 United States           94065. 101496168           1079
    ##  2 China                   87933.  98836691           1124
    ##  3 India                   41839.  44684376           1068
    ##  4 France                  35585.  38467616           1081
    ##  5 Germany                 35041.  37949446           1083
    ##  6 Brazil                  34633.  36953492           1067
    ##  7 Japan                   30267.  32990844           1090
    ##  8 South Korea             27850.  30384701           1091
    ##  9 Italy                   23455.  25519067           1088
    ## 10 United Kingdom          22536.  24315983           1079
    ## 11 Russia                  20777.  22106985           1064
    ## 12 Turkey                  15982.  17004677           1064
    ## 13 Spain                   12730.  13748918           1080
    ## 14 Vietnam                 10874.  11526754           1060
    ## 15 Australia               10575.  11326032           1071
    ## 16 Argentina                9385.  10042136           1070
    ## 17 Netherlands              7989.   8587919           1075
    ## 18 Iran                     6967.   7565865           1086
    ## 19 Mexico                   6917.   7400848           1070
    ## 20 Indonesia                6305.   6733478           1068

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       663.             711437.           1073
    ##  2 Israel                        608.             651652.           1071
    ##  3 Denmark                       579.             620300.           1072
    ##  4 South Korea                   575.             627490.           1091
    ##  5 France                        549.             593926.           1081
    ##  6 Switzerland                   536.             578874.           1079
    ##  7 Greece                        495.             530133.           1070
    ##  8 Australia                     492.             526406.           1071
    ##  9 Portugal                      488.             521386.           1068
    ## 10 Netherlands                   480.             515946.           1075
    ## 11 Germany                       428.             463917.           1083
    ## 12 Belgium                       420.             451884.           1077
    ## 13 Czech Republic                410.             438935.           1070
    ## 14 Italy                         389.             422919.           1088
    ## 15 United Kingdom                361.             390001.           1079
    ## 16 Slovakia                      321.             341307.           1064
    ## 17 Serbia                        318.             337842.           1063
    ## 18 United States                 303.             327161.           1079
    ## 19 Chile                         288.             306978.           1066
    ## 20 Norway                        274.             295147.           1078

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.86       5011    63775
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27324
    ##  5 Peru                  4.89     219287  4483779
    ##  6 Egypt                 4.81      24809   515698
    ##  7 Mexico                4.49     332580  7400848
    ##  8 Afghanistan           3.77       7877   209054
    ##  9 Ecuador               3.41      36008  1056578
    ## 10 Niger                 3.31        315     9512
    ## 11 Myanmar               3.07      19490   633875
    ## 12 Malawi                3.03       2686    88543
    ## 13 Bulgaria              2.95      38198  1296009
    ## 14 Paraguay              2.70      19843   734244
    ## 15 Tunisia               2.55      29326  1150606
    ## 16 Algeria               2.54       6881   271406
    ## 17 Chad                  2.54        194     7652
    ## 18 South Africa          2.53     102595  4057134
    ## 19 Haiti                 2.52        860    34076
    ## 20 Sri Lanka             2.50      16829   672015

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7332.     219287   29.9 
    ##  2 Bulgaria               5343.      38198    7.15
    ##  3 Hungary                4871.      48623    9.98
    ##  4 Czech Republic         4043.      42358   10.5 
    ##  5 Slovakia               3848.      20989    5.46
    ##  6 Chile                  3823.      64015   16.7 
    ##  7 United States          3558.    1103936  310.  
    ##  8 Brazil                 3470.     697762  201.  
    ##  9 United Kingdom         3297.     205540   62.3 
    ## 10 Greece                 3269.      35957   11   
    ## 11 Belgium                3231.      33616   10.4 
    ## 12 Argentina              3155.     130448   41.3 
    ## 13 Paraguay               3112.      19843    6.38
    ## 14 Italy                  3108.     187551   60.3 
    ## 15 Poland                 3086.     118800   38.5 
    ## 16 Romania                3081.      67650   22.0 
    ## 17 Colombia               2983.     142576   47.8 
    ## 18 Mexico                 2957.     332580  112.  
    ## 19 Russia                 2812.     395652  141.  
    ## 20 Tunisia                2769.      29326   10.6

EOL
