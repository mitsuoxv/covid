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

Updated: 2022-01-14

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
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           91228. 62126362            681
    ##  2 India                   54206. 36317927            670
    ##  3 Brazil                  33725. 22629460            671
    ##  4 United Kingdom          21888. 14862142            679
    ##  5 France                  18454. 12604364            683
    ##  6 Russia                  16101. 10723305            666
    ##  7 Turkey                  15307. 10194785            666
    ##  8 Italy                   11552.  7971068            690
    ##  9 Spain                   11395.  7771367            682
    ## 10 Germany                 11320.  7743228            684
    ## 11 Argentina                9825.  6533635            665
    ## 12 Iran                     9029.  6212387            688
    ## 13 Colombia                 8079.  5380841            666
    ## 14 Indonesia                6370.  4268097            670
    ## 15 Poland                   6366.  4265433            670
    ## 16 Mexico                   6205.  4170066            672
    ## 17 Ukraine                  5647.  3727034            660
    ## 18 South Africa             5316.  3540891            666
    ## 19 Netherlands              5069.  3432119            677
    ## 20 Philippines              4565.  3058634            670

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                364.             244581.            672
    ##  2 United Kingdom                351.             238372.            679
    ##  3 Israel                        337.             226726.            673
    ##  4 Belgium                       332.             225624.            680
    ##  5 Switzerland                   309.             210705.            681
    ##  6 Netherlands                   305.             206195.            677
    ##  7 United States                 294.             200257.            681
    ##  8 France                        285.             194607.            683
    ##  9 Serbia                        284.             188719.            665
    ## 10 Denmark                       278.             187935.            675
    ## 11 Jordan                        257.             169863.            662
    ## 12 Austria                       249.             167762.            675
    ## 13 Spain                         245.             167105.            682
    ## 14 Portugal                      242.             162453.            671
    ## 15 Slovakia                      240.             159947.            666
    ## 16 Argentina                     238.             158034.            665
    ## 17 Sweden                        233.             157937.            677
    ## 18 Greece                        215.             144769.            672
    ## 19 Hungary                       199.             132047.            664
    ## 20 Turkey                        197.             131031.            666

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1987    10233
    ##  2 Peru                 8.42     203157  2412577
    ##  3 Mexico               7.21     300574  4170066
    ##  4 Sudan                6.73       3358    49916
    ##  5 Ecuador              5.90      34122   578525
    ##  6 Syria                5.80       2936    50580
    ##  7 Egypt                5.57      22042   395688
    ##  8 Somalia              5.50       1335    24261
    ##  9 Afghanistan          4.65       7376   158511
    ## 10 China                4.22       5699   135019
    ## 11 Bulgaria             3.98      31838   799943
    ## 12 Myanmar              3.62      19297   532553
    ## 13 Niger                3.46        286     8260
    ## 14 Paraguay             3.46      16689   482506
    ## 15 Tunisia              3.40      25731   756155
    ## 16 Indonesia            3.38     144150  4268097
    ## 17 Romania              3.17      59114  1866102
    ## 18 El Salvador          3.11       3828   123025
    ## 19 Hungary              3.05      40164  1318093
    ## 20 Malawi               2.99       2437    81414

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6793.     203157   29.9 
    ##  2 Bulgaria               4454.      31838    7.15
    ##  3 Hungary                4024.      40164    9.98
    ##  4 Czech Republic         3509.      36765   10.5 
    ##  5 Slovakia               3140.      17128    5.46
    ##  6 Brazil                 3084.     620238  201.  
    ##  7 Argentina              2844.     117595   41.3 
    ##  8 Belgium                2746.      28566   10.4 
    ##  9 Colombia               2730.     130460   47.8 
    ## 10 United States          2696.     836482  310.  
    ## 11 Romania                2692.      59114   22.0 
    ## 12 Mexico                 2673.     300574  112.  
    ## 13 Poland                 2634.     101419   38.5 
    ## 14 Paraguay               2618.      16689    6.38
    ## 15 Tunisia                2430.      25731   10.6 
    ## 16 United Kingdom         2422.     151007   62.3 
    ## 17 Chile                  2346.      39290   16.7 
    ## 18 Italy                  2318.     139872   60.3 
    ## 19 Ecuador                2307.      34122   14.8 
    ## 20 Russia                 2268.     319172  141.

EOL
