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

Updated: 2022-02-01

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
    ##  1 United States          105195. 73531094            699
    ##  2 India                   60032. 41302440            688
    ##  3 Brazil                  36596. 25214622            689
    ##  4 France                  26498. 18574875            701
    ##  5 United Kingdom          23628. 16468526            697
    ##  6 Russia                  17341. 11861077            684
    ##  7 Turkey                  16850. 11525730            684
    ##  8 Italy                   15431. 10925485            708
    ##  9 Germany                 13982.  9815533            702
    ## 10 Spain                   13800.  9660209            700
    ## 11 Argentina               12204.  8335184            683
    ## 12 Iran                     8986.  6344179            706
    ## 13 Colombia                 8561.  5855858            684
    ## 14 Mexico                   7125.  4916143            690
    ## 15 Poland                   7102.  4886154            688
    ## 16 Indonesia                6327.  4353370            688
    ## 17 Netherlands              6216.  4320257            695
    ## 18 Ukraine                  5995.  4064495            678
    ## 19 South Africa             5269.  3603856            684
    ## 20 Philippines              5153.  3545680            688

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        561.             387937.            691
    ##  2 Denmark                       451.             312452.            693
    ##  3 Belgium                       421.             293754.            698
    ##  4 Czech Republic                417.             287653.            690
    ##  5 France                        409.             286789.            701
    ##  6 Switzerland                   400.             279957.            699
    ##  7 United Kingdom                379.             264137.            697
    ##  8 Netherlands                   373.             259553.            695
    ##  9 Portugal                      355.             244650.            689
    ## 10 United States                 339.             237019.            699
    ## 11 Serbia                        331.             226342.            683
    ## 12 Austria                       323.             223584.            693
    ## 13 Sweden                        312.             216668.            695
    ## 14 Spain                         297.             207720.            700
    ## 15 Argentina                     295.             201610.            683
    ## 16 Jordan                        277.             188710.            680
    ## 17 Slovakia                      270.             184810.            684
    ## 18 Italy                         256.             181064.            708
    ## 19 Greece                        253.             174636.            690
    ## 20 Hungary                       228.             155621.            682

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.3        2011    11019
    ##  2 Peru                 6.42     205347  3196488
    ##  3 Mexico               6.22     305762  4916143
    ##  4 Sudan                5.97       3441    57632
    ##  5 Syria                5.82       2986    51341
    ##  6 Egypt                5.34      22604   423688
    ##  7 Somalia              5.26       1335    25388
    ##  8 Ecuador              4.87      34442   707224
    ##  9 Afghanistan          4.57       7409   162140
    ## 10 China                4.10       5700   138992
    ## 11 Myanmar              3.61      19310   535254
    ## 12 Bulgaria             3.52      33160   941814
    ## 13 Niger                3.45        298     8649
    ## 14 Indonesia            3.32     144320  4353370
    ## 15 Malawi               3.03       2558    84420
    ## 16 Paraguay             3.02      17231   570469
    ## 17 El Salvador          2.90       3891   134155
    ## 18 Tunisia              2.90      26271   907239
    ## 19 Russia               2.79     331349 11861077
    ## 20 Romania              2.73      59984  2196394

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6866.     205347   29.9 
    ##  2 Bulgaria               4639.      33160    7.15
    ##  3 Hungary                4148.      41405    9.98
    ##  4 Czech Republic         3552.      37209   10.5 
    ##  5 Slovakia               3269.      17830    5.46
    ##  6 Brazil                 3115.     626524  201.  
    ##  7 Argentina              2926.     120988   41.3 
    ##  8 United States          2823.     875755  310.  
    ##  9 Colombia               2800.     133832   47.8 
    ## 10 Belgium                2784.      28957   10.4 
    ## 11 Poland                 2732.     105194   38.5 
    ## 12 Romania                2732.      59984   22.0 
    ## 13 Mexico                 2719.     305762  112.  
    ## 14 Paraguay               2703.      17231    6.38
    ## 15 United Kingdom         2497.     155698   62.3 
    ## 16 Tunisia                2481.      26271   10.6 
    ## 17 Italy                  2422.     146149   60.3 
    ## 18 Chile                  2370.      39684   16.7 
    ## 19 Russia                 2355.     331349  141.  
    ## 20 Ecuador                2329.      34442   14.8

EOL
