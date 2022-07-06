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

Updated: 2022-07-07

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
    ##  1 United States          101500. 86782609            855
    ##  2 India                   51597. 43547809            844
    ##  3 Brazil                  38595. 32535923            843
    ##  4 France                  35851. 30724311            857
    ##  5 Germany                 33380. 28673212            859
    ##  6 United Kingdom          26598. 22741517            855
    ##  7 Russia                  21962. 18448451            840
    ##  8 Italy                   21920. 18938771            864
    ##  9 South Korea             21261. 18433359            867
    ## 10 Turkey                  18072. 15180444            840
    ## 11 Spain                   15058. 12890002            856
    ## 12 Vietnam                 12858. 10749324            836
    ## 13 Argentina               11104.  9394326            846
    ## 14 Japan                   10914.  9451806            866
    ## 15 Australia                9789.  8291349            847
    ## 16 Netherlands              9648.  8210651            851
    ## 17 Iran                     8401.  7241648            862
    ## 18 Colombia                 7360.  6175181            839
    ## 19 Indonesia                7228.  6100671            844
    ## 20 Mexico                   7203.  6093835            846

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        707.             598889.            847
    ##  2 Denmark                       683.             579940.            849
    ##  3 Austria                       648.             550518.            849
    ##  4 Switzerland                   584.             499639.            855
    ##  5 Netherlands                   580.             493280.            851
    ##  6 Portugal                      579.             488451.            844
    ##  7 France                        554.             474372.            857
    ##  8 Belgium                       480.             410006.            854
    ##  9 Australia                     455.             385362.            847
    ## 10 Czech Republic                444.             375851.            846
    ## 11 South Korea                   439.             380676.            867
    ## 12 United Kingdom                427.             364749.            855
    ## 13 Germany                       408.             350519.            859
    ## 14 Greece                        403.             341370.            846
    ## 15 Slovakia                      392.             329676.            840
    ## 16 Italy                         363.             313866.            864
    ## 17 Norway                        339.             289207.            853
    ## 18 Serbia                        330.             277003.            839
    ## 19 United States                 327.             279734.            855
    ## 20 Spain                         324.             277169.            856

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11832
    ##  2 Sudan                7.90       4952    62704
    ##  3 Peru                 5.87     213579  3640061
    ##  4 Syria                5.63       3150    55937
    ##  5 Mexico               5.35     325793  6093835
    ##  6 Somalia              5.08       1361    26803
    ##  7 Egypt                4.81      24724   514133
    ##  8 Afghanistan          4.22       7725   182873
    ##  9 Ecuador              3.91      35745   913798
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.17      37261  1175082
    ## 12 Myanmar              3.17      19434   613683
    ## 13 Malawi               3.06       2646    86576
    ## 14 Paraguay             2.87      18994   660841
    ## 15 Tunisia              2.70      28748  1066127
    ## 16 Haiti                2.64        837    31677
    ## 17 Chad                 2.60        193     7426
    ## 18 Algeria              2.58       6875   266164
    ## 19 Indonesia            2.57     156770  6100671
    ## 20 Honduras             2.55      10906   427718

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7141.     213579   29.9 
    ##  2 Bulgaria               5212.      37261    7.15
    ##  3 Hungary                4675.      46661    9.98
    ##  4 Czech Republic         3849.      40324   10.5 
    ##  5 Slovakia               3694.      20152    5.46
    ##  6 Chile                  3501.      58631   16.7 
    ##  7 Brazil                 3342.     672033  201.  
    ##  8 United States          3252.    1008832  310.  
    ##  9 Argentina              3123.     129109   41.3 
    ## 10 Belgium                3071.      31952   10.4 
    ## 11 Poland                 3024.     116440   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2979.      18994    6.38
    ## 14 Colombia               2931.     140070   47.8 
    ## 15 Mexico                 2897.     325793  112.  
    ## 16 United Kingdom         2894.     180417   62.3 
    ## 17 Italy                  2796.     168698   60.3 
    ## 18 Greece                 2759       30349   11   
    ## 19 Tunisia                2715.      28748   10.6 
    ## 20 Russia                 2711.     381398  141.

EOL
