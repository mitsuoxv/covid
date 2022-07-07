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

Updated: 2022-07-08

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
    ##  1 United States          101659. 87020037            856
    ##  2 India                   51558. 43566739            845
    ##  3 Brazil                  38638. 32610514            844
    ##  4 France                  35989. 30878926            858
    ##  5 Germany                 33498. 28808614            860
    ##  6 United Kingdom          26734. 22884446            856
    ##  7 Italy                   22022. 19048788            865
    ##  8 Russia                  21940. 18451810            841
    ##  9 South Korea             21258. 18451862            868
    ## 10 Turkey                  18050. 15180444            841
    ## 11 Spain                   15041. 12890002            857
    ## 12 Vietnam                 12845. 10751227            837
    ## 13 Argentina               11091.  9394326            847
    ## 14 Japan                   10953.  9496651            867
    ## 15 Australia                9821.  8327916            848
    ## 16 Netherlands              9644.  8217081            852
    ## 17 Iran                     8393.  7242919            863
    ## 18 Colombia                 7351.  6175181            840
    ## 19 Mexico                   7227.  6121808            847
    ## 20 Indonesia                7223   6103552            845

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        709.             600990.            848
    ##  2 Denmark                       683.             580446.            850
    ##  3 Austria                       650.             552095.            850
    ##  4 Switzerland                   584.             499639.            856
    ##  5 Netherlands                   579.             493667.            852
    ##  6 Portugal                      578.             488451.            845
    ##  7 France                        556.             476759.            858
    ##  8 Belgium                       480.             410006.            855
    ##  9 Australia                     456.             387061.            848
    ## 10 Czech Republic                444.             375872.            847
    ## 11 South Korea                   439.             381059.            868
    ## 12 United Kingdom                429.             367041.            856
    ## 13 Germany                       410.             352174.            860
    ## 14 Greece                        405.             343125.            847
    ## 15 Slovakia                      392.             329799.            841
    ## 16 Italy                         365.             315689.            865
    ## 17 Norway                        339.             289239.            854
    ## 18 Serbia                        330.             277185.            840
    ## 19 United States                 328.             280499.            856
    ## 20 Spain                         323.             277169.            857

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11832
    ##  2 Sudan                7.89       4952    62745
    ##  3 Peru                 5.86     213593  3644199
    ##  4 Syria                5.63       3150    55940
    ##  5 Mexico               5.32     325868  6121808
    ##  6 Somalia              5.08       1361    26803
    ##  7 Egypt                4.81      24724   514133
    ##  8 Afghanistan          4.22       7725   182979
    ##  9 Ecuador              3.91      35745   913939
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.17      37263  1175725
    ## 12 Myanmar              3.17      19434   613683
    ## 13 Malawi               3.06       2646    86576
    ## 14 Paraguay             2.87      18994   660841
    ## 15 Tunisia              2.70      28748  1066127
    ## 16 Haiti                2.64        837    31703
    ## 17 Chad                 2.60        193     7426
    ## 18 Algeria              2.58       6875   266181
    ## 19 Indonesia            2.57     156776  6103552
    ## 20 Honduras             2.55      10906   427718

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7142.     213593   29.9 
    ##  2 Bulgaria               5212.      37263    7.15
    ##  3 Hungary                4675.      46661    9.98
    ##  4 Czech Republic         3849.      40325   10.5 
    ##  5 Slovakia               3695.      20154    5.46
    ##  6 Chile                  3502.      58649   16.7 
    ##  7 Brazil                 3344.     672429  201.  
    ##  8 United States          3253.    1009269  310.  
    ##  9 Argentina              3123.     129109   41.3 
    ## 10 Belgium                3071.      31952   10.4 
    ## 11 Poland                 3025.     116449   38.5 
    ## 12 Romania                2994.      65755   22.0 
    ## 13 Paraguay               2979.      18994    6.38
    ## 14 Colombia               2931.     140070   47.8 
    ## 15 United Kingdom         2899.     180718   62.3 
    ## 16 Mexico                 2897.     325868  112.  
    ## 17 Italy                  2797.     168770   60.3 
    ## 18 Greece                 2761       30371   11   
    ## 19 Tunisia                2715.      28748   10.6 
    ## 20 Russia                 2711.     381450  141.

EOL
