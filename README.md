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

Updated: 2021-07-29

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
    ##  1 United States           66010. 34391413            521
    ##  2 India                   62843. 31484605            501
    ##  3 Brazil                  39258. 19707662            502
    ##  4 Russia                  12465.  6195232            497
    ##  5 France                  11479.  5900396            514
    ##  6 Turkey                  11344.  5638178            497
    ##  7 United Kingdom          11222.  5745530            512
    ##  8 Argentina                9796.  4859170            496
    ##  9 Colombia                 9530.  4736349            497
    ## 10 Spain                    8515.  4368453            513
    ## 11 Italy                    8301.  4325046            521
    ## 12 Germany                  7303.  3761169            515
    ## 13 Iran                     7241.  3758197            519
    ## 14 Indonesia                6562.  3287727            501
    ## 15 Poland                   5753.  2882465            501
    ## 16 Mexico                   5542.  2754438            497
    ## 17 South Africa             4811.  2391223            497
    ## 18 Ukraine                  4582.  2250061            491
    ## 19 Peru                     4227.  2105005            498
    ## 20 Netherlands              3644.  1851329            508

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                317.             159700.            503
    ##  2 Jordan                        243.             119762.            493
    ##  3 Argentina                     237.             117533.            496
    ##  4 Israel                        234.             117743.            504
    ##  5 Sweden                        226.             114919.            508
    ##  6 Netherlands                   219.             111224.            508
    ##  7 United States                 213.             110857.            521
    ##  8 Belgium                       210.             107568.            511
    ##  9 Colombia                      199.              99108.            497
    ## 10 Serbia                        198.              98115.            496
    ## 11 Brazil                        195.              97998.            502
    ## 12 Chile                         193.              96205.            499
    ## 13 Switzerland                   183.              93930.            512
    ## 14 Spain                         183.              93933.            513
    ## 15 United Kingdom                180.              92152.            512
    ## 16 Portugal                      179.              89639.            502
    ## 17 France                        177.              91100.            514
    ## 18 Hungary                       164.              81082.            495
    ## 19 Austria                       157.              79533.            507
    ## 20 Poland                        149.              74869.            501

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1374     7022
    ##  2 Peru                 9.31     195973  2105005
    ##  3 Mexico               8.66     238595  2754438
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1909    25911
    ##  6 Ecuador              6.51      31426   482947
    ##  7 Egypt                5.81      16498   284090
    ##  8 Somalia              5.22        798    15294
    ##  9 China                4.68       5635   120399
    ## 10 Afghanistan          4.52       6577   145552
    ## 11 Bulgaria             4.29      18203   424079
    ## 12 Bolivia              3.77      17672   469182
    ## 13 Hungary              3.71      30025   809362
    ## 14 Mali                 3.65        531    14552
    ## 15 Chad                 3.50        174     4971
    ## 16 Niger                3.48        195     5604
    ## 17 Tanzania             3.45         21      609
    ## 18 Tunisia              3.29      19027   578962
    ## 19 Paraguay             3.27      14701   449902
    ## 20 Zimbabwe             3.22       3280   101711

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6553.     195973   29.9 
    ##  2 Hungary                3008.      30025    9.98
    ##  3 Czech Republic         2898.      30362   10.5 
    ##  4 Brazil                 2737.     550502  201.  
    ##  5 Bulgaria               2546.      18203    7.15
    ##  6 Argentina              2518.     104105   41.3 
    ##  7 Colombia               2494.     119182   47.8 
    ##  8 Belgium                2425.      25230   10.4 
    ##  9 Paraguay               2306.      14701    6.38
    ## 10 Slovakia               2298.      12534    5.46
    ## 11 Ecuador                2125.      31426   14.8 
    ## 12 Mexico                 2121.     238595  112.  
    ## 13 Italy                  2121.     127995   60.3 
    ## 14 Chile                  2099.      35151   16.7 
    ## 15 United Kingdom         2074.     129303   62.3 
    ## 16 Poland                 1955.      75252   38.5 
    ## 17 United States          1954.     606263  310.  
    ## 18 Tunisia                1797.      19027   10.6 
    ## 19 Bolivia                1777.      17672    9.95
    ## 20 Spain                  1749.      81323   46.5

EOL
