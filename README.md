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

Updated: 2022-08-24

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
    ##  1 United States          102286. 92364032            903
    ##  2 India                   49728. 44357546            892
    ##  3 Brazil                  38479. 34284864            891
    ##  4 France                  36853. 33352404            905
    ##  5 Germany                 35136. 31868639            907
    ##  6 United Kingdom          25981. 23461239            903
    ##  7 South Korea             24535. 22449475            915
    ##  8 Italy                   23751. 21660885            912
    ##  9 Russia                  21600. 19181371            888
    ## 10 Japan                   18955. 17325025            914
    ## 11 Turkey                  18774. 16671848            888
    ## 12 Spain                   14729. 13314764            904
    ## 13 Vietnam                 12880. 11386016            884
    ## 14 Australia               11089.  9924370            895
    ## 15 Argentina               10803.  9658391            894
    ## 16 Netherlands              9317.  8376026            899
    ## 17 Iran                     8253.  7510702            910
    ## 18 Mexico                   7774.  6949653            894
    ## 19 Colombia                 7095.  6293130            887
    ## 20 Indonesia                7089.  6323715            892

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        703.             628973.            895
    ##  2 Austria                       668.             599420.            897
    ##  3 Denmark                       664.             595369.            897
    ##  4 Switzerland                   583.             526802.            903
    ##  5 France                        569.             514949.            905
    ##  6 Portugal                      567.             505436.            892
    ##  7 Netherlands                   560.             503216.            899
    ##  8 Australia                     515.             461261.            895
    ##  9 South Korea                   507.             463615.            915
    ## 10 Belgium                       477.             429839.            902
    ## 11 Greece                        473.             423158.            894
    ## 12 Czech Republic                430.             384461.            894
    ## 13 Germany                       430.             389581.            907
    ## 14 United Kingdom                417.             376292.            903
    ## 15 Italy                         394.             358979.            912
    ## 16 Slovakia                      378.             335780.            888
    ## 17 Serbia                        345.             306104.            887
    ## 18 United States                 330.             297725.            903
    ## 19 Norway                        323.             291264.            901
    ## 20 Spain                         317.             286302.            904

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2154    11915
    ##  2 Sudan                 7.85       4961    63173
    ##  3 Syria                 5.56       3161    56876
    ##  4 Peru                  5.29     215342  4074004
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24791   515264
    ##  7 Mexico                4.73     328871  6949653
    ##  8 Afghanistan           4.07       7767   191040
    ##  9 Ecuador               3.62      35815   989885
    ## 10 Niger                 3.39        312     9203
    ## 11 Myanmar               3.16      19437   614696
    ## 12 Malawi                3.05       2673    87718
    ## 13 Bulgaria              3.04      37560  1235510
    ## 14 Paraguay              2.72      19448   714340
    ## 15 Chad                  2.59        193     7456
    ## 16 Tunisia               2.56      29209  1141773
    ## 17 Haiti                 2.56        840    32843
    ## 18 Algeria               2.55       6878   269805
    ## 19 South Africa          2.55     102066  4009730
    ## 20 Indonesia             2.49     157420  6323715

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7200.     215342   29.9 
    ##  2 Bulgaria               5254.      37560    7.15
    ##  3 Hungary                4717.      47083    9.98
    ##  4 Czech Republic         3890.      40747   10.5 
    ##  5 Slovakia               3728.      20338    5.46
    ##  6 Chile                  3597.      60236   16.7 
    ##  7 Brazil                 3394.     682549  201.  
    ##  8 United States          3320.    1029936  310.  
    ##  9 Argentina              3136.     129646   41.3 
    ## 10 Belgium                3121.      32463   10.4 
    ## 11 Paraguay               3050.      19448    6.38
    ## 12 Poland                 3037.     116909   38.5 
    ## 13 Romania                3028.      66500   22.0 
    ## 14 United Kingdom         3000.     187018   62.3 
    ## 15 Colombia               2959.     141406   47.8 
    ## 16 Mexico                 2924.     328871  112.  
    ## 17 Greece                 2912.      32028   11   
    ## 18 Italy                  2897.     174797   60.3 
    ## 19 Tunisia                2758.      29209   10.6 
    ## 20 Russia                 2727.     383686  141.

EOL
