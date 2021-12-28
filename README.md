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

Updated: 2021-12-29

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
    ##  1 United States           77858. 51775769            665
    ##  2 India                   53210. 34799691            654
    ##  3 Brazil                  33953. 22239436            655
    ##  4 United Kingdom          18361. 12209995            665
    ##  5 Russia                  16057. 10437152            650
    ##  6 Turkey                  14357.  9332332            650
    ##  7 France                  13338.  8896253            667
    ##  8 Germany                 10518.  7026369            668
    ##  9 Iran                     9206.  6186729            672
    ## 10 Spain                    8908.  5932627            666
    ## 11 Italy                    8424.  5678112            674
    ## 12 Argentina                8413.  5460042            649
    ## 13 Colombia                 7884.  5124690            650
    ## 14 Indonesia                6516.  4261879            654
    ## 15 Poland                   6215.  4064715            654
    ## 16 Mexico                   6023.  3951003            656
    ## 17 Ukraine                  5666.  3649236            644
    ## 18 South Africa             5257.  3417318            650
    ## 19 Netherlands              4654.  3076442            661
    ## 20 Philippines              4340.  2838792            654

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                357.             234311.            656
    ##  2 Belgium                       297.             197335.            664
    ##  3 United Kingdom                294.             195835.            665
    ##  4 Israel                        284.             186108.            656
    ##  5 Netherlands                   280.             184827.            661
    ##  6 Serbia                        271.             175867.            649
    ##  7 Jordan                        255.             164645.            646
    ##  8 United States                 251.             166893.            665
    ##  9 Switzerland                   249.             165879.            665
    ## 10 Slovakia                      234.             152354.            650
    ## 11 Austria                       233.             153855.            659
    ## 12 France                        206.             137355.            667
    ## 13 Argentina                     203.             132066.            649
    ## 14 Sweden                        202.             133249.            661
    ## 15 Denmark                       199.             131118.            659
    ## 16 Hungary                       193.             124894.            648
    ## 17 Spain                         192.             127567.            666
    ## 18 Turkey                        185.             119946.            650
    ## 19 Portugal                      184.             120468.            655
    ## 20 Brazil                        169.             110587.            655

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1984    10118
    ##  2 Peru                 8.89     202524  2279299
    ##  3 Mexico               7.56     298777  3951003
    ##  4 Sudan                7.12       3298    46292
    ##  5 Ecuador              6.20      33649   542341
    ##  6 Syria                5.74       2879    50127
    ##  7 Somalia              5.66       1333    23532
    ##  8 Egypt                5.66      21639   382194
    ##  9 Afghanistan          4.66       7354   157967
    ## 10 China                4.35       5699   131093
    ## 11 Bulgaria             4.16      30623   735998
    ## 12 Niger                3.76        274     7289
    ## 13 Myanmar              3.63      19257   529813
    ## 14 Paraguay             3.57      16601   465338
    ## 15 Tunisia              3.53      25538   723422
    ## 16 Bolivia              3.38      19554   577808
    ## 17 Indonesia            3.38     144063  4261879
    ## 18 Mali                 3.27        658    20121
    ## 19 Malawi               3.27       2337    71551
    ## 20 Romania              3.25      58575  1803311

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6772.     202524   29.9 
    ##  2 Bulgaria               4284.      30623    7.15
    ##  3 Hungary                3896.      38894    9.98
    ##  4 Czech Republic         3428.      35911   10.5 
    ##  5 Brazil                 3075.     618448  201.  
    ##  6 Slovakia               3022.      16486    5.46
    ##  7 Argentina              2831.     117035   41.3 
    ##  8 Colombia               2715.     129761   47.8 
    ##  9 Belgium                2712.      28218   10.4 
    ## 10 Romania                2667.      58575   22.0 
    ## 11 Mexico                 2657.     298777  112.  
    ## 12 United States          2611.     809908  310.  
    ## 13 Paraguay               2604.      16601    6.38
    ## 14 Poland                 2465.      94914   38.5 
    ## 15 Tunisia                2412.      25538   10.6 
    ## 16 United Kingdom         2374.     148003   62.3 
    ## 17 Chile                  2332.      39056   16.7 
    ## 18 Ecuador                2275.      33649   14.8 
    ## 19 Italy                  2266.     136753   60.3 
    ## 20 Russia                 2175.     306090  141.

EOL
