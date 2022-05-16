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

Updated: 2022-05-17

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
    ##  1 United States          101516. 81618866            804
    ##  2 India                   54380. 43123801            793
    ##  3 Brazil                  38740. 30682094            792
    ##  4 France                  35147. 28328294            806
    ##  5 Germany                 31847. 25732153            808
    ##  6 United Kingdom          27562. 22159809            804
    ##  7 Russia                  23149. 18264836            789
    ##  8 South Korea             21808. 17795357            816
    ##  9 Italy                   20981. 17057873            813
    ## 10 Turkey                  19080. 15054322            789
    ## 11 Spain                   15065. 12127122            805
    ## 12 Vietnam                 13626. 10696630            785
    ## 13 Argentina               11491.  9135308            795
    ## 14 Japan                   10274.  8373056            815
    ## 15 Netherlands             10084.  8067116            800
    ## 16 Iran                     8912.  7228051            811
    ## 17 Australia                8163.  6497556            796
    ## 18 Colombia                 7735.  6095316            788
    ## 19 Indonesia                7630.  6050958            793
    ## 20 Poland                   7571.  6003531            793

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       715.             570418.            798
    ##  2 Israel                        702.             558768.            796
    ##  3 Austria                       650.             518433.            798
    ##  4 Netherlands                   606.             484657.            800
    ##  5 Switzerland                   596.             479077.            804
    ##  6 France                        543.             437378.            806
    ##  7 Belgium                       493.             395693.            803
    ##  8 Portugal                      480.             380917.            794
    ##  9 Czech Republic                470.             373799.            795
    ## 10 South Korea                   450.             367501.            816
    ## 11 United Kingdom                442.             355419.            804
    ## 12 Slovakia                      415.             327615.            789
    ## 13 Germany                       389.             314565.            808
    ## 14 Greece                        388.             308416.            795
    ## 15 Australia                     379.             301991.            796
    ## 16 Norway                        356.             285348.            802
    ## 17 Serbia                        348.             274047.            788
    ## 18 Italy                         348.             282694.            813
    ## 19 Jordan                        337.             264763.            785
    ## 20 Sweden                        328.             262131.            800

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4936    62195
    ##  3 Peru                  5.96     213023  3571919
    ##  4 Mexico                5.65     324465  5745652
    ##  5 Syria                 5.64       3150    55870
    ##  6 Somalia               5.13       1361    26518
    ##  7 Egypt                 4.80      24690   513881
    ##  8 Afghanistan           4.29       7690   179267
    ##  9 Ecuador               4.09      35602   871046
    ## 10 Niger                 3.44        310     9013
    ## 11 Bulgaria              3.19      37048  1161630
    ## 12 Myanmar               3.17      19434   613144
    ## 13 Malawi                3.07       2636    85887
    ## 14 Paraguay              2.90      18872   649718
    ## 15 Tunisia               2.74      28575  1041197
    ## 16 Haiti                 2.72        835    30713
    ## 17 Chad                  2.60        193     7414
    ## 18 South Africa          2.59     100755  3891793
    ## 19 Algeria               2.59       6875   265820
    ## 20 Indonesia             2.59     156464  6050958

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7123.     213023   29.9 
    ##  2 Bulgaria               5182.      37048    7.15
    ##  3 Hungary                4643.      46343    9.98
    ##  4 Czech Republic         3842.      40246   10.5 
    ##  5 Slovakia               3676.      20050    5.46
    ##  6 Chile                  3447.      57722   16.7 
    ##  7 Brazil                 3306.     664872  201.  
    ##  8 United States          3199.     992289  310.  
    ##  9 Argentina              3115.     128776   41.3 
    ## 10 Belgium                3039.      31613   10.4 
    ## 11 Poland                 3018.     116207   38.5 
    ## 12 Romania                2988.      65612   22.0 
    ## 13 Paraguay               2960.      18872    6.38
    ## 14 Colombia               2926.     139821   47.8 
    ## 15 Mexico                 2885.     324465  112.  
    ## 16 United Kingdom         2840.     177095   62.3 
    ## 17 Italy                  2739.     165244   60.3 
    ## 18 Tunisia                2699.      28575   10.6 
    ## 19 Greece                 2686.      29547   11   
    ## 20 Russia                 2685.     377759  141.

EOL
