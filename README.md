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

Updated: 2023-02-10

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
    ##  1 United States           94326. 101211478           1073
    ##  2 China                   88306.  98726098           1118
    ##  3 India                   42075.  44683748           1062
    ##  4 France                  35767.  38449944           1075
    ##  5 Germany                 35171.  37879714           1077
    ##  6 Brazil                  34767.  36887991           1061
    ##  7 Japan                   30301.  32846656           1084
    ##  8 South Korea             27937.  30311979           1085
    ##  9 Italy                   23556.  25488166           1082
    ## 10 United Kingdom          22641.  24293752           1073
    ## 11 Russia                  20827.  22035133           1058
    ## 12 Turkey                  16072.  17004677           1058
    ## 13 Spain                   12794.  13740531           1074
    ## 14 Vietnam                 10936.  11526610           1054
    ## 15 Australia               10619.  11309388           1065
    ## 16 Argentina                9436.  10040329           1064
    ## 17 Netherlands              8031.   8585025           1069
    ## 18 Iran                     7005.   7565025           1080
    ## 19 Mexico                   6946.   7390902           1064
    ## 20 Indonesia                6339.   6732179           1062

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       664.             708435.           1067
    ##  2 Israel                        612.             651357.           1065
    ##  3 Denmark                       582.             620154.           1066
    ##  4 South Korea                   577.             625988.           1085
    ##  5 France                        552.             593653.           1075
    ##  6 Switzerland                   539.             578744.           1073
    ##  7 Australia                     494.             525633.           1065
    ##  8 Portugal                      491.             521256.           1062
    ##  9 Greece                        489.             520338.           1064
    ## 10 Netherlands                   482.             515772.           1069
    ## 11 Germany                       430.             463064.           1077
    ## 12 Belgium                       421.             451351.           1071
    ## 13 Czech Republic                412.             438519.           1064
    ## 14 Italy                         390.             422407.           1082
    ## 15 United Kingdom                363.             389645.           1073
    ## 16 Slovakia                      323.             341225.           1058
    ## 17 Serbia                        319.             337268.           1057
    ## 18 United States                 304.             326244.           1073
    ## 19 Chile                         289.             306459.           1060
    ## 20 Norway                        275.             295102.           1072

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
    ##  5 Peru                  4.89     219214  4482852
    ##  6 Egypt                 4.81      24807   515666
    ##  7 Mexico                4.50     332483  7390902
    ##  8 Afghanistan           3.78       7896   208771
    ##  9 Ecuador               3.42      35965  1052007
    ## 10 Niger                 3.31        315     9510
    ## 11 Myanmar               3.07      19490   633859
    ## 12 Malawi                3.04       2686    88462
    ## 13 Bulgaria              2.95      38191  1295748
    ## 14 Paraguay              2.70      19830   734176
    ## 15 Tunisia               2.55      29312  1150477
    ## 16 Algeria               2.54       6881   271395
    ## 17 Chad                  2.54        194     7652
    ## 18 South Africa          2.53     102595  4055656
    ## 19 Haiti                 2.52        860    34076
    ## 20 Sri Lanka             2.50      16828   672004

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7330.     219214   29.9 
    ##  2 Bulgaria               5342.      38191    7.15
    ##  3 Hungary                4869.      48603    9.98
    ##  4 Czech Republic         4041.      42338   10.5 
    ##  5 Slovakia               3845.      20973    5.46
    ##  6 Chile                  3817.      63919   16.7 
    ##  7 United States          3547.    1100421  310.  
    ##  8 Brazil                 3469.     697533  201.  
    ##  9 United Kingdom         3286.     204898   62.3 
    ## 10 Greece                 3257.      35822   11   
    ## 11 Belgium                3228.      33582   10.4 
    ## 12 Argentina              3155.     130437   41.3 
    ## 13 Paraguay               3110.      19830    6.38
    ## 14 Italy                  3104.     187272   60.3 
    ## 15 Poland                 3085.     118767   38.5 
    ## 16 Romania                3079.      67619   22.0 
    ## 17 Colombia               2983.     142544   47.8 
    ## 18 Mexico                 2956.     332483  112.  
    ## 19 Russia                 2811.     395447  141.  
    ## 20 Tunisia                2768.      29312   10.6

EOL
