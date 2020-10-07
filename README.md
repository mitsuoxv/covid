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

Updated: 2020-10-08

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
    ##  1 United States           33700.  7380326            219
    ##  2 India                   32643.  6757131            207
    ##  3 Brazil                  23575.  4927235            209
    ##  4 Russia                   6120.  1248619            204
    ##  5 Colombia                 4247.   862158            203
    ##  6 Peru                     4068.   829999            204
    ##  7 Argentina                3969.   809728            204
    ##  8 Spain                    3768.   825410            219
    ##  9 Mexico                   3768.   765082            203
    ## 10 South Africa             3349.   683242            204
    ## 11 France                   2741.   608537            222
    ## 12 United Kingdom           2431.   530117            218
    ## 13 Chile                    2308.   473306            205
    ## 14 Iran                     2132.   479825            225
    ## 15 Bangladesh               2008.   371631            185
    ## 16 Iraq                     1870.   387121            207
    ## 17 Saudi Arabia             1621.   337243            208
    ## 18 Turkey                   1605.   327557            204
    ## 19 Philippines              1578.   326833            207
    ## 20 Pakistan                 1539.   315727            205

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           179.               37185.            208
    ##  2 Chile                            138.               28263.            205
    ##  3 Peru                             136.               27753.            204
    ##  4 Brazil                           117.               24501.            209
    ##  5 United States                    109.               23790.            219
    ##  6 Argentina                         96.0              19586.            204
    ##  7 Colombia                          88.9              18041.            203
    ##  8 Spain                             81.0              17748.            219
    ##  9 Bolivia                           72.5              13783.            190
    ## 10 South Africa                      68.3              13944.            204
    ## 11 Iraq                              63.0              13047.            207
    ## 12 Saudi Arabia                      63.0              13106.            208
    ## 13 Belgium                           59.4              12900.            217
    ## 14 Dominican Republic                59.2              11744.            198
    ## 15 Honduras                          52.1              10016.            192
    ## 16 Kazakhstan                        47.3               9272.            196
    ## 17 Ecuador                           47.0               9604.            204
    ## 18 Sweden                            46.7              10061.            215
    ## 19 Kyrgyzstan                        45.6               8731.            191
    ## 20 Libya                             45.0               5953.            132

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         594     2051
    ##  2 Italy                  10.9       36030   330263
    ##  3 Mexico                 10.4       79268   765082
    ##  4 Ecuador                 8.24      11702   142056
    ##  5 United Kingdom          8.01      42445   530117
    ##  6 Belgium                 7.52      10092   134197
    ##  7 Chad                    7.11         88     1238
    ##  8 Sudan                   6.12        836    13653
    ##  9 Sweden                  6.12       5883    96145
    ## 10 Bolivia                 5.93       8129   137107
    ## 11 Egypt                   5.78       6001   103902
    ## 12 Niger                   5.75         69     1200
    ## 13 Iran                    5.71      27419   479825
    ## 14 Canada                  5.62       9504   168960
    ## 15 France                  5.28      32134   608537
    ## 16 China                   5.20       4746    91188
    ## 17 Syria                   4.69        209     4457
    ## 18 Netherlands             4.47       6473   144838
    ## 19 Tanzania                4.13         21      509
    ## 20 Mali                    4.10        131     3195

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1098.      32834   29.9 
    ##  2 Belgium                 970.      10092   10.4 
    ##  3 Bolivia                 817.       8129    9.95
    ##  4 Ecuador                 791.      11702   14.8 
    ##  5 Chile                   780.      13070   16.7 
    ##  6 Brazil                  729.     146675  201.  
    ##  7 Mexico                  705.      79268  112.  
    ##  8 Spain                   699.      32486   46.5 
    ##  9 United Kingdom          681.      42445   62.3 
    ## 10 United States           673.     208787  310.  
    ## 11 Sweden                  616.       5883    9.56
    ## 12 Italy                   597.      36030   60.3 
    ## 13 Colombia                562.      26844   47.8 
    ## 14 Argentina               519.      21468   41.3 
    ## 15 France                  496.      32134   64.8 
    ## 16 Netherlands             389.       6473   16.6 
    ## 17 Iran                    356.      27419   76.9 
    ## 18 South Africa            349.      17103   49   
    ## 19 Iraq                    321.       9531   29.7 
    ## 20 Honduras                305.       2433    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
