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

Updated: 2021-01-01

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
    ##  1 United States           63640. 19346790            304
    ##  2 India                   35159. 10266674            292
    ##  3 Brazil                  25726.  7563551            294
    ##  4 Russia                  10969.  3159297            288
    ##  5 France                   8382.  2556708            305
    ##  6 United Kingdom           8029.  2432892            303
    ##  7 Italy                    6678.  2083689            312
    ##  8 Spain                    6228.  1893502            304
    ##  9 Germany                  5620.  1719737            306
    ## 10 Colombia                 5607.  1614822            288
    ## 11 Argentina                5543.  1602163            289
    ## 12 Mexico                   4866.  1401529            288
    ## 13 Turkey                   4791.  1379934            288
    ## 14 Poland                   4434.  1294878            292
    ## 15 Iran                     3931   1218753            310
    ## 16 Ukraine                  3741.  1055047            282
    ## 17 South Africa             3595.  1039161            289
    ## 18 Peru                     3496.  1010496            289
    ## 19 Netherlands              2626.   787797            300
    ## 20 Indonesia                2517.   735124            292

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                233.              68601.            294
    ##  2 United States                 205.              62362.            304
    ##  3 Belgium                       205.              61928.            302
    ##  4 Switzerland                   193.              58794.            304
    ##  5 Israel                        189.              55518.            293
    ##  6 Jordan                        161.              45741.            284
    ##  7 Serbia                        159.              45609.            287
    ##  8 Netherlands                   158.              47329.            300
    ##  9 Sweden                        153.              45771.            299
    ## 10 Austria                       146.              43431.            298
    ## 11 Argentina                     134.              38753.            289
    ## 12 Spain                         134.              40715.            304
    ## 13 Portugal                      130.              38034.            293
    ## 14 France                        129.              39475.            305
    ## 15 United Kingdom                129.              39021.            303
    ## 16 Brazil                        128.              37610.            294
    ## 17 Chile                         125.              36184.            290
    ## 18 Colombia                      117.              33790.            288
    ## 19 Peru                          117.              33788.            289
    ## 20 Poland                        115.              33633.            292

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.1         611     2101
    ##  2 Mexico                                    8.84     123845  1401529
    ##  3 Ecuador                                   6.63      14023   211512
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.21        704    11344
    ##  6 Bolivia                                   5.82       9135   156887
    ##  7 Egypt                                     5.54       7576   136644
    ##  8 Chad                                      5.01        104     2077
    ##  9 China                                     4.95       4788    96673
    ## 10 Iran                                      4.52      55095  1218753
    ## 11 Afghanistan                               4.18       2189    52330
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Mali                                      3.83        269     7029
    ## 14 Bulgaria                                  3.73       7515   201220
    ## 15 Peru                                      3.72      37574  1010496
    ## 16 Italy                                     3.53      73604  2083689
    ## 17 Guatemala                                 3.50       4803   137166
    ## 18 Greece                                    3.47       4788   137918
    ## 19 Nicaragua                                 3.42        165     4829
    ## 20 Democratic Republic of the Congo          3.40        584    17180

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1869.      19441   10.4 
    ##  2 Peru                   1256.      37574   29.9 
    ##  3 Italy                  1220.      73604   60.3 
    ##  4 United Kingdom         1164.      72548   62.3 
    ##  5 Czech Republic         1105.      11580   10.5 
    ##  6 Mexico                 1101.     123845  112.  
    ##  7 Spain                  1085.      50442   46.5 
    ##  8 United States          1082.     335789  310.  
    ##  9 Bulgaria               1051.       7515    7.15
    ## 10 Argentina              1041.      43018   41.3 
    ## 11 France                  988.      64004   64.8 
    ## 12 Chile                   985.      16499   16.7 
    ## 13 Brazil                  958.     192681  201.  
    ## 14 Hungary                 955.       9537    9.98
    ## 15 Ecuador                 948.      14023   14.8 
    ## 16 Switzerland             920.       6972    7.58
    ## 17 Bolivia                 918.       9135    9.95
    ## 18 Sweden                  913.       8727    9.56
    ## 19 Colombia                892.      42620   47.8 
    ## 20 Austria                 742.       6086    8.20

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
