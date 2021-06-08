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

Updated: 2021-06-09

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
    ##  1 United States           70154. 33042622            471
    ##  2 India                   64293. 28996473            451
    ##  3 Brazil                  37493. 16947062            452
    ##  4 France                  12093.  5611217            464
    ##  5 Turkey                  11842.  5293627            447
    ##  6 Russia                  11512.  5145843            447
    ##  7 United Kingdom           9789.  4522480            462
    ##  8 Italy                    8988.  4233698            471
    ##  9 Argentina                8868.  3955439            446
    ## 10 Spain                    8007.  3707523            463
    ## 11 Colombia                 7989.  3571067            447
    ## 12 Germany                  7963.  3702688            465
    ## 13 Poland                   6376.  2875729            451
    ## 14 Iran                     6335.  2971270            469
    ## 15 Mexico                   5444.  2433681            447
    ## 16 Ukraine                  5026.  2216654            441
    ## 17 Peru                     4427.  1983570            448
    ## 18 Indonesia                4140.  1863031            450
    ## 19 South Africa             3802.  1699849            447
    ## 20 Czech Republic           3673.  1663998            453

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                351.             158839.            453
    ##  2 Jordan                        261.             115575.            443
    ##  3 Israel                        253.             114167.            452
    ##  4 Sweden                        246.             112816.            458
    ##  5 United States                 226.             106509.            471
    ##  6 Belgium                       223.             102977.            461
    ##  7 Netherlands                   218.              99996.            458
    ##  8 Serbia                        218.              97189.            446
    ##  9 Argentina                     215.              95673.            446
    ## 10 Switzerland                   198.              91710.            462
    ## 11 Chile                         191.              85683.            449
    ## 12 France                        187.              86635.            464
    ## 13 Brazil                        186.              84270.            452
    ## 14 Hungary                       181.              80766.            445
    ## 15 Portugal                      177.              79902.            452
    ## 16 Spain                         172.              79721.            463
    ## 17 Austria                       171.              78372.            457
    ## 18 Colombia                      167.              74724.            447
    ## 19 Poland                        166.              74694.            451
    ## 20 Slovakia                      160.              71594.            446

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1336     6812
    ##  2 Peru                 9.40     186511  1983570
    ##  3 Mexico               9.40     228804  2433681
    ##  4 Sudan                7.49       2697    36004
    ##  5 Syria                7.28       1796    24680
    ##  6 Egypt                5.73      15399   268754
    ##  7 Somalia              5.23        773    14768
    ##  8 Ecuador              4.81      20814   432739
    ##  9 China                4.47       5132   114707
    ## 10 Bulgaria             4.25      17854   419681
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.11       1611    39238
    ## 13 Afghanistan          3.95       3251    82326
    ## 14 Bolivia              3.88      15024   387162
    ## 15 Hungary              3.70      29799   806206
    ## 16 Tunisia              3.65      13027   356750
    ## 17 Mali                 3.63        519    14302
    ## 18 Niger                3.53        192     5439
    ## 19 Chad                 3.52        174     4940
    ## 20 Malawi               3.36       1157    34403

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6236.     186511   29.9 
    ##  2 Hungary                2985.      29799    9.98
    ##  3 Czech Republic         2882.      30193   10.5 
    ##  4 Bulgaria               2497.      17854    7.15
    ##  5 Belgium                2407.      25041   10.4 
    ##  6 Brazil                 2354.     473404  201.  
    ##  7 Slovakia               2277.      12423    5.46
    ##  8 Italy                  2098.     126588   60.3 
    ##  9 United Kingdom         2050.     127841   62.3 
    ## 10 Mexico                 2034.     228804  112.  
    ## 11 Argentina              1964.      81214   41.3 
    ## 12 Poland                 1929.      74255   38.5 
    ## 13 Colombia               1924.      91961   47.8 
    ## 14 United States          1909.     592114  310.  
    ## 15 Chile                  1795.      30058   16.7 
    ## 16 Spain                  1725.      80236   46.5 
    ## 17 France                 1686.     109209   64.8 
    ## 18 Portugal               1596.      17036   10.7 
    ## 19 Paraguay               1549.       9874    6.38
    ## 20 Sweden                 1520.      14523    9.56

EOL
