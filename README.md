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

Updated: 2022-08-12

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
    ##  1 United States          102478. 91307921            891
    ##  2 India                   50235. 44206996            880
    ##  3 Brazil                  38755. 34066000            879
    ##  4 France                  37132. 33159258            893
    ##  5 Germany                 35128. 31439645            895
    ##  6 United Kingdom          26286. 23421278            891
    ##  7 Italy                   23778. 21400179            900
    ##  8 South Korea             23237. 20983169            903
    ##  9 Russia                  21457. 18796472            876
    ## 10 Turkey                  18602. 16295817            876
    ## 11 Japan                   16476. 14861375            902
    ## 12 Spain                   14888. 13280557            892
    ## 13 Vietnam                 13020. 11353573            872
    ## 14 Australia               10999.  9711908            883
    ## 15 Argentina               10887.  9602534            882
    ## 16 Netherlands              9424.  8358922            887
    ## 17 Iran                     8298.  7451779            898
    ## 18 Mexico                   7795.  6875708            882
    ## 19 Colombia                 7176.  6278998            875
    ## 20 Indonesia                7115.  6261605            880

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        710.             626836.            883
    ##  2 Denmark                       669.             592275.            885
    ##  3 Austria                       669.             591773.            885
    ##  4 Switzerland                   589.             524409.            891
    ##  5 France                        573.             511967.            893
    ##  6 Portugal                      572.             503028.            880
    ##  7 Netherlands                   566.             502188.            887
    ##  8 Australia                     511.             451386.            883
    ##  9 Belgium                       480.             427263.            890
    ## 10 South Korea                   480.             433334.            903
    ## 11 Greece                        472.             416152.            882
    ## 12 Czech Republic                434.             382518.            882
    ## 13 Germany                       429.             384337.            895
    ## 14 United Kingdom                422.             375651.            891
    ## 15 Italy                         394.             354658.            900
    ## 16 Slovakia                      382.             334742.            876
    ## 17 Serbia                        340.             297523.            875
    ## 18 United States                 330.             294321.            891
    ## 19 Norway                        327.             290944.            889
    ## 20 Spain                         320.             285567.            892

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11903
    ##  2 Sudan                 7.86       4960    63128
    ##  3 Syria                 5.57       3155    56604
    ##  4 Peru                  5.39     214739  3980850
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24781   515082
    ##  7 Mexico                4.78     328437  6875708
    ##  8 Afghanistan           4.12       7753   188202
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.41        311     9132
    ## 11 Myanmar               3.16      19434   614276
    ## 12 Bulgaria              3.06      37469  1222948
    ## 13 Malawi                3.05       2670    87630
    ## 14 Paraguay              2.71      19289   710890
    ## 15 Chad                  2.59        193     7442
    ## 16 Haiti                 2.57        838    32577
    ## 17 Algeria               2.56       6878   268584
    ## 18 Tunisia               2.56      29153  1139241
    ## 19 South Africa          2.55     101982  4006916
    ## 20 Indonesia             2.51     157149  6261605

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7180.     214739   29.9 
    ##  2 Bulgaria               5241.      37469    7.15
    ##  3 Hungary                4705.      46966    9.98
    ##  4 Czech Republic         3876.      40608   10.5 
    ##  5 Slovakia               3718.      20280    5.46
    ##  6 Chile                  3574.      59845   16.7 
    ##  7 Brazil                 3384.     680531  201.  
    ##  8 United States          3303.    1024596  310.  
    ##  9 Argentina              3131.     129440   41.3 
    ## 10 Belgium                3108.      32329   10.4 
    ## 11 Poland                 3032.     116737   38.5 
    ## 12 Paraguay               3025.      19289    6.38
    ## 13 Romania                3017.      66262   22.0 
    ## 14 United Kingdom         2985.     186087   62.3 
    ## 15 Colombia               2952.     141075   47.8 
    ## 16 Mexico                 2920.     328437  112.  
    ## 17 Greece                 2884.      31722   11   
    ## 18 Italy                  2877.     173571   60.3 
    ## 19 Tunisia                2753.      29153   10.6 
    ## 20 Russia                 2722.     382954  141.

EOL
