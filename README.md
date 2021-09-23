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

Updated: 2021-09-24

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
    ##  1 United States           72947. 42163561            578
    ##  2 India                   60149. 33563421            558
    ##  3 Brazil                  38009. 21247094            559
    ##  4 Russia                  13276.  7354995            554
    ##  5 United Kingdom          13234.  7530107            569
    ##  6 Turkey                  12513.  6932453            554
    ##  7 France                  11839.  6760265            571
    ##  8 Iran                     9509.  5477229            576
    ##  9 Argentina                9481.  5243231            553
    ## 10 Colombia                 8923.  4943622            554
    ## 11 Spain                    8668.  4940824            570
    ## 12 Italy                    8038.  4645853            578
    ## 13 Indonesia                7529.  4201559            558
    ## 14 Germany                  7293.  4171666            572
    ## 15 Mexico                   6472.  3585565            554
    ## 16 South Africa             5206.  2884134            554
    ## 17 Poland                   5198.  2900862            558
    ## 18 Philippines              4332.  2417419            558
    ## 19 Ukraine                  4325.  2370425            548
    ## 20 Peru                     3907.  2168431            555

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        303.             169884.            560
    ##  2 Czech Republic                288.             161128.            560
    ##  3 United States                 235.             135909.            578
    ##  4 Jordan                        232.             127449.            550
    ##  5 Argentina                     229.             126822.            553
    ##  6 Serbia                        218.             120703.            553
    ##  7 Sweden                        213.             120123.            565
    ##  8 United Kingdom                212.             120775.            569
    ##  9 Netherlands                   212.             119544.            565
    ## 10 Belgium                       208.             118162.            568
    ## 11 Switzerland                   192.             109050.            569
    ## 12 Brazil                        189.             105653.            559
    ## 13 Colombia                      187.             103445.            554
    ## 14 Spain                         186.             106241.            570
    ## 15 France                        183.             104376.            571
    ## 16 Portugal                      178.              99665.            559
    ## 17 Chile                         177.              98442.            556
    ## 18 Turkey                        161.              89101.            554
    ## 19 Austria                       157.              88381.            563
    ## 20 Hungary                       149.              82102.            552

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1658     8789
    ##  2 Peru                 9.18     199060  2168431
    ##  3 Mexico               7.60     272580  3585565
    ##  4 Sudan                7.45       2835    38077
    ##  5 Syria                6.87       2158    31426
    ##  6 Ecuador              6.44      32661   507020
    ##  7 Egypt                5.70      17043   298988
    ##  8 Somalia              5.61       1079    19234
    ##  9 Afghanistan          4.65       7199   154800
    ## 10 China                4.58       5690   124283
    ## 11 Bulgaria             4.15      20251   487588
    ## 12 Myanmar              3.83      17343   453407
    ## 13 Bolivia              3.75      18672   497676
    ## 14 Malawi               3.69       2264    61382
    ## 15 Hungary              3.68      30145   819547
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.62        545    15075
    ## 18 Zimbabwe             3.56       4569   128186
    ## 19 Paraguay             3.51      16136   459695
    ## 20 Tunisia              3.51      24654   702503

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6656.     199060   29.9 
    ##  2 Hungary                3020.      30145    9.98
    ##  3 Brazil                 2941.     591440  201.  
    ##  4 Czech Republic         2906.      30448   10.5 
    ##  5 Bulgaria               2833.      20251    7.15
    ##  6 Argentina              2771.     114579   41.3 
    ##  7 Colombia               2636.     125962   47.8 
    ##  8 Paraguay               2531.      16136    6.38
    ##  9 Belgium                2454.      25533   10.4 
    ## 10 Mexico                 2424.     272580  112.  
    ## 11 Tunisia                2328.      24654   10.6 
    ## 12 Slovakia               2308.      12592    5.46
    ## 13 Chile                  2232.      37379   16.7 
    ## 14 Ecuador                2208.      32661   14.8 
    ## 15 United Kingdom         2175.     135621   62.3 
    ## 16 United States          2172.     673728  310.  
    ## 17 Italy                  2163.     130488   60.3 
    ## 18 Poland                 1962       75537   38.5 
    ## 19 Bolivia                1877.      18672    9.95
    ## 20 Spain                  1851.      86085   46.5

EOL
