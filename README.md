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

Updated: 2021-11-20

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
    ##  1 United States           75129. 47030792            626
    ##  2 India                   56081. 34489623            615
    ##  3 Brazil                  35678. 21977661            616
    ##  4 United Kingdom          15530.  9721920            626
    ##  5 Russia                  15150.  9257068            611
    ##  6 Turkey                  13917.  8503220            611
    ##  7 France                  11342.  7122737            628
    ##  8 Iran                     9570.  6057893            633
    ##  9 Argentina                8705.  5310334            610
    ## 10 Germany                  8344.  5248291            629
    ## 11 Colombia                 8246.  5038544            611
    ## 12 Spain                    8092.  5074027            627
    ## 13 Italy                    7707.  4893887            635
    ## 14 Indonesia                6915.  4252705            615
    ## 15 Mexico                   6241.  3851079            617
    ## 16 Ukraine                  5461.  3304058            605
    ## 17 Poland                   5371.  3303046            615
    ## 18 South Africa             4791.  2927499            611
    ## 19 Philippines              4588.  2821753            615
    ## 20 Malaysia                 4144.  2569533            620

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                303.             186886.            617
    ##  2 Israel                        295.             182135.            617
    ##  3 Serbia                        273.             166817.            610
    ##  4 United Kingdom                249.             155929.            626
    ##  5 United States                 242.             151598.            626
    ##  6 Belgium                       240.             149957.            625
    ##  7 Jordan                        232.             140781.            607
    ##  8 Netherlands                   230.             142915.            622
    ##  9 Argentina                     211.             128445.            610
    ## 10 Sweden                        200.             124280.            622
    ## 11 Austria                       199.             123215.            620
    ## 12 Switzerland                   196.             122796.            626
    ## 13 Turkey                        179.             109290.            611
    ## 14 Slovakia                      178.             108752.            611
    ## 15 Brazil                        177.             109285.            616
    ## 16 France                        175.             109972.            628
    ## 17 Spain                         174.             109105.            627
    ## 18 Colombia                      173.             105431.            611
    ## 19 Portugal                      170.             104447.            616
    ## 20 Chile                         169.             103615.            613

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1934     9950
    ##  2 Peru                 9.05     200741  2218202
    ##  3 Mexico               7.57     291573  3851079
    ##  4 Sudan                7.43       3087    41558
    ##  5 Ecuador              6.34      33088   521792
    ##  6 Somalia              5.75       1313    22837
    ##  7 Syria                5.74       2682    46703
    ##  8 Egypt                5.68      19707   346808
    ##  9 Afghanistan          4.69       7361   156786
    ## 10 China                4.47       5697   127405
    ## 11 Bulgaria             4.04      26985   668363
    ## 12 Malawi               3.72       2303    61858
    ## 13 Myanmar              3.68      18989   516146
    ## 14 Bolivia              3.62      19043   526306
    ## 15 Tunisia              3.54      25325   715911
    ## 16 Paraguay             3.54      16343   462109
    ## 17 Zimbabwe             3.52       4699   133593
    ## 18 Mali                 3.51        589    16797
    ## 19 Niger                3.50        237     6773
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6712.     200741   29.9 
    ##  2 Bulgaria               3775.      26985    7.15
    ##  3 Hungary                3284.      32780    9.98
    ##  4 Czech Republic         3043.      31879   10.5 
    ##  5 Brazil                 3042.     611851  201.  
    ##  6 Argentina              2813.     116313   41.3 
    ##  7 Colombia               2677.     127912   47.8 
    ##  8 Mexico                 2592.     291573  112.  
    ##  9 Paraguay               2563.      16343    6.38
    ## 10 Belgium                2550.      26526   10.4 
    ## 11 Slovakia               2526.      13781    5.46
    ## 12 Romania                2475.      54343   22.0 
    ## 13 United States          2448.     759388  310.  
    ## 14 Tunisia                2392.      25325   10.6 
    ## 15 United Kingdom         2303.     143559   62.3 
    ## 16 Chile                  2272.      38049   16.7 
    ## 17 Ecuador                2237.      33088   14.8 
    ## 18 Italy                  2205.     133034   60.3 
    ## 19 Poland                 2088.      80399   38.5 
    ## 20 Bolivia                1914.      19043    9.95

EOL
