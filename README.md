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

Updated: 2020-11-30

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
    ##  1 United States           47572. 12939666            272
    ##  2 India                   36126.  9392919            260
    ##  3 Brazil                  23810.  6238350            262
    ##  4 Russia                   8864.  2269316            256
    ##  5 France                   7948.  2169811            273
    ##  6 Spain                    5986.  1628208            272
    ##  7 United Kingdom           5923.  1605176            271
    ##  8 Italy                    5587.  1564532            280
    ##  9 Argentina                5475.  1407277            257
    ## 10 Colombia                 5041.  1290510            256
    ## 11 Mexico                   4260.  1090675            256
    ## 12 Germany                  3805.  1042700            274
    ## 13 Poland                   3744.   973593            260
    ## 14 Peru                     3728.   958324            257
    ## 15 Iran                     3366.   935799            278
    ## 16 South Africa             3055.   785139            257
    ## 17 Ukraine                  2890.   722679            250
    ## 18 Chile                    2127.   548941            258
    ## 19 Belgium                  2127.   574352            270
    ## 20 Iraq                     2110.   548821            260

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      204.               55210.            270
    ##  2 Czech Republic               189.               49508.            262
    ##  3 Israel                       173.               45172.            261
    ##  4 Switzerland                  154.               41817.            272
    ##  5 United States                153.               41710.            272
    ##  6 Argentina                    132.               34039.            257
    ##  7 Jordan                       130.               32887.            252
    ##  8 Spain                        129.               35011.            272
    ##  9 Chile                        127.               32779.            258
    ## 10 Austria                      126.               33428.            266
    ## 11 Peru                         125.               32043.            257
    ## 12 France                       123.               33501.            273
    ## 13 Brazil                       118.               31021.            262
    ## 14 Netherlands                  115.               30802.            268
    ## 15 Colombia                     105.               27004.            256
    ## 16 Portugal                     104.               27230.            261
    ## 17 Poland                        97.3              25288.            260
    ## 18 United Kingdom                95.0              25745.            271
    ## 19 Sweden                        94.9              25443.            268
    ## 20 Italy                         92.6              25928.            280

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         605     2078
    ##  2 Mexico                  9.62     104873  1090675
    ##  3 Sudan                   7.10       1235    17404
    ##  4 Ecuador                 7.00      13371   190909
    ##  5 Bolivia                 6.19       8943   144494
    ##  6 Chad                    6.07        101     1663
    ##  7 Egypt                   5.75       6621   115183
    ##  8 Syria                   5.30        409     7715
    ##  9 China                   5.09       4750    93329
    ## 10 Iran                    5.07      47486   935799
    ## 11 Niger                   4.76         70     1472
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.81       1752    45966
    ## 14 Peru                    3.74      35839   958324
    ## 15 United Kingdom          3.62      58030  1605176
    ## 16 Italy                   3.47      54363  1564532
    ## 17 Nicaragua               3.46        160     4629
    ## 18 Guatemala               3.42       4161   121798
    ## 19 Tunisia                 3.32       3153    94980
    ## 20 Canada                  3.31      11894   359064

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1582.      16461   10.4 
    ##  2 Peru                   1198.      35839   29.9 
    ##  3 Spain                   960.      44668   46.5 
    ##  4 Mexico                  932.     104873  112.  
    ##  5 United Kingdom          931.      58030   62.3 
    ##  6 Argentina               924.      38216   41.3 
    ##  7 Chile                   915.      15322   16.7 
    ##  8 Ecuador                 904.      13371   14.8 
    ##  9 Italy                   901.      54363   60.3 
    ## 10 Bolivia                 899.       8943    9.95
    ## 11 Brazil                  855.     171974  201.  
    ## 12 United States           847.     262736  310.  
    ## 13 France                  799.      51767   64.8 
    ## 14 Czech Republic          769.       8054   10.5 
    ## 15 Colombia                758.      36214   47.8 
    ## 16 Sweden                  699.       6681    9.56
    ## 17 Iran                    617.      47486   76.9 
    ## 18 Netherlands             560.       9313   16.6 
    ## 19 Switzerland             559.       4236    7.58
    ## 20 Bulgaria                524.       3749    7.15

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
