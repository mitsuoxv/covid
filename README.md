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

Updated: 2022-08-17

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
    ##  1 United States          102365. 91719079            896
    ##  2 India                   50031. 44277194            885
    ##  3 Brazil                  38654. 34170286            884
    ##  4 France                  36984  33211755            898
    ##  5 Germany                 35110. 31599085            900
    ##  6 United Kingdom          26140. 23421278            896
    ##  7 Italy                   23767. 21509424            905
    ##  8 South Korea             23681. 21502164            908
    ##  9 Russia                  21488. 18931140            881
    ## 10 Turkey                  18760. 16528070            881
    ## 11 Japan                   17392. 15775032            907
    ## 12 Spain                   14821. 13294139            897
    ## 13 Vietnam                 12962. 11367479            877
    ## 14 Australia               11048.  9810517            888
    ## 15 Argentina               10861.  9633732            887
    ## 16 Netherlands              9379.  8366574            892
    ## 17 Iran                     8286.  7482521            903
    ## 18 Mexico                   7812.  6929001            887
    ## 19 Colombia                 7144.  6286392            880
    ## 20 Indonesia                7110.  6292231            885

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        707.             627842.            888
    ##  2 Austria                       668.             594900.            890
    ##  3 Denmark                       667.             593751.            890
    ##  4 Switzerland                   585.             524409.            896
    ##  5 France                        571.             512777.            898
    ##  6 Portugal                      569.             503527.            885
    ##  7 Netherlands                   563.             502648.            892
    ##  8 Australia                     513.             455969.            888
    ##  9 South Korea                   489.             444052.            908
    ## 10 Belgium                       478.             428096.            895
    ## 11 Greece                        469.             416152.            887
    ## 12 Czech Republic                432.             383269.            887
    ## 13 Germany                       429.             386286.            900
    ## 14 United Kingdom                419.             375651.            896
    ## 15 Italy                         394.             356468.            905
    ## 16 Slovakia                      380.             335197.            881
    ## 17 Serbia                        342.             301259.            880
    ## 18 United States                 330.             295646.            896
    ## 19 Norway                        326.             291085.            894
    ## 20 Spain                         319.             285859.            897

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11903
    ##  2 Sudan                 7.86       4961    63147
    ##  3 Syria                 5.57       3159    56756
    ##  4 Peru                  5.34     214956  4027614
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24786   515198
    ##  7 Mexico                4.74     328736  6929001
    ##  8 Afghanistan           4.10       7759   189389
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.40        311     9139
    ## 11 Myanmar               3.16      19435   614407
    ## 12 Bulgaria              3.05      37501  1228283
    ## 13 Malawi                3.05       2673    87718
    ## 14 Paraguay              2.72      19357   712907
    ## 15 Chad                  2.59        193     7456
    ## 16 Haiti                 2.56        838    32703
    ## 17 Tunisia               2.56      29153  1139241
    ## 18 Algeria               2.55       6878   269269
    ## 19 South Africa          2.54     101982  4008443
    ## 20 Indonesia             2.50     157277  6292231

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7187.     214956   29.9 
    ##  2 Bulgaria               5246.      37501    7.15
    ##  3 Hungary                4705.      46966    9.98
    ##  4 Czech Republic         3881.      40660   10.5 
    ##  5 Slovakia               3723.      20311    5.46
    ##  6 Chile                  3584.      60023   16.7 
    ##  7 Brazil                 3388.     681437  201.  
    ##  8 United States          3310.    1026757  310.  
    ##  9 Argentina              3134.     129566   41.3 
    ## 10 Belgium                3111.      32364   10.4 
    ## 11 Paraguay               3036.      19357    6.38
    ## 12 Poland                 3033.     116773   38.5 
    ## 13 Romania                3022.      66357   22.0 
    ## 14 United Kingdom         2985.     186087   62.3 
    ## 15 Colombia               2956.     141287   47.8 
    ## 16 Mexico                 2923.     328736  112.  
    ## 17 Italy                  2885.     174102   60.3 
    ## 18 Greece                 2884.      31722   11   
    ## 19 Tunisia                2753.      29153   10.6 
    ## 20 Russia                 2724.     383237  141.

EOL
