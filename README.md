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

Updated: 2020-11-25

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
    ##  1 United States           45392. 12119654            267
    ##  2 India                   35991.  9177840            255
    ##  3 Brazil                  23624.  6071401            257
    ##  4 Russia                   8521.  2138828            251
    ##  5 France                   7860.  2106660            268
    ##  6 Spain                    5830.  1556730            267
    ##  7 United Kingdom           5742.  1527499            266
    ##  8 Argentina                5438.  1370366            252
    ##  9 Italy                    5206.  1431795            275
    ## 10 Colombia                 4973.  1248417            251
    ## 11 Mexico                   4150.  1041875            251
    ## 12 Peru                     3768.   949670            252
    ## 13 Germany                  3504    942687            269
    ## 14 Poland                   3436.   876333            255
    ## 15 Iran                     3175.   866821            273
    ## 16 South Africa             3054.   769759            252
    ## 17 Ukraine                  2644.   647976            245
    ## 18 Chile                    2142.   542080            253
    ## 19 Belgium                  2112.   559806            265
    ## 20 Iraq                     2107.   537457            255

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      203.               53812.            265
    ##  2 Czech Republic               184.               47407.            257
    ##  3 Israel                       175.               44777.            256
    ##  4 Switzerland                  148.               39463.            267
    ##  5 United States                146.               39066.            267
    ##  6 Argentina                    132.               33146.            252
    ##  7 Chile                        128.               32370.            253
    ##  8 Peru                         126.               31754.            252
    ##  9 Spain                        125.               33474.            267
    ## 10 France                       121.               32526.            268
    ## 11 Jordan                       119.               29407.            247
    ## 12 Brazil                       117.               30190.            257
    ## 13 Austria                      116.               30373.            261
    ## 14 Netherlands                  112.               29392.            263
    ## 15 Colombia                     104.               26123.            251
    ## 16 Portugal                      96.8              24803.            256
    ## 17 United Kingdom                92.1              24499.            266
    ## 18 Poland                        89.3              22762.            255
    ## 19 Italy                         86.3              23729.            275
    ## 20 Sweden                        83.1              21798.            262

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         605     2076
    ##  2 Mexico                  9.76     101676  1041875
    ##  3 Sudan                   7.32       1202    16431
    ##  4 Ecuador                 7.11      13225   185944
    ##  5 Bolivia                 6.19       8907   143978
    ##  6 Chad                    6.13        101     1648
    ##  7 Egypt                   5.79       6560   113381
    ##  8 Iran                    5.22      45255   866821
    ##  9 Syria                   5.21        380     7295
    ## 10 China                   5.12       4749    92829
    ## 11 Niger                   5.07         70     1381
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.77       1695    44988
    ## 14 Peru                    3.75      35595   949670
    ## 15 United Kingdom          3.62      55230  1527499
    ## 16 Italy                   3.52      50453  1431795
    ## 17 Nicaragua               3.47        159     4583
    ## 18 Canada                  3.47      11455   330503
    ## 19 Guatemala               3.45       4092   118722
    ## 20 Mali                    3.37        146     4326

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1514.      15755   10.4 
    ##  2 Peru                   1190.      35595   29.9 
    ##  3 Spain                   916.      42619   46.5 
    ##  4 Mexico                  904.     101676  112.  
    ##  5 Chile                   902.      15106   16.7 
    ##  6 Bolivia                 895.       8907    9.95
    ##  7 Argentina               895.      37002   41.3 
    ##  8 Ecuador                 894.      13225   14.8 
    ##  9 United Kingdom          886.      55230   62.3 
    ## 10 Brazil                  841.     169183  201.  
    ## 11 Italy                   836.      50453   60.3 
    ## 12 United States           821.     254798  310.  
    ## 13 France                  755.      48883   64.8 
    ## 14 Colombia                738.      35287   47.8 
    ## 15 Czech Republic          703.       7360   10.5 
    ## 16 Sweden                  670.       6406    9.56
    ## 17 Iran                    588.      45255   76.9 
    ## 18 Netherlands             537.       8933   16.6 
    ## 19 Switzerland             499.       3780    7.58
    ## 20 Romania                 463.      10177   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
