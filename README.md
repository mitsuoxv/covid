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

Updated: 2021-04-17

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

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
    ##  1 United States           76046. 31103006            409
    ##  2 India                   35909. 14291917            398
    ##  3 Brazil                  34269. 13673507            399
    ##  4 France                  12428.  5107935            411
    ##  5 Russia                  11888.  4684148            394
    ##  6 United Kingdom          10711.  4380980            409
    ##  7 Turkey                  10373.  4086957            394
    ##  8 Italy                    9153.  3826156            418
    ##  9 Spain                    8284.  3396685            410
    ## 10 Germany                  7522.  3099273            412
    ## 11 Poland                   6683.  2660088            398
    ## 12 Argentina                6626.  2604157            393
    ## 13 Colombia                 6563.  2585801            394
    ## 14 Mexico                   5815.  2291246            394
    ## 15 Iran                     5213.  2168872            416
    ## 16 Ukraine                  4951.  1921244            388
    ## 17 Peru                     4222.  1667737            395
    ## 18 Indonesia                4003.  1589359            397
    ## 19 Czech Republic           3992.  1597103            400
    ## 20 South Africa             3966.  1562931            394

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             152454.            400
    ##  2 Israel                        285.             113779.            399
    ##  3 Jordan                        272.             105998.            390
    ##  4 United States                 245.             100257.            409
    ##  5 Sweden                        231.              93396.            405
    ##  6 Serbia                        227.              89160.            393
    ##  7 Belgium                       221.              90292.            408
    ##  8 Netherlands                   204.              82796.            405
    ##  9 Switzerland                   202.              82749.            409
    ## 10 Portugal                      195.              77684.            399
    ## 11 France                        192.              78865.            411
    ## 12 Hungary                       190.              74354.            392
    ## 13 Spain                         178.              73038.            410
    ## 14 Austria                       176.              71074.            404
    ## 15 Slovakia                      175.              68668.            393
    ## 16 Poland                        174.              69093.            398
    ## 17 United Kingdom                172.              70266.            409
    ## 18 Brazil                        170.              67992.            399
    ## 19 Chile                         166.              65787.            396
    ## 20 Argentina                     160.              62989.            393

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1098     5661
    ##  2 Mexico                9.20     210812  2291246
    ##  3 Syria                 6.83       1414    20713
    ##  4 Sudan                 6.69       2208    33022
    ##  5 Egypt                 5.90      12611   213798
    ##  6 Somalia               5.11        656    12837
    ##  7 Ecuador               4.92      17489   355431
    ##  8 China                 4.71       4856   103203
    ##  9 Afghanistan           4.40       2535    57612
    ## 10 Bolivia               4.39      12519   285291
    ## 11 Zimbabwe              4.14       1550    37422
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.91      14979   382761
    ## 14 Niger                 3.72        190     5114
    ## 15 Chad                  3.60        168     4673
    ## 16 South Africa          3.43      53571  1562931
    ## 17 Tunisia               3.42       9553   279376
    ## 18 Guatemala             3.41       7120   208694
    ## 19 Peru                  3.35      55812  1667737
    ## 20 Malawi                3.34       1134    33902

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2703.      28317   10.5 
    ##  2 Hungary                2481.      24762    9.98
    ##  3 Belgium                2272.      23636   10.4 
    ##  4 Bulgaria               2095.      14979    7.15
    ##  5 United Kingdom         2040.     127191   62.3 
    ##  6 Slovakia               2011.      10970    5.46
    ##  7 Italy                  1921.     115937   60.3 
    ##  8 Mexico                 1874.     210812  112.  
    ##  9 Peru                   1866.      55812   29.9 
    ## 10 United States          1802.     559010  310.  
    ## 11 Brazil                 1799.     361884  201.  
    ## 12 Spain                  1653.      76882   46.5 
    ## 13 Poland                 1590.      61208   38.5 
    ## 14 Portugal               1586.      16933   10.7 
    ## 15 France                 1535.      99442   64.8 
    ## 16 Chile                  1479.      24766   16.7 
    ## 17 Sweden                 1440.      13761    9.56
    ## 18 Argentina              1416.      58542   41.3 
    ## 19 Colombia               1398.      66819   47.8 
    ## 20 Switzerland            1294.       9811    7.58

EOL
