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

Updated: 2021-09-25

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
    ##  1 United States           73058. 42300954            579
    ##  2 India                   60098. 33594803            559
    ##  3 Brazil                  38006. 21283567            560
    ##  4 Russia                  13290.  7376374            555
    ##  5 United Kingdom          13273.  7565871            570
    ##  6 Turkey                  12541.  6960297            555
    ##  7 France                  11828.  6765698            572
    ##  8 Iran                     9492.  5477229            577
    ##  9 Argentina                9468.  5245265            554
    ## 10 Colombia                 8910.  4945203            555
    ## 11 Spain                    8658.  4943855            571
    ## 12 Italy                    8031.  4649906            579
    ## 13 Indonesia                7521.  4204116            559
    ## 14 Germany                  7297.  4181393            573
    ## 15 Mexico                   6481.  3597168            555
    ## 16 South Africa             5211.  2892081            555
    ## 17 Poland                   5191.  2901674            559
    ## 18 Philippines              4355.  2434753            559
    ## 19 Ukraine                  4334.  2379483            549
    ## 20 Peru                     3902.  2169427            556

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        304.             170757.            561
    ##  2 Czech Republic                287.             161174.            561
    ##  3 United States                 235.             136352.            579
    ##  4 Jordan                        231.             127449.            551
    ##  5 Argentina                     229.             126871.            554
    ##  6 Serbia                        219.             121585.            554
    ##  7 United Kingdom                213.             121348.            570
    ##  8 Sweden                        212.             120202.            566
    ##  9 Netherlands                   211.             119653.            566
    ## 10 Belgium                       208.             118382.            569
    ## 11 Switzerland                   192.             109265.            570
    ## 12 Brazil                        189.             105834.            560
    ## 13 Colombia                      186.             103478.            555
    ## 14 Spain                         186.             106306.            571
    ## 15 France                        183.             104460.            572
    ## 16 Portugal                      178.              99748.            560
    ## 17 Chile                         177.              98493.            557
    ## 18 Turkey                        161.              89459.            555
    ## 19 Austria                       157.              88589.            564
    ## 20 Hungary                       149.              82156.            553

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1658     8789
    ##  2 Peru                 9.18     199108  2169427
    ##  3 Mexico               7.60     273391  3597168
    ##  4 Sudan                7.45       2835    38077
    ##  5 Syria                6.87       2158    31426
    ##  6 Ecuador              6.44      32661   507020
    ##  7 Egypt                5.70      17043   298988
    ##  8 Somalia              5.61       1079    19234
    ##  9 Afghanistan          4.65       7199   154960
    ## 10 China                4.58       5690   124348
    ## 11 Bulgaria             4.16      20350   489423
    ## 12 Myanmar              3.83      17413   455074
    ## 13 Bolivia              3.75      18681   497984
    ## 14 Malawi               3.69       2269    61453
    ## 15 Hungary              3.68      30151   820078
    ## 16 Mali                 3.62        547    15124
    ## 17 Zimbabwe             3.56       4600   129134
    ## 18 Paraguay             3.51      16138   459720
    ## 19 Tunisia              3.51      24654   702503
    ## 20 Chad                 3.46        174     5033

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6658.     199108   29.9 
    ##  2 Hungary                3021.      30151    9.98
    ##  3 Brazil                 2945.     592316  201.  
    ##  4 Czech Republic         2907.      30451   10.5 
    ##  5 Bulgaria               2847.      20350    7.15
    ##  6 Argentina              2774.     114684   41.3 
    ##  7 Colombia               2637.     126006   47.8 
    ##  8 Paraguay               2531.      16138    6.38
    ##  9 Belgium                2455.      25543   10.4 
    ## 10 Mexico                 2431.     273391  112.  
    ## 11 Tunisia                2328.      24654   10.6 
    ## 12 Slovakia               2309.      12594    5.46
    ## 13 Chile                  2234.      37410   16.7 
    ## 14 Ecuador                2208.      32661   14.8 
    ## 15 United States          2183.     677323  310.  
    ## 16 United Kingdom         2178.     135803   62.3 
    ## 17 Italy                  2164.     130551   60.3 
    ## 18 Poland                 1962.      75551   38.5 
    ## 19 Bolivia                1878.      18681    9.95
    ## 20 Spain                  1853.      86185   46.5

EOL
