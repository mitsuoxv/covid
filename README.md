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

Updated: 2021-12-21

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
    ##  1 United States           76736. 50415400            657
    ##  2 India                   53788. 34746838            646
    ##  3 Brazil                  34320. 22204941            647
    ##  4 United Kingdom          17293. 11361391            657
    ##  5 Russia                  15953. 10241812            642
    ##  6 Turkey                  14285.  9171119            642
    ##  7 France                  12720.  8382498            659
    ##  8 Germany                 10317.  6809622            660
    ##  9 Iran                     9293.  6170979            664
    ## 10 Argentina                8403.  5386453            641
    ## 11 Spain                    8240.  5422169            658
    ## 12 Italy                    8092.  5389155            666
    ## 13 Colombia                 7952.  5105285            642
    ## 14 Indonesia                6595.  4260677            646
    ## 15 Poland                   6143.  3968450            646
    ## 16 Mexico                   6069.  3932545            648
    ## 17 Ukraine                  5677.  3610687            636
    ## 18 South Africa             5153.  3308074            642
    ## 19 Netherlands              4563.  2980003            653
    ## 20 Philippines              4392.  2837555            646

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                355.             229762.            648
    ##  2 Belgium                       293.             192230.            656
    ##  3 Israel                        284.             184362.            648
    ##  4 United Kingdom                277.             182224.            657
    ##  5 Netherlands                   274.             179033.            653
    ##  6 Serbia                        272.             174607.            641
    ##  7 Jordan                        254.             161800.            638
    ##  8 United States                 247.             162508.            657
    ##  9 Switzerland                   235.             154336.            657
    ## 10 Austria                       233.             151852.            651
    ## 11 Slovakia                      230.             148000.            642
    ## 12 Argentina                     203.             130286.            641
    ## 13 Sweden                        200.             130902.            653
    ## 14 France                        196.             129423.            659
    ## 15 Hungary                       192.             123062.            640
    ## 16 Turkey                        184.             117874.            642
    ## 17 Portugal                      177.             114753.            647
    ## 18 Spain                         177.             116591.            658
    ## 19 Denmark                       173.             112559.            651
    ## 20 Brazil                        171.             110416.            647

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1976    10101
    ##  2 Peru                 8.93     202154  2263739
    ##  3 Mexico               7.57     297835  3932545
    ##  4 Sudan                7.18       3295    45901
    ##  5 Ecuador              6.27      33593   536129
    ##  6 Somalia              5.75       1333    23169
    ##  7 Syria                5.72       2846    49751
    ##  8 Egypt                5.69      21361   375330
    ##  9 Afghanistan          4.65       7335   157787
    ## 10 China                4.39       5698   129678
    ## 11 Bulgaria             4.15      30082   724793
    ## 12 Niger                3.78        272     7199
    ## 13 Myanmar              3.64      19220   528253
    ## 14 Malawi               3.57       2311    64741
    ## 15 Paraguay             3.57      16570   464582
    ## 16 Tunisia              3.53      25470   721031
    ## 17 Bolivia              3.45      19408   562638
    ## 18 Indonesia            3.38     144013  4260677
    ## 19 Mali                 3.31        639    19307
    ## 20 Romania              3.24      58196  1798205

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6759.     202154   29.9 
    ##  2 Bulgaria               4208.      30082    7.15
    ##  3 Hungary                3796.      37896    9.98
    ##  4 Czech Republic         3368.      35288   10.5 
    ##  5 Brazil                 3070.     617395  201.  
    ##  6 Slovakia               2946.      16068    5.46
    ##  7 Argentina              2828.     116899   41.3 
    ##  8 Colombia               2708.     129399   47.8 
    ##  9 Belgium                2681.      27895   10.4 
    ## 10 Romania                2650.      58196   22.0 
    ## 11 Mexico                 2648.     297835  112.  
    ## 12 Paraguay               2599.      16570    6.38
    ## 13 United States          2577.     799326  310.  
    ## 14 Tunisia                2405.      25470   10.6 
    ## 15 Poland                 2377.      91514   38.5 
    ## 16 United Kingdom         2361.     147218   62.3 
    ## 17 Chile                  2321.      38864   16.7 
    ## 18 Ecuador                2271.      33593   14.8 
    ## 19 Italy                  2248.     135641   60.3 
    ## 20 Russia                 2120.     298222  141.

EOL
