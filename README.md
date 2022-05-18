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

Updated: 2022-05-19

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
    ##  1 United States          101520. 81824843            806
    ##  2 India                   54248. 43127199            795
    ##  3 Brazil                  38667. 30701900            794
    ##  4 France                  35114. 28372414            808
    ##  5 Germany                 31963. 25890456            810
    ##  6 United Kingdom          27552. 22207106            806
    ##  7 Russia                  23102. 18273690            791
    ##  8 South Korea             21836. 17861744            818
    ##  9 Italy                   21002. 17116550            815
    ## 10 Turkey                  19035. 15057184            791
    ## 11 Spain                   15092. 12179234            807
    ## 12 Vietnam                 13596. 10699965            787
    ## 13 Argentina               11462.  9135308            797
    ## 14 Japan                   10322.  8433124            817
    ## 15 Netherlands             10064.  8071518            802
    ## 16 Iran                     8891.  7228786            813
    ## 17 Australia                8374.  6682583            798
    ## 18 Colombia                 7715.  6095316            790
    ## 19 Indonesia                7612.  6051532            795
    ## 20 Poland                   7553.  6004427            795

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       713.             570668.            800
    ##  2 Israel                        701.             559402.            798
    ##  3 Austria                       649.             519041.            800
    ##  4 Netherlands                   605.             484921.            802
    ##  5 Switzerland                   596.             480491.            806
    ##  6 France                        542.             438060.            808
    ##  7 Belgium                       493.             396724.            805
    ##  8 Portugal                      484.             385380.            796
    ##  9 Czech Republic                469.             373896.            797
    ## 10 South Korea                   451.             368872.            818
    ## 11 United Kingdom                442.             356177.            806
    ## 12 Slovakia                      414.             327710.            791
    ## 13 Germany                       391.             316501.            810
    ## 14 Australia                     389.             310590.            798
    ## 15 Greece                        388.             309266.            797
    ## 16 Norway                        355.             285502.            804
    ## 17 Italy                         348.             283667.            815
    ## 18 Serbia                        347.             274154.            790
    ## 19 Jordan                        336.             264763.            787
    ## 20 United States                 327.             263753.            806

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4937    62211
    ##  3 Peru                  5.96     213044  3572832
    ##  4 Mexico                5.64     324617  5752441
    ##  5 Syria                 5.64       3150    55872
    ##  6 Somalia               5.13       1361    26518
    ##  7 Egypt                 4.80      24690   513881
    ##  8 Afghanistan           4.29       7691   179416
    ##  9 Ecuador               4.08      35609   872465
    ## 10 Niger                 3.44        310     9013
    ## 11 Bulgaria              3.19      37065  1162449
    ## 12 Myanmar               3.17      19434   613182
    ## 13 Malawi                3.07       2637    85889
    ## 14 Paraguay              2.91      18881   649929
    ## 15 Tunisia               2.75      28628  1041789
    ## 16 Haiti                 2.72        835    30725
    ## 17 Chad                  2.60        193     7415
    ## 18 Algeria               2.59       6875   265828
    ## 19 Indonesia             2.59     156498  6051532
    ## 20 South Africa          2.59     100812  3899841

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7124.     213044   29.9 
    ##  2 Bulgaria               5185.      37065    7.15
    ##  3 Hungary                4653.      46446    9.98
    ##  4 Czech Republic         3843.      40258   10.5 
    ##  5 Slovakia               3679.      20069    5.46
    ##  6 Chile                  3447.      57733   16.7 
    ##  7 Brazil                 3307.     664987  201.  
    ##  8 United States          3200.     992667  310.  
    ##  9 Argentina              3115.     128776   41.3 
    ## 10 Belgium                3043.      31656   10.4 
    ## 11 Poland                 3019.     116230   38.5 
    ## 12 Romania                2988.      65625   22.0 
    ## 13 Paraguay               2961.      18881    6.38
    ## 14 Colombia               2926.     139821   47.8 
    ## 15 Mexico                 2886.     324617  112.  
    ## 16 United Kingdom         2848.     177580   62.3 
    ## 17 Italy                  2743.     165494   60.3 
    ## 18 Tunisia                2704.      28628   10.6 
    ## 19 Greece                 2691.      29599   11   
    ## 20 Russia                 2686.     377975  141.

EOL
