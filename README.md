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

Updated: 2021-06-07

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
    ##  1 United States           70396. 33015604            469
    ##  2 India                   64163. 28809339            449
    ##  3 Brazil                  37425. 16841408            450
    ##  4 France                  12133.  5605392            462
    ##  5 Turkey                  11871.  5282594            445
    ##  6 Russia                  11520.  5126437            445
    ##  7 United Kingdom           9808.  4511673            460
    ##  8 Italy                    9019.  4230153            469
    ##  9 Argentina                8818.  3915397            444
    ## 10 Spain                    8011.  3693012            461
    ## 11 Germany                  7992.  3700367            463
    ## 12 Colombia                 7905.  3518046            445
    ## 13 Poland                   6403.  2875136            449
    ## 14 Iran                     6340.  2960751            467
    ## 15 Mexico                   5460.  2429631            445
    ## 16 Ukraine                  5044.  2214517            439
    ## 17 Peru                     4431.  1976166            446
    ## 18 Indonesia                4130.  1850206            448
    ## 19 South Africa             3801.  1691491            445
    ## 20 Czech Republic           3688.  1663517            451

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                352.             158793.            451
    ##  2 Jordan                        262.             115391.            441
    ##  3 Israel                        254.             114165.            450
    ##  4 Sweden                        247.             112816.            456
    ##  5 United States                 227.             106422.            469
    ##  6 Belgium                       224.             102843.            459
    ##  7 Netherlands                   219.              99821.            456
    ##  8 Serbia                        219.              97151.            444
    ##  9 Argentina                     213.              94705.            444
    ## 10 Switzerland                   199.              91569.            460
    ## 11 Chile                         190.              84810.            447
    ## 12 France                        187.              86545.            462
    ## 13 Brazil                        186.              83745.            450
    ## 14 Hungary                       182.              80746.            443
    ## 15 Portugal                      177.              79808.            450
    ## 16 Spain                         172.              79409.            461
    ## 17 Austria                       172.              78297.            455
    ## 18 Poland                        166.              74679.            449
    ## 19 Colombia                      165.              73615.            445
    ## 20 Slovakia                      161.              71574.            444

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.5        1325     6780
    ##  2 Mexico                9.41     228568  2429631
    ##  3 Peru                  9.40     185813  1976166
    ##  4 Sudan                 7.47       2662    35656
    ##  5 Syria                 7.26       1790    24639
    ##  6 Egypt                 5.73      15309   267171
    ##  7 Somalia               5.25        773    14729
    ##  8 Ecuador               4.81      20773   431429
    ##  9 China                 4.44       5070   114106
    ## 10 Bulgaria              4.25      17813   419426
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1605    39168
    ## 13 Afghanistan           3.97       3145    79224
    ## 14 Bolivia               3.89      14900   383457
    ## 15 Hungary               3.69      29770   806008
    ## 16 Tunisia               3.66      12948   353782
    ## 17 Mali                  3.62        518    14296
    ## 18 Niger                 3.53        192     5438
    ## 19 Chad                  3.52        174     4939
    ## 20 South Africa          3.37      56929  1691491

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6213.     185813   29.9 
    ##  2 Hungary                2982.      29770    9.98
    ##  3 Czech Republic         2879.      30159   10.5 
    ##  4 Bulgaria               2492.      17813    7.15
    ##  5 Belgium                2405.      25019   10.4 
    ##  6 Brazil                 2341.     470842  201.  
    ##  7 Slovakia               2274.      12404    5.46
    ##  8 Italy                  2096.     126472   60.3 
    ##  9 United Kingdom         2050.     127836   62.3 
    ## 10 Mexico                 2032.     228568  112.  
    ## 11 Argentina              1945.      80411   41.3 
    ## 12 Poland                 1926.      74152   38.5 
    ## 13 United States          1906.     591276  310.  
    ## 14 Colombia               1902.      90890   47.8 
    ## 15 Chile                  1780.      29816   16.7 
    ## 16 Spain                  1722.      80099   46.5 
    ## 17 France                 1684.     109096   64.8 
    ## 18 Portugal               1595.      17032   10.7 
    ## 19 Sweden                 1520.      14523    9.56
    ## 20 Paraguay               1507.       9609    6.38

EOL
