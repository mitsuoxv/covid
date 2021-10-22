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

Updated: 2021-10-23

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
    ##  1 United States           71789. 44940696            626
    ##  2 India                   58165. 34143236            587
    ##  3 Brazil                  36871. 21680488            588
    ##  4 United Kingdom          14450.  8641225            598
    ##  5 Russia                  14011.  8168305            583
    ##  6 Turkey                  13332.  7772604            583
    ##  7 France                  11478.  6886851            600
    ##  8 Iran                     9642.  5833525            605
    ##  9 Argentina                9065.  5275984            582
    ## 10 Colombia                 8550.  4984751            583
    ## 11 Spain                    8339.  4995176            599
    ## 12 Italy                    7792.  4729678            607
    ## 13 Germany                  7383.  4437280            601
    ## 14 Indonesia                7221.  4238594            587
    ## 15 Mexico                   6463.  3767758            583
    ## 16 Poland                   5046.  2961923            587
    ## 17 South Africa             5006.  2918366            583
    ## 18 Ukraine                  4723.  2725385            577
    ## 19 Philippines              4668.  2740111            587
    ## 20 Malaysia                 4077.  2413592            592

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        305.             179666.            589
    ##  2 Czech Republic                279.             164418.            589
    ##  3 Serbia                        252.             146774.            582
    ##  4 United Kingdom                232.             138596.            598
    ##  5 United States                 231.             144861.            626
    ##  6 Jordan                        228.             132046.            579
    ##  7 Argentina                     219.             127614.            582
    ##  8 Belgium                       210.             125510.            597
    ##  9 Netherlands                   209.             124045.            594
    ## 10 Sweden                        205.             121935.            594
    ## 11 Switzerland                   189.             113112.            598
    ## 12 Brazil                        183.             107808.            588
    ## 13 Spain                         179.             107409.            599
    ## 14 Colombia                      179.             104305.            583
    ## 15 France                        177.             106330.            600
    ## 16 Portugal                      172.             101416.            588
    ## 17 Turkey                        171.              99900.            583
    ## 18 Chile                         171.             100082.            585
    ## 19 Austria                       161.              95604.            592
    ## 20 Hungary                       145.              84535.            581

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1831     9617
    ##  2 Peru                 9.12     199945  2192205
    ##  3 Mexico               7.57     285347  3767758
    ##  4 Sudan                7.46       2990    40084
    ##  5 Ecuador              6.41      32937   514087
    ##  6 Syria                6.10       2457    40294
    ##  7 Egypt                5.64      18105   321084
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7249   155891
    ## 10 China                4.54       5695   125402
    ## 11 Bulgaria             4.08      22839   559893
    ## 12 Myanmar              3.76      18465   491584
    ## 13 Malawi               3.72       2296    61745
    ## 14 Bolivia              3.72      18887   508166
    ## 15 Hungary              3.61      30492   843825
    ## 16 Mali                 3.54        558    15742
    ## 17 Tunisia              3.53      25121   711164
    ## 18 Paraguay             3.52      16228   460615
    ## 19 Zimbabwe             3.52       4662   132540
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6686.     199945   29.9 
    ##  2 Bulgaria               3195.      22839    7.15
    ##  3 Hungary                3055.      30492    9.98
    ##  4 Brazil                 3005.     604228  201.  
    ##  5 Czech Republic         2920.      30593   10.5 
    ##  6 Argentina              2800.     115770   41.3 
    ##  7 Colombia               2656.     126931   47.8 
    ##  8 Paraguay               2545.      16228    6.38
    ##  9 Mexico                 2537.     285347  112.  
    ## 10 Belgium                2483.      25835   10.4 
    ## 11 Tunisia                2372.      25121   10.6 
    ## 12 Slovakia               2362.      12886    5.46
    ## 13 United States          2343.     726846  310.  
    ## 14 Chile                  2248.      37640   16.7 
    ## 15 United Kingdom         2232.     139146   62.3 
    ## 16 Ecuador                2227.      32937   14.8 
    ## 17 Italy                  2183.     131724   60.3 
    ## 18 Romania                1997.      43844   22.0 
    ## 19 Poland                 1983.      76359   38.5 
    ## 20 Bolivia                1899.      18887    9.95

EOL
