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

Updated: 2021-04-11

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
    ##  1 United States           76159. 30692226            403
    ##  2 Brazil                  33791. 13279857            393
    ##  3 India                   33688. 13205926            392
    ##  4 France                  12103.  4901955            405
    ##  5 Russia                  11940.  4632688            388
    ##  6 United Kingdom          10844.  4370325            403
    ##  7 Turkey                   9653.  3745657            388
    ##  8 Italy                    9069.  3736526            412
    ##  9 Spain                    8259.  3336637            404
    ## 10 Germany                  7341.  2980413            406
    ## 11 Poland                   6512.  2552898            392
    ## 12 Colombia                 6423.  2492081            388
    ## 13 Argentina                6392.  2473751            387
    ## 14 Mexico                   5843.  2267019            388
    ## 15 Iran                     4949.  2029412            410
    ## 16 Ukraine                  4819.  1841137            382
    ## 17 Peru                     4159.  1617864            389
    ## 18 South Africa             4011.  1556242            388
    ## 19 Czech Republic           4005.  1577972            394
    ## 20 Indonesia                3985.  1558145            391

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                382.             150627.            394
    ##  2 Israel                        289.             113636.            393
    ##  3 Jordan                        268.             102894.            384
    ##  4 United States                 245.              98933.            403
    ##  5 Sweden                        225.              89725.            399
    ##  6 Serbia                        224.              86648.            387
    ##  7 Belgium                       219.              88236.            402
    ##  8 Switzerland                   201.              81087.            403
    ##  9 Netherlands                   201.              80191.            399
    ## 10 Portugal                      197.              77400.            393
    ## 11 France                        187.              75684.            405
    ## 12 Hungary                       185.              71516.            386
    ## 13 Spain                         178.              71746.            404
    ## 14 Slovakia                      175.              67914.            387
    ## 15 Austria                       174.              69256.            398
    ## 16 United Kingdom                174.              70095.            403
    ## 17 Poland                        169.              66309.            392
    ## 18 Brazil                        168.              66035.            393
    ## 19 Chile                         162.              63322.            390
    ## 20 Argentina                     155.              59835.            387

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.5        1023     5237
    ##  2 Mexico                9.09     206146  2267019
    ##  3 Syria                 6.80       1360    20008
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.92      12362   208876
    ##  6 Ecuador               5.01      17158   342678
    ##  7 Somalia               4.93        605    12271
    ##  8 China                 4.71       4853   103066
    ##  9 Bolivia               4.45      12412   279207
    ## 10 Afghanistan           4.41       2521    57144
    ## 11 Zimbabwe              4.13       1535    37147
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.87      14308   370179
    ## 14 Niger                 3.71        188     5062
    ## 15 Chad                  3.62        167     4616
    ## 16 Mali                  3.55        404    11393
    ## 17 Guatemala             3.47       6977   201295
    ## 18 South Africa          3.42      53226  1556242
    ## 19 Tunisia               3.41       9179   268837
    ## 20 Peru                  3.34      53978  1617864

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2647.      27734   10.5 
    ##  2 Hungary                2325.      23211    9.98
    ##  3 Belgium                2248.      23390   10.4 
    ##  4 United Kingdom         2037.     126980   62.3 
    ##  5 Bulgaria               2001.      14308    7.15
    ##  6 Slovakia               1922.      10487    5.46
    ##  7 Italy                  1882.     113579   60.3 
    ##  8 Mexico                 1833.     206146  112.  
    ##  9 Peru                   1805.      53978   29.9 
    ## 10 United States          1788.     554783  310.  
    ## 11 Brazil                 1716.     345025  201.  
    ## 12 Spain                  1638.      76179   46.5 
    ## 13 Portugal               1583.      16904   10.7 
    ## 14 Poland                 1511.      58176   38.5 
    ## 15 France                 1509.      97749   64.8 
    ## 16 Chile                  1440.      24108   16.7 
    ## 17 Sweden                 1425.      13621    9.56
    ## 18 Argentina              1382.      57122   41.3 
    ## 19 Colombia               1360.      65014   47.8 
    ## 20 Switzerland            1286.       9750    7.58

EOL
