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

Updated: 2023-02-15

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
    ##  1 United States           94152. 101496168           1078
    ##  2 China                   87993.  98815992           1123
    ##  3 India                   41878.  44684274           1067
    ##  4 France                  35613.  38462630           1080
    ##  5 Germany                 35054.  37928944           1082
    ##  6 Brazil                  34646.  36932830           1066
    ##  7 Japan                   30265.  32958774           1089
    ##  8 South Korea             27862.  30369744           1090
    ##  9 Italy                   23476.  25519067           1087
    ## 10 United Kingdom          22556.  24315983           1078
    ## 11 Russia                  20784.  22093549           1063
    ## 12 Turkey                  15997.  17004677           1063
    ## 13 Spain                   12742.  13748918           1079
    ## 14 Vietnam                 10884.  11526704           1059
    ## 15 Australia               10585.  11326032           1070
    ## 16 Argentina                9394.  10042136           1069
    ## 17 Netherlands              7995.   8586372           1074
    ## 18 Iran                     6973.   7565678           1085
    ## 19 Mexico                   6923.   7400848           1069
    ## 20 Indonesia                6310.   6733215           1067

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       663.             710801.           1072
    ##  2 Israel                        609.             651584.           1070
    ##  3 Denmark                       579.             620272.           1071
    ##  4 South Korea                   575.             627181.           1090
    ##  5 France                        550.             593849.           1080
    ##  6 Switzerland                   537.             578744.           1078
    ##  7 Greece                        496.             530133.           1069
    ##  8 Australia                     492.             526406.           1070
    ##  9 Portugal                      489.             521386.           1067
    ## 10 Netherlands                   480.             515853.           1074
    ## 11 Germany                       429.             463666.           1082
    ## 12 Belgium                       420.             451884.           1076
    ## 13 Czech Republic                410.             438796.           1069
    ## 14 Italy                         389.             422919.           1087
    ## 15 United Kingdom                362.             390001.           1078
    ## 16 Slovakia                      321.             341284.           1063
    ## 17 Serbia                        318.             337718.           1062
    ## 18 United States                 303.             327161.           1078
    ## 19 Chile                         288.             306918.           1065
    ## 20 Norway                        274.             295139.           1077

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
    ##  5 Peru                  4.89     219269  4483729
    ##  6 Egypt                 4.81      24809   515698
    ##  7 Mexico                4.49     332580  7400848
    ##  8 Afghanistan           3.78       7896   209020
    ##  9 Ecuador               3.41      36008  1056578
    ## 10 Niger                 3.31        315     9512
    ## 11 Myanmar               3.07      19490   633867
    ## 12 Malawi                3.03       2686    88503
    ## 13 Bulgaria              2.95      38195  1295958
    ## 14 Paraguay              2.70      19843   734244
    ## 15 Tunisia               2.55      29312  1150477
    ## 16 Algeria               2.54       6881   271406
    ## 17 Chad                  2.54        194     7652
    ## 18 South Africa          2.53     102595  4057134
    ## 19 Haiti                 2.52        860    34076
    ## 20 Sri Lanka             2.50      16829   672012

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7332.     219269   29.9 
    ##  2 Bulgaria               5343.      38195    7.15
    ##  3 Hungary                4871.      48623    9.98
    ##  4 Czech Republic         4043.      42358   10.5 
    ##  5 Slovakia               3847.      20986    5.46
    ##  6 Chile                  3822.      64013   16.7 
    ##  7 United States          3558.    1103936  310.  
    ##  8 Brazil                 3469.     697674  201.  
    ##  9 United Kingdom         3297.     205540   62.3 
    ## 10 Greece                 3269.      35957   11   
    ## 11 Belgium                3231.      33616   10.4 
    ## 12 Argentina              3155.     130448   41.3 
    ## 13 Paraguay               3112.      19843    6.38
    ## 14 Italy                  3108.     187551   60.3 
    ## 15 Poland                 3085.     118785   38.5 
    ## 16 Romania                3081.      67650   22.0 
    ## 17 Colombia               2983.     142576   47.8 
    ## 18 Mexico                 2957.     332580  112.  
    ## 19 Russia                 2812.     395616  141.  
    ## 20 Tunisia                2768.      29312   10.6

EOL
