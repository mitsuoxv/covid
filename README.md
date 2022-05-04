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

Updated: 2022-05-05

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
    ##  1 United States          101864. 80676055            792
    ##  2 India                   55170. 43088118            781
    ##  3 Brazil                  39052. 30460997            780
    ##  4 France                  35166. 27921895            794
    ##  5 Germany                 31450. 25033970            796
    ##  6 United Kingdom          27871. 22073862            792
    ##  7 Russia                  23431. 18206167            777
    ##  8 South Korea             21636. 17395791            804
    ##  9 Italy                   20707. 16586268            801
    ## 10 Turkey                  19351. 15036110            777
    ## 11 Spain                   15074. 11953481            793
    ## 12 Vietnam                 13789. 10659358            773
    ## 13 Argentina               11601.  9083673            783
    ## 14 Netherlands             10219.  8053048            788
    ## 15 Japan                    9903.  7952192            803
    ## 16 Iran                     9041.  7223576            799
    ## 17 Colombia                 7851.  6092667            776
    ## 18 Indonesia                7743.  6047491            781
    ## 19 Poland                   7680.  5997998            781
    ## 20 Australia                7452.  5842487            784

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       724.             568763.            786
    ##  2 Israel                        708.             555334.            784
    ##  3 Austria                       651.             511517.            786
    ##  4 Netherlands                   614.             483812.            788
    ##  5 Switzerland                   603.             477383.            792
    ##  6 France                        543.             431104.            794
    ##  7 Belgium                       495.             391356.            791
    ##  8 Czech Republic                477.             373155.            783
    ##  9 Portugal                      466.             364485.            782
    ## 10 United Kingdom                447.             354040.            792
    ## 11 South Korea                   447.             359249.            804
    ## 12 Slovakia                      421.             326921.            777
    ## 13 Greece                        387.             303232.            783
    ## 14 Germany                       384.             306030.            796
    ## 15 Norway                        360.             284838.            791
    ## 16 Serbia                        352.             273328.            776
    ## 17 Australia                     346.             271545.            784
    ## 18 Italy                         343.             274879.            801
    ## 19 Jordan                        342.             264702.            773
    ## 20 Sweden                        332.             261715.            788

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4933    62135
    ##  3 Peru                  5.97     212865  3566523
    ##  4 Mexico                5.65     324334  5739680
    ##  5 Syria                 5.64       3150    55829
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.80      24641   513790
    ##  8 Afghanistan           4.29       7683   178901
    ##  9 Ecuador               4.09      35598   869903
    ## 10 Niger                 3.45        309     8954
    ## 11 Bulgaria              3.19      36947  1157919
    ## 12 Myanmar               3.17      19434   612924
    ## 13 Malawi                3.07       2634    85790
    ## 14 Paraguay              2.91      18870   649455
    ## 15 Tunisia               2.74      28550  1040193
    ## 16 Haiti                 2.72        835    30703
    ## 17 South Africa          2.64     100377  3802198
    ## 18 Chad                  2.60        193     7412
    ## 19 Algeria               2.59       6875   265782
    ## 20 Indonesia             2.58     156321  6047491

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7118.     212865   29.9 
    ##  2 Bulgaria               5168.      36947    7.15
    ##  3 Hungary                4635.      46266    9.98
    ##  4 Czech Republic         3836.      40184   10.5 
    ##  5 Slovakia               3656.      19943    5.46
    ##  6 Chile                  3436.      57544   16.7 
    ##  7 Brazil                 3300.     663602  201.  
    ##  8 United States          3181.     986698  310.  
    ##  9 Argentina              3112.     128653   41.3 
    ## 10 Belgium                3027.      31494   10.4 
    ## 11 Poland                 3015.     116070   38.5 
    ## 12 Romania                2983.      65510   22.0 
    ## 13 Paraguay               2960.      18870    6.38
    ## 14 Colombia               2925.     139797   47.8 
    ## 15 Mexico                 2884.     324334  112.  
    ## 16 United Kingdom         2812.     175319   62.3 
    ## 17 Italy                  2716.     163889   60.3 
    ## 18 Tunisia                2696.      28550   10.6 
    ## 19 Russia                 2675.     376421  141.  
    ## 20 Greece                 2659       29249   11

EOL
