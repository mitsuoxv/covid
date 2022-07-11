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

Updated: 2022-07-12

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
    ##  1 United States          101368. 87176676            860
    ##  2 India                   51401. 43639329            849
    ##  3 Brazil                  38547. 32687680            848
    ##  4 France                  36169. 31178060            862
    ##  5 Germany                 33594. 29025760            864
    ##  6 United Kingdom          26610. 22884446            860
    ##  7 Italy                   22370. 19439501            869
    ##  8 Russia                  21852. 18465308            845
    ##  9 South Korea             21244. 18524538            872
    ## 10 Turkey                  17965. 15180444            845
    ## 11 Spain                   15068. 12973615            861
    ## 12 Vietnam                 12788. 10754813            841
    ## 13 Japan                   11133.  9696650            871
    ## 14 Argentina               11039.  9394326            851
    ## 15 Australia                9875.  8413831            852
    ## 16 Netherlands              9616.  8231077            856
    ## 17 Iran                     8356.  7244694            867
    ## 18 Colombia                 7316.  6175181            844
    ## 19 Mexico                   7230.  6152924            851
    ## 20 Indonesia                7200.  6112986            849

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        711.             605807.            852
    ##  2 Denmark                       681.             581373.            854
    ##  3 Austria                       653.             557370.            854
    ##  4 Switzerland                   581.             499639.            860
    ##  5 Portugal                      578.             490580.            849
    ##  6 Netherlands                   578.             494507.            856
    ##  7 France                        558.             481378.            862
    ##  8 Belgium                       481.             412850.            859
    ##  9 Australia                     459.             391054.            852
    ## 10 Czech Republic                442.             376265.            851
    ## 11 South Korea                   439.             382559.            872
    ## 12 United Kingdom                427.             367041.            860
    ## 13 Germany                       411.             354828.            864
    ## 14 Greece                        411.             349377.            851
    ## 15 Slovakia                      391.             330184.            845
    ## 16 Italy                         371.             322164.            869
    ## 17 Norway                        337.             289492.            858
    ## 18 Serbia                        329.             277906.            844
    ## 19 United States                 327.             281004.            860
    ## 20 Spain                         324.             278967.            861

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11832
    ##  2 Sudan                 7.89       4952    62745
    ##  3 Peru                  5.85     213612  3650203
    ##  4 Syria                 5.63       3150    55940
    ##  5 Mexico                5.30     325928  6152924
    ##  6 Somalia               5.08       1361    26803
    ##  7 Egypt                 4.81      24724   514133
    ##  8 Afghanistan           4.22       7727   183084
    ##  9 Ecuador               3.90      35747   915679
    ## 10 Niger                 3.42        311     9096
    ## 11 Myanmar               3.17      19434   613751
    ## 12 Bulgaria              3.16      37272  1178189
    ## 13 Malawi                3.06       2646    86576
    ## 14 Paraguay              2.87      18994   660841
    ## 15 Tunisia               2.70      28748  1066127
    ## 16 Haiti                 2.64        837    31703
    ## 17 Chad                  2.60        193     7426
    ## 18 Algeria               2.58       6875   266257
    ## 19 Indonesia             2.56     156798  6112986
    ## 20 South Africa          2.55     101876  3997269

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7143.     213612   29.9 
    ##  2 Bulgaria               5214.      37272    7.15
    ##  3 Hungary                4675.      46661    9.98
    ##  4 Czech Republic         3850.      40332   10.5 
    ##  5 Slovakia               3696.      20160    5.46
    ##  6 Chile                  3506.      58717   16.7 
    ##  7 Brazil                 3345.     672790  201.  
    ##  8 United States          3255.    1009906  310.  
    ##  9 Argentina              3123.     129109   41.3 
    ## 10 Belgium                3074.      31977   10.4 
    ## 11 Poland                 3025.     116453   38.5 
    ## 12 Romania                2994.      65755   22.0 
    ## 13 Paraguay               2979.      18994    6.38
    ## 14 Colombia               2931.     140070   47.8 
    ## 15 United Kingdom         2899.     180718   62.3 
    ## 16 Mexico                 2898.     325928  112.  
    ## 17 Italy                  2803.     169106   60.3 
    ## 18 Greece                 2771.      30476   11   
    ## 19 Tunisia                2715.      28748   10.6 
    ## 20 Russia                 2712.     381621  141.

EOL
