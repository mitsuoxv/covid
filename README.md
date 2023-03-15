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

Updated: 2023-03-16

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
Wednesdays

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
    ##  1 United States           92518. 102417985           1107
    ##  2 China                   86098.  99185059           1152
    ##  3 India                   40777.  44691956           1096
    ##  4 France                  35278.  39122892           1109
    ##  5 Germany                 34452.  38276190           1111
    ##  6 Brazil                  33868.  37085520           1095
    ##  7 Japan                   29818.  33336977           1118
    ##  8 South Korea             27401.  30662229           1119
    ##  9 Italy                   22964.  25627473           1116
    ## 10 United Kingdom          22063.  24423396           1107
    ## 11 Russia                  20563.  22454933           1092
    ## 12 Turkey                  15572.  17004677           1092
    ## 13 Spain                   12435.  13778467           1108
    ## 14 Vietnam                 10595.  11527054           1088
    ## 15 Australia               10355.  11380700           1099
    ## 16 Argentina                9148.  10044957           1098
    ## 17 Netherlands              7801.   8604733           1103
    ## 18 Mexico                   6823.   7492112           1098
    ## 19 Iran                     6801.   7575927           1114
    ## 20 Indonesia                6150.   6740031           1096

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       662.             728956.           1101
    ##  2 Israel                        595.             653615.           1099
    ##  3 South Korea                   566.             633221.           1119
    ##  4 Denmark                       564.             620902.           1100
    ##  5 France                        545.             604043.           1109
    ##  6 Switzerland                   524.             579646.           1107
    ##  7 Greece                        489.             537282.           1098
    ##  8 Australia                     481.             528947.           1099
    ##  9 Portugal                      476.             521907.           1096
    ## 10 Netherlands                   469.             516956.           1103
    ## 11 Germany                       421.             467911.           1111
    ## 12 Belgium                       412.             455577.           1105
    ## 13 Czech Republic                402.             441321.           1098
    ## 14 Italy                         381.             424716.           1116
    ## 15 United Kingdom                354.             391724.           1107
    ## 16 Slovakia                      313.             341770.           1092
    ## 17 Serbia                        312.             340935.           1091
    ## 18 United States                 298.             330133.           1107
    ## 19 Chile                         284.             311059.           1094
    ## 20 Spain                         267.             296273.           1108

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.87       5023    63853
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27324
    ##  5 Peru                  4.89     219587  4488259
    ##  6 Egypt                 4.81      24815   515792
    ##  7 Mexico                4.45     333243  7492112
    ##  8 Afghanistan           3.76       7881   209602
    ##  9 Ecuador               3.41      36015  1057608
    ## 10 Niger                 3.31        315     9513
    ## 11 Myanmar               3.07      19490   633967
    ## 12 Malawi                3.03       2686    88613
    ## 13 Bulgaria              2.95      38232  1298013
    ## 14 Paraguay              2.70      19880   735759
    ## 15 Tunisia               2.55      29345  1151333
    ## 16 Algeria               2.53       6881   271522
    ## 17 Chad                  2.53        194     7682
    ## 18 South Africa          2.52     102595  4068224
    ## 19 Haiti                 2.51        860    34202
    ## 20 Sri Lanka             2.50      16831   672047

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7342.     219587   29.9 
    ##  2 Bulgaria               5348.      38232    7.15
    ##  3 Hungary                4876.      48677    9.98
    ##  4 Czech Republic         4060.      42528   10.5 
    ##  5 Slovakia               3859.      21049    5.46
    ##  6 Chile                  3841.      64330   16.7 
    ##  7 United States          3588.    1113229  310.  
    ##  8 Brazil                 3477.     699310  201.  
    ##  9 United Kingdom         3343.     208458   62.3 
    ## 10 Greece                 3307.      36372   11   
    ## 11 Belgium                3250.      33814   10.4 
    ## 12 Argentina              3156.     130472   41.3 
    ## 13 Italy                  3125.     188538   60.3 
    ## 14 Paraguay               3118.      19880    6.38
    ## 15 Poland                 3093.     119072   38.5 
    ## 16 Romania                3086.      67773   22.0 
    ## 17 Colombia               2985.     142639   47.8 
    ## 18 Mexico                 2963.     333243  112.  
    ## 19 Russia                 2819.     396696  141.  
    ## 20 Tunisia                2771.      29345   10.6

EOL
