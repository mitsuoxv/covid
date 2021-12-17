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

Updated: 2021-12-18

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
    ##  1 United States           76198. 49833416            654
    ##  2 India                   54006. 34726049            643
    ##  3 Brazil                  34474. 22201221            644
    ##  4 United Kingdom          16969. 11097855            654
    ##  5 Russia                  15899. 10159389            639
    ##  6 Turkey                  14270.  9118424            639
    ##  7 France                  12527.  8217565            656
    ##  8 Germany                 10230.  6721375            657
    ##  9 Argentina                8419.  5371341            638
    ## 10 Spain                    8278.  5422168            655
    ## 11 Italy                    8006.  5308180            663
    ## 12 Colombia                 7981.  5099746            639
    ## 13 Indonesia                6625.  4260148            643
    ## 14 Poland                   6102.  3923472            643
    ## 15 Mexico                   6085.  3924638            645
    ## 16 Ukraine                  5682.  3597046            633
    ## 17 South Africa             5095.  3255816            639
    ## 18 Netherlands              4518.  2936761            650
    ## 19 Philippines              4412.  2837016            643
    ## 20 Malaysia                 4178.  2707402            648

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                353.             227974.            645
    ##  2 Belgium                       293.             191306.            653
    ##  3 Israel                        285.             184051.            645
    ##  4 Serbia                        273.             174196.            638
    ##  5 United Kingdom                272.             177997.            654
    ##  6 Netherlands                   271.             176435.            650
    ##  7 United States                 246.             160632.            654
    ##  8 Switzerland                   234.             153031.            654
    ##  9 Austria                       233.             150988.            648
    ## 10 Slovakia                      229.             146409.            639
    ## 11 Argentina                     204.             129921.            638
    ## 12 Sweden                        201.             130470.            650
    ## 13 France                        193.             126876.            656
    ## 14 Hungary                       192.             122049.            637
    ## 15 Turkey                        183.             117197.            639
    ## 16 Spain                         178.             116591.            655
    ## 17 Portugal                      176.             113444.            644
    ## 18 Brazil                        171.             110397.            644
    ## 19 Colombia                      167.             106712.            639
    ## 20 Chile                         167.             106749.            641

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Peru                 8.94     201992  2258456
    ##  2 Mexico               7.57     297188  3924638
    ##  3 Ecuador              6.28      33570   534176
    ##  4 China                4.40       5698   129430
    ##  5 Bulgaria             4.15      29933   721819
    ##  6 Niger                3.77        271     7185
    ##  7 Malawi               3.64       2311    63408
    ##  8 Myanmar              3.64      19201   527714
    ##  9 Paraguay             3.56      16517   464004
    ## 10 Bolivia              3.47      19372   558565
    ## 11 Indonesia            3.38     143986  4260148
    ## 12 Mali                 3.35        634    18939
    ## 13 Romania              3.23      58019  1796230
    ## 14 Chad                 3.17        181     5703
    ## 15 El Salvador          3.14       3802   121267
    ## 16 Hungary              3.08      37530  1218295
    ## 17 Haiti                2.95        765    25907
    ## 18 Russia               2.90     295104 10159389
    ## 19 Algeria              2.89       6171   213745
    ## 20 Brazil               2.78     617271 22201221

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6754.     201992   29.9 
    ##  2 Bulgaria               4187.      29933    7.15
    ##  3 Hungary                3760.      37530    9.98
    ##  4 Czech Republic         3345.      35046   10.5 
    ##  5 Brazil                 3069.     617271  201.  
    ##  6 Slovakia               2904.      15843    5.46
    ##  7 Argentina              2827.     116857   41.3 
    ##  8 Colombia               2705.     129256   47.8 
    ##  9 Belgium                2669.      27763   10.4 
    ## 10 Mexico                 2642.     297188  112.  
    ## 11 Romania                2642.      58019   22.0 
    ## 12 Paraguay               2591.      16517    6.38
    ## 13 United States          2554.     792371  310.  
    ## 14 Poland                 2360.      90872   38.5 
    ## 15 United Kingdom         2357.     146937   62.3 
    ## 16 Chile                  2315.      38773   16.7 
    ## 17 Ecuador                2270.      33570   14.8 
    ## 18 Italy                  2242.     135301   60.3 
    ## 19 Russia                 2097.     295104  141.  
    ## 20 Ukraine                2040.      92641   45.4

EOL
