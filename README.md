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

Updated: 2021-11-18

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
    ##  1 United States           75212. 46932468            624
    ##  2 India                   56226. 34466598            613
    ##  3 Brazil                  35767. 21960766            614
    ##  4 United Kingdom          15444.  9637194            624
    ##  5 Russia                  15078.  9182538            609
    ##  6 Turkey                  13887.  8457119            609
    ##  7 France                  11316.  7084061            626
    ##  8 Iran                     9590.  6051642            631
    ##  9 Argentina                8729.  5307159            608
    ## 10 Colombia                 8266.  5034266            609
    ## 11 Germany                  8182.  5129950            627
    ## 12 Spain                    8097.  5061046            625
    ## 13 Italy                    7698.  4873075            633
    ## 14 Indonesia                6936.  4251945            613
    ## 15 Mexico                   6254.  3846508            615
    ## 16 Ukraine                  5412.  3263417            603
    ## 17 Poland                   5310.  3254875            613
    ## 18 South Africa             4805.  2926348            609
    ## 19 Philippines              4599.  2819341            613
    ## 20 Malaysia                 4137.  2556865            618

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                300.             184251.            615
    ##  2 Israel                        296.             182000.            615
    ##  3 Serbia                        273.             165888.            608
    ##  4 United Kingdom                248.             154570.            624
    ##  5 United States                 242.             151281.            624
    ##  6 Belgium                       235.             146579.            623
    ##  7 Jordan                        232.             140264.            605
    ##  8 Netherlands                   226.             140251.            620
    ##  9 Argentina                     211.             128368.            608
    ## 10 Sweden                        200.             124017.            620
    ## 11 Switzerland                   194.             121230.            624
    ## 12 Austria                       193.             119425.            618
    ## 13 Turkey                        178.             108698.            609
    ## 14 Brazil                        178.             109201.            614
    ## 15 France                        175.             109375.            626
    ## 16 Spain                         174.             108826.            625
    ## 17 Slovakia                      174.             105996.            609
    ## 18 Colombia                      173.             105341.            609
    ## 19 Portugal                      169.             103986.            614
    ## 20 Chile                         169.             103332.            611

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1926     9936
    ##  2 Peru                 9.06     200672  2215373
    ##  3 Mexico               7.57     291204  3846508
    ##  4 Sudan                7.47       3087    41351
    ##  5 Ecuador              6.34      33088   521792
    ##  6 Somalia              5.75       1313    22837
    ##  7 Syria                5.75       2677    46564
    ##  8 Egypt                5.68      19636   345848
    ##  9 Afghanistan          4.66       7295   156649
    ## 10 China                4.47       5697   127331
    ## 11 Bulgaria             4.03      26676   662739
    ## 12 Malawi               3.72       2302    61846
    ## 13 Myanmar              3.68      18963   514716
    ## 14 Bolivia              3.63      19022   524261
    ## 15 Tunisia              3.54      25320   715818
    ## 16 Paraguay             3.54      16340   462003
    ## 17 Mali                 3.52        589    16717
    ## 18 Zimbabwe             3.52       4698   133505
    ## 19 Niger                3.49        235     6726
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6710.     200672   29.9 
    ##  2 Bulgaria               3732.      26676    7.15
    ##  3 Hungary                3257.      32514    9.98
    ##  4 Brazil                 3040.     611346  201.  
    ##  5 Czech Republic         3027.      31709   10.5 
    ##  6 Argentina              2812.     116250   41.3 
    ##  7 Colombia               2675.     127833   47.8 
    ##  8 Mexico                 2589.     291204  112.  
    ##  9 Paraguay               2563.      16340    6.38
    ## 10 Belgium                2542.      26444   10.4 
    ## 11 Slovakia               2509.      13687    5.46
    ## 12 Romania                2444.      53661   22.0 
    ## 13 United States          2443.     757821  310.  
    ## 14 Tunisia                2391.      25320   10.6 
    ## 15 United Kingdom         2296.     143159   62.3 
    ## 16 Chile                  2269.      38005   16.7 
    ## 17 Ecuador                2237.      33088   14.8 
    ## 18 Italy                  2202.     132893   60.3 
    ## 19 Poland                 2068.      79624   38.5 
    ## 20 Bolivia                1912.      19022    9.95

EOL
