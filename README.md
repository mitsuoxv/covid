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

Updated: 2022-06-28

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
    ##  1 United States          101269. 85673420            846
    ##  2 India                   51984. 43407046            835
    ##  3 Brazil                  38238. 31890733            834
    ##  4 France                  34783. 29495945            848
    ##  5 Germany                 32673. 27771911            850
    ##  6 United Kingdom          26706. 22593279            846
    ##  7 Russia                  22168. 18421564            831
    ##  8 South Korea             21363. 18329448            858
    ##  9 Italy                   21326. 18234242            855
    ## 10 Turkey                  18153. 15085742            831
    ## 11 Spain                   14972. 12681820            847
    ## 12 Vietnam                 12991. 10743448            827
    ## 13 Argentina               11161.  9341492            837
    ## 14 Japan                   10797.  9253386            857
    ## 15 Netherlands              9682.  8152778            842
    ## 16 Australia                9482.  7946440            838
    ## 17 Iran                     8483.  7236361            853
    ## 18 Colombia                 7387.  6131657            830
    ## 19 Indonesia                7282.  6080451            835
    ## 20 Poland                   7201.  6013164            835

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        699.             585740.            838
    ##  2 Denmark                       686.             576431.            840
    ##  3 Austria                       642.             539407.            840
    ##  4 Netherlands                   582.             489803.            842
    ##  5 Switzerland                   578.             489236.            846
    ##  6 Portugal                      574.             479377.            835
    ##  7 France                        537.             455406.            848
    ##  8 Belgium                       479.             404836.            845
    ##  9 Czech Republic                448.             375062.            837
    ## 10 South Korea                   441.             378531.            858
    ## 11 Australia                     441.             369331.            838
    ## 12 United Kingdom                428.             362371.            846
    ## 13 Germany                       399.             339501.            850
    ## 14 Slovakia                      396.             328947.            831
    ## 15 Greece                        393.             328807.            837
    ## 16 Italy                         353.             302190.            855
    ## 17 Norway                        341.             288051.            844
    ## 18 Serbia                        332.             275846.            830
    ## 19 United States                 326.             276158.            846
    ## 20 Spain                         322.             272692.            847

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.92       4951    62551
    ##  3 Peru                 5.92     213425  3605614
    ##  4 Syria                5.63       3150    55922
    ##  5 Mexico               5.51     325487  5906953
    ##  6 Somalia              5.08       1361    26803
    ##  7 Egypt                4.81      24723   514088
    ##  8 Afghanistan          4.24       7717   182149
    ##  9 Ecuador              3.97      35695   898667
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.18      37246  1170091
    ## 12 Myanmar              3.17      19434   613556
    ## 13 Malawi               3.07       2644    86204
    ## 14 Paraguay             2.90      18947   653428
    ## 15 Tunisia              2.74      28670  1046703
    ## 16 Haiti                2.68        837    31226
    ## 17 Chad                 2.60        193     7424
    ## 18 Algeria              2.58       6875   266030
    ## 19 Indonesia            2.58     156717  6080451
    ## 20 Honduras             2.56      10903   425930

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7136.     213425   29.9 
    ##  2 Bulgaria               5210.      37246    7.15
    ##  3 Hungary                4671.      46626    9.98
    ##  4 Czech Republic         3848.      40313   10.5 
    ##  5 Slovakia               3692.      20142    5.46
    ##  6 Chile                  3483.      58335   16.7 
    ##  7 Brazil                 3329.     669530  201.  
    ##  8 United States          3240.    1005025  310.  
    ##  9 Argentina              3121.     129016   41.3 
    ## 10 Belgium                3065.      31883   10.4 
    ## 11 Poland                 3024.     116417   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2972.      18947    6.38
    ## 14 Colombia               2928.     139918   47.8 
    ## 15 Mexico                 2894.     325487  112.  
    ## 16 United Kingdom         2886.     179927   62.3 
    ## 17 Italy                  2786.     168102   60.3 
    ## 18 Greece                 2743.      30178   11   
    ## 19 Tunisia                2708.      28670   10.6 
    ## 20 Russia                 2707.     380943  141.

EOL
