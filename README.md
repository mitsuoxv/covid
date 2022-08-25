WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-08-26

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
    ##  1 United States          102338. 92615784            905
    ##  2 India                   49641. 44378920            894
    ##  3 Brazil                  38422. 34311323            893
    ##  4 France                  36828. 33402681            907
    ##  5 Germany                 35171. 31970779            909
    ##  6 United Kingdom          25959. 23493327            905
    ##  7 South Korea             24757. 22701921            917
    ##  8 Italy                   23765. 21721630            914
    ##  9 Russia                  21646. 19265521            890
    ## 10 Japan                   19385. 17756658            916
    ## 11 Turkey                  18732. 16671848            890
    ## 12 Spain                   14706. 13323784            906
    ## 13 Vietnam                 12859. 11392859            886
    ## 14 Australia               11092.  9949823            897
    ## 15 Argentina               10779.  9658391            896
    ## 16 Netherlands              9299.  8378653            901
    ## 17 Iran                     8242.  7516596            912
    ## 18 Mexico                   7797.  6986328            896
    ## 19 Indonesia                7085.  6334357            894
    ## 20 Colombia                 7079.  6293130            889

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        702.             629265.            897
    ##  2 Austria                       668.             600748.            899
    ##  3 Denmark                       663.             595784.            899
    ##  4 Switzerland                   585.             529038.            905
    ##  5 France                        569.             515725.            907
    ##  6 Portugal                      566.             506054.            894
    ##  7 Netherlands                   559.             503374.            901
    ##  8 Australia                     516.             462444.            897
    ##  9 South Korea                   511.             468829.            917
    ## 10 Greece                        478.             428366.            896
    ## 11 Belgium                       475.             429839.            904
    ## 12 Germany                       430.             390830.            909
    ## 13 Czech Republic                430.             384851.            896
    ## 14 United Kingdom                416.             376807.            905
    ## 15 Italy                         394.             359985.            914
    ## 16 Slovakia                      377.             335965.            890
    ## 17 Serbia                        346.             307380.            889
    ## 18 United States                 330.             298536.            905
    ## 19 Norway                        323.             291321.            903
    ## 20 Spain                         316.             286496.            906

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2154    11917
    ##  2 Sudan                 7.85       4961    63173
    ##  3 Syria                 5.55       3162    56924
    ##  4 Peru                  5.28     215454  4081141
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24791   515264
    ##  7 Mexico                4.71     329174  6986328
    ##  8 Afghanistan           4.06       7769   191585
    ##  9 Ecuador               3.61      35818   991855
    ## 10 Niger                 3.37        312     9250
    ## 11 Myanmar               3.16      19437   614811
    ## 12 Malawi                3.05       2673    87718
    ## 13 Bulgaria              3.04      37570  1237628
    ## 14 Paraguay              2.72      19448   714340
    ## 15 Chad                  2.58        193     7489
    ## 16 Tunisia               2.56      29221  1142527
    ## 17 Algeria               2.55       6878   269971
    ## 18 South Africa          2.55     102066  4010207
    ## 19 Haiti                 2.54        841    33133
    ## 20 Sri Lanka             2.49      16669   669467

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7204.     215454   29.9 
    ##  2 Bulgaria               5255.      37570    7.15
    ##  3 Hungary                4728.      47191    9.98
    ##  4 Czech Republic         3891.      40758   10.5 
    ##  5 Slovakia               3729.      20343    5.46
    ##  6 Chile                  3598.      60254   16.7 
    ##  7 Brazil                 3396.     682874  201.  
    ##  8 United States          3324.    1031062  310.  
    ##  9 Argentina              3136.     129646   41.3 
    ## 10 Belgium                3121.      32463   10.4 
    ## 11 Paraguay               3050.      19448    6.38
    ## 12 Poland                 3038.     116967   38.5 
    ## 13 Romania                3032.      66576   22.0 
    ## 14 United Kingdom         3011.     187761   62.3 
    ## 15 Colombia               2959.     141406   47.8 
    ## 16 Greece                 2940.      32335   11   
    ## 17 Mexico                 2927.     329174  112.  
    ## 18 Italy                  2901.     175043   60.3 
    ## 19 Tunisia                2760.      29221   10.6 
    ## 20 Russia                 2728.     383829  141.

EOL
