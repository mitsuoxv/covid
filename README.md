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

Updated: 2022-08-27

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
    ##  1 United States          102362. 92739935            906
    ##  2 India                   49597. 44389176            895
    ##  3 Brazil                  38400. 34329600            894
    ##  4 France                  36802. 33416532            908
    ##  5 Germany                 35174. 32008122            910
    ##  6 United Kingdom          25931. 23493327            906
    ##  7 South Korea             24840. 22802985            918
    ##  8 Italy                   23765. 21745065            915
    ##  9 Russia                  21674. 19311973            891
    ## 10 Japan                   19611. 17983797            917
    ## 11 Turkey                  18711. 16671848            891
    ## 12 Spain                   14690. 13323784            907
    ## 13 Vietnam                 12848. 11396205            887
    ## 14 Australia               11095.  9963232            898
    ## 15 Argentina               10767.  9658391            897
    ## 16 Netherlands              9290.  8379855            902
    ## 17 Iran                     8233.  7516596            913
    ## 18 Mexico                   7797.  6994309            897
    ## 19 Indonesia                7082.  6338906            895
    ## 20 Colombia                 7071.  6293130            890

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        701.             629387.            898
    ##  2 Austria                       668.             601418.            900
    ##  3 Denmark                       662.             595986.            900
    ##  4 Switzerland                   584.             529038.            906
    ##  5 France                        568.             515939.            908
    ##  6 Portugal                      566.             506327.            895
    ##  7 Netherlands                   558.             503446.            902
    ##  8 Australia                     516.             463067.            898
    ##  9 South Korea                   513.             470916.            918
    ## 10 Greece                        478.             428366.            897
    ## 11 Belgium                       476.             430431.            905
    ## 12 Germany                       430.             391287.            910
    ## 13 Czech Republic                429.             385007.            897
    ## 14 United Kingdom                416.             376807.            906
    ## 15 Italy                         394.             360374.            915
    ## 16 Slovakia                      377.             336032.            891
    ## 17 Serbia                        346.             307957.            890
    ## 18 United States                 330.             298937.            906
    ## 19 Norway                        322.             291351.            904
    ## 20 Spain                         316.             286496.            907

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
    ##  4 Peru                  5.27     215486  4086627
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24791   515264
    ##  7 Mexico                4.71     329225  6994309
    ##  8 Afghanistan           4.06       7769   191585
    ##  9 Ecuador               3.61      35818   991855
    ## 10 Niger                 3.37        312     9250
    ## 11 Myanmar               3.16      19437   614844
    ## 12 Malawi                3.05       2673    87718
    ## 13 Bulgaria              3.03      37578  1238531
    ## 14 Paraguay              2.72      19448   714340
    ## 15 Chad                  2.58        193     7489
    ## 16 Tunisia               2.56      29221  1142527
    ## 17 Algeria               2.55       6878   269971
    ## 18 South Africa          2.55     102066  4010207
    ## 19 Haiti                 2.54        841    33133
    ## 20 Sri Lanka             2.49      16675   669581

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7205.     215486   29.9 
    ##  2 Bulgaria               5257.      37578    7.15
    ##  3 Hungary                4728.      47191    9.98
    ##  4 Czech Republic         3892.      40772   10.5 
    ##  5 Slovakia               3730.      20346    5.46
    ##  6 Chile                  3602.      60321   16.7 
    ##  7 Brazil                 3397.     683076  201.  
    ##  8 United States          3326.    1031832  310.  
    ##  9 Argentina              3136.     129646   41.3 
    ## 10 Belgium                3124.      32496   10.4 
    ## 11 Paraguay               3050.      19448    6.38
    ## 12 Poland                 3039.     117007   38.5 
    ## 13 Romania                3033.      66596   22.0 
    ## 14 United Kingdom         3011.     187761   62.3 
    ## 15 Colombia               2959.     141406   47.8 
    ## 16 Greece                 2940.      32335   11   
    ## 17 Mexico                 2927.     329225  112.  
    ## 18 Italy                  2902.     175127   60.3 
    ## 19 Tunisia                2760.      29221   10.6 
    ## 20 Russia                 2729.     383910  141.

EOL
