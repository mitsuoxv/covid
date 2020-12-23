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

Updated: 2020-12-24

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
    ##  1 United States           60456. 17895109            296
    ##  2 India                   35560. 10099066            284
    ##  3 Brazil                  25397.  7263619            286
    ##  4 Russia                  10477.  2933753            280
    ##  5 France                   8244.  2448543            297
    ##  6 United Kingdom           7153.  2110318            295
    ##  7 Italy                    6504.  1977370            304
    ##  8 Spain                    6182.  1829903            296
    ##  9 Argentina                5505.  1547138            281
    ## 10 Colombia                 5421.  1518067            280
    ## 11 Germany                  5217.  1554920            298
    ## 12 Mexico                   4735.  1325915            280
    ## 13 Turkey                   4459.  1248622            280
    ## 14 Poland                   4320.  1226883            284
    ## 15 Iran                     3876.  1170743            302
    ## 16 Ukraine                  3611.   989642            274
    ## 17 Peru                     3553.   998475            281
    ## 18 South Africa             3346.   940212            281
    ## 19 Netherlands              2434.   710739            292
    ## 20 Indonesia                2387.   678125            284

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                216.              61695.            286
    ##  2 Belgium                       206.              60474.            294
    ##  3 United States                 195.              57683.            296
    ##  4 Switzerland                   186.              54926.            296
    ##  5 Israel                        181.              51693.            285
    ##  6 Jordan                        158.              43685.            276
    ##  7 Serbia                        150.              41911.            279
    ##  8 Netherlands                   146.              42700.            292
    ##  9 Austria                       143.              41430.            290
    ## 10 Sweden                        140.              40754.            291
    ## 11 Argentina                     133.              37422.            281
    ## 12 Spain                         133.              39348.            296
    ## 13 France                        127.              37805.            297
    ## 14 Brazil                        126.              36119.            286
    ## 15 Chile                         125.              35183.            282
    ## 16 Portugal                      124.              35468.            285
    ## 17 Peru                          119.              33386.            281
    ## 18 United Kingdom                115.              33847.            295
    ## 19 Colombia                      113.              31765.            280
    ## 20 Poland                        112.              31867.            284

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.0         607     2091
    ##  2 Mexico                                    8.94     118598  1325915
    ##  3 Ecuador                                   6.76      13949   206364
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.03        630    10442
    ##  6 Bolivia                                   6.01       9043   150385
    ##  7 Egypt                                     5.64       7167   127061
    ##  8 Chad                                      5.32        102     1916
    ##  9 China                                     4.97       4773    95998
    ## 10 Iran                                      4.61      54003  1170743
    ## 11 Tanzania                                  4.13         21      509
    ## 12 Afghanistan                               4.12       2105    51070
    ## 13 Peru                                      3.72      37173   998475
    ## 14 Democratic Republic of the Congo          3.61        566    15667
    ## 15 Mali                                      3.58        225     6291
    ## 16 Bulgaria                                  3.54       6879   194271
    ## 17 Italy                                     3.53      69842  1977370
    ## 18 Guatemala                                 3.53       4718   133601
    ## 19 Niger                                     3.47         82     2361
    ## 20 Tunisia                                   3.44       4237   123323

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1809.      18821   10.4 
    ##  2 Peru                   1243.      37173   29.9 
    ##  3 Italy                  1157.      69842   60.3 
    ##  4 United Kingdom         1096.      68307   62.3 
    ##  5 Spain                  1065.      49520   46.5 
    ##  6 Mexico                 1054.     118598  112.  
    ##  7 United States          1022.     317032  310.  
    ##  8 Czech Republic         1018.      10664   10.5 
    ##  9 Argentina              1016.      41997   41.3 
    ## 10 Chile                   968.      16217   16.7 
    ## 11 Bulgaria                962.       6879    7.15
    ## 12 France                  947.      61326   64.8 
    ## 13 Ecuador                 943.      13949   14.8 
    ## 14 Brazil                  931.     187291  201.  
    ## 15 Bolivia                 909.       9043    9.95
    ## 16 Hungary                 863.       8616    9.98
    ## 17 Sweden                  855.       8167    9.56
    ## 18 Colombia                851.      40680   47.8 
    ## 19 Switzerland             832.       6308    7.58
    ## 20 Iran                    702.      54003   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
