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

Updated: 2022-02-24

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
    ##  1 United States          107820  77846164            722
    ##  2 India                   60291. 42867031            711
    ##  3 Brazil                  39671. 28245551            712
    ##  4 France                  30036. 21746293            724
    ##  5 United Kingdom          25894. 18695452            722
    ##  6 Russia                  22341. 15795570            707
    ##  7 Turkey                  19342. 13674690            707
    ##  8 Germany                 19271. 13971947            725
    ##  9 Italy                   17174. 12554596            731
    ## 10 Spain                   15049. 10880194            723
    ## 11 Argentina               12543.  8855624            706
    ## 12 Iran                     9580.  6983635            729
    ## 13 Netherlands              8570.  6153207            718
    ## 14 Colombia                 8557.  6049952            707
    ## 15 Poland                   7880.  5602680            711
    ## 16 Mexico                   7599.  5418257            713
    ## 17 Indonesia                7526.  5350902            711
    ## 18 Ukraine                  6824.  4783835            701
    ## 19 Japan                    6285.  4607029            733
    ## 20 South Africa             5180.  3662032            707

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        682.             487126.            714
    ##  2 Denmark                       672.             480929.            716
    ##  3 Netherlands                   515.             369673.            718
    ##  4 Switzerland                   493.             356173.            722
    ##  5 Czech Republic                474.             337746.            713
    ##  6 Belgium                       469.             338419.            721
    ##  7 France                        464.             335755.            724
    ##  8 Austria                       431.             308634.            716
    ##  9 Portugal                      422.             300326.            712
    ## 10 United Kingdom                415.             299854.            722
    ## 11 Serbia                        365.             257621.            706
    ## 12 Slovakia                      361.             255460.            707
    ## 13 Sweden                        354.             254436.            718
    ## 14 Jordan                        353.             248362.            703
    ## 15 United States                 348.             250928.            722
    ## 16 Spain                         324.             233953.            723
    ## 17 Norway                        319.             229844.            720
    ## 18 Argentina                     303.             214198.            706
    ## 19 Greece                        298.             212420.            713
    ## 20 Italy                         285.             208063.            731

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2124    11746
    ##  2 Sudan                 6.35       3895    61350
    ##  3 Peru                  5.99     209641  3497896
    ##  4 Mexico                5.83     315786  5418257
    ##  5 Syria                 5.67       3056    53912
    ##  6 Somalia               5.12       1348    26313
    ##  7 Egypt                 5.04      23857   473449
    ##  8 Afghanistan           4.38       7574   172901
    ##  9 Ecuador               4.29      35172   820541
    ## 10 Niger                 3.50        306     8745
    ## 11 Myanmar               3.36      19349   575508
    ## 12 Bulgaria              3.27      35245  1077160
    ## 13 Malawi                3.06       2609    85238
    ## 14 China                 2.99       5824   194947
    ## 15 Paraguay              2.87      18237   636520
    ## 16 Tunisia               2.79      27592   990483
    ## 17 Indonesia             2.75     147025  5350902
    ## 18 El Salvador           2.74       4048   147786
    ## 19 Haiti                 2.70        819    30287
    ## 20 South Africa          2.70      98868  3662032

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7010.     209641   29.9 
    ##  2 Bulgaria               4930.      35245    7.15
    ##  3 Hungary                4364.      43562    9.98
    ##  4 Czech Republic         3666.      38403   10.5 
    ##  5 Slovakia               3357.      18314    5.46
    ##  6 Brazil                 3205.     644604  201.  
    ##  7 Argentina              3038.     125618   41.3 
    ##  8 United States          2992.     928350  310.  
    ##  9 Colombia               2892.     138205   47.8 
    ## 10 Belgium                2888.      30040   10.4 
    ## 11 Poland                 2871.     110517   38.5 
    ## 12 Romania                2862.      62839   22.0 
    ## 13 Paraguay               2860.      18237    6.38
    ## 14 Mexico                 2808.     315786  112.  
    ## 15 Tunisia                2606.      27592   10.6 
    ## 16 United Kingdom         2579.     160815   62.3 
    ## 17 Italy                  2544.     153512   60.3 
    ## 18 Chile                  2480.      41526   16.7 
    ## 19 Russia                 2472.     347816  141.  
    ## 20 Ecuador                2378.      35172   14.8

EOL
