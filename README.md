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

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2022-04-16

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
    ##  1 United States          103260. 79716960            772
    ##  2 India                   56556. 43039023            761
    ##  3 Brazil                  39716. 30183929            760
    ##  4 France                  34270. 26525319            774
    ##  5 Germany                 29913. 23182447            775
    ##  6 United Kingdom          28128. 21715120            772
    ##  7 Russia                  23833. 18041927            757
    ##  8 South Korea             20381. 15979061            784
    ##  9 Italy                   19804. 15467395            781
    ## 10 Turkey                  19786. 14978031            757
    ## 11 Spain                   15248. 11787004            773
    ## 12 Vietnam                 13675. 10297587            753
    ## 13 Argentina               11869.  9056203            763
    ## 14 Netherlands             10425.  8006753            768
    ## 15 Iran                     9242.  7199861            779
    ## 16 Japan                    9171.  7180734            783
    ## 17 Colombia                 8054.  6088619            756
    ## 18 Indonesia                7934.  6037742            761
    ## 19 Poland                   7861.  5982664            761
    ## 20 Mexico                   7502.  5723862            763

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       736.             563804.            766
    ##  2 Israel                        715.             546489.            764
    ##  3 Austria                       647.             495496.            766
    ##  4 Netherlands                   626.             481031.            768
    ##  5 Switzerland                   607.             468513.            772
    ##  6 France                        529.             409541.            774
    ##  7 Belgium                       492.             379105.            771
    ##  8 Czech Republic                485.             369988.            763
    ##  9 Portugal                      455.             346349.            762
    ## 10 United Kingdom                451.             348286.            772
    ## 11 Slovakia                      425.             322111.            757
    ## 12 South Korea                   421.             329992.            784
    ## 13 Greece                        382.             291541.            763
    ## 14 Norway                        368.             283008.            770
    ## 15 Germany                       366.             283396.            775
    ## 16 Serbia                        359.             271303.            756
    ## 17 Jordan                        351.             264544.            753
    ## 18 Sweden                        340.             260779.            768
    ## 19 United States                 333.             256958.            772
    ## 20 Italy                         328.             256336.            781

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2147    11815
    ##  2 Sudan                 7.94       4929    62057
    ##  3 Peru                  5.98     212528  3552467
    ##  4 Mexico                5.66     323805  5723862
    ##  5 Syria                 5.65       3148    55756
    ##  6 Somalia               5.14       1361    26471
    ##  7 Egypt                 4.79      24522   511977
    ##  8 Afghanistan           4.30       7676   178332
    ##  9 Ecuador               4.10      35513   865585
    ## 10 Niger                 3.48        308     8846
    ## 11 Bulgaria              3.20      36756  1147812
    ## 12 Myanmar               3.17      19434   612480
    ## 13 Malawi                3.07       2628    85713
    ## 14 Paraguay              2.89      18734   648446
    ## 15 Tunisia               2.74      28509  1038668
    ## 16 Haiti                 2.73        835    30586
    ## 17 South Africa          2.68     100132  3735578
    ## 18 Chad                  2.60        192     7378
    ## 19 Algeria               2.59       6874   265731
    ## 20 Honduras              2.58      10888   421268

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7106.     212528   29.9 
    ##  2 Bulgaria               5142.      36756    7.15
    ##  3 Hungary                4594.      45856    9.98
    ##  4 Czech Republic         3813.      39945   10.5 
    ##  5 Slovakia               3601.      19643    5.46
    ##  6 Chile                  3410.      57098   16.7 
    ##  7 Brazil                 3289.     661493  201.  
    ##  8 United States          3157.     979321  310.  
    ##  9 Argentina              3103.     128285   41.3 
    ## 10 Poland                 3007.     115775   38.5 
    ## 11 Belgium                2988.      31079   10.4 
    ## 12 Romania                2973.      65285   22.0 
    ## 13 Paraguay               2938.      18734    6.38
    ## 14 Colombia               2924.     139729   47.8 
    ## 15 Mexico                 2879.     323805  112.  
    ## 16 United Kingdom         2743.     171046   62.3 
    ## 17 Tunisia                2692.      28509   10.6 
    ## 18 Italy                  2671.     161187   60.3 
    ## 19 Russia                 2649.     372766  141.  
    ## 20 Greece                 2577.      28344   11

EOL
