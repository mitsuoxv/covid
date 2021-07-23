WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2021-07-24

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
    ##  1 United States           65650. 33875385            516
    ##  2 India                   63091. 31293062            496
    ##  3 Brazil                  39183. 19473954            497
    ##  4 Russia                  12354.  6078522            492
    ##  5 France                  11421.  5813457            509
    ##  6 Turkey                  11308.  5563903            492
    ##  7 United Kingdom          11050.  5602325            507
    ##  8 Argentina                9773.  4798851            491
    ##  9 Colombia                 9512.  4679994            492
    ## 10 Spain                    8364.  4249258            508
    ## 11 Italy                    8338.  4302393            516
    ## 12 Germany                  7358.  3752592            510
    ## 13 Iran                     7050.  3623840            514
    ## 14 Indonesia                6214.  3082410            496
    ## 15 Poland                   5810.  2881948            496
    ## 16 Mexico                   5474.  2693495            492
    ## 17 South Africa             4761.  2342330            492
    ## 18 Ukraine                  4624.  2247419            486
    ## 19 Peru                     4255.  2097811            493
    ## 20 Netherlands              3632.  1827273            503

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                320.             159616.            498
    ##  2 Jordan                        244.             119041.            488
    ##  3 Argentina                     236.             116074.            491
    ##  4 Israel                        234.             116611.            499
    ##  5 Sweden                        228.             114729.            503
    ##  6 Netherlands                   218.             109779.            503
    ##  7 United States                 212.             109193.            516
    ##  8 Belgium                       211.             106908.            506
    ##  9 Serbia                        199.              97955.            491
    ## 10 Colombia                      199.              97928.            492
    ## 11 Brazil                        195.              96836.            497
    ## 12 Chile                         194.              95824.            494
    ## 13 Switzerland                   184.              93484.            507
    ## 14 Spain                         180.              91370.            508
    ## 15 Portugal                      178.              88352.            497
    ## 16 United Kingdom                177.              89855.            507
    ## 17 France                        176.              89758.            509
    ## 18 Hungary                       165.              81056.            490
    ## 19 Austria                       158.              79315.            502
    ## 20 Poland                        151.              74856.            496

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1371     6997
    ##  2 Peru                 9.32     195429  2097811
    ##  3 Mexico               8.81     237207  2693495
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1905    25849
    ##  6 Ecuador              6.43      30752   478615
    ##  7 Egypt                5.80      16465   283862
    ##  8 Somalia              5.15        781    15162
    ##  9 China                4.69       5630   120000
    ## 10 Afghanistan          4.43       6357   143439
    ## 11 Bulgaria             4.30      18189   423440
    ## 12 Bolivia              3.77      17546   465351
    ## 13 Hungary              3.71      30020   809101
    ## 14 Mali                 3.65        530    14528
    ## 15 Chad                 3.50        174     4965
    ## 16 Niger                3.49        195     5594
    ## 17 Tanzania             3.45         21      609
    ## 18 Paraguay             3.23      14446   447146
    ## 19 Tunisia              3.22      17913   555997
    ## 20 Slovakia             3.20      12534   392259

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6535.     195429   29.9 
    ##  2 Hungary                3007.      30020    9.98
    ##  3 Czech Republic         2897.      30347   10.5 
    ##  4 Brazil                 2713.     545604  201.  
    ##  5 Bulgaria               2544.      18189    7.15
    ##  6 Argentina              2487.     102818   41.3 
    ##  7 Colombia               2458.     117482   47.8 
    ##  8 Belgium                2424.      25217   10.4 
    ##  9 Slovakia               2298.      12534    5.46
    ## 10 Paraguay               2266.      14446    6.38
    ## 11 Italy                  2120.     127920   60.3 
    ## 12 Mexico                 2109.     237207  112.  
    ## 13 Ecuador                2079.      30752   14.8 
    ## 14 Chile                  2078.      34792   16.7 
    ## 15 United Kingdom         2069.     128980   62.3 
    ## 16 Poland                 1954.      75235   38.5 
    ## 17 United States          1949.     604546  310.  
    ## 18 Bolivia                1764.      17546    9.95
    ## 19 Spain                  1746.      81194   46.5 
    ## 20 France                 1707.     110566   64.8

EOL
