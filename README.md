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

Updated: 2022-03-22

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
    ##  1 United States          105614. 78999760            748
    ##  2 India                   58357. 43009390            737
    ##  3 Brazil                  40132. 29617266            738
    ##  4 France                  31224. 23417844            750
    ##  5 United Kingdom          26863. 20093766            748
    ##  6 Germany                 24996. 18772331            751
    ##  7 Russia                  24026. 17611401            733
    ##  8 Turkey                  20045. 14693026            733
    ##  9 Italy                   18311. 13861743            757
    ## 10 Spain                   15120. 11324637            749
    ## 11 South Korea             12609.  9582815            760
    ## 12 Argentina               12305.  9007753            732
    ## 13 Vietnam                 10916.  7958048            729
    ## 14 Netherlands             10096.  7511397            744
    ## 15 Iran                     9458.  7141033            755
    ## 16 Colombia                 8295.  6080589            733
    ## 17 Indonesia                8096.  5967182            737
    ## 18 Poland                   7999.  5895304            737
    ## 19 Japan                    7987.  6061939            759
    ## 20 Mexico                   7624.  5633928            739

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       738.             547941.            742
    ##  2 Israel                        694.             513333.            740
    ##  3 Netherlands                   607.             451270.            744
    ##  4 Austria                       576.             427349.            742
    ##  5 Switzerland                   574.             429207.            748
    ##  6 Czech Republic                483.             357023.            739
    ##  7 France                        482.             361563.            750
    ##  8 Belgium                       477.             356393.            747
    ##  9 Portugal                      433.             319690.            738
    ## 10 United Kingdom                431.             322282.            748
    ## 11 Slovakia                      410.             300185.            733
    ## 12 Norway                        369.             275330.            746
    ## 13 Serbia                        364.             266211.            732
    ## 14 Jordan                        362.             263663.            729
    ## 15 Sweden                        348.             259074.            744
    ## 16 Greece                        343.             253514             739
    ## 17 United States                 340.             254647.            748
    ## 18 Spain                         325.             243509.            749
    ## 19 Germany                       306.             229484.            751
    ## 20 Italy                         303.             229726.            757

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2140    11801
    ##  2 Sudan                 7.92       4897    61842
    ##  3 Peru                  5.98     211814  3540793
    ##  4 Mexico                5.72     322072  5633928
    ##  5 Syria                 5.63       3127    55558
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.86      24361   500889
    ##  8 Afghanistan           4.32       7654   177116
    ##  9 Ecuador               4.15      35410   853850
    ## 10 Niger                 3.50        308     8794
    ## 11 Bulgaria              3.23      36282  1124186
    ## 12 Myanmar               3.19      19425   608990
    ## 13 Malawi                3.07       2626    85561
    ## 14 Paraguay              2.87      18577   646968
    ## 15 Tunisia               2.73      28065  1029762
    ## 16 Haiti                 2.71        827    30478
    ## 17 South Africa          2.70      99881  3704218
    ## 18 Chad                  2.61        190     7269
    ## 19 Honduras              2.60      10857   418300
    ## 20 Algeria               2.59       6871   265550

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7082.     211814   29.9 
    ##  2 Bulgaria               5075.      36282    7.15
    ##  3 Hungary                4518.      45095    9.98
    ##  4 Czech Republic         3758.      39374   10.5 
    ##  5 Slovakia               3507.      19133    5.46
    ##  6 Brazil                 3267.     657102  201.  
    ##  7 United States          3108.     964198  310.  
    ##  8 Argentina              3084.     127494   41.3 
    ##  9 Poland                 2967.     114221   38.5 
    ## 10 Romania                2946.      64685   22.0 
    ## 11 Belgium                2935.      30529   10.4 
    ## 12 Colombia               2918.     139434   47.8 
    ## 13 Paraguay               2914.      18577    6.38
    ## 14 Mexico                 2864.     322072  112.  
    ## 15 Chile                  2658.      44518   16.7 
    ## 16 Tunisia                2650.      28065   10.6 
    ## 17 United Kingdom         2623.     163511   62.3 
    ## 18 Italy                  2615.     157785   60.3 
    ## 19 Russia                 2593.     364901  141.  
    ## 20 Greece                 2449.      26937   11

EOL
