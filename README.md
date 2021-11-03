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

Updated: 2021-11-04

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
    ##  1 United States           71807. 45813604            638
    ##  2 India                   57276. 34308140            599
    ##  3 Brazil                  36358. 21814693            600
    ##  4 United Kingdom          14968.  9130861            610
    ##  5 Russia                  14510.  8633643            595
    ##  6 Turkey                  13599.  8091462            595
    ##  7 France                  11352.  6947472            612
    ##  8 Iran                     9634.  5944599            617
    ##  9 Argentina                8905.  5289945            594
    ## 10 Colombia                 8410.  5003977            595
    ## 11 Spain                    8211.  5016969            611
    ## 12 Italy                    7718.  4777614            619
    ## 13 Germany                  7567.  4638419            613
    ## 14 Indonesia                7089.  4246174            599
    ## 15 Mexico                   6336.  3808205            601
    ## 16 Poland                   5083.  3045102            599
    ## 17 Ukraine                  5058.  2979086            589
    ## 18 South Africa             4911.  2922391            595
    ## 19 Philippines              4662.  2792656            599
    ## 20 Malaysia                 4108.  2481339            604

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        301.             180724.            601
    ##  2 Czech Republic                283.             170220.            601
    ##  3 Serbia                        265.             157356.            594
    ##  4 United Kingdom                240.             146449.            610
    ##  5 United States                 231.             147675.            638
    ##  6 Jordan                        229.             135233.            591
    ##  7 Belgium                       219.             133171.            609
    ##  8 Argentina                     215.             127952.            594
    ##  9 Netherlands                   213.             129016.            606
    ## 10 Sweden                        203.             122885.            606
    ## 11 Switzerland                   189.             115467.            610
    ## 12 Brazil                        181.             108475.            600
    ## 13 Spain                         177.             107878.            611
    ## 14 Colombia                      176.             104708.            595
    ## 15 France                        175.             107266.            612
    ## 16 Turkey                        175.             103998.            595
    ## 17 Portugal                      170.             102247.            600
    ## 18 Chile                         170.             101402.            597
    ## 19 Austria                       169.             102125.            604
    ## 20 Slovakia                      152.              90427.            595

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1894     9806
    ##  2 Peru                 9.09     200276  2202189
    ##  3 Mexico               7.57     288464  3808205
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32958   515859
    ##  6 Syria                5.88       2584    43931
    ##  7 Egypt                5.64      18769   332889
    ##  8 Somalia              5.49       1208    21998
    ##  9 Afghanistan          4.66       7281   156307
    ## 10 China                4.51       5696   126270
    ## 11 Bulgaria             3.98      24454   614362
    ## 12 Myanmar              3.73      18744   502979
    ## 13 Malawi               3.72       2302    61802
    ## 14 Bolivia              3.68      18928   513810
    ## 15 Tunisia              3.54      25250   712880
    ## 16 Hungary              3.53      30994   879092
    ## 17 Paraguay             3.52      16249   461086
    ## 18 Zimbabwe             3.52       4683   133047
    ## 19 Mali                 3.52        568    16149
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6697.     200276   29.9 
    ##  2 Bulgaria               3421.      24454    7.15
    ##  3 Hungary                3105.      30994    9.98
    ##  4 Brazil                 3023.     607922  201.  
    ##  5 Czech Republic         2944.      30840   10.5 
    ##  6 Argentina              2806.     115989   41.3 
    ##  7 Colombia               2664.     127311   47.8 
    ##  8 Mexico                 2565.     288464  112.  
    ##  9 Paraguay               2549.      16249    6.38
    ## 10 Belgium                2505.      26061   10.4 
    ## 11 Slovakia               2404.      13112    5.46
    ## 12 United States          2391.     741714  310.  
    ## 13 Tunisia                2385.      25250   10.6 
    ## 14 United Kingdom         2261.     140964   62.3 
    ## 15 Chile                  2256.      37782   16.7 
    ## 16 Romania                2237.      49115   22.0 
    ## 17 Ecuador                2228.      32958   14.8 
    ## 18 Italy                  2190.     132161   60.3 
    ## 19 Poland                 2004.      77145   38.5 
    ## 20 Bolivia                1903.      18928    9.95

EOL
