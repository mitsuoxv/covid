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

Updated: 2022-02-10

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
    ##  1 United States          107705. 76255008            708
    ##  2 India                   60848. 42410976            697
    ##  3 Brazil                  38108. 26599593            698
    ##  4 France                  28805. 20451810            710
    ##  5 United Kingdom          25293. 17932807            709
    ##  6 Russia                  19236. 13330769            693
    ##  7 Turkey                  17958. 12445220            693
    ##  8 Italy                   16410. 11765767            717
    ##  9 Germany                 16205. 11521678            711
    ## 10 Spain                   14724. 10439303            709
    ## 11 Argentina               12450.  8615285            692
    ## 12 Iran                     9311.  6657842            715
    ## 13 Colombia                 8623.  5975786            693
    ## 14 Netherlands              7599.  5350048            704
    ## 15 Poland                   7545.  5258785            697
    ## 16 Mexico                   7383.  5160767            699
    ## 17 Indonesia                6638.  4626936            697
    ## 18 Ukraine                  6375.  4380047            687
    ## 19 South Africa             5235.  3628014            693
    ## 20 Philippines              5193.  3619633            697

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        640.             448181.            700
    ##  2 Denmark                       542.             380687.            702
    ##  3 Belgium                       457.             323358.            707
    ##  4 Netherlands                   457.             321421.            704
    ##  5 Switzerland                   456.             323169.            708
    ##  6 Czech Republic                452.             316070.            699
    ##  7 France                        445.             315768.            710
    ##  8 United Kingdom                406.             287622.            709
    ##  9 Portugal                      398.             277608.            698
    ## 10 Austria                       369.             258927.            702
    ## 11 Serbia                        353.             244192.            692
    ## 12 Sweden                        350.             246394.            704
    ## 13 United States                 347.             245799.            708
    ## 14 Spain                         317.             224472.            709
    ## 15 Jordan                        311.             214521.            689
    ## 16 Slovakia                      309.             213903.            693
    ## 17 Argentina                     301.             208385.            692
    ## 18 Italy                         272.             194990.            717
    ## 19 Greece                        272.             190035.            699
    ## 20 Norway                        264.             186314.            706

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.0        2090    11579
    ##  2 Sudan                 6.33       3758    59345
    ##  3 Peru                  6.14     207114  3372895
    ##  4 Mexico                6.00     309752  5160767
    ##  5 Syria                 5.78       3014    52119
    ##  6 Egypt                 5.19      23053   444117
    ##  7 Somalia               5.11       1340    26203
    ##  8 Ecuador               4.52      34739   769149
    ##  9 Afghanistan           4.44       7454   167739
    ## 10 China                 4.00       5700   142599
    ## 11 Myanmar               3.57      19310   540597
    ## 12 Niger                 3.48        303     8696
    ## 13 Bulgaria              3.37      34044  1011588
    ## 14 Indonesia             3.13     144784  4626936
    ## 15 Malawi                3.03       2575    84876
    ## 16 El Salvador           2.93       3960   135109
    ## 17 Paraguay              2.89      17653   610207
    ## 18 Tunisia               2.82      26824   950575
    ## 19 Haiti                 2.72        804    29549
    ## 20 South Africa          2.65      96289  3628014

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6925.     207114   29.9 
    ##  2 Bulgaria               4762.      34044    7.15
    ##  3 Hungary                4225.      42170    9.98
    ##  4 Czech Republic         3590.      37612   10.5 
    ##  5 Slovakia               3302.      18014    5.46
    ##  6 Brazil                 3146.     632621  201.  
    ##  7 Argentina              2974.     122943   41.3 
    ##  8 United States          2897.     898668  310.  
    ##  9 Colombia               2846.     135992   47.8 
    ## 10 Belgium                2829.      29429   10.4 
    ## 11 Poland                 2785.     107204   38.5 
    ## 12 Romania                2774.      60916   22.0 
    ## 13 Paraguay               2769.      17653    6.38
    ## 14 Mexico                 2754.     309752  112.  
    ## 15 United Kingdom         2545.     158677   62.3 
    ## 16 Tunisia                2533.      26824   10.6 
    ## 17 Italy                  2478.     149512   60.3 
    ## 18 Russia                 2398.     337390  141.  
    ## 19 Chile                  2394.      40087   16.7 
    ## 20 Ecuador                2349.      34739   14.8

EOL
