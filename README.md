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

Updated: 2020-12-31

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
    ##  1 United States           63193. 19147627            303
    ##  2 India                   35205. 10244852            291
    ##  3 Brazil                  25613.  7504833            293
    ##  4 Russia                  10911.  3131550            287
    ##  5 France                   8323.  2530400            304
    ##  6 United Kingdom           7890.  2382869            302
    ##  7 Italy                    6647.  2067487            311
    ##  8 Spain                    6249.  1893502            303
    ##  9 Colombia                 5588.  1603807            287
    ## 10 Germany                  5531.  1687185            305
    ## 11 Argentina                5522.  1590513            288
    ## 12 Mexico                   4841.  1389430            287
    ## 13 Turkey                   4753.  1364242            287
    ## 14 Poland                   4403.  1281414            291
    ## 15 Iran                     3923.  1212481            309
    ## 16 Ukraine                  3720.  1045348            281
    ## 17 South Africa             3546.  1021451            288
    ## 18 Peru                     3503.  1008908            288
    ## 19 Netherlands              2603.   778293            299
    ## 20 Indonesia                2498.   727122            291

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                229.              66974.            293
    ##  2 Belgium                       205.              61656.            301
    ##  3 United States                 204.              61720.            303
    ##  4 Switzerland                   192.              58083.            303
    ##  5 Israel                        190.              55518.            292
    ##  6 Jordan                        161.              45480.            283
    ##  7 Serbia                        158.              45168.            286
    ##  8 Netherlands                   156.              46758.            299
    ##  9 Sweden                        150.              44845.            298
    ## 10 Austria                       145.              43050.            297
    ## 11 Spain                         134.              40715.            303
    ## 12 Argentina                     134.              38471.            288
    ## 13 France                        129.              39068.            304
    ## 14 Portugal                      128.              37467.            292
    ## 15 Brazil                        127.              37318.            293
    ## 16 United Kingdom                127.              38219.            302
    ## 17 Chile                         125.              36066.            289
    ## 18 Peru                          117.              33735.            288
    ## 19 Colombia                      117.              33559.            287
    ## 20 Poland                        114.              33283.            291

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.1         611     2100
    ##  2 Mexico                                    8.84     122855  1389430
    ##  3 Ecuador                                   6.66      14001   210326
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.19        696    11243
    ##  6 Bolivia                                   5.85       9106   155594
    ##  7 Egypt                                     5.56       7520   135233
    ##  8 Chad                                      5.16        104     2015
    ##  9 China                                     4.95       4784    96592
    ## 10 Iran                                      4.53      54946  1212481
    ## 11 Afghanistan                               4.18       2189    52330
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Mali                                      3.82        256     6703
    ## 14 Peru                                      3.72      37525  1008908
    ## 15 Bulgaria                                  3.71       7405   199491
    ## 16 Italy                                     3.53      73029  2067487
    ## 17 Guatemala                                 3.51       4781   136287
    ## 18 Greece                                    3.45       4730   136976
    ## 19 Democratic Republic of the Congo          3.45        584    16915
    ## 20 Nicaragua                                 3.42        165     4829

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1861.      19361   10.4 
    ##  2 Peru                   1255.      37525   29.9 
    ##  3 Italy                  1210.      73029   60.3 
    ##  4 United Kingdom         1148.      71567   62.3 
    ##  5 Mexico                 1092.     122855  112.  
    ##  6 Czech Republic         1091.      11429   10.5 
    ##  7 Spain                  1085.      50442   46.5 
    ##  8 United States          1072.     332423  310.  
    ##  9 Argentina              1037.      42868   41.3 
    ## 10 Bulgaria               1036.       7405    7.15
    ## 11 Chile                   985.      16488   16.7 
    ## 12 France                  984.      63701   64.8 
    ## 13 Brazil                  953.     191570  201.  
    ## 14 Ecuador                 947.      14001   14.8 
    ## 15 Hungary                 945.       9429    9.98
    ## 16 Bolivia                 915.       9106    9.95
    ## 17 Switzerland             908.       6882    7.58
    ## 18 Sweden                  888.       8484    9.56
    ## 19 Colombia                887.      42374   47.8 
    ## 20 Austria                 732.       6005    8.20

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
