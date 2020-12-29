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

Updated: 2020-12-30

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
    ##  1 United States           62824. 18972813            302
    ##  2 India                   35256. 10224303            290
    ##  3 Brazil                  25631.  7484285            292
    ##  4 Russia                  10856.  3105037            286
    ##  5 France                   8313.  2519105            303
    ##  6 United Kingdom           7740.  2329734            301
    ##  7 Italy                    6633.  2056277            310
    ##  8 Spain                    6223.  1879413            302
    ##  9 Colombia                 5575.  1594497            286
    ## 10 Argentina                5519.  1583927            287
    ## 11 Germany                  5476.  1664726            304
    ## 12 Mexico                   4837.  1383434            286
    ## 13 Turkey                   4714.  1348437            286
    ## 14 Poland                   4374.  1268634            290
    ## 15 Iran                     3916.  1206373            308
    ## 16 Ukraine                  3704.  1037362            280
    ## 17 South Africa             3525.  1011871            287
    ## 18 Peru                     3510.  1007657            287
    ## 19 Netherlands              2586.   770732            298
    ## 20 Indonesia                2480.   719219            290

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                224.              65407.            292
    ##  2 Belgium                       205.              61495.            300
    ##  3 United States                 203.              61157.            302
    ##  4 Switzerland                   190.              57538.            302
    ##  5 Israel                        179.              52178.            291
    ##  6 Jordan                        160.              45223.            282
    ##  7 Serbia                        157.              44741.            285
    ##  8 Netherlands                   155.              46304.            298
    ##  9 Austria                       145.              42826.            296
    ## 10 Sweden                        139.              41445.            297
    ## 11 Spain                         134.              40412.            302
    ## 12 Argentina                     133.              38312.            287
    ## 13 France                        128.              38894.            303
    ## 14 Portugal                      128.              37155.            291
    ## 15 Brazil                        127.              37216.            292
    ## 16 Chile                         125.              35950.            288
    ## 17 United Kingdom                124.              37366.            301
    ## 18 Peru                          117.              33693.            287
    ## 19 Colombia                      117.              33365.            286
    ## 20 Poland                        114.              32952.            290

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29           609     2100
    ##  2 Mexico                                    8.85     122426  1383434
    ##  3 Ecuador                                   6.67      13994   209758
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.16        686    11138
    ##  6 Bolivia                                   5.88       9098   154843
    ##  7 Egypt                                     5.58       7466   133900
    ##  8 Chad                                      5.16        104     2015
    ##  9 China                                     4.95       4782    96513
    ## 10 Iran                                      4.54      54814  1206373
    ## 11 Afghanistan                               4.18       2182    52147
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Mali                                      3.82        256     6703
    ## 14 Peru                                      3.72      37474  1007657
    ## 15 Bulgaria                                  3.66       7251   198053
    ## 16 Guatemala                                 3.52       4773   135441
    ## 17 Italy                                     3.52      72370  2056277
    ## 18 Democratic Republic of the Congo          3.44        579    16837
    ## 19 Greece                                    3.44       4672   135931
    ## 20 Nicaragua                                 3.42        164     4790

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1849.      19234   10.4 
    ##  2 Peru                   1253.      37474   29.9 
    ##  3 Italy                  1199.      72370   60.3 
    ##  4 United Kingdom         1141.      71109   62.3 
    ##  5 Mexico                 1089.     122426  112.  
    ##  6 Czech Republic         1079.      11302   10.5 
    ##  7 Spain                  1078.      50122   46.5 
    ##  8 United States          1066.     330644  310.  
    ##  9 Argentina              1032.      42650   41.3 
    ## 10 Bulgaria               1014.       7251    7.15
    ## 11 Chile                   982.      16443   16.7 
    ## 12 France                  969.      62732   64.8 
    ## 13 Brazil                  950.     191139  201.  
    ## 14 Ecuador                 946.      13994   14.8 
    ## 15 Hungary                 931.       9292    9.98
    ## 16 Bolivia                 915.       9098    9.95
    ## 17 Switzerland             891.       6751    7.58
    ## 18 Colombia                882.      42171   47.8 
    ## 19 Sweden                  866.       8279    9.56
    ## 20 Austria                 716.       5872    8.20

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
