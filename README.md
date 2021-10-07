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

Updated: 2021-10-08

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
    ##  1 United States           73773. 43673628            592
    ##  2 India                   59256. 33894312            572
    ##  3 Brazil                  37520. 21499074            573
    ##  4 United Kingdom          13733.  8006664            583
    ##  5 Russia                  13539.  7690110            568
    ##  6 Turkey                  12900.  7327317            568
    ##  7 France                  11661.  6821616            585
    ##  8 Iran                     9597.  5662458            590
    ##  9 Argentina                9280.  5261935            567
    ## 10 Colombia                 8740.  4964454            568
    ## 11 Spain                    8509.  4969503            584
    ## 12 Italy                    7921.  4689341            592
    ## 13 Indonesia                7385.  4224487            572
    ## 14 Germany                  7309.  4283378            586
    ## 15 Mexico                   6500.  3691924            568
    ## 16 South Africa             5121.  2908768            568
    ## 17 Poland                   5099.  2916969            572
    ## 18 Philippines              4585.  2622917            572
    ## 19 Ukraine                  4444.  2497643            562
    ## 20 Malaysia                 3993.  2303837            577

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        308.             176689.            574
    ##  2 Czech Republic                282.             161995.            574
    ##  3 United States                 238.             140777.            592
    ##  4 Serbia                        236.             133608.            567
    ##  5 Jordan                        230.             129527.            564
    ##  6 Argentina                     224.             127274.            567
    ##  7 United Kingdom                220.             128418.            583
    ##  8 Sweden                        209.             120998.            579
    ##  9 Netherlands                   209.             120963.            579
    ## 10 Belgium                       207.             120753.            582
    ## 11 Switzerland                   191.             111168.            583
    ## 12 Brazil                        187.             106906.            573
    ## 13 Spain                         183.             106857.            584
    ## 14 Colombia                      183.             103881.            568
    ## 15 France                        180.             105323.            585
    ## 16 Portugal                      175.             100462.            573
    ## 17 Chile                         174.              99032.            570
    ## 18 Turkey                        166.              94176.            568
    ## 19 Austria                       158.              91423.            577
    ## 20 Hungary                       146.              82813.            566

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1763     9271
    ##  2 Peru                 9.15     199520  2180149
    ##  3 Mexico               7.58     279896  3691924
    ##  4 Sudan                7.44       2876    38670
    ##  5 Syria                6.42       2306    35898
    ##  6 Ecuador              6.42      32819   511317
    ##  7 Egypt                5.68      17545   309135
    ##  8 Somalia              5.51       1152    20900
    ##  9 Afghanistan          4.65       7220   155382
    ## 10 China                4.56       5693   124920
    ## 11 Bulgaria             4.16      21411   514208
    ## 12 Myanmar              3.80      18034   474419
    ## 13 Bolivia              3.74      18770   502047
    ## 14 Malawi               3.71       2287    61639
    ## 15 Hungary              3.66      30259   826636
    ## 16 Mali                 3.59        552    15369
    ## 17 Zimbabwe             3.52       4630   131434
    ## 18 Tunisia              3.52      24971   709001
    ## 19 Paraguay             3.52      16204   460084
    ## 20 Chad                 3.44        174     5053

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6671.     199520   29.9 
    ##  2 Hungary                3031.      30259    9.98
    ##  3 Bulgaria               2995.      21411    7.15
    ##  4 Brazil                 2978.     598829  201.  
    ##  5 Czech Republic         2911.      30493   10.5 
    ##  6 Argentina              2789.     115323   41.3 
    ##  7 Colombia               2646.     126455   47.8 
    ##  8 Paraguay               2541.      16204    6.38
    ##  9 Mexico                 2489.     279896  112.  
    ## 10 Belgium                2466.      25649   10.4 
    ## 11 Tunisia                2358.      24971   10.6 
    ## 12 Slovakia               2329.      12705    5.46
    ## 13 United States          2259.     700773  310.  
    ## 14 Chile                  2240.      37512   16.7 
    ## 15 Ecuador                2219.      32819   14.8 
    ## 16 United Kingdom         2202.     137295   62.3 
    ## 17 Italy                  2174.     131157   60.3 
    ## 18 Poland                 1969.      75803   38.5 
    ## 19 Bolivia                1887.      18770    9.95
    ## 20 Spain                  1864.      86678   46.5

EOL
