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

Updated: 2021-12-22

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           76847. 50565638            658
    ##  2 India                   53713. 34752164            647
    ##  3 Brazil                  34280. 22213762            648
    ##  4 United Kingdom          17406. 11453125            658
    ##  5 Russia                  15968. 10267719            643
    ##  6 Turkey                  14292.  9189881            643
    ##  7 France                  12723.  8397296            660
    ##  8 Germany                 10337.  6833050            661
    ##  9 Iran                     9283.  6173369            665
    ## 10 Spain                    8399.  5535232            659
    ## 11 Argentina                8395.  5389707            642
    ## 12 Italy                    8104.  5405360            667
    ## 13 Colombia                 7943.  5107323            643
    ## 14 Indonesia                6585.  4260893            647
    ## 15 Poland                   6155.  3982257            647
    ## 16 Mexico                   6060.  3933386            649
    ## 17 Ukraine                  5678.  3616716            637
    ## 18 South Africa             5158.  3316585            643
    ## 19 Netherlands              4575.  2992157            654
    ## 20 Philippines              4386.  2837730            647

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                355.             230586.            649
    ##  2 Belgium                       295.             193901.            657
    ##  3 Israel                        284.             184542.            649
    ##  4 United Kingdom                279.             183695.            658
    ##  5 Netherlands                   275.             179763.            654
    ##  6 Serbia                        272.             174747.            642
    ##  7 Jordan                        254.             162358.            639
    ##  8 United States                 248.             162993.            658
    ##  9 Switzerland                   239.             157022.            658
    ## 10 Austria                       233.             152079.            652
    ## 11 Slovakia                      231.             148675.            643
    ## 12 Argentina                     203.             130365.            642
    ## 13 Sweden                        200.             130902.            654
    ## 14 France                        196.             129651.            660
    ## 15 Hungary                       192.             123260.            641
    ## 16 Turkey                        184.             118116.            643
    ## 17 Spain                         181.             119022.            659
    ## 18 Portugal                      177.             115011.            648
    ## 19 Denmark                       175.             114398.            652
    ## 20 Brazil                        170.             110459.            648

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1977    10102
    ##  2 Peru                 8.93     202225  2265320
    ##  3 Mexico               7.57     297858  3933386
    ##  4 Sudan                7.18       3296    45901
    ##  5 Ecuador              6.26      33597   537032
    ##  6 Somalia              5.75       1333    23169
    ##  7 Syria                5.72       2850    49806
    ##  8 Egypt                5.69      21410   376233
    ##  9 Afghanistan          4.65       7335   157797
    ## 10 China                4.39       5699   129893
    ## 11 Bulgaria             4.16      30239   726794
    ## 12 Niger                3.77        272     7214
    ## 13 Myanmar              3.64      19226   528380
    ## 14 Paraguay             3.57      16575   464630
    ## 15 Malawi               3.55       2313    65223
    ## 16 Tunisia              3.53      25475   721103
    ## 17 Bolivia              3.44      19440   564747
    ## 18 Indonesia            3.38     144024  4260893
    ## 19 Mali                 3.34        646    19366
    ## 20 Romania              3.24      58232  1798629

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6762.     202225   29.9 
    ##  2 Bulgaria               4230.      30239    7.15
    ##  3 Hungary                3810.      38028    9.98
    ##  4 Czech Republic         3379.      35401   10.5 
    ##  5 Brazil                 3072.     617803  201.  
    ##  6 Slovakia               2957.      16129    5.46
    ##  7 Argentina              2828.     116903   41.3 
    ##  8 Colombia               2709.     129458   47.8 
    ##  9 Belgium                2691.      27992   10.4 
    ## 10 Romania                2652.      58232   22.0 
    ## 11 Mexico                 2648.     297858  112.  
    ## 12 Paraguay               2600.      16575    6.38
    ## 13 United States          2579.     799942  310.  
    ## 14 Tunisia                2406.      25475   10.6 
    ## 15 Poland                 2391.      92052   38.5 
    ## 16 United Kingdom         2362.     147261   62.3 
    ## 17 Chile                  2322.      38885   16.7 
    ## 18 Ecuador                2272.      33597   14.8 
    ## 19 Italy                  2250.     135778   60.3 
    ## 20 Russia                 2127.     299249  141.

EOL
