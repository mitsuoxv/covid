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

Updated: 2022-04-08

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
    ##  1 United States          103923. 79501007            765
    ##  2 India                   57071. 43031958            754
    ##  3 Brazil                  39788. 30040129            755
    ##  4 France                  33408. 25623682            767
    ##  5 Germany                 28992. 22265788            768
    ##  6 United Kingdom          28054. 21461560            765
    ##  7 Russia                  23940. 17955120            750
    ##  8 Turkey                  19906. 14929905            750
    ##  9 Italy                   19426. 15035943            774
    ## 10 South Korea             19020. 14778405            777
    ## 11 Spain                   15116. 11578653            766
    ## 12 Vietnam                 13378.  9980464            746
    ## 13 Argentina               11980.  9045326            755
    ## 14 Netherlands             10444.  7948131            761
    ## 15 Iran                     9300.  7180008            772
    ## 16 Japan                    8804.  6832377            776
    ## 17 Colombia                 8115.  6086484            750
    ## 18 Indonesia                7995.  6028413            754
    ## 19 Poland                   7924.  5975040            754
    ## 20 Mexico                   7501.  5671144            756

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       739.             560822.            759
    ##  2 Israel                        714.             540810.            757
    ##  3 Austria                       639.             485339.            759
    ##  4 Netherlands                   627.             477509.            761
    ##  5 Switzerland                   606.             463277.            765
    ##  6 France                        516.             395620.            767
    ##  7 Belgium                       488.             373116.            764
    ##  8 Czech Republic                486.             367593.            756
    ##  9 Portugal                      453.             341760.            755
    ## 10 United Kingdom                450.             344220.            765
    ## 11 Slovakia                      426.             319284.            750
    ## 12 South Korea                   393.             305196.            777
    ## 13 Greece                        376.             284260.            756
    ## 14 Norway                        369.             281794.            764
    ## 15 Serbia                        361.             270269.            749
    ## 16 Jordan                        354.             264429.            746
    ## 17 Germany                       354.             272190.            768
    ## 18 Sweden                        342.             260347.            761
    ## 19 United States                 335.             256262.            765
    ## 20 Spain                         325.             248971.            766

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2144    11812
    ##  2 Sudan                 7.92       4907    61987
    ##  3 Peru                  5.98     212372  3549028
    ##  4 Mexico                5.70     323318  5671144
    ##  5 Syria                 5.64       3145    55727
    ##  6 Somalia               5.14       1361    26471
    ##  7 Egypt                 4.81      24473   509177
    ##  8 Afghanistan           4.31       7671   177974
    ##  9 Ecuador               4.11      35449   862321
    ## 10 Niger                 3.49        308     8822
    ## 11 Bulgaria              3.21      36655  1143424
    ## 12 Myanmar               3.18      19434   612079
    ## 13 Malawi                3.07       2627    85676
    ## 14 Paraguay              2.89      18731   648353
    ## 15 Tunisia               2.74      28425  1037358
    ## 16 Haiti                 2.72        833    30575
    ## 17 South Africa          2.68     100070  3727208
    ## 18 Chad                  2.61        192     7349
    ## 19 Algeria               2.59       6874   265705
    ## 20 Honduras              2.58      10885   421170

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7101.     212372   29.9 
    ##  2 Bulgaria               5127.      36655    7.15
    ##  3 Hungary                4577.      45684    9.98
    ##  4 Czech Republic         3801.      39816   10.5 
    ##  5 Slovakia               3575.      19500    5.46
    ##  6 Chile                  3393.      56822   16.7 
    ##  7 Brazil                 3285.     660528  201.  
    ##  8 United States          3145.     975540  310.  
    ##  9 Argentina              3099.     128106   41.3 
    ## 10 Poland                 3001.     115536   38.5 
    ## 11 Belgium                2971.      30908   10.4 
    ## 12 Romania                2967.      65147   22.0 
    ## 13 Paraguay               2938.      18731    6.38
    ## 14 Colombia               2923.     139678   47.8 
    ## 15 Mexico                 2875.     323318  112.  
    ## 16 United Kingdom         2712.     169095   62.3 
    ## 17 Tunisia                2684.      28425   10.6 
    ## 18 Italy                  2656.     160253   60.3 
    ## 19 Russia                 2636.     370889  141.  
    ## 20 Greece                 2536.      27892   11

EOL
