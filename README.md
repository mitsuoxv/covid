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

Updated: 2022-02-03

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
    ##  1 United States          106277. 74500060            701
    ##  2 India                   60334. 41630885            690
    ##  3 Brazil                  36797. 25426744            691
    ##  4 France                  27042. 19010518            703
    ##  5 United Kingdom          24827. 17428349            702
    ##  6 Russia                  17680. 12128796            686
    ##  7 Turkey                  17087. 11721592            686
    ##  8 Italy                   15657. 11116422            710
    ##  9 Germany                 14470. 10186644            704
    ## 10 Spain                   14301. 10039127            702
    ## 11 Argentina               12231.  8378656            685
    ## 12 Iran                     9051.  6408244            708
    ## 13 Colombia                 8582.  5887261            686
    ## 14 Poland                   7219.  4981321            690
    ## 15 Mexico                   7142.  4942590            692
    ## 16 Netherlands              6511.  4538279            697
    ## 17 Indonesia                6358.  4387286            690
    ## 18 Ukraine                  6074.  4130277            680
    ## 19 South Africa             5260.  3608307            686
    ## 20 Philippines              5173.  3569665            690

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        585.             405422.            693
    ##  2 Denmark                       469.             326028.            695
    ##  3 Belgium                       437.             306085.            700
    ##  4 Czech Republic                428.             295959.            692
    ##  5 Switzerland                   422.             296021.            701
    ##  6 France                        418.             293515.            703
    ##  7 United Kingdom                398.             279531.            702
    ##  8 Netherlands                   391.             272651.            697
    ##  9 Portugal                      365.             252032.            691
    ## 10 United States                 343.             240142.            701
    ## 11 Serbia                        337.             231048.            685
    ## 12 Austria                       331.             230114.            695
    ## 13 Sweden                        328.             228541.            697
    ## 14 Spain                         307.             215868.            702
    ## 15 Argentina                     296.             202661.            685
    ## 16 Jordan                        284.             194018.            682
    ## 17 Slovakia                      279.             191202.            686
    ## 18 Italy                         259.             184229.            710
    ## 19 Greece                        258.             178702.            692
    ## 20 Hungary                       232.             158537.            684

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.1        2013    11113
    ##  2 Peru                 6.35     205834  3239538
    ##  3 Mexico               6.19     306091  4942590
    ##  4 Sudan                6.03       3533    58623
    ##  5 Syria                5.81       2992    51483
    ##  6 Egypt                5.30      22683   428202
    ##  7 Somalia              5.12       1335    26067
    ##  8 Ecuador              4.72      34533   732038
    ##  9 Afghanistan          4.53       7417   163720
    ## 10 China                4.09       5700   139457
    ## 11 Myanmar              3.60      19310   536393
    ## 12 Niger                3.48        301     8655
    ## 13 Bulgaria             3.47      33405   963108
    ## 14 Indonesia            3.29     144373  4387286
    ## 15 Malawi               3.03       2563    84572
    ## 16 Haiti                3.00        876    29217
    ## 17 Paraguay             2.97      17321   583662
    ## 18 El Salvador          2.89       3908   135109
    ## 19 Tunisia              2.87      26362   917814
    ## 20 Russia               2.74     332690 12128796

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6882.     205834   29.9 
    ##  2 Bulgaria               4673.      33405    7.15
    ##  3 Hungary                4162.      41548    9.98
    ##  4 Czech Republic         3559.      37281   10.5 
    ##  5 Slovakia               3277.      17877    5.46
    ##  6 Brazil                 3118.     627138  201.  
    ##  7 Argentina              2933.     121273   41.3 
    ##  8 United States          2838.     880580  310.  
    ##  9 Colombia               2810.     134300   47.8 
    ## 10 Belgium                2796.      29083   10.4 
    ## 11 Poland                 2747.     105753   38.5 
    ## 12 Romania                2738.      60122   22.0 
    ## 13 Mexico                 2722.     306091  112.  
    ## 14 Paraguay               2717.      17321    6.38
    ## 15 United Kingdom         2516.     156875   62.3 
    ## 16 Tunisia                2490.      26362   10.6 
    ## 17 Italy                  2435.     146925   60.3 
    ## 18 Chile                  2373.      39733   16.7 
    ## 19 Russia                 2365.     332690  141.  
    ## 20 Ecuador                2335.      34533   14.8

EOL
