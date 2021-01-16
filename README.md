WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2021-01-17

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           72181. 23097938            320
    ##  2 India                   34230. 10542841            308
    ##  3 Brazil                  26852.  8324294            310
    ##  4 Russia                  11659.  3544623            304
    ##  5 United Kingdom          10395.  3316023            319
    ##  6 France                   8803.  2825764            321
    ##  7 Italy                    7172.  2352423            328
    ##  8 Spain                    6891.  2211967            321
    ##  9 Germany                  6272.  2019636            322
    ## 10 Colombia                 6082.  1849101            304
    ## 11 Argentina                5805.  1770715            305
    ## 12 Mexico                   5225.  1588369            304
    ## 13 Turkey                   5127.  1558777            304
    ## 14 Poland                   4641.  1429612            308
    ## 15 South Africa             4300.  1311686            305
    ## 16 Iran                     4043.  1318295            326
    ## 17 Ukraine                  3874.  1154692            298
    ## 18 Peru                     3438.  1048662            305
    ## 19 Indonesia                2865.   882418            308
    ## 20 Netherlands              2862.   901696            315

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                272.              84374.            310
    ##  2 United States                 233.              74454.            320
    ##  3 Israel                        230.              70974.            309
    ##  4 Belgium                       204.              64894.            318
    ##  5 Switzerland                   203.              65003.            320
    ##  6 Sweden                        174.              54781.            315
    ##  7 Netherlands                   172.              54172.            315
    ##  8 United Kingdom                167.              53185.            319
    ##  9 Serbia                        166.              50351.            303
    ## 10 Jordan                        163.              48829.            300
    ## 11 Portugal                      160.              49501.            309
    ## 12 Austria                       151.              47288.            314
    ## 13 Spain                         148.              47563.            321
    ## 14 Argentina                     140.              42830.            305
    ## 15 France                        136.              43629.            321
    ## 16 Slovakia                      134.              40834.            304
    ## 17 Brazil                        134.              41393.            310
    ## 18 Chile                         129.              39482.            306
    ## 19 Colombia                      127.              38692.            304
    ## 20 Poland                        121.              37133.            308

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         613     2115
    ##  2 Mexico               8.68     137916  1588369
    ##  3 Syria                6.36        817    12850
    ##  4 Ecuador              6.29      14273   226866
    ##  5 Sudan                6.13       1576    25730
    ##  6 Egypt                5.48       8473   154620
    ##  7 Bolivia              5.26       9530   181016
    ##  8 China                4.88       4803    98459
    ##  9 Afghanistan          4.33       2336    53938
    ## 10 Iran                 4.30      56621  1318295
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.00       8457   211503
    ## 13 Chad                 3.95        111     2807
    ## 14 Mali                 3.95        308     7800
    ## 15 Peru                 3.68      38564  1048662
    ## 16 Greece               3.67       5421   147860
    ## 17 Guatemala            3.51       5177   147560
    ## 18 Italy                3.46      81325  2352423
    ## 19 Nicaragua            3.40        167     4916
    ## 20 Niger                3.36        138     4105

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1956.      20352   10.4 
    ##  2 United Kingdom         1400.      87295   62.3 
    ##  3 Czech Republic         1357.      14215   10.5 
    ##  4 Italy                  1348.      81325   60.3 
    ##  5 Peru                   1289.      38564   29.9 
    ##  6 United States          1242.     385413  310.  
    ##  7 Mexico                 1226.     137916  112.  
    ##  8 Bulgaria               1183.       8457    7.15
    ##  9 Spain                  1141.      53079   46.5 
    ## 10 Hungary                1128.      11264    9.98
    ## 11 Argentina              1091.      45125   41.3 
    ## 12 Sweden                 1080.      10323    9.56
    ## 13 France                 1074.      69561   64.8 
    ## 14 Switzerland            1046.       7930    7.58
    ## 15 Chile                  1037.      17369   16.7 
    ## 16 Brazil                 1030.     207095  201.  
    ## 17 Colombia                994.      47491   47.8 
    ## 18 Ecuador                 965.      14273   14.8 
    ## 19 Bolivia                 958.       9530    9.95
    ## 20 Poland                  863.      33213   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
