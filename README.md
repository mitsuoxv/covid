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

Updated: 2021-09-15

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
    ##  1 United States           71713. 40804998            569
    ##  2 India                   60637. 33289579            549
    ##  3 Brazil                  38181. 20999779            550
    ##  4 Russia                  13167.  7176085            545
    ##  5 United Kingdom          12958.  7256563            560
    ##  6 Turkey                  12262.  6682864            545
    ##  7 France                  11930.  6704512            562
    ##  8 Argentina                9604.  5224534            544
    ##  9 Iran                     9380.  5318327            567
    ## 10 Colombia                 9046.  4930249            545
    ## 11 Spain                    8761.  4915265            561
    ## 12 Italy                    8100.  4609205            569
    ## 13 Indonesia                7603.  4174216            549
    ## 14 Germany                  7264.  4089476            563
    ## 15 Mexico                   6444.  3511882            545
    ## 16 Poland                   5272.  2894455            549
    ## 17 South Africa             5249.  2860835            545
    ## 18 Ukraine                  4306.  2321156            539
    ## 19 Philippines              4095.  2248071            549
    ## 20 Peru                     3958.  2161086            546

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        292.             161008.            551
    ##  2 Czech Republic                292.             160729.            551
    ##  3 Jordan                        233.             126014.            541
    ##  4 Argentina                     232.             126370.            544
    ##  5 United States                 231.             131530.            569
    ##  6 Sweden                        214.             119091.            556
    ##  7 Netherlands                   213.             118513.            556
    ##  8 Belgium                       208.             116349.            559
    ##  9 United Kingdom                208.             116387.            560
    ## 10 Serbia                        206.             112073.            544
    ## 11 Switzerland                   191.             106928.            560
    ## 12 Brazil                        190.             104423.            550
    ## 13 Colombia                      189.             103165.            545
    ## 14 Spain                         188.             105691.            561
    ## 15 France                        184.             103515.            562
    ## 16 Portugal                      180.              98917.            550
    ## 17 Chile                         180.              98202.            547
    ## 18 Turkey                        158.              85893.            545
    ## 19 Austria                       156.              86274.            554
    ## 20 Hungary                       151.              81732.            543

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1584     8414
    ##  2 Peru                 9.20     198764  2161086
    ##  3 Mexico               7.62     267748  3511882
    ##  4 Sudan                7.45       2829    37951
    ##  5 Syria                7.04       2077    29498
    ##  6 Ecuador              6.42      32448   505278
    ##  7 Egypt                5.76      16871   292957
    ##  8 Somalia              5.57       1023    18373
    ##  9 Afghanistan          4.65       7171   154180
    ## 10 China                4.60       5688   123642
    ## 11 Bulgaria             4.15      19661   473270
    ## 12 Myanmar              3.82      16693   436527
    ## 13 Bolivia              3.75      18587   495035
    ## 14 Hungary              3.69      30102   815851
    ## 15 Malawi               3.67       2242    61137
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.62        543    14985
    ## 18 Zimbabwe             3.59       4543   126399
    ## 19 Tunisia              3.54      24244   685799
    ## 20 Paraguay             3.51      16102   459291

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6646.     198764   29.9 
    ##  2 Hungary                3016.      30102    9.98
    ##  3 Brazil                 2918.     586851  201.  
    ##  4 Czech Republic         2903.      30416   10.5 
    ##  5 Bulgaria               2750.      19661    7.15
    ##  6 Argentina              2743.     113402   41.3 
    ##  7 Colombia               2629.     125647   47.8 
    ##  8 Paraguay               2525.      16102    6.38
    ##  9 Belgium                2449.      25473   10.4 
    ## 10 Mexico                 2381.     267748  112.  
    ## 11 Slovakia               2303.      12562    5.46
    ## 12 Tunisia                2290.      24244   10.6 
    ## 13 Chile                  2225.      37253   16.7 
    ## 14 Ecuador                2194.      32448   14.8 
    ## 15 Italy                  2154.     129955   60.3 
    ## 16 United Kingdom         2153.     134261   62.3 
    ## 17 United States          2112.     655172  310.  
    ## 18 Poland                 1959.      75433   38.5 
    ## 19 Bolivia                1869.      18587    9.95
    ## 20 Spain                  1836.      85393   46.5

EOL
