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

Updated: 2021-07-30

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
    ##  1 United States           66042. 34473788            522
    ##  2 India                   62805. 31528114            502
    ##  3 Brazil                  39262. 19749073            503
    ##  4 Russia                  12440.  6195232            498
    ##  5 France                  11511.  5928194            515
    ##  6 Turkey                  11366.  5660469            498
    ##  7 United Kingdom          11249.  5770932            513
    ##  8 Argentina                9810.  4875927            497
    ##  9 Colombia                 9533.  4747775            498
    ## 10 Spain                    8552.  4395602            514
    ## 11 Italy                    8296.  4330739            522
    ## 12 Germany                  7295.  3764311            516
    ## 13 Iran                     7292.  3792014            520
    ## 14 Indonesia                6636.  3331206            502
    ## 15 Poland                   5742.  2882630            502
    ## 16 Mexico                   5566.  2771846            498
    ## 17 South Africa             4836.  2408525            498
    ## 18 Ukraine                  4575.  2250907            492
    ## 19 Peru                     4221.  2106371            499
    ## 20 Netherlands              3644.  1854784            509

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                317.             159719.            504
    ##  2 Jordan                        243.             119927.            494
    ##  3 Argentina                     237.             117938.            497
    ##  4 Israel                        234.             118037.            505
    ##  5 Sweden                        226.             114986.            509
    ##  6 Netherlands                   219.             111432.            509
    ##  7 United States                 213.             111122.            522
    ##  8 Belgium                       210.             107766.            512
    ##  9 Colombia                      199.              99347.            498
    ## 10 Serbia                        197.              98161.            497
    ## 11 Brazil                        195.              98204.            503
    ## 12 Chile                         192.              96254.            500
    ## 13 Spain                         184.              94517.            514
    ## 14 Switzerland                   183.              94139.            513
    ## 15 United Kingdom                180.              92559.            513
    ## 16 Portugal                      179.              89962.            503
    ## 17 France                        178.              91529.            515
    ## 18 Hungary                       163.              81089.            496
    ## 19 Austria                       157.              79597.            508
    ## 20 Poland                        149.              74874.            502

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1374     7027
    ##  2 Peru                 9.31     196058  2106371
    ##  3 Mexico               8.63     239079  2771846
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1911    25930
    ##  6 Ecuador              6.50      31454   483733
    ##  7 Egypt                5.81      16507   284128
    ##  8 Somalia              5.25        804    15323
    ##  9 China                4.68       5635   120469
    ## 10 Afghanistan          4.53       6615   145996
    ## 11 Bulgaria             4.29      18205   424295
    ## 12 Bolivia              3.77      17716   470024
    ## 13 Hungary              3.71      30025   809427
    ## 14 Mali                 3.65        531    14564
    ## 15 Chad                 3.50        174     4972
    ## 16 Niger                3.48        195     5607
    ## 17 Tunisia              3.29      19027   578962
    ## 18 Paraguay             3.28      14759   450494
    ## 19 Zimbabwe             3.22       3340   103567
    ## 20 Slovakia             3.19      12536   392537

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6556.     196058   29.9 
    ##  2 Hungary                3008.      30025    9.98
    ##  3 Czech Republic         2898.      30363   10.5 
    ##  4 Brazil                 2744.     551835  201.  
    ##  5 Bulgaria               2547.      18205    7.15
    ##  6 Argentina              2524.     104352   41.3 
    ##  7 Colombia               2500.     119482   47.8 
    ##  8 Belgium                2425.      25231   10.4 
    ##  9 Paraguay               2315.      14759    6.38
    ## 10 Slovakia               2298.      12536    5.46
    ## 11 Ecuador                2127.      31454   14.8 
    ## 12 Mexico                 2126.     239079  112.  
    ## 13 Italy                  2121.     128010   60.3 
    ## 14 Chile                  2100.      35176   16.7 
    ## 15 United Kingdom         2076.     129430   62.3 
    ## 16 United States          1956.     606686  310.  
    ## 17 Poland                 1955.      75257   38.5 
    ## 18 Tunisia                1797.      19027   10.6 
    ## 19 Bolivia                1781.      17716    9.95
    ## 20 Spain                  1750.      81396   46.5

EOL
