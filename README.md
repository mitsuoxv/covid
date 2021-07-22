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

Updated: 2021-07-23

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

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           65777. 33875385            515
    ##  2 India                   63147. 31257720            495
    ##  3 Brazil                  39152. 19419437            496
    ##  4 Russia                  12331.  6054711            491
    ##  5 France                  11401.  5791689            508
    ##  6 Turkey                  11312.  5554317            491
    ##  7 United Kingdom          10994.  5563010            506
    ##  8 Argentina                9763.  4784219            490
    ##  9 Colombia                 9508.  4668750            491
    ## 10 Italy                    8344.  4297337            515
    ## 11 Spain                    8323.  4219723            507
    ## 12 Germany                  7368.  3750503            509
    ## 13 Iran                     7024.  3603527            513
    ## 14 Indonesia                6128.  3033339            495
    ## 15 Poland                   5822.  2881840            495
    ## 16 Mexico                   5455.  2678297            491
    ## 17 South Africa             4740.  2327472            491
    ## 18 Ukraine                  4632.  2246656            485
    ## 19 Peru                     4260.  2096013            492
    ## 20 Netherlands              3627.  1821040            502

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                321.             159597.            497
    ##  2 Jordan                        244.             119041.            487
    ##  3 Argentina                     236.             115720.            490
    ##  4 Israel                        234.             116435.            498
    ##  5 Sweden                        228.             114668.            502
    ##  6 Netherlands                   218.             109405.            502
    ##  7 United States                 212.             109193.            515
    ##  8 Belgium                       211.             106573.            505
    ##  9 Serbia                        200.              97924.            490
    ## 10 Colombia                      199.              97693.            491
    ## 11 Brazil                        195.              96564.            496
    ## 12 Chile                         194.              95713.            493
    ## 13 Switzerland                   184.              93371.            506
    ## 14 Spain                         179.              90735.            507
    ## 15 Portugal                      177.              88013.            496
    ## 16 United Kingdom                176.              89225.            506
    ## 17 France                        176.              89422.            508
    ## 18 Hungary                       166.              81047.            489
    ## 19 Austria                       158.              79258.            501
    ## 20 Poland                        151.              74853.            495

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1371     6997
    ##  2 Peru                 9.32     195332  2096013
    ##  3 Mexico               8.84     236810  2678297
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1905    25849
    ##  6 Ecuador              6.43      30744   477946
    ##  7 Egypt                5.80      16465   283862
    ##  8 Somalia              5.15        781    15162
    ##  9 China                4.69       5626   119918
    ## 10 Afghanistan          4.42       6325   143183
    ## 11 Bulgaria             4.30      18187   423319
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.77      17505   464177
    ## 14 Hungary              3.71      30020   809016
    ## 15 Mali                 3.65        530    14525
    ## 16 Chad                 3.50        174     4965
    ## 17 Niger                3.47        194     5594
    ## 18 Paraguay             3.23      14394   446267
    ## 19 Tunisia              3.22      17913   555997
    ## 20 Slovakia             3.20      12534   392219

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6531.     195332   29.9 
    ##  2 Hungary                3007.      30020    9.98
    ##  3 Czech Republic         2897.      30347   10.5 
    ##  4 Brazil                 2706.     544180  201.  
    ##  5 Bulgaria               2544.      18187    7.15
    ##  6 Argentina              2476.     102381   41.3 
    ##  7 Colombia               2451.     117131   47.8 
    ##  8 Belgium                2424.      25213   10.4 
    ##  9 Slovakia               2298.      12534    5.46
    ## 10 Paraguay               2258.      14394    6.38
    ## 11 Italy                  2120.     127905   60.3 
    ## 12 Mexico                 2106.     236810  112.  
    ## 13 Ecuador                2079.      30744   14.8 
    ## 14 United Kingdom         2067.     128896   62.3 
    ## 15 Chile                  2067.      34611   16.7 
    ## 16 Poland                 1954.      75231   38.5 
    ## 17 United States          1949.     604546  310.  
    ## 18 Bolivia                1760.      17505    9.95
    ## 19 Spain                  1745.      81166   46.5 
    ## 20 France                 1707.     110556   64.8

EOL
