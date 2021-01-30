WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
-   [Save data](#save-data)

Updated: 2021-01-31

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
“Southern Europe”. “West Europe” is basically Europe other than “Eastern
Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           76383. 25512197            334
    ##  2 India                   33332. 10733131            322
    ##  3 Brazil                  27959.  9058687            324
    ##  4 Russia                  12050.  3832080            318
    ##  5 United Kingdom          11242.  3743738            333
    ##  6 France                   9260.  3102215            335
    ##  7 Spain                    8074.  2705001            335
    ##  8 Turkey                   7748.  2464030            318
    ##  9 Italy                    7395.  2529070            342
    ## 10 Germany                  6563.  2205171            336
    ## 11 Colombia                 6501.  2067575            318
    ## 12 Argentina                5973.  1905524            319
    ## 13 Mexico                   5740.  1825519            318
    ## 14 Poland                   4685   1508674            322
    ## 15 South Africa             4526.  1443939            319
    ## 16 Iran                     4133.  1405414            340
    ## 17 Ukraine                  3898.  1216278            312
    ## 18 Peru                     3510.  1119685            319
    ## 19 Indonesia                3266.  1051795            322
    ## 20 Czech Republic           3027.   980714            324

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                289.              93615.            324
    ##  2 Israel                        259.              83754.            323
    ##  3 United States                 246.              82236.            334
    ##  4 Switzerland                   205.              68429.            333
    ##  5 Belgium                       204.              67780.            332
    ##  6 Portugal                      203.              65435.            323
    ##  7 United Kingdom                180.              60045.            333
    ##  8 Sweden                        180.              59331.            329
    ##  9 Netherlands                   177.              58312.            329
    ## 10 Spain                         174.              58165.            335
    ## 11 Serbia                        168.              53419.            317
    ## 12 Jordan                        162.              50730.            314
    ## 13 Austria                       152.              49771.            328
    ## 14 Argentina                     144.              46090.            319
    ## 15 France                        143.              47897.            335
    ## 16 Slovakia                      142.              45279.            318
    ## 17 Brazil                        139.              45045.            324
    ## 18 Colombia                      136.              43264.            318
    ## 19 Chile                         134.              42919.            320
    ## 20 Italy                         123.              41913.            342

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2124
    ##  2 Mexico               8.50     155145  1825519
    ##  3 Syria                6.53        911    13944
    ##  4 Sudan                6.14       1798    29291
    ##  5 Ecuador              6.00      14766   246000
    ##  6 Egypt                5.59       9217   164871
    ##  7 Bolivia              4.85      10226   210726
    ##  8 China                4.79       4821   100747
    ##  9 Afghanistan          4.36       2400    55008
    ## 10 Bulgaria             4.13       9008   218269
    ## 11 Tanzania             4.13         21      509
    ## 12 Iran                 4.11      57807  1405414
    ## 13 Mali                 4.08        329     8063
    ## 14 Greece               3.70       5764   155678
    ## 15 Peru                 3.62      40484  1119685
    ## 16 Zimbabwe             3.57       1178    32952
    ## 17 Chad                 3.55        118     3321
    ## 18 Niger                3.54        159     4489
    ## 19 Guatemala            3.53       5582   158336
    ## 20 Italy                3.47      87858  2529070

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2020.      21018   10.4 
    ##  2 United Kingdom         1654.     103126   62.3 
    ##  3 Czech Republic         1547.      16211   10.5 
    ##  4 Italy                  1456.      87858   60.3 
    ##  5 United States          1385.     429652  310.  
    ##  6 Mexico                 1379.     155145  112.  
    ##  7 Peru                   1354.      40484   29.9 
    ##  8 Bulgaria               1260.       9008    7.15
    ##  9 Spain                  1243.      57806   46.5 
    ## 10 Hungary                1240.      12374    9.98
    ## 11 Sweden                 1213.      11591    9.56
    ## 12 France                 1161.      75224   64.8 
    ## 13 Argentina              1151.      47601   41.3 
    ## 14 Switzerland            1135.       8601    7.58
    ## 15 Portugal               1113.      11886   10.7 
    ## 16 Colombia               1107.      52913   47.8 
    ## 17 Brazil                 1102.     221547  201.  
    ## 18 Chile                  1090.      18257   16.7 
    ## 19 Bolivia                1028.      10226    9.95
    ## 20 Ecuador                 998.      14766   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
