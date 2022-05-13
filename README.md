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

Updated: 2022-05-14

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
    ##  1 United States          101644. 81417085            801
    ##  2 India                   54577. 43116254            790
    ##  3 Brazil                  38806. 30617786            789
    ##  4 France                  35174. 28244891            803
    ##  5 Germany                 31878. 25661838            805
    ##  6 United Kingdom          27647. 22145161            801
    ##  7 Russia                  23219. 18250290            786
    ##  8 South Korea             21804. 17727086            813
    ##  9 Italy                   20883. 16915301            810
    ## 10 Turkey                  19148. 15050227            786
    ## 11 Spain                   14974. 12009064            802
    ## 12 Vietnam                 13671. 10690471            782
    ## 13 Argentina               11491.  9101319            792
    ## 14 Japan                   10173.  8260356            812
    ## 15 Netherlands             10120.  8065852            797
    ## 16 Iran                     8944.  7227043            808
    ## 17 Australia                8124.  6442558            793
    ## 18 Colombia                 7762.  6093645            785
    ## 19 Indonesia                7658.  6049876            790
    ## 20 Poland                   7598.  6002863            790

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       717.             570111.            795
    ##  2 Israel                        704.             557948.            793
    ##  3 Austria                       649.             516328.            795
    ##  4 Netherlands                   608.             484581.            797
    ##  5 Switzerland                   598.             479077.            801
    ##  6 France                        543.             436091.            803
    ##  7 Belgium                       495.             395693.            800
    ##  8 Portugal                      475.             376118.            791
    ##  9 Czech Republic                472.             373733.            792
    ## 10 South Korea                   450.             366091.            813
    ## 11 United Kingdom                443.             355184.            801
    ## 12 Slovakia                      417.             327512.            786
    ## 13 Germany                       390.             313706.            805
    ## 14 Greece                        388.             307327.            792
    ## 15 Australia                     378.             299434.            793
    ## 16 Norway                        357.             285290.            799
    ## 17 Serbia                        349.             273910.            785
    ## 18 Italy                         346.             280332.            810
    ## 19 Jordan                        338.             264715.            782
    ## 20 Sweden                        329.             262131.            797

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4936    62161
    ##  3 Peru                  5.96     212979  3570801
    ##  4 Mexico                5.65     324465  5745652
    ##  5 Syria                 5.64       3150    55865
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.80      24669   513846
    ##  8 Afghanistan           4.29       7686   179169
    ##  9 Ecuador               4.09      35602   871046
    ## 10 Niger                 3.44        310     9013
    ## 11 Bulgaria              3.19      37035  1161038
    ## 12 Myanmar               3.17      19434   613088
    ## 13 Malawi                3.07       2635    85842
    ## 14 Paraguay              2.90      18872   649718
    ## 15 Tunisia               2.74      28575  1041197
    ## 16 Haiti                 2.72        835    30713
    ## 17 Chad                  2.60        193     7414
    ## 18 South Africa          2.60     100630  3871085
    ## 19 Algeria               2.59       6875   265808
    ## 20 Indonesia             2.59     156438  6049876

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7121.     212979   29.9 
    ##  2 Bulgaria               5181.      37035    7.15
    ##  3 Hungary                4643.      46343    9.98
    ##  4 Czech Republic         3841.      40240   10.5 
    ##  5 Slovakia               3670.      20018    5.46
    ##  6 Chile                  3444.      57680   16.7 
    ##  7 Brazil                 3304.     664516  201.  
    ##  8 United States          3196.     991595  310.  
    ##  9 Argentina              3114.     128729   41.3 
    ## 10 Belgium                3039.      31613   10.4 
    ## 11 Poland                 3018.     116186   38.5 
    ## 12 Romania                2987.      65595   22.0 
    ## 13 Paraguay               2960.      18872    6.38
    ## 14 Colombia               2925.     139809   47.8 
    ## 15 Mexico                 2885.     324465  112.  
    ## 16 United Kingdom         2836.     176835   62.3 
    ## 17 Italy                  2732.     164846   60.3 
    ## 18 Tunisia                2699.      28575   10.6 
    ## 19 Russia                 2683.     377464  141.  
    ## 20 Greece                 2681       29491   11

EOL
