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

Updated: 2020-12-05

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
    ##  1 United States           49673. 13759500            277
    ##  2 India                   36119.  9571559            265
    ##  3 Brazil                  24107.  6436650            267
    ##  4 Russia                   9206.  2402949            261
    ##  5 France                   7978.  2217873            278
    ##  6 United Kingdom           6065.  1674138            276
    ##  7 Spain                    6050.  1675902            277
    ##  8 Italy                    5841.  1664829            285
    ##  9 Argentina                5496.  1440103            262
    ## 10 Colombia                 5111.  1334089            261
    ## 11 Mexico                   4343.  1133613            261
    ## 12 Germany                  4051.  1130237            279
    ## 13 Poland                   3881.  1028610            265
    ## 14 Peru                     3691.   967075            262
    ## 15 Iran                     3545.  1003494            283
    ## 16 Ukraine                  3089.   787891            255
    ## 17 South Africa             3056.   800872            262
    ## 18 Belgium                  2126.   584754            275
    ## 19 Chile                    2111.   555406            263
    ## 20 Iraq                     2108.   558767            265

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      204.               56210.            275
    ##  2 Czech Republic               192.               51323.            267
    ##  3 Israel                       174.               46227.            266
    ##  4 Switzerland                  161.               44682.            277
    ##  5 United States                160.               44352.            277
    ##  6 Jordan                       140.               36091.            257
    ##  7 Argentina                    133.               34833.            262
    ##  8 Austria                      131.               35519.            271
    ##  9 Spain                        130.               36036.            277
    ## 10 Chile                        126.               33166.            263
    ## 11 Peru                         123.               32336.            262
    ## 12 France                       123.               34243.            278
    ## 13 Brazil                       120.               32007.            267
    ## 14 Netherlands                  118.               32286.            273
    ## 15 Portugal                     108.               28814.            266
    ## 16 Colombia                     107.               27916.            261
    ## 17 Sweden                       105.               28531.            272
    ## 18 Serbia                       104.               27115.            260
    ## 19 Poland                       101.               26717.            265
    ## 20 United Kingdom                97.3              26851.            276

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         607     2081
    ##  2 Mexico                  9.49     107565  1133613
    ##  3 Ecuador                 6.95      13612   195884
    ##  4 Sudan                   6.86       1271    18535
    ##  5 Bolivia                 6.19       8972   144994
    ##  6 Chad                    5.97        102     1708
    ##  7 Egypt                   5.73       6713   117156
    ##  8 Syria                   5.30        432     8147
    ##  9 China                   5.06       4752    93905
    ## 10 Iran                    4.92      49348  1003494
    ## 11 Niger                   4.63         76     1640
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.90       1841    47258
    ## 14 Peru                    3.73      36076   967075
    ## 15 United Kingdom          3.59      60113  1674138
    ## 16 Italy                   3.49      58038  1664829
    ## 17 Nicaragua               3.45        161     4671
    ## 18 Guatemala               3.39       4209   124053
    ## 19 Tunisia                 3.38       3359    99280
    ## 20 Mali                    3.32        162     4880

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1637.      17033   10.4 
    ##  2 Peru                   1206.      36076   29.9 
    ##  3 Spain                   990.      46038   46.5 
    ##  4 United Kingdom          964.      60113   62.3 
    ##  5 Italy                   962.      58038   60.3 
    ##  6 Mexico                  956.     107565  112.  
    ##  7 Argentina               947.      39156   41.3 
    ##  8 Chile                   927.      15519   16.7 
    ##  9 Ecuador                 920.      13612   14.8 
    ## 10 Bolivia                 902.       8972    9.95
    ## 11 United States           874.     271233  310.  
    ## 12 Brazil                  868.     174515  201.  
    ## 13 France                  830.      53779   64.8 
    ## 14 Czech Republic          825.       8641   10.5 
    ## 15 Colombia                777.      37117   47.8 
    ## 16 Sweden                  733.       7007    9.56
    ## 17 Iran                    642.      49348   76.9 
    ## 18 Bulgaria                630.       4503    7.15
    ## 19 Switzerland             624.       4732    7.58
    ## 20 Netherlands             574.       9552   16.6

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
