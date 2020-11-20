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

Updated: 2020-11-21

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
    ##  1 United States           43398. 11413788            263
    ##  2 India                   35874.  9004365            251
    ##  3 Brazil                  23501.  5945849            253
    ##  4 Russia                   8258.  2039926            247
    ##  5 France                   7760.  2048857            264
    ##  6 Spain                    5861.  1541574            263
    ##  7 United Kingdom           5546.  1453260            262
    ##  8 Argentina                5400.  1339337            248
    ##  9 Colombia                 4931.  1218003            247
    ## 10 Italy                    4828.  1308528            271
    ## 11 Mexico                   4109.  1015071            247
    ## 12 Peru                     3798.   941951            248
    ## 13 Germany                  3319.   879564            265
    ## 14 Poland                   3174.   796798            251
    ## 15 South Africa             3063.   759658            248
    ## 16 Iran                     3030.   815117            269
    ## 17 Ukraine                  2481.   598085            241
    ## 18 Chile                    2152.   536012            249
    ## 19 Iraq                     2108.   529226            251
    ## 20 Belgium                  2107.   550168            261

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      203.               52886.            261
    ##  2 Czech Republic               182.               45987.            253
    ##  3 Israel                       175.               44299.            253
    ##  4 Switzerland                  143.               37536.            263
    ##  5 United States                140.               36791.            263
    ##  6 Argentina                    131.               32396.            248
    ##  7 Chile                        129.               32007.            249
    ##  8 Peru                         127.               31496.            248
    ##  9 Spain                        126.               33148.            263
    ## 10 France                       120.               31634.            264
    ## 11 Brazil                       117.               29566.            253
    ## 12 Jordan                       109.               26439.            243
    ## 13 Netherlands                  108.               28038.            259
    ## 14 Austria                      108.               27795.            257
    ## 15 Colombia                     103.               25487.            247
    ## 16 Portugal                      90.3              22762.            252
    ## 17 United Kingdom                89.0              23309.            262
    ## 18 Poland                        82.4              20696.            251
    ## 19 Sweden                        81.5              21040.            258
    ## 20 Italy                         80.0              21686.            271

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         605     2072
    ##  2 Mexico                  9.81      99528  1015071
    ##  3 Sudan                   7.71       1179    15299
    ##  4 Ecuador                 7.13      13073   183246
    ##  5 Chad                    6.23        101     1620
    ##  6 Bolivia                 6.18       8875   143569
    ##  7 Egypt                   5.81       6508   111955
    ##  8 Iran                    5.33      43417   815117
    ##  9 Niger                   5.24         70     1335
    ## 10 Syria                   5.19        363     6991
    ## 11 China                   5.13       4749    92544
    ## 12 Tanzania                4.13         21      509
    ## 13 Peru                    3.76      35402   941951
    ## 14 Afghanistan             3.73       1650    44228
    ## 15 United Kingdom          3.70      53775  1453260
    ## 16 Italy                   3.66      47870  1308528
    ## 17 Canada                  3.60      11186   311109
    ## 18 Nicaragua               3.47        159     4583
    ## 19 Mali                    3.47        142     4093
    ## 20 Guatemala               3.46       4050   117066

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1461.      15196   10.4 
    ##  2 Peru                   1184.      35402   29.9 
    ##  3 Spain                   909.      42291   46.5 
    ##  4 Chile                   893.      14955   16.7 
    ##  5 Bolivia                 892.       8875    9.95
    ##  6 Mexico                  885.      99528  112.  
    ##  7 Ecuador                 884.      13073   14.8 
    ##  8 Argentina               879.      36347   41.3 
    ##  9 United Kingdom          862.      53775   62.3 
    ## 10 Brazil                  833.     167455  201.  
    ## 11 United States           801.     248571  310.  
    ## 12 Italy                   793.      47870   60.3 
    ## 13 Colombia                723.      34563   47.8 
    ## 14 France                  722.      46780   64.8 
    ## 15 Sweden                  663.       6340    9.56
    ## 16 Czech Republic          656.       6874   10.5 
    ## 17 Iran                    564.      43417   76.9 
    ## 18 Netherlands             526.       8759   16.6 
    ## 19 Switzerland             456.       3456    7.58
    ## 20 Romania                 437.       9596   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
