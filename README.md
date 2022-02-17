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

Updated: 2022-02-18

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
    ##  1 United States          108119. 77413180            716
    ##  2 India                   60644. 42754315            705
    ##  3 Brazil                  39177. 27659052            706
    ##  4 France                  29727. 21344186            718
    ##  5 United Kingdom          25765. 18447710            716
    ##  6 Russia                  21170. 14840502            701
    ##  7 Turkey                  18791. 13172968            701
    ##  8 Germany                 18131. 13035941            719
    ##  9 Italy                   16918. 12265343            725
    ## 10 Spain                   14985. 10744394            717
    ## 11 Argentina               12547.  8783208            700
    ## 12 Iran                     9511.  6876565            723
    ## 13 Colombia                 8598.  6026988            701
    ## 14 Netherlands              8296.  5906860            712
    ## 15 Poland                   7795.  5495315            705
    ## 16 Mexico                   7527.  5321744            707
    ## 17 Indonesia                7135.  5030002            705
    ## 18 Ukraine                  6672.  4637260            695
    ## 19 Japan                    5703.  4146197            727
    ## 20 South Africa             5205.  3648968            701

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        672.             475992.            708
    ##  2 Denmark                       627.             445441.            710
    ##  3 Netherlands                   498.             354873.            712
    ##  4 Switzerland                   482.             345223.            716
    ##  5 Czech Republic                468.             331077.            707
    ##  6 Belgium                       467.             333847.            715
    ##  7 France                        459.             329546.            718
    ##  8 Portugal                      416.             293359.            706
    ##  9 United Kingdom                413.             295881.            716
    ## 10 Austria                       408.             289777.            710
    ## 11 Serbia                        362.             253431.            700
    ## 12 Sweden                        355.             252667.            712
    ## 13 United States                 349.             249532.            716
    ## 14 Slovakia                      342.             239591.            701
    ## 15 Jordan                        342.             238216.            697
    ## 16 Spain                         322.             231033.            717
    ## 17 Argentina                     303.             212446.            700
    ## 18 Norway                        299.             213346.            714
    ## 19 Greece                        287.             203265.            707
    ## 20 Italy                         280.             203269.            725

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.0        2113    11707
    ##  2 Sudan                 6.37       3821    59939
    ##  3 Peru                  6.04     208622  3456789
    ##  4 Mexico                5.89     313608  5321744
    ##  5 Syria                 5.72       3038    53148
    ##  6 Somalia               5.12       1345    26260
    ##  7 Egypt                 5.10      23519   461299
    ##  8 Afghanistan           4.38       7513   171519
    ##  9 Ecuador               4.38      35038   800320
    ## 10 China                 3.62       5715   158054
    ## 11 Myanmar               3.47      19319   556256
    ## 12 Niger                 3.47        303     8728
    ## 13 Bulgaria              3.30      34779  1054566
    ## 14 Malawi                3.05       2599    85106
    ## 15 Indonesia             2.90     145828  5030002
    ## 16 Paraguay              2.87      18027   628574
    ## 17 Tunisia               2.80      27295   974214
    ## 18 El Salvador           2.72       4019   147786
    ## 19 Haiti                 2.69        809    30055
    ## 20 South Africa          2.67      97520  3648968

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6976.     208622   29.9 
    ##  2 Bulgaria               4865.      34779    7.15
    ##  3 Hungary                4304.      42966    9.98
    ##  4 Czech Republic         3632.      38050   10.5 
    ##  5 Slovakia               3333.      18179    5.46
    ##  6 Brazil                 3181.     639689  201.  
    ##  7 Argentina              3018.     124765   41.3 
    ##  8 United States          2961.     918560  310.  
    ##  9 Colombia               2876.     137439   47.8 
    ## 10 Belgium                2868.      29832   10.4 
    ## 11 Poland                 2836.     109205   38.5 
    ## 12 Paraguay               2827.      18027    6.38
    ## 13 Romania                2826.      62063   22.0 
    ## 14 Mexico                 2788.     313608  112.  
    ## 15 Tunisia                2578.      27295   10.6 
    ## 16 United Kingdom         2567.     160038   62.3 
    ## 17 Italy                  2518.     151962   60.3 
    ## 18 Russia                 2439.     343173  141.  
    ## 19 Chile                  2432.      40735   16.7 
    ## 20 Ecuador                2369.      35038   14.8

EOL
