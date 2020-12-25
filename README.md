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

Updated: 2020-12-26

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
    ##  1 United States           61447. 18311405            298
    ##  2 India                   35478. 10146845            286
    ##  3 Brazil                  25574.  7365517            288
    ##  4 Russia                  10612.  2992706            282
    ##  5 France                   8310.  2484875            299
    ##  6 United Kingdom           7369.  2188591            297
    ##  7 Italy                    6566.  2009317            306
    ##  8 Spain                    6224.  1854951            298
    ##  9 Argentina                5526.  1563865            283
    ## 10 Colombia                 5478.  1544826            282
    ## 11 Germany                  5375.  1612648            300
    ## 12 Mexico                   4787.  1350079            282
    ## 13 Turkey                   4561.  1286374            282
    ## 14 Poland                   4367.  1249079            286
    ## 15 Iran                     3892.  1183182            304
    ## 16 Ukraine                  3667.  1012167            276
    ## 17 Peru                     3534.  1000153            283
    ## 18 South Africa             3422.   968563            283
    ## 19 Netherlands              2492.   732741            294
    ## 20 Indonesia                2422.   692838            286

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                220.              63465.            288
    ##  2 Belgium                       206.              61031.            296
    ##  3 United States                 198.              59025.            298
    ##  4 Switzerland                   189.              56219.            298
    ##  5 Israel                        182.              52178.            287
    ##  6 Jordan                        159.              44278.            278
    ##  7 Serbia                        153.              43070.            281
    ##  8 Netherlands                   150.              44022.            294
    ##  9 Austria                       144.              42090.            292
    ## 10 Sweden                        141.              41445.            293
    ## 11 Spain                         134.              39886.            298
    ## 12 Argentina                     134.              37826.            283
    ## 13 France                        128.              38366.            299
    ## 14 Brazil                        127.              36626.            288
    ## 15 Portugal                      126.              36309.            287
    ## 16 Chile                         125.              35429.            284
    ## 17 United Kingdom                118.              35103.            297
    ## 18 Peru                          118.              33442.            283
    ## 19 Colombia                      115.              32325.            282
    ## 20 Poland                        113.              32444.            286

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.0         607     2096
    ##  2 Mexico                                    8.91     120311  1350079
    ##  3 Ecuador                                   6.72      13977   208010
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.09        652    10701
    ##  6 Bolivia                                   5.96       9065   152064
    ##  7 Egypt                                     5.63       7260   128993
    ##  8 Chad                                      5.21        102     1958
    ##  9 China                                     4.97       4776    96159
    ## 10 Iran                                      4.59      54308  1183182
    ## 11 Afghanistan                               4.14       2135    51595
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Peru                                      3.72      37218  1000153
    ## 14 Mali                                      3.58        225     6291
    ## 15 Bulgaria                                  3.57       7023   196658
    ## 16 Democratic Republic of the Congo          3.53        566    16037
    ## 17 Italy                                     3.53      70900  2009317
    ## 18 Guatemala                                 3.52       4749   134894
    ## 19 Nicaragua                                 3.42        164     4790
    ## 20 Tunisia                                   3.41       4324   126752

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1830.      19038   10.4 
    ##  2 Peru                   1244.      37218   29.9 
    ##  3 Italy                  1175.      70900   60.3 
    ##  4 United Kingdom         1117.      69625   62.3 
    ##  5 Spain                  1071.      49824   46.5 
    ##  6 Mexico                 1070.     120311  112.  
    ##  7 United States          1043.     323527  310.  
    ##  8 Czech Republic         1037.      10859   10.5 
    ##  9 Argentina              1023.      42314   41.3 
    ## 10 Bulgaria                982.       7023    7.15
    ## 11 Chile                   974.      16303   16.7 
    ## 12 France                  956.      61892   64.8 
    ## 13 Ecuador                 945.      13977   14.8 
    ## 14 Brazil                  941.     189220  201.  
    ## 15 Bolivia                 911.       9065    9.95
    ## 16 Hungary                 885.       8833    9.98
    ## 17 Sweden                  866.       8279    9.56
    ## 18 Colombia                862.      41173   47.8 
    ## 19 Switzerland             858.       6508    7.58
    ## 20 Iran                    706.      54308   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
