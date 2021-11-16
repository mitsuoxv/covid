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

Updated: 2021-11-17

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
    ##  1 United States           71859. 46780515            651
    ##  2 India                   56301. 34456401            612
    ##  3 Brazil                  35820. 21957967            613
    ##  4 United Kingdom          15410.  9600373            623
    ##  5 Russia                  15042.  9145912            608
    ##  6 Turkey                  13868.  8432018            608
    ##  7 France                  11303.  7064362            625
    ##  8 Iran                     9595.  6045212            630
    ##  9 Argentina                8741.  5305742            607
    ## 10 Colombia                 8276.  5031945            608
    ## 11 Germany                  8110.  5077124            626
    ## 12 Spain                    8104.  5056954            624
    ## 13 Italy                    7698.  4865260            632
    ## 14 Indonesia                6947.  4251423            612
    ## 15 Mexico                   6263.  3845733            614
    ## 16 Ukraine                  5390.  3244749            602
    ## 17 Poland                   5279.  3230634            612
    ## 18 South Africa             4812.  2926075            608
    ## 19 Philippines              4605.  2818511            612
    ## 20 Malaysia                 4135.  2551452            617

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                297.             182095.            614
    ##  2 Israel                        296.             181927.            614
    ##  3 Serbia                        272.             165374.            607
    ##  4 United Kingdom                247.             153979.            623
    ##  5 Belgium                       234.             145388.            622
    ##  6 United States                 232.             150792.            651
    ##  7 Jordan                        231.             139777.            604
    ##  8 Netherlands                   225.             139039.            619
    ##  9 Argentina                     211.             128334.            607
    ## 10 Sweden                        200.             123743.            619
    ## 11 Switzerland                   194.             120671.            623
    ## 12 Austria                       191.             118148.            617
    ## 13 Turkey                        178.             108375.            608
    ## 14 Brazil                        178.             109187.            613
    ## 15 France                        175.             109071.            625
    ## 16 Spain                         174.             108738.            624
    ## 17 Colombia                      173.             105293.            608
    ## 18 Slovakia                      172.             104467.            608
    ## 19 Portugal                      169.             103827.            613
    ## 20 Chile                         169.             103232.            610

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1926     9936
    ##  2 Peru                 9.06     200635  2214543
    ##  3 Mexico               7.57     291147  3845733
    ##  4 Sudan                7.43       3069    41309
    ##  5 Ecuador              6.34      33088   521792
    ##  6 Syria                5.76       2672    46421
    ##  7 Somalia              5.75       1313    22837
    ##  8 Egypt                5.67      19567   344907
    ##  9 Afghanistan          4.66       7294   156610
    ## 10 China                4.48       5697   127297
    ## 11 Bulgaria             4.03      26555   658870
    ## 12 Malawi               3.72       2302    61845
    ## 13 Myanmar              3.69      18946   513962
    ## 14 Bolivia              3.63      19017   523485
    ## 15 Tunisia              3.54      25315   715716
    ## 16 Paraguay             3.54      16337   461957
    ## 17 Mali                 3.53        588    16680
    ## 18 Zimbabwe             3.52       4697   133471
    ## 19 Niger                3.46        232     6703
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6709.     200635   29.9 
    ##  2 Bulgaria               3715.      26555    7.15
    ##  3 Hungary                3239.      32336    9.98
    ##  4 Brazil                 3040.     611283  201.  
    ##  5 Czech Republic         3020.      31636   10.5 
    ##  6 Argentina              2811.     116232   41.3 
    ##  7 Colombia               2674.     127809   47.8 
    ##  8 Mexico                 2589.     291147  112.  
    ##  9 Paraguay               2562.      16337    6.38
    ## 10 Belgium                2538.      26403   10.4 
    ## 11 Slovakia               2501.      13644    5.46
    ## 12 United States          2439.     756664  310.  
    ## 13 Romania                2426.      53264   22.0 
    ## 14 Tunisia                2391.      25315   10.6 
    ## 15 United Kingdom         2293.     142945   62.3 
    ## 16 Chile                  2269.      38001   16.7 
    ## 17 Ecuador                2237.      33088   14.8 
    ## 18 Italy                  2201.     132819   60.3 
    ## 19 Poland                 2056.      79161   38.5 
    ## 20 Bolivia                1912.      19017    9.95

EOL
