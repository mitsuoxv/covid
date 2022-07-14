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

Updated: 2022-07-15

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
    ##  1 United States          101831. 87880709            863
    ##  2 India                   51279. 43689989            852
    ##  3 Brazil                  38783. 33004555            851
    ##  4 France                  36681. 31729280            865
    ##  5 Germany                 33979. 29460249            867
    ##  6 United Kingdom          26738. 23075360            863
    ##  7 Italy                   22682. 19778911            872
    ##  8 Russia                  21788. 18476477            848
    ##  9 South Korea             21304. 18641278            875
    ## 10 Turkey                  18039. 15297539            848
    ## 11 Spain                   15084. 13032841            864
    ## 12 Vietnam                 12745. 10757257            844
    ## 13 Japan                   11331.  9903381            874
    ## 14 Argentina               11038.  9426171            854
    ## 15 Australia               10054.  8596145            855
    ## 16 Netherlands              9616.  8260662            859
    ## 17 Iran                     8345.  7260017            870
    ## 18 Mexico                   7379.  6301645            854
    ## 19 Colombia                 7318.  6198848            847
    ## 20 Indonesia                7187.  6123753            852

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        713.             609862.            855
    ##  2 Denmark                       681.             583388.            857
    ##  3 Austria                       655.             561376.            857
    ##  4 Switzerland                   587.             506997.            863
    ##  5 Portugal                      580.             493981.            852
    ##  6 Netherlands                   578.             496285.            859
    ##  7 France                        566.             489888.            865
    ##  8 Belgium                       482.             415275.            862
    ##  9 Australia                     467.             399528.            855
    ## 10 Czech Republic                441.             376840.            854
    ## 11 South Korea                   440.             384970.            875
    ## 12 United Kingdom                429.             370103.            863
    ## 13 Germany                       415.             360140.            867
    ## 14 Greece                        409.             349377.            854
    ## 15 Slovakia                      390.             330649.            848
    ## 16 Italy                         376.             327789.            872
    ## 17 Norway                        337.             289772.            861
    ## 18 Serbia                        329.             278722.            847
    ## 19 United States                 328.             283273.            863
    ## 20 Spain                         324.             280240.            864

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11832
    ##  2 Sudan                 7.89       4955    62795
    ##  3 Peru                  5.79     213714  3691213
    ##  4 Syria                 5.63       3150    55960
    ##  5 Mexico                5.18     326189  6301645
    ##  6 Somalia               5.06       1361    26900
    ##  7 Egypt                 4.81      24725   514182
    ##  8 Afghanistan           4.22       7728   183285
    ##  9 Ecuador               3.88      35755   922398
    ## 10 Niger                 3.42        311     9096
    ## 11 Myanmar               3.17      19434   613784
    ## 12 Bulgaria              3.15      37281  1181657
    ## 13 Malawi                3.05       2649    86750
    ## 14 Paraguay              2.83      19036   673829
    ## 15 Tunisia               2.65      28823  1087030
    ## 16 Haiti                 2.62        837    31980
    ## 17 Chad                  2.60        193     7427
    ## 18 Algeria               2.58       6875   266303
    ## 19 Indonesia             2.56     156827  6123753
    ## 20 South Africa          2.55     101895  3998466

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7146.     213714   29.9 
    ##  2 Bulgaria               5215.      37281    7.15
    ##  3 Hungary                4678.      46696    9.98
    ##  4 Czech Republic         3851.      40343   10.5 
    ##  5 Slovakia               3697.      20168    5.46
    ##  6 Chile                  3516.      58884   16.7 
    ##  7 Brazil                 3352.     674102  201.  
    ##  8 United States          3263.    1012182  310.  
    ##  9 Argentina              3124.     129145   41.3 
    ## 10 Belgium                3077.      32015   10.4 
    ## 11 Poland                 3025.     116468   38.5 
    ## 12 Romania                2997.      65801   22.0 
    ## 13 Paraguay               2986.      19036    6.38
    ## 14 Colombia               2934.     140202   47.8 
    ## 15 United Kingdom         2912.     181580   62.3 
    ## 16 Mexico                 2900.     326189  112.  
    ## 17 Italy                  2809.     169496   60.3 
    ## 18 Greece                 2771.      30476   11   
    ## 19 Tunisia                2722.      28823   10.6 
    ## 20 Russia                 2713.     381754  141.

EOL
