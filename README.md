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

Updated: 2021-08-07

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
    ##  1 United States           66470. 35229302            530
    ##  2 India                   62464. 31856757            510
    ##  3 Brazil                  39191. 20026533            511
    ##  4 Russia                  12653.  6402564            506
    ##  5 France                  11651.  6093653            523
    ##  6 Turkey                  11555.  5846784            506
    ##  7 United Kingdom          11483.  5982585            521
    ##  8 Argentina                9852.  4975616            505
    ##  9 Colombia                 9516.  4815063            506
    ## 10 Spain                    8748.  4566571            522
    ## 11 Italy                    8259.  4377188            530
    ## 12 Iran                     7685.  4057758            528
    ## 13 Germany                  7222.  3784433            524
    ## 14 Indonesia                7074.  3607863            510
    ## 15 Mexico                   5733.  2901094            506
    ## 16 Poland                   5654.  2883796            510
    ## 17 South Africa             4936.  2497655            506
    ## 18 Ukraine                  4515.  2257478            500
    ## 19 Peru                     4179.  2119068            507
    ## 20 Netherlands              3633.  1878214            517

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                312.             159849.            512
    ##  2 Jordan                        241.             120999.            502
    ##  3 Argentina                     238.             120349.            505
    ##  4 Israel                        236.             121269.            513
    ##  5 Sweden                        223.             115499.            517
    ##  6 Netherlands                   218.             112840.            517
    ##  7 United States                 214.             113558.            530
    ##  8 Belgium                       210.             109094.            520
    ##  9 Colombia                      199.             100755.            506
    ## 10 Serbia                        195.              98586.            505
    ## 11 Brazil                        195.              99583.            511
    ## 12 Chile                         190.              96760.            508
    ## 13 Spain                         188.              98193.            522
    ## 14 United Kingdom                184.              95954.            521
    ## 15 Switzerland                   182.              94922.            521
    ## 16 France                        180.              94084.            523
    ## 17 Portugal                      180.              91793.            511
    ## 18 Hungary                       161.              81132.            504
    ## 19 Austria                       155.              80065.            516
    ## 20 Turkey                        149.              75147.            506

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1383     7104
    ##  2 Peru                 9.28     196673  2119068
    ##  3 Mexico               8.36     242547  2901094
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1919    26044
    ##  6 Ecuador              6.48      31721   489497
    ##  7 Egypt                5.82      16550   284472
    ##  8 Somalia              5.32        837    15735
    ##  9 China                4.65       5639   121316
    ## 10 Afghanistan          4.59       6879   149810
    ## 11 Bulgaria             4.27      18243   426932
    ## 12 Bolivia              3.76      17910   476097
    ## 13 Hungary              3.71      30033   809855
    ## 14 Mali                 3.65        534    14616
    ## 15 Chad                 3.50        174     4976
    ## 16 Myanmar              3.49      11262   322838
    ## 17 Niger                3.46        196     5663
    ## 18 Tunisia              3.41      20550   602757
    ## 19 Paraguay             3.34      15172   453794
    ## 20 Zimbabwe             3.28       3754   114489

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6576.     196673   29.9 
    ##  2 Hungary                3009.      30033    9.98
    ##  3 Czech Republic         2899.      30367   10.5 
    ##  4 Brazil                 2783.     559607  201.  
    ##  5 Argentina              2582.     106747   41.3 
    ##  6 Bulgaria               2552.      18243    7.15
    ##  7 Colombia               2546.     121695   47.8 
    ##  8 Belgium                2429.      25264   10.4 
    ##  9 Paraguay               2380.      15172    6.38
    ## 10 Slovakia               2299.      12541    5.46
    ## 11 Mexico                 2157.     242547  112.  
    ## 12 Ecuador                2145.      31721   14.8 
    ## 13 Chile                  2138.      35806   16.7 
    ## 14 Italy                  2124.     128163   60.3 
    ## 15 United Kingdom         2086.     130086   62.3 
    ## 16 United States          1967.     610180  310.  
    ## 17 Poland                 1955.      75281   38.5 
    ## 18 Tunisia                1941.      20550   10.6 
    ## 19 Bolivia                1800.      17910    9.95
    ## 20 Spain                  1762.      81931   46.5

EOL
