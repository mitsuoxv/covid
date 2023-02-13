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

Updated: 2023-02-14

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
    ##  1 United States           93975. 101211478           1077
    ##  2 China                   88060.  98803168           1122
    ##  3 India                   41918.  44684197           1066
    ##  4 France                  35641.  38456268           1079
    ##  5 Germany                 35067.  37907312           1081
    ##  6 Brazil                  34655.  36907890           1065
    ##  7 Japan                   30284.  32949351           1088
    ##  8 South Korea             27874.  30355373           1089
    ##  9 Italy                   23498.  25519067           1086
    ## 10 United Kingdom          22577.  24315983           1077
    ## 11 Russia                  20794.  22083723           1062
    ## 12 Turkey                  16012.  17004677           1062
    ## 13 Spain                   12754.  13748918           1078
    ## 14 Vietnam                 10895.  11526692           1058
    ## 15 Australia               10595.  11326032           1069
    ## 16 Argentina                9401.  10040329           1068
    ## 17 Netherlands              8002.   8586372           1073
    ## 18 Iran                     6979.   7565552           1084
    ## 19 Mexico                   6920.   7390902           1068
    ## 20 Indonesia                6316.   6732968           1066

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       663.             710457.           1071
    ##  2 Israel                        609.             651473.           1069
    ##  3 Denmark                       580.             620209.           1070
    ##  4 South Korea                   576.             626884.           1089
    ##  5 France                        550.             593751.           1079
    ##  6 Switzerland                   537.             578744.           1077
    ##  7 Greece                        496.             530133.           1068
    ##  8 Australia                     492.             526406.           1069
    ##  9 Portugal                      489.             521308.           1066
    ## 10 Netherlands                   481.             515853.           1073
    ## 11 Germany                       429.             463402.           1081
    ## 12 Belgium                       420.             451884.           1075
    ## 13 Czech Republic                411.             438662.           1068
    ## 14 Italy                         389.             422919.           1086
    ## 15 United Kingdom                362.             390001.           1077
    ## 16 Slovakia                      321.             341265.           1062
    ## 17 Serbia                        318.             337606.           1061
    ## 18 United States                 303.             326244.           1077
    ## 19 Chile                         288.             306568.           1064
    ## 20 Norway                        274.             295126.           1076

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
    ##  4 Somalia               4.98       1361    27322
    ##  5 Peru                  4.89     219228  4483036
    ##  6 Egypt                 4.81      24809   515698
    ##  7 Mexico                4.50     332483  7390902
    ##  8 Afghanistan           3.78       7896   208985
    ##  9 Ecuador               3.42      35965  1052007
    ## 10 Niger                 3.31        315     9512
    ## 11 Myanmar               3.07      19490   633866
    ## 12 Malawi                3.03       2686    88503
    ## 13 Bulgaria              2.95      38194  1295870
    ## 14 Paraguay              2.70      19830   734176
    ## 15 Tunisia               2.55      29312  1150477
    ## 16 Algeria               2.54       6881   271406
    ## 17 Chad                  2.54        194     7652
    ## 18 South Africa          2.53     102595  4057134
    ## 19 Haiti                 2.52        860    34076
    ## 20 Sri Lanka             2.50      16829   672009

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7330.     219228   29.9 
    ##  2 Bulgaria               5343.      38194    7.15
    ##  3 Hungary                4871.      48623    9.98
    ##  4 Czech Republic         4042.      42348   10.5 
    ##  5 Slovakia               3846.      20982    5.46
    ##  6 Chile                  3818.      63941   16.7 
    ##  7 United States          3547.    1100421  310.  
    ##  8 Brazil                 3469.     697583  201.  
    ##  9 United Kingdom         3297.     205540   62.3 
    ## 10 Greece                 3269.      35957   11   
    ## 11 Belgium                3231.      33616   10.4 
    ## 12 Argentina              3155.     130437   41.3 
    ## 13 Paraguay               3110.      19830    6.38
    ## 14 Italy                  3108.     187551   60.3 
    ## 15 Poland                 3085.     118779   38.5 
    ## 16 Romania                3081.      67650   22.0 
    ## 17 Colombia               2983.     142544   47.8 
    ## 18 Mexico                 2956.     332483  112.  
    ## 19 Russia                 2811.     395581  141.  
    ## 20 Tunisia                2768.      29312   10.6

EOL
