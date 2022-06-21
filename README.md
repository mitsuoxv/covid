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

Updated: 2022-06-22

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
    ##  1 United States          101504. 85263864            840
    ##  2 India                   52255. 43319396            829
    ##  3 Brazil                  38290. 31704193            828
    ##  4 France                  34638. 29165005            842
    ##  5 Germany                 32387. 27334993            844
    ##  6 United Kingdom          26797. 22509380            840
    ##  7 Russia                  22307. 18403427            825
    ##  8 South Korea             21466. 18289373            852
    ##  9 Italy                   21079. 17896065            849
    ## 10 Turkey                  18286. 15085742            825
    ## 11 Spain                   14938. 12563399            841
    ## 12 Vietnam                 13079. 10738161            821
    ## 13 Argentina               11241.  9341492            831
    ## 14 Japan                   10764.  9159940            851
    ## 15 Netherlands              9728.  8132482            836
    ## 16 Australia                9402.  7822716            832
    ## 17 Iran                     8542.  7234988            847
    ## 18 Colombia                 7441.  6131657            824
    ## 19 Indonesia                7323.  6070933            829
    ## 20 Poland                   7252.  6011660            829

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        695.             577846.            832
    ##  2 Denmark                       690.             575487.            834
    ##  3 Austria                       639.             532897.            834
    ##  4 Netherlands                   584.             488584.            836
    ##  5 Switzerland                   579.             485988.            840
    ##  6 Portugal                      572.             474199.            829
    ##  7 France                        535.             450297.            842
    ##  8 Belgium                       481.             403474.            839
    ##  9 Czech Republic                451.             374759.            831
    ## 10 South Korea                   443.             377703.            852
    ## 11 Australia                     437.             363581.            832
    ## 12 United Kingdom                430.             361026.            840
    ## 13 Slovakia                      398.             328634.            825
    ## 14 Germany                       396.             334159.            844
    ## 15 Greece                        388.             322722.            831
    ## 16 Italy                         349.             296585.            849
    ## 17 Norway                        343.             287424.            838
    ## 18 Serbia                        334.             275418.            824
    ## 19 United States                 327.             274838.            840
    ## 20 Jordan                        323.             265068.            821

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.92       4950    62533
    ##  3 Peru                 5.93     213389  3599501
    ##  4 Syria                5.63       3150    55916
    ##  5 Mexico               5.54     325408  5875705
    ##  6 Somalia              5.10       1361    26675
    ##  7 Egypt                4.81      24722   514047
    ##  8 Afghanistan          4.24       7714   181749
    ##  9 Ecuador              3.98      35693   896483
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37227  1168508
    ## 12 Myanmar              3.17      19434   613508
    ## 13 Malawi               3.07       2644    86204
    ## 14 Paraguay             2.90      18947   653428
    ## 15 Tunisia              2.74      28655  1044426
    ## 16 Haiti                2.69        837    31115
    ## 17 Chad                 2.60        193     7420
    ## 18 Algeria              2.58       6875   265975
    ## 19 Indonesia            2.58     156700  6070933
    ## 20 Honduras             2.56      10903   425930

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7135.     213389   29.9 
    ##  2 Bulgaria               5207.      37227    7.15
    ##  3 Hungary                4668.      46594    9.98
    ##  4 Czech Republic         3848.      40309   10.5 
    ##  5 Slovakia               3691.      20137    5.46
    ##  6 Chile                  3480.      58277   16.7 
    ##  7 Brazil                 3327.     669065  201.  
    ##  8 United States          3235.    1003740  310.  
    ##  9 Argentina              3121.     129016   41.3 
    ## 10 Belgium                3063.      31868   10.4 
    ## 11 Poland                 3023.     116400   38.5 
    ## 12 Romania                2993.      65714   22.0 
    ## 13 Paraguay               2972.      18947    6.38
    ## 14 Colombia               2928.     139918   47.8 
    ## 15 Mexico                 2893.     325408  112.  
    ## 16 United Kingdom         2881.     179601   62.3 
    ## 17 Italy                  2781.     167780   60.3 
    ## 18 Greece                 2736.      30099   11   
    ## 19 Tunisia                2706.      28655   10.6 
    ## 20 Russia                 2705.     380577  141.

EOL
