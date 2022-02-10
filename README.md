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

Updated: 2022-02-11

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
    ##  1 United States          107825. 76448067            709
    ##  2 India                   60857. 42478060            698
    ##  3 Brazil                  38307. 26776620            699
    ##  4 France                  28765. 20451810            711
    ##  5 United Kingdom          25352. 18000123            710
    ##  6 Russia                  19492. 13527845            694
    ##  7 Turkey                  18089. 12553783            694
    ##  8 Germany                 16530. 11769540            712
    ##  9 Italy                   16500. 11847436            718
    ## 10 Spain                   14792. 10502141            710
    ## 11 Argentina               12479   8648075            693
    ## 12 Iran                     9353.  6696927            716
    ## 13 Colombia                 8625.  5985516            694
    ## 14 Netherlands              7711.  5436575            705
    ## 15 Poland                   7611.  5312414            698
    ## 16 Mexico                   7381.  5167110            700
    ## 17 Indonesia                6687.  4667554            698
    ## 18 Ukraine                  6427.  4421741            688
    ## 19 South Africa             5233.  3631642            694
    ## 20 Philippines              5191.  3623176            698

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        647.             453230.            701
    ##  2 Denmark                       556.             390738.            703
    ##  3 Netherlands                   463.             326619.            705
    ##  4 Switzerland                   461.             326991.            709
    ##  5 Belgium                       460.             325504.            708
    ##  6 Czech Republic                455.             318854.            700
    ##  7 France                        444.             315768.            711
    ##  8 United Kingdom                407.             288702.            710
    ##  9 Portugal                      402.             280795.            699
    ## 10 Austria                       375.             263759.            703
    ## 11 Serbia                        355.             245898.            693
    ## 12 Sweden                        352.             248290.            705
    ## 13 United States                 348.             246422.            709
    ## 14 Spain                         318.             225824.            710
    ## 15 Jordan                        316.             217951.            690
    ## 16 Slovakia                      314.             217599.            694
    ## 17 Argentina                     302.             209178.            693
    ## 18 Greece                        274.             191818.            700
    ## 19 Italy                         273.             196344.            718
    ## 20 Norway                        265.             187120.            707

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.0        2093    11604
    ##  2 Sudan                 6.33       3764    59455
    ##  3 Peru                  6.13     207312  3384546
    ##  4 Mexico                6.00     309884  5167110
    ##  5 Syria                 5.77       3017    52243
    ##  6 Egypt                 5.18      23110   446308
    ##  7 Somalia               5.11       1340    26203
    ##  8 Ecuador               4.52      34739   769149
    ##  9 Afghanistan           4.43       7465   168550
    ## 10 China                 3.96       5702   143843
    ## 11 Myanmar               3.57      19310   540597
    ## 12 Niger                 3.48        303     8700
    ## 13 Bulgaria              3.35      34152  1018851
    ## 14 Indonesia             3.10     144858  4667554
    ## 15 Malawi                3.04       2580    84915
    ## 16 El Salvador           2.94       3967   135109
    ## 17 Paraguay              2.89      17704   612893
    ## 18 Tunisia               2.82      26889   954726
    ## 19 Haiti                 2.72        804    29549
    ## 20 South Africa          2.66      96502  3631642

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6932.     207312   29.9 
    ##  2 Bulgaria               4777.      34152    7.15
    ##  3 Hungary                4235.      42269    9.98
    ##  4 Czech Republic         3595.      37660   10.5 
    ##  5 Slovakia               3307.      18040    5.46
    ##  6 Brazil                 3152.     633810  201.  
    ##  7 Argentina              2981.     123227   41.3 
    ##  8 United States          2908.     902189  310.  
    ##  9 Colombia               2850.     136197   47.8 
    ## 10 Belgium                2835.      29497   10.4 
    ## 11 Poland                 2791.     107466   38.5 
    ## 12 Romania                2782.      61092   22.0 
    ## 13 Paraguay               2777.      17704    6.38
    ## 14 Mexico                 2755.     309884  112.  
    ## 15 United Kingdom         2549.     158953   62.3 
    ## 16 Tunisia                2539.      26889   10.6 
    ## 17 Italy                  2484.     149896   60.3 
    ## 18 Russia                 2403.     338091  141.  
    ## 19 Chile                  2395.      40111   16.7 
    ## 20 Ecuador                2349.      34739   14.8

EOL
