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

Updated: 2020-12-25

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
    ##  1 United States           60910. 18090260            297
    ##  2 India                   35522. 10123778            285
    ##  3 Brazil                  25501.  7318821            287
    ##  4 Russia                  10546.  2963688            281
    ##  5 France                   8266.  2463379            298
    ##  6 United Kingdom           7262.  2149555            296
    ##  7 Italy                    6528.  1991278            305
    ##  8 Spain                    6203.  1842289            297
    ##  9 Argentina                5515.  1555279            282
    ## 10 Colombia                 5447.  1530593            281
    ## 11 Germany                  5308.  1587115            299
    ## 12 Mexico                   4763.  1338426            281
    ## 13 Turkey                   4513.  1268272            281
    ## 14 Poland                   4351.  1239998            285
    ## 15 Iran                     3884.  1177004            303
    ## 16 Ukraine                  3640.  1001132            275
    ## 17 Peru                     3546.  1000153            282
    ## 18 South Africa             3383.   954258            282
    ## 19 Netherlands              2461.   721186            293
    ## 20 Indonesia                2405.   685639            285

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                220.              63045.            287
    ##  2 Belgium                       206.              60783.            295
    ##  3 United States                 196.              58312.            297
    ##  4 Switzerland                   187.              55584.            297
    ##  5 Israel                        182.              52178.            286
    ##  6 Jordan                        159.              44011.            277
    ##  7 Serbia                        152.              42513.            280
    ##  8 Netherlands                   148.              43327.            293
    ##  9 Austria                       143.              41747.            291
    ## 10 Sweden                        142.              41445.            292
    ## 11 Argentina                     133.              37619.            282
    ## 12 Spain                         133.              39614.            297
    ## 13 France                        128.              38034.            298
    ## 14 Brazil                        127.              36393.            287
    ## 15 Portugal                      125.              35899.            286
    ## 16 Chile                         125.              35286.            283
    ## 17 Peru                          119.              33442.            282
    ## 18 United Kingdom                116.              34476.            296
    ## 19 Colombia                      114.              32027.            281
    ## 20 Poland                        113.              32208.            285

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.0         607     2091
    ##  2 Mexico                                    8.93     119495  1338426
    ##  3 Ecuador                                   6.74      13962   207084
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.06        641    10571
    ##  6 Bolivia                                   5.99       9052   151059
    ##  7 Egypt                                     5.63       7209   127972
    ##  8 Chad                                      5.32        102     1916
    ##  9 China                                     4.97       4774    96074
    ## 10 Iran                                      4.60      54156  1177004
    ## 11 Afghanistan                               4.14       2126    51357
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Peru                                      3.72      37218  1000153
    ## 14 Democratic Republic of the Congo          3.58        566    15808
    ## 15 Mali                                      3.58        225     6291
    ## 16 Bulgaria                                  3.56       6978   195886
    ## 17 Italy                                     3.54      70395  1991278
    ## 18 Guatemala                                 3.53       4739   134256
    ## 19 Nicaragua                                 3.42        164     4790
    ## 20 Tunisia                                   3.42       4275   125000

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1821.      18939   10.4 
    ##  2 Peru                   1244.      37218   29.9 
    ##  3 Italy                  1167.      70395   60.3 
    ##  4 United Kingdom         1108.      69051   62.3 
    ##  5 Spain                  1069.      49698   46.5 
    ##  6 Mexico                 1062.     119495  112.  
    ##  7 United States          1032.     320180  310.  
    ##  8 Czech Republic         1029.      10776   10.5 
    ##  9 Argentina              1022.      42254   41.3 
    ## 10 Bulgaria                976.       6978    7.15
    ## 11 Chile                   969.      16228   16.7 
    ## 12 France                  951.      61602   64.8 
    ## 13 Ecuador                 944.      13962   14.8 
    ## 14 Brazil                  936.     188259  201.  
    ## 15 Bolivia                 910.       9052    9.95
    ## 16 Hungary                 874.       8729    9.98
    ## 17 Sweden                  866.       8279    9.56
    ## 18 Colombia                856.      40931   47.8 
    ## 19 Switzerland             845.       6406    7.58
    ## 20 Iran                    704.      54156   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
