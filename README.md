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

Updated: 2022-02-15

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
    ##  1 United States          107971. 76983188            713
    ##  2 India                   60777. 42665534            702
    ##  3 Brazil                  39012. 27425743            703
    ##  4 France                  29519. 21106470            715
    ##  5 United Kingdom          25676. 18306863            713
    ##  6 Russia                  20507. 14313965            698
    ##  7 Turkey                  18492. 12907430            698
    ##  8 Germany                 17348. 12421126            716
    ##  9 Italy                   16767. 12105675            722
    ## 10 Spain                   14783. 10555197            714
    ## 11 Argentina               12522.  8728262            697
    ## 12 Iran                     9453.  6806265            720
    ## 13 Colombia                 8617.  6014563            698
    ## 14 Netherlands              8088.  5734472            709
    ## 15 Poland                   7714.  5415014            702
    ## 16 Mexico                   7505.  5283852            704
    ## 17 Indonesia                6901.  4844279            702
    ## 18 Ukraine                  6564.  4542693            692
    ## 19 Japan                    5403.  3912198            724
    ## 20 South Africa             5217.  3641811            698

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        662.             466944.            705
    ##  2 Denmark                       600.             424398.            707
    ##  3 Netherlands                   486.             344516.            709
    ##  4 Switzerland                   468.             333362.            713
    ##  5 Belgium                       462.             328855.            712
    ##  6 Czech Republic                461.             324882.            704
    ##  7 France                        456.             325876.            715
    ##  8 United Kingdom                412.             293622.            713
    ##  9 Portugal                      411.             288990.            703
    ## 10 Austria                       395.             278945.            707
    ## 11 Serbia                        360.             250653.            697
    ## 12 Sweden                        354.             250875.            709
    ## 13 United States                 348.             248146.            713
    ## 14 Jordan                        330.             229178.            694
    ## 15 Slovakia                      328.             229088.            698
    ## 16 Spain                         318.             226964.            714
    ## 17 Argentina                     303.             211117.            697
    ## 18 Greece                        281.             197645.            704
    ## 19 Italy                         278.             200623.            722
    ## 20 Norway                        277.             197010.            711

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.0        2103    11671
    ##  2 Sudan                 6.38       3820    59903
    ##  3 Peru                  6.06     208120  3435753
    ##  4 Mexico                5.92     312697  5283852
    ##  5 Syria                 5.74       3029    52751
    ##  6 Egypt                 5.13      23349   454952
    ##  7 Somalia               5.11       1340    26203
    ##  8 Ecuador               4.46      34854   781470
    ##  9 Afghanistan           4.39       7494   170604
    ## 10 China                 3.81       5706   149640
    ## 11 Myanmar               3.53      19310   546771
    ## 12 Niger                 3.48        303     8711
    ## 13 Bulgaria              3.32      34404  1036824
    ## 14 Malawi                3.05       2596    85025
    ## 15 Indonesia             3.00     145321  4844279
    ## 16 El Salvador           2.96       3994   135109
    ## 17 Paraguay              2.87      17882   622585
    ## 18 Tunisia               2.80      27119   967052
    ## 19 Haiti                 2.70        807    29907
    ## 20 South Africa          2.66      96993  3641811

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6959.     208120   29.9 
    ##  2 Bulgaria               4813.      34404    7.15
    ##  3 Hungary                4271.      42631    9.98
    ##  4 Czech Republic         3615.      37873   10.5 
    ##  5 Slovakia               3319.      18105    5.46
    ##  6 Brazil                 3173.     638048  201.  
    ##  7 Argentina              2999.     123987   41.3 
    ##  8 United States          2936.     910982  310.  
    ##  9 Colombia               2866.     136953   47.8 
    ## 10 Belgium                2848.      29624   10.4 
    ## 11 Poland                 2809.     108137   38.5 
    ## 12 Romania                2805.      61601   22.0 
    ## 13 Paraguay               2805.      17882    6.38
    ## 14 Mexico                 2780.     312697  112.  
    ## 15 Tunisia                2561.      27119   10.6 
    ## 16 United Kingdom         2559.     159570   62.3 
    ## 17 Italy                  2503.     151015   60.3 
    ## 18 Russia                 2423.     340931  141.  
    ## 19 Chile                  2422.      40558   16.7 
    ## 20 Ecuador                2356.      34854   14.8

EOL
