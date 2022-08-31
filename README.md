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

Updated: 2022-09-01

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
    ##  1 United States          102152. 93060268            911
    ##  2 India                   49365. 44428393            900
    ##  3 Brazil                  38261. 34397205            899
    ##  4 France                  36685. 33493980            913
    ##  5 Germany                 35131. 32145157            915
    ##  6 United Kingdom          25788. 23493327            911
    ##  7 South Korea             25186. 23246398            923
    ##  8 Italy                   23745. 21845943            920
    ##  9 Russia                  21796. 19528969            896
    ## 10 Japan                   20360. 18772004            922
    ## 11 Turkey                  18607. 16671848            896
    ## 12 Spain                   14630. 13342530            912
    ## 13 Vietnam                 12790. 11408952            892
    ## 14 Australia               11094. 10018025            903
    ## 15 Argentina               10730.  9678225            902
    ## 16 Netherlands              9245.  8385110            907
    ## 17 Iran                     8200.  7527499            918
    ## 18 Mexico                   7776.  7014510            902
    ## 19 Indonesia                7065.  6358808            900
    ## 20 Colombia                 7039.  6299595            895

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        698.             629988.            903
    ##  2 Austria                       667.             604023.            905
    ##  3 Denmark                       659.             596726.            905
    ##  4 Switzerland                   583.             531048.            911
    ##  5 France                        566.             517135.            913
    ##  6 Portugal                      564.             507386.            900
    ##  7 Netherlands                   555.             503761.            907
    ##  8 South Korea                   520.             480073.            923
    ##  9 Australia                     516.             465613.            903
    ## 10 Greece                        480.             432984.            902
    ## 11 Belgium                       473.             430868.            910
    ## 12 Germany                       429.             392962.            915
    ## 13 Czech Republic                428.             385717.            902
    ## 14 United Kingdom                414.             376807.            911
    ## 15 Italy                         394.             362045.            920
    ## 16 Slovakia                      375.             336245.            896
    ## 17 Serbia                        347.             310352.            895
    ## 18 United States                 329.             299969.            911
    ## 19 Norway                        321.             291439.            909
    ## 20 Spain                         315.             286899.            912

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11926
    ##  2 Sudan                 7.85       4961    63228
    ##  3 Syria                 5.55       3163    57026
    ##  4 Peru                  5.26     215685  4100923
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24794   515308
    ##  7 Mexico                4.70     329390  7014510
    ##  8 Afghanistan           4.02       7777   193250
    ##  9 Ecuador               3.60      35832   995111
    ## 10 Myanmar               3.16      19437   615117
    ## 11 Niger                 3.14        312     9931
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.03      37600  1242133
    ## 14 Paraguay              2.72      19478   715162
    ## 15 Chad                  2.56        193     7536
    ## 16 Tunisia               2.56      29234  1143788
    ## 17 Algeria               2.54       6878   270272
    ## 18 South Africa          2.54     102084  4011657
    ## 19 Haiti                 2.52        841    33381
    ## 20 Sri Lanka             2.49      16695   669893

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7212.     215685   29.9 
    ##  2 Bulgaria               5260.      37600    7.15
    ##  3 Hungary                4738.      47291    9.98
    ##  4 Czech Republic         3896.      40814   10.5 
    ##  5 Slovakia               3731.      20353    5.46
    ##  6 Chile                  3609.      60445   16.7 
    ##  7 Brazil                 3399.     683622  201.  
    ##  8 United States          3331.    1033467  310.  
    ##  9 Argentina              3137.     129711   41.3 
    ## 10 Belgium                3126.      32516   10.4 
    ## 11 Paraguay               3055.      19478    6.38
    ## 12 Poland                 3041.     117093   38.5 
    ## 13 Romania                3036.      66673   22.0 
    ## 14 United Kingdom         3011.     187761   62.3 
    ## 15 Colombia               2961.     141519   47.8 
    ## 16 Greece                 2959.      32552   11   
    ## 17 Mexico                 2929.     329390  112.  
    ## 18 Italy                  2909.     175505   60.3 
    ## 19 Tunisia                2761.      29234   10.6 
    ## 20 Russia                 2732.     384346  141.

EOL
