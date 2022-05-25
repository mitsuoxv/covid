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

Updated: 2022-05-26

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
    ##  1 United States          101537. 82549419            813
    ##  2 India                   53793. 43142192            802
    ##  3 Brazil                  38457. 30803995            801
    ##  4 France                  34992. 28518939            815
    ##  5 Germany                 32018. 26159106            817
    ##  6 United Kingdom          27394. 22271126            813
    ##  7 Russia                  22940. 18305973            798
    ##  8 South Korea             21840. 18017923            825
    ##  9 Italy                   21032. 17288287            822
    ## 10 Turkey                  18879. 15065524            798
    ## 11 Spain                   15086. 12280345            814
    ## 12 Vietnam                 13490. 10711389            794
    ## 13 Argentina               11416.  9178795            804
    ## 14 Japan                   10523.  8671121            824
    ## 15 Netherlands              9986.  8078973            809
    ## 16 Iran                     8818.  7230589            820
    ## 17 Australia                8721.  7020862            805
    ## 18 Colombia                 7652.  6099111            797
    ## 19 Indonesia                7547.  6053109            802
    ## 20 Poland                   7489.  6006298            802

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       708.             571391.            807
    ##  2 Israel                        697.             561287.            805
    ##  3 Austria                       646.             521186.            807
    ##  4 Netherlands                   600.             485369.            809
    ##  5 Switzerland                   592.             481554.            813
    ##  6 France                        540.             440322.            815
    ##  7 Portugal                      531.             425657.            802
    ##  8 Belgium                       490.             398290.            812
    ##  9 Czech Republic                465.             374068.            804
    ## 10 South Korea                   451.             372097.            825
    ## 11 United Kingdom                439.             357204.            813
    ## 12 Slovakia                      411.             327931.            798
    ## 13 Australia                     405.             326313.            805
    ## 14 Germany                       391.             319785.            817
    ## 15 Greece                        388.             311623.            804
    ## 16 Norway                        352.             285816.            811
    ## 17 Italy                         349.             286513.            822
    ## 18 Serbia                        344.             274439.            797
    ## 19 Jordan                        333.             264811.            794
    ## 20 United States                 327.             266089.            813

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4941    62251
    ##  3 Peru                  5.96     213116  3576309
    ##  4 Mexico                5.64     324768  5759773
    ##  5 Syria                 5.64       3150    55883
    ##  6 Somalia               5.13       1361    26535
    ##  7 Egypt                 4.81      24704   513916
    ##  8 Afghanistan           4.28       7699   179835
    ##  9 Ecuador               4.07      35617   874719
    ## 10 Niger                 3.43        310     9031
    ## 11 Bulgaria              3.19      37109  1163806
    ## 12 Myanmar               3.17      19434   613238
    ## 13 Malawi                3.07       2638    85933
    ## 14 Paraguay              2.90      18885   650283
    ## 15 Tunisia               2.75      28636  1042935
    ## 16 Haiti                 2.72        835    30746
    ## 17 Chad                  2.60        193     7417
    ## 18 Indonesia             2.59     156548  6053109
    ## 19 Algeria               2.59       6875   265860
    ## 20 South Africa          2.57     101002  3935761

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7126.     213116   29.9 
    ##  2 Bulgaria               5191.      37109    7.15
    ##  3 Hungary                4659.      46507    9.98
    ##  4 Czech Republic         3845.      40277   10.5 
    ##  5 Slovakia               3682.      20088    5.46
    ##  6 Chile                  3452.      57813   16.7 
    ##  7 Brazil                 3310.     665666  201.  
    ##  8 United States          3207.     994931  310.  
    ##  9 Argentina              3116.     128825   41.3 
    ## 10 Belgium                3048.      31710   10.4 
    ## 11 Poland                 3021.     116290   38.5 
    ## 12 Romania                2990.      65663   22.0 
    ## 13 Paraguay               2962.      18885    6.38
    ## 14 Colombia               2926.     139833   47.8 
    ## 15 Mexico                 2888.     324768  112.  
    ## 16 United Kingdom         2858.     178221   62.3 
    ## 17 Italy                  2753.     166127   60.3 
    ## 18 Tunisia                2704.      28636   10.6 
    ## 19 Greece                 2702.      29725   11   
    ## 20 Russia                 2691.     378609  141.

EOL
