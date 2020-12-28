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

Updated: 2020-12-29

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
    ##  1 United States           62549. 18827300            301
    ##  2 India                   35321. 10207871            289
    ##  3 Brazil                  25655.  7465806            291
    ##  4 Russia                  10800.  3078035            285
    ##  5 France                   8332.  2516348            302
    ##  6 United Kingdom           7627.  2288349            300
    ##  7 Italy                    6626.  2047696            309
    ##  8 Spain                    6162.  1854951            301
    ##  9 Colombia                 5561.  1584903            285
    ## 10 Argentina                5518.  1578267            286
    ## 11 Germany                  5451.  1651834            303
    ## 12 Mexico                   4832.  1377217            285
    ## 13 Turkey                   4677.  1333240            285
    ## 14 Poland                   4363.  1261010            289
    ## 15 Iran                     3910.  1200465            307
    ## 16 Ukraine                  3693.  1030374            279
    ## 17 Peru                     3518.  1006318            286
    ## 18 South Africa             3512.  1004413            286
    ## 19 Netherlands              2570.   763279            297
    ## 20 Indonesia                2468.   713365            289

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                221.              64370.            291
    ##  2 Belgium                       205.              61413.            299
    ##  3 United States                 202.              60688.            301
    ##  4 Switzerland                   187.              56219.            301
    ##  5 Israel                        180.              52178.            290
    ##  6 Jordan                        160.              44942.            281
    ##  7 Serbia                        156.              44393.            284
    ##  8 Netherlands                   154.              45856.            297
    ##  9 Austria                       144.              42625.            295
    ## 10 Sweden                        140.              41445.            296
    ## 11 Argentina                     133.              38175.            286
    ## 12 Spain                         133.              39886.            301
    ## 13 France                        129.              38851.            302
    ## 14 Brazil                        128.              37124.            291
    ## 15 Portugal                      127.              36959.            290
    ## 16 Chile                         125.              35835.            287
    ## 17 United Kingdom                122.              36703.            300
    ## 18 Peru                          118.              33648.            286
    ## 19 Colombia                      116.              33164.            285
    ## 20 Poland                        113.              32754.            289

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.0         608     2098
    ##  2 Mexico                                    8.86     122026  1377217
    ##  3 Ecuador                                   6.68      13992   209355
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.15        678    11033
    ##  6 Bolivia                                   5.89       9093   154349
    ##  7 Egypt                                     5.59       7405   132541
    ##  8 Chad                                      5.19        103     1986
    ##  9 China                                     4.96       4778    96417
    ## 10 Iran                                      4.56      54693  1200465
    ## 11 Afghanistan                               4.17       2170    52007
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Mali                                      3.82        253     6629
    ## 14 Peru                                      3.72      37414  1006318
    ## 15 Bulgaria                                  3.62       7164   197716
    ## 16 Guatemala                                 3.52       4768   135309
    ## 17 Italy                                     3.51      71925  2047696
    ## 18 Democratic Republic of the Congo          3.48        566    16280
    ## 19 Nicaragua                                 3.42        164     4790
    ## 20 Greece                                    3.40       4606   135456

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1846.      19200   10.4 
    ##  2 Peru                   1251.      37414   29.9 
    ##  3 Italy                  1192.      71925   60.3 
    ##  4 United Kingdom         1135.      70752   62.3 
    ##  5 Mexico                 1085.     122026  112.  
    ##  6 Spain                  1071.      49824   46.5 
    ##  7 Czech Republic         1065.      11152   10.5 
    ##  8 United States          1061.     329310  310.  
    ##  9 Argentina              1028.      42501   41.3 
    ## 10 Bulgaria               1002.       7164    7.15
    ## 11 Chile                   982.      16443   16.7 
    ## 12 France                  963.      62370   64.8 
    ## 13 Brazil                  949.     190795  201.  
    ## 14 Ecuador                 946.      13992   14.8 
    ## 15 Hungary                 918.       9161    9.98
    ## 16 Bolivia                 914.       9093    9.95
    ## 17 Colombia                878.      41943   47.8 
    ## 18 Sweden                  866.       8279    9.56
    ## 19 Switzerland             858.       6508    7.58
    ## 20 Iran                    711.      54693   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
