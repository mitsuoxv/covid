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

Updated: 2021-10-29

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
    ##  1 United States           71774. 45361805            632
    ##  2 India                   57726. 34231809            593
    ##  3 Brazil                  36614. 21748984            594
    ##  4 United Kingdom          14730.  8897153            604
    ##  5 Russia                  14249.  8392697            589
    ##  6 Turkey                  13473.  7936007            589
    ##  7 France                  11415.  6917770            606
    ##  8 Iran                     9637.  5888100            611
    ##  9 Argentina                8984.  5283000            588
    ## 10 Colombia                 8479.  4994014            589
    ## 11 Spain                    8275.  5006675            605
    ## 12 Italy                    7752.  4752368            613
    ## 13 Germany                  7470.  4534452            607
    ## 14 Indonesia                7154.  4242532            593
    ## 15 Mexico                   6433.  3788986            589
    ## 16 Poland                   5057.  2998891            593
    ## 17 South Africa             4958.  2920581            589
    ## 18 Ukraine                  4891.  2851804            583
    ## 19 Philippines              4669.  2768849            593
    ## 20 Malaysia                 4094.  2448372            598

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        303.             180270.            595
    ##  2 Czech Republic                280.             166829.            595
    ##  3 Serbia                        259.             152339.            588
    ##  4 United Kingdom                236.             142700.            604
    ##  5 United States                 231.             146219.            632
    ##  6 Jordan                        228.             133672.            585
    ##  7 Argentina                     217.             127784.            588
    ##  8 Belgium                       214.             129070.            603
    ##  9 Netherlands                   210.             126216.            600
    ## 10 Sweden                        204.             122388.            600
    ## 11 Switzerland                   189.             114153.            604
    ## 12 Brazil                        182.             108148.            594
    ## 13 Spain                         178.             107657.            605
    ## 14 Colombia                      177.             104499.            589
    ## 15 France                        176.             106808.            606
    ## 16 Turkey                        173.             102000.            589
    ## 17 Portugal                      171.             101840.            594
    ## 18 Chile                         170.             100697.            591
    ## 19 Austria                       164.              98224.            598
    ## 20 Hungary                       147.              86093.            587

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.2        1868     9728
    ##  2 Peru                 9.11     200118  2197052
    ##  3 Mexico               7.57     286888  3788986
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32958   515859
    ##  6 Syria                5.99       2536    42351
    ##  7 Egypt                5.63      18428   327286
    ##  8 Somalia              5.49       1208    21998
    ##  9 Afghanistan          4.65       7266   156124
    ## 10 China                4.53       5696   125738
    ## 11 Bulgaria             4.01      23594   587765
    ## 12 Myanmar              3.74      18603   496901
    ## 13 Malawi               3.72       2297    61774
    ## 14 Bolivia              3.70      18907   511147
    ## 15 Hungary              3.57      30692   859378
    ## 16 Tunisia              3.54      25221   712139
    ## 17 Mali                 3.52        561    15925
    ## 18 Paraguay             3.52      16233   460815
    ## 19 Zimbabwe             3.52       4675   132808
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6691.     200118   29.9 
    ##  2 Bulgaria               3300.      23594    7.15
    ##  3 Hungary                3075.      30692    9.98
    ##  4 Brazil                 3015.     606246  201.  
    ##  5 Czech Republic         2929.      30689   10.5 
    ##  6 Argentina              2803.     115866   41.3 
    ##  7 Colombia               2660.     127133   47.8 
    ##  8 Mexico                 2551.     286888  112.  
    ##  9 Paraguay               2546.      16233    6.38
    ## 10 Belgium                2494.      25946   10.4 
    ## 11 Tunisia                2382.      25221   10.6 
    ## 12 Slovakia               2379.      12977    5.46
    ## 13 United States          2367.     734447  310.  
    ## 14 Chile                  2251.      37697   16.7 
    ## 15 United Kingdom         2246.     140041   62.3 
    ## 16 Ecuador                2228.      32958   14.8 
    ## 17 Italy                  2187.     131954   60.3 
    ## 18 Romania                2114.      46430   22.0 
    ## 19 Poland                 1994.      76773   38.5 
    ## 20 Bolivia                1901.      18907    9.95

EOL
