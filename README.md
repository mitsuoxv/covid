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

Updated: 2022-09-03

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
    ##  1 United States          102226. 93332054            913
    ##  2 India                   49271. 44442507            902
    ##  3 Brazil                  38213. 34429853            901
    ##  4 France                  36647. 33531717            915
    ##  5 Germany                 35135. 32218483            917
    ##  6 United Kingdom          25764. 23522244            913
    ##  7 South Korea             25316. 23417425            925
    ##  8 Italy                   23740. 21888255            922
    ##  9 Russia                  21859. 19629682            898
    ## 10 Japan                   20663. 19092657            924
    ## 11 Turkey                  18565. 16671848            898
    ## 12 Spain                   14598. 13342530            914
    ## 13 Vietnam                 12768. 11414359            894
    ## 14 Australia               11097. 10042846            905
    ## 15 Argentina               10706.  9678225            904
    ## 16 Netherlands              9226.  8386307            909
    ## 17 Iran                     8183.  7528961            920
    ## 18 Mexico                   7759.  7014510            904
    ## 19 Indonesia                7058.  6366518            902
    ## 20 Colombia                 7023.  6299595            897

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        696.             630224.            905
    ##  2 Austria                       667.             605242.            907
    ##  3 Denmark                       658.             597009.            907
    ##  4 Switzerland                   582.             531048.            913
    ##  5 France                        566.             517717.            915
    ##  6 Portugal                      563.             507900.            902
    ##  7 Netherlands                   554.             503833.            909
    ##  8 South Korea                   523.             483605.            925
    ##  9 Australia                     516.             466767.            905
    ## 10 Greece                        479.             432984.            904
    ## 11 Belgium                       473.             431419.            912
    ## 12 Germany                       430.             393858.            917
    ## 13 Czech Republic                427.             386058.            904
    ## 14 United Kingdom                413.             377271.            913
    ## 15 Italy                         393.             362747.            922
    ## 16 Slovakia                      375.             336350.            898
    ## 17 Serbia                        347.             311308.            897
    ## 18 United States                 330.             300845.            913
    ## 19 Norway                        320.             291491.            911
    ## 20 Spain                         314.             286899.            914

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11926
    ##  2 Sudan                 7.85       4961    63228
    ##  3 Syria                 5.54       3163    57043
    ##  4 Peru                  5.26     215762  4103874
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24794   515308
    ##  7 Mexico                4.70     329390  7014510
    ##  8 Afghanistan           4.02       7778   193520
    ##  9 Ecuador               3.60      35843   995968
    ## 10 Niger                 3.34        312     9352
    ## 11 Myanmar               3.16      19437   615221
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.02      37607  1243657
    ## 14 Paraguay              2.72      19478   715162
    ## 15 Chad                  2.56        193     7536
    ## 16 Tunisia               2.56      29234  1143862
    ## 17 South Africa          2.54     102108  4012239
    ## 18 Algeria               2.54       6878   270359
    ## 19 Haiti                 2.52        841    33381
    ## 20 Sri Lanka             2.49      16699   670018

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7214.     215762   29.9 
    ##  2 Bulgaria               5261.      37607    7.15
    ##  3 Hungary                4738.      47291    9.98
    ##  4 Czech Republic         3898.      40839   10.5 
    ##  5 Slovakia               3732.      20360    5.46
    ##  6 Chile                  3613.      60508   16.7 
    ##  7 Brazil                 3401.     683965  201.  
    ##  8 United States          3338.    1035674  310.  
    ##  9 Argentina              3137.     129711   41.3 
    ## 10 Belgium                3127.      32534   10.4 
    ## 11 Paraguay               3055.      19478    6.38
    ## 12 Poland                 3042.     117130   38.5 
    ## 13 Romania                3039.      66728   22.0 
    ## 14 United Kingdom         3019.     188242   62.3 
    ## 15 Colombia               2961.     141519   47.8 
    ## 16 Greece                 2959.      32552   11   
    ## 17 Mexico                 2929.     329390  112.  
    ## 18 Italy                  2911.     175663   60.3 
    ## 19 Tunisia                2761.      29234   10.6 
    ## 20 Russia                 2733.     384532  141.

EOL
