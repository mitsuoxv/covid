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

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-07-13

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
    ##  1 United States          101655. 87525062            861
    ##  2 India                   51356. 43652944            850
    ##  3 Brazil                  38721. 32874501            849
    ##  4 France                  36407. 31419745            863
    ##  5 Germany                 33735. 29180489            865
    ##  6 United Kingdom          26579. 22884446            861
    ##  7 Italy                   22440. 19523262            870
    ##  8 Russia                  21830. 18468310            846
    ##  9 South Korea             21262. 18561861            873
    ## 10 Turkey                  17944. 15180444            846
    ## 11 Spain                   15050. 12973615            862
    ## 12 Vietnam                 12773. 10755381            842
    ## 13 Japan                   11173.  9742683            872
    ## 14 Argentina               11063.  9426171            852
    ## 15 Australia                9979.  8511844            853
    ## 16 Netherlands              9622.  8246492            857
    ## 17 Iran                     8354.  7251429            868
    ## 18 Mexico                   7346.  6259325            852
    ## 19 Colombia                 7336.  6198848            845
    ## 20 Indonesia                7196.  6116347            850

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        712.             607406.            853
    ##  2 Denmark                       681.             582392.            855
    ##  3 Austria                       653.             558121.            855
    ##  4 Switzerland                   580.             499639.            861
    ##  5 Netherlands                   578.             495434.            857
    ##  6 Portugal                      577.             490580.            850
    ##  7 France                        562.             485109.            863
    ##  8 Belgium                       483.             415275.            860
    ##  9 Australia                     464.             395610.            853
    ## 10 Czech Republic                442.             376460.            852
    ## 11 South Korea                   439.             383330.            873
    ## 12 United Kingdom                426.             367041.            861
    ## 13 Germany                       412.             356720.            865
    ## 14 Greece                        410.             349377.            852
    ## 15 Slovakia                      390.             330338.            846
    ## 16 Italy                         372.             323552.            870
    ## 17 Norway                        337.             289615.            859
    ## 18 Serbia                        329.             278161.            845
    ## 19 United States                 328.             282127.            861
    ## 20 Spain                         324.             278967.            862

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11832
    ##  2 Sudan                 7.89       4955    62795
    ##  3 Peru                  5.81     213685  3675152
    ##  4 Syria                 5.63       3150    55955
    ##  5 Mexico                5.21     326085  6259325
    ##  6 Somalia               5.06       1361    26900
    ##  7 Egypt                 4.81      24725   514182
    ##  8 Afghanistan           4.22       7728   183268
    ##  9 Ecuador               3.88      35754   921765
    ## 10 Niger                 3.42        311     9096
    ## 11 Myanmar               3.17      19434   613760
    ## 12 Bulgaria              3.16      37277  1179497
    ## 13 Malawi                3.05       2649    86750
    ## 14 Paraguay              2.83      19036   673829
    ## 15 Tunisia               2.70      28748  1066127
    ## 16 Haiti                 2.62        837    31908
    ## 17 Chad                  2.60        193     7427
    ## 18 Algeria               2.58       6875   266274
    ## 19 Indonesia             2.56     156806  6116347
    ## 20 South Africa          2.55     101880  3997975

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7145.     213685   29.9 
    ##  2 Bulgaria               5214.      37277    7.15
    ##  3 Hungary                4675.      46661    9.98
    ##  4 Czech Republic         3850.      40334   10.5 
    ##  5 Slovakia               3696.      20163    5.46
    ##  6 Chile                  3515.      58860   16.7 
    ##  7 Brazil                 3349.     673554  201.  
    ##  8 United States          3259.    1011098  310.  
    ##  9 Argentina              3124.     129145   41.3 
    ## 10 Belgium                3077.      32015   10.4 
    ## 11 Poland                 3025.     116458   38.5 
    ## 12 Romania                2996.      65788   22.0 
    ## 13 Paraguay               2986.      19036    6.38
    ## 14 Colombia               2934.     140202   47.8 
    ## 15 Mexico                 2899.     326085  112.  
    ## 16 United Kingdom         2899.     180718   62.3 
    ## 17 Italy                  2805.     169233   60.3 
    ## 18 Greece                 2771.      30476   11   
    ## 19 Tunisia                2715.      28748   10.6 
    ## 20 Russia                 2713.     381669  141.

EOL
