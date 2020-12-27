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

Updated: 2020-12-28

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
    ##  1 United States           62163. 18648989            300
    ##  2 India                   35374. 10187850            288
    ##  3 Brazil                  25684.  7448560            290
    ##  4 Russia                  10740.  3050248            284
    ##  5 France                   8330.  2507532            301
    ##  6 United Kingdom           7545.  2256009            299
    ##  7 Italy                    6619.  2038759            308
    ##  8 Spain                    6183.  1854951            300
    ##  9 Colombia                 5544.  1574707            284
    ## 10 Argentina                5524.  1574554            285
    ## 11 Germany                  5433.  1640858            302
    ## 12 Mexico                   4831.  1372243            284
    ## 13 Turkey                   4644.  1319035            284
    ## 14 Poland                   4367.  1257799            288
    ## 15 Iran                     3905.  1194963            306
    ## 16 Ukraine                  3690.  1025989            278
    ## 17 Peru                     3528.  1005546            285
    ## 18 South Africa             3490.   994911            285
    ## 19 Netherlands              2547.   754171            296
    ## 20 Indonesia                2454.   706837            288

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                221.              64013.            290
    ##  2 Belgium                       206.              61331.            298
    ##  3 United States                 200.              60113.            300
    ##  4 Switzerland                   187.              56219.            300
    ##  5 Israel                        180.              52178.            289
    ##  6 Jordan                        160.              44694.            280
    ##  7 Serbia                        156.              44026.            283
    ##  8 Netherlands                   153.              45309.            296
    ##  9 Austria                       144.              42457.            294
    ## 10 Sweden                        140.              41445.            295
    ## 11 Argentina                     134.              38085.            285
    ## 12 Spain                         133.              39886.            300
    ## 13 France                        129.              38715.            301
    ## 14 Brazil                        128.              37038.            290
    ## 15 Portugal                      127.              36811.            289
    ## 16 Chile                         125.              35733.            286
    ## 17 United Kingdom                121.              36184.            299
    ## 18 Peru                          118.              33622.            285
    ## 19 Colombia                      116.              32951.            284
    ## 20 Poland                        113.              32670.            288

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.0         607     2096
    ##  2 Mexico                                    8.88     121837  1372243
    ##  3 Ecuador                                   6.69      13990   209274
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.12        669    10932
    ##  6 Bolivia                                   5.91       9083   153590
    ##  7 Egypt                                     5.60       7352   131315
    ##  8 Chad                                      5.19        103     1986
    ##  9 China                                     4.96       4777    96324
    ## 10 Iran                                      4.57      54574  1194963
    ## 11 Afghanistan                               4.16       2158    51848
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Mali                                      3.79        249     6574
    ## 14 Peru                                      3.72      37368  1005546
    ## 15 Bulgaria                                  3.61       7123   197384
    ## 16 Guatemala                                 3.52       4763   135171
    ## 17 Italy                                     3.51      71620  2038759
    ## 18 Democratic Republic of the Congo          3.48        566    16280
    ## 19 Nicaragua                                 3.42        164     4790
    ## 20 Tunisia                                   3.40       4426   130230

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1842.      19158   10.4 
    ##  2 Peru                   1249.      37368   29.9 
    ##  3 Italy                  1187.      71620   60.3 
    ##  4 United Kingdom         1129.      70405   62.3 
    ##  5 Mexico                 1083.     121837  112.  
    ##  6 Spain                  1071.      49824   46.5 
    ##  7 United States          1057.     328014  310.  
    ##  8 Czech Republic         1054.      11044   10.5 
    ##  9 Argentina              1026.      42422   41.3 
    ## 10 Bulgaria                996.       7123    7.15
    ## 11 Chile                   980.      16404   16.7 
    ## 12 France                  960.      62197   64.8 
    ## 13 Brazil                  947.     190488  201.  
    ## 14 Ecuador                 946.      13990   14.8 
    ## 15 Bolivia                 913.       9083    9.95
    ## 16 Hungary                 906.       9047    9.98
    ## 17 Colombia                872.      41690   47.8 
    ## 18 Sweden                  866.       8279    9.56
    ## 19 Switzerland             858.       6508    7.58
    ## 20 Iran                    709.      54574   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
