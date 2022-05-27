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

Updated: 2022-05-28

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          101660. 82853070            815
    ##  2 India                   53666. 43147530            804
    ##  3 Brazil                  38414. 30846602            803
    ##  4 France                  34959. 28561540            817
    ##  5 Germany                 32029. 26199643            818
    ##  6 United Kingdom          27329. 22272992            815
    ##  7 Russia                  22894. 18315292            800
    ##  8 South Korea             21830. 18053287            827
    ##  9 Italy                   21035. 17333299            824
    ## 10 Turkey                  18835. 15068094            800
    ## 11 Spain                   15087. 12311477            816
    ## 12 Vietnam                 13460. 10714008            796
    ## 13 Argentina               11388.  9178795            806
    ## 14 Japan                   10578.  8737532            826
    ## 15 Netherlands              9963.  8080032            811
    ## 16 Australia                8814.  7112650            807
    ## 17 Iran                     8797.  7230882            822
    ## 18 Colombia                 7633.  6099111            799
    ## 19 Indonesia                7530.  6053894            804
    ## 20 Poland                   7471.  6006809            804

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       706.             571591.            809
    ##  2 Israel                        696.             561720.            807
    ##  3 Austria                       645.             521826.            809
    ##  4 Netherlands                   599.             485433.            811
    ##  5 Switzerland                   591.             481554.            815
    ##  6 France                        540.             440980.            817
    ##  7 Portugal                      537.             431440.            804
    ##  8 Belgium                       490.             398690.            814
    ##  9 Czech Republic                464.             374126.            806
    ## 10 South Korea                   451.             372827.            827
    ## 11 United Kingdom                438.             357234.            815
    ## 12 Slovakia                      410.             327993.            800
    ## 13 Australia                     410.             330579.            807
    ## 14 Germany                       392.             320280.            818
    ## 15 Greece                        388.             312368.            806
    ## 16 Norway                        352.             285959.            813
    ## 17 Italy                         349.             287259.            824
    ## 18 Serbia                        344.             274514.            799
    ## 19 Jordan                        333.             264811.            796
    ## 20 United States                 328.             267067.            815

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11819
    ##  2 Sudan                7.94       4941    62251
    ##  3 Peru                 5.96     213134  3577241
    ##  4 Mexico               5.64     324768  5759773
    ##  5 Syria                5.64       3150    55885
    ##  6 Somalia              5.13       1361    26535
    ##  7 Egypt                4.81      24704   513916
    ##  8 Afghanistan          4.28       7699   179835
    ##  9 Ecuador              4.07      35617   874750
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37121  1164358
    ## 12 Myanmar              3.17      19434   613260
    ## 13 Malawi               3.07       2638    85935
    ## 14 Paraguay             2.90      18885   650283
    ## 15 Tunisia              2.75      28632  1042362
    ## 16 Haiti                2.71        835    30781
    ## 17 Chad                 2.60        193     7417
    ## 18 Indonesia            2.59     156565  6053894
    ## 19 Algeria              2.59       6875   265864
    ## 20 Honduras             2.56      10899   425113

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7127.     213134   29.9 
    ##  2 Bulgaria               5193.      37121    7.15
    ##  3 Hungary                4659.      46507    9.98
    ##  4 Czech Republic         3845.      40280   10.5 
    ##  5 Slovakia               3683.      20093    5.46
    ##  6 Chile                  3455.      57851   16.7 
    ##  7 Brazil                 3312.     666037  201.  
    ##  8 United States          3211.     996108  310.  
    ##  9 Argentina              3116.     128825   41.3 
    ## 10 Belgium                3050.      31727   10.4 
    ## 11 Poland                 3021.     116305   38.5 
    ## 12 Romania                2990.      65669   22.0 
    ## 13 Paraguay               2962.      18885    6.38
    ## 14 Colombia               2926.     139833   47.8 
    ## 15 Mexico                 2888.     324768  112.  
    ## 16 United Kingdom         2861.     178397   62.3 
    ## 17 Italy                  2757.     166358   60.3 
    ## 18 Greece                 2705.      29756   11   
    ## 19 Tunisia                2704.      28632   10.6 
    ## 20 Russia                 2692.     378784  141.

EOL
