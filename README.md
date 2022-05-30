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

Updated: 2022-05-31

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
    ##  1 United States          101287. 82853070            818
    ##  2 India                   53477. 43155749            807
    ##  3 Brazil                  38271. 30846602            806
    ##  4 France                  34886. 28606373            820
    ##  5 Germany                 31927. 26244107            822
    ##  6 United Kingdom          27234. 22277700            818
    ##  7 Russia                  22824. 18327837            803
    ##  8 South Korea             21791. 18086462            830
    ##  9 Italy                   21026. 17388877            827
    ## 10 Turkey                  18768. 15070864            803
    ## 11 Spain                   15050. 12326264            819
    ## 12 Vietnam                 13413. 10717251            799
    ## 13 Argentina               11346.  9178795            809
    ## 14 Japan                   10629.  8811614            829
    ## 15 Netherlands              9929.  8081992            814
    ## 16 Australia                8829.  7152007            810
    ## 17 Iran                     8765.  7231562            825
    ## 18 Colombia                 7605.  6099111            802
    ## 19 Indonesia                7502.  6054633            807
    ## 20 Poland                   7444.  6007238            807

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       704.             571732.            812
    ##  2 Israel                        694.             562403.            810
    ##  3 Austria                       643.             522472.            812
    ##  4 Netherlands                   596.             485551.            814
    ##  5 Switzerland                   589.             481554.            818
    ##  6 France                        539.             441672.            820
    ##  7 Portugal                      538.             433880.            807
    ##  8 Belgium                       488.             398690.            817
    ##  9 Czech Republic                462.             374159.            809
    ## 10 South Korea                   450.             373512.            830
    ## 11 United Kingdom                437.             357310.            818
    ## 12 Australia                     410.             332408.            810
    ## 13 Slovakia                      408.             328041.            803
    ## 14 Germany                       390.             320824.            822
    ## 15 Greece                        387.             313231.            809
    ## 16 Norway                        350.             285965.            816
    ## 17 Italy                         348.             288180.            827
    ## 18 Serbia                        342.             274604.            802
    ## 19 Jordan                        331.             264853.            799
    ## 20 United States                 326.             267067.            818

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.93       4941    62321
    ##  3 Peru                 5.96     213134  3577241
    ##  4 Mexico               5.64     324768  5759773
    ##  5 Syria                5.64       3150    55891
    ##  6 Somalia              5.12       1361    26565
    ##  7 Egypt                4.81      24718   513944
    ##  8 Afghanistan          4.27       7701   180176
    ##  9 Ecuador              4.07      35617   874833
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37134  1164732
    ## 12 Myanmar              3.17      19434   613315
    ## 13 Malawi               3.07       2640    85973
    ## 14 Paraguay             2.90      18885   650283
    ## 15 Tunisia              2.75      28632  1042362
    ## 16 Haiti                2.71        835    30781
    ## 17 Chad                 2.60        193     7417
    ## 18 Indonesia            2.59     156586  6054633
    ## 19 Algeria              2.59       6875   265873
    ## 20 Honduras             2.56      10899   425113

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7127.     213134   29.9 
    ##  2 Bulgaria               5194.      37134    7.15
    ##  3 Hungary                4659.      46507    9.98
    ##  4 Czech Republic         3845.      40281   10.5 
    ##  5 Slovakia               3684.      20098    5.46
    ##  6 Chile                  3455.      57851   16.7 
    ##  7 Brazil                 3312.     666037  201.  
    ##  8 United States          3211.     996108  310.  
    ##  9 Argentina              3116.     128825   41.3 
    ## 10 Belgium                3050.      31727   10.4 
    ## 11 Poland                 3021.     116311   38.5 
    ## 12 Romania                2991.      65678   22.0 
    ## 13 Paraguay               2962.      18885    6.38
    ## 14 Colombia               2926.     139833   47.8 
    ## 15 Mexico                 2888.     324768  112.  
    ## 16 United Kingdom         2862.     178465   62.3 
    ## 17 Italy                  2760.     166569   60.3 
    ## 18 Greece                 2709.      29803   11   
    ## 19 Tunisia                2704.      28632   10.6 
    ## 20 Russia                 2694.     379029  141.

EOL
