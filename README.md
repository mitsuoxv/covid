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

Updated: 2022-02-12

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
    ##  1 United States          107957. 76649746            710
    ##  2 India                   60853. 42536137            699
    ##  3 Brazil                  38508. 26955434            700
    ##  4 France                  29175. 20772543            712
    ##  5 United Kingdom          25580. 18162203            710
    ##  6 Russia                  19758. 13731794            695
    ##  7 Turkey                  18205. 12652385            695
    ##  8 Germany                 16844. 12009712            713
    ##  9 Italy                   16583. 11923631            719
    ## 10 Spain                   14845. 10555196            711
    ## 11 Argentina               12536.  8700437            694
    ## 12 Iran                     9387.  6730508            717
    ## 13 Colombia                 8625.  5994301            695
    ## 14 Netherlands              7823.  5523354            706
    ## 15 Poland                   7651.  5348182            699
    ## 16 Mexico                   7406.  5192008            701
    ## 17 Indonesia                6735.  4708043            699
    ## 18 Ukraine                  6477.  4462970            689
    ## 19 South Africa             5230.  3634811            695
    ## 20 Philippines              5190.  3627575            699

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        651.             457148.            702
    ##  2 Denmark                       569.             400539.            704
    ##  3 Netherlands                   470.             331833.            706
    ##  4 Switzerland                   465.             330444.            710
    ##  5 Belgium                       462.             327390.            709
    ##  6 Czech Republic                458.             321025.            701
    ##  7 France                        450.             320720.            712
    ##  8 United Kingdom                410.             291302.            710
    ##  9 Portugal                      405.             283385.            700
    ## 10 Austria                       381.             268210.            704
    ## 11 Serbia                        356.             247413.            694
    ## 12 Sweden                        354.             250066.            706
    ## 13 United States                 348.             247072.            710
    ## 14 Jordan                        320.             221300.            691
    ## 15 Spain                         319.             226964.            711
    ## 16 Slovakia                      318.             221275.            695
    ## 17 Argentina                     303.             210444.            694
    ## 18 Norway                        277.             196170.            708
    ## 19 Greece                        276.             193559.            701
    ## 20 Italy                         275.             197606.            719

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.0        2093    11604
    ##  2 Sudan                 6.32       3764    59525
    ##  3 Peru                  6.11     207536  3397637
    ##  4 Mexico                5.98     310627  5192008
    ##  5 Syria                 5.77       3017    52243
    ##  6 Egypt                 5.18      23110   446308
    ##  7 Somalia               5.11       1340    26203
    ##  8 Ecuador               4.46      34854   781470
    ##  9 Afghanistan           4.41       7477   169448
    ## 10 China                 3.93       5703   145013
    ## 11 Myanmar               3.56      19310   541904
    ## 12 Niger                 3.48        303     8703
    ## 13 Bulgaria              3.34      34228  1025129
    ## 14 Indonesia             3.08     144958  4708043
    ## 15 Malawi                3.04       2586    84936
    ## 16 El Salvador           2.94       3975   135109
    ## 17 Paraguay              2.88      17751   615911
    ## 18 Tunisia               2.82      26889   954726
    ## 19 Haiti                 2.72        804    29549
    ## 20 South Africa          2.66      96705  3634811

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6939.     207536   29.9 
    ##  2 Bulgaria               4788.      34228    7.15
    ##  3 Hungary                4244.      42360    9.98
    ##  4 Czech Republic         3600.      37712   10.5 
    ##  5 Slovakia               3311.      18064    5.46
    ##  6 Brazil                 3158.     635074  201.  
    ##  7 Argentina              2992.     123707   41.3 
    ##  8 United States          2920.     905957  310.  
    ##  9 Colombia               2854.     136404   47.8 
    ## 10 Belgium                2842.      29563   10.4 
    ## 11 Poland                 2799.     107757   38.5 
    ## 12 Romania                2788.      61231   22.0 
    ## 13 Paraguay               2784.      17751    6.38
    ## 14 Mexico                 2762.     310627  112.  
    ## 15 United Kingdom         2553.     159158   62.3 
    ## 16 Tunisia                2539.      26889   10.6 
    ## 17 Italy                  2490.     150221   60.3 
    ## 18 Russia                 2408.     338813  141.  
    ## 19 Chile                  2405.      40273   16.7 
    ## 20 Ecuador                2356.      34854   14.8

EOL
