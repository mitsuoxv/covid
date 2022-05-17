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

Updated: 2022-05-18

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
    ##  1 United States          101469. 81682634            805
    ##  2 India                   54314. 43125370            794
    ##  3 Brazil                  38699. 30688390            793
    ##  4 France                  35104. 28328687            807
    ##  5 Germany                 31914. 25818405            809
    ##  6 United Kingdom          27582. 22203803            805
    ##  7 Russia                  23125. 18268958            790
    ##  8 South Korea             21824. 17830429            817
    ##  9 Italy                   20972. 17071649            814
    ## 10 Turkey                  19057. 15055576            790
    ## 11 Spain                   15046. 12127122            806
    ## 12 Vietnam                 13611. 10698180            786
    ## 13 Argentina               11476.  9135308            796
    ## 14 Japan                   10293.  8399390            816
    ## 15 Netherlands             10075.  8070272            801
    ## 16 Iran                     8902.  7228434            812
    ## 17 Australia                8320.  6631359            797
    ## 18 Colombia                 7725.  6095316            789
    ## 19 Indonesia                7621.  6051205            794
    ## 20 Poland                   7562.  6004041            794

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       714.             570522.            799
    ##  2 Israel                        701.             559097.            797
    ##  3 Austria                       649.             518696.            799
    ##  4 Netherlands                   605.             484847.            801
    ##  5 Switzerland                   595.             479077.            805
    ##  6 France                        542.             437384.            807
    ##  7 Belgium                       493.             396724.            804
    ##  8 Portugal                      485.             385380.            795
    ##  9 Czech Republic                470.             373849.            796
    ## 10 South Korea                   451.             368225.            817
    ## 11 United Kingdom                442.             356124.            805
    ## 12 Slovakia                      415.             327663.            790
    ## 13 Germany                       390.             315620.            809
    ## 14 Greece                        388.             308695.            796
    ## 15 Australia                     387.             308209.            797
    ## 16 Norway                        355.             285431.            803
    ## 17 Italy                         348.             282923.            814
    ## 18 Serbia                        347.             274102.            789
    ## 19 Jordan                        337.             264763.            786
    ## 20 Sweden                        327.             262131.            801

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4936    62195
    ##  3 Peru                  5.96     213040  3572423
    ##  4 Mexico                5.64     324617  5752441
    ##  5 Syria                 5.64       3150    55871
    ##  6 Somalia               5.13       1361    26518
    ##  7 Egypt                 4.80      24690   513881
    ##  8 Afghanistan           4.29       7691   179321
    ##  9 Ecuador               4.08      35609   872465
    ## 10 Niger                 3.44        310     9013
    ## 11 Bulgaria              3.19      37059  1161992
    ## 12 Myanmar               3.17      19434   613144
    ## 13 Malawi                3.07       2636    85887
    ## 14 Paraguay              2.91      18881   649929
    ## 15 Tunisia               2.74      28575  1041197
    ## 16 Haiti                 2.72        835    30725
    ## 17 Chad                  2.60        193     7415
    ## 18 South Africa          2.59     100771  3894745
    ## 19 Algeria               2.59       6875   265823
    ## 20 Indonesia             2.59     156481  6051205

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7123.     213040   29.9 
    ##  2 Bulgaria               5184.      37059    7.15
    ##  3 Hungary                4643.      46343    9.98
    ##  4 Czech Republic         3843.      40256   10.5 
    ##  5 Slovakia               3678.      20062    5.46
    ##  6 Chile                  3447.      57725   16.7 
    ##  7 Brazil                 3306.     664918  201.  
    ##  8 United States          3199.     992415  310.  
    ##  9 Argentina              3115.     128776   41.3 
    ## 10 Belgium                3043.      31656   10.4 
    ## 11 Poland                 3019.     116217   38.5 
    ## 12 Romania                2988.      65612   22.0 
    ## 13 Paraguay               2961.      18881    6.38
    ## 14 Colombia               2926.     139821   47.8 
    ## 15 Mexico                 2886.     324617  112.  
    ## 16 United Kingdom         2845.     177410   62.3 
    ## 17 Italy                  2740.     165346   60.3 
    ## 18 Tunisia                2699.      28575   10.6 
    ## 19 Greece                 2689.      29576   11   
    ## 20 Russia                 2686.     377869  141.

EOL
