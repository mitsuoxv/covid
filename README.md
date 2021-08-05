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

Updated: 2021-08-06

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
    ##  1 United States           66399. 35125227            529
    ##  2 India                   62499. 31812114            509
    ##  3 Brazil                  39188. 19985817            510
    ##  4 Russia                  12633.  6379904            505
    ##  5 France                  11625.  6068252            522
    ##  6 Turkey                  11529.  5822487            505
    ##  7 United Kingdom          11447.  5952760            520
    ##  8 Argentina                9845.  4961880            504
    ##  9 Colombia                 9521.  4807979            505
    ## 10 Spain                    8724.  4545184            521
    ## 11 Italy                    8261.  4369964            529
    ## 12 Iran                     7626.  4019084            527
    ## 13 Germany                  7229.  3780985            523
    ## 14 Indonesia                7010.  3568331            509
    ## 15 Mexico                   5704.  2880409            505
    ## 16 Poland                   5665.  2883624            509
    ## 17 South Africa             4919.  2484009            505
    ## 18 Ukraine                  4522.  2256397            499
    ## 19 Peru                     4183.  2116652            506
    ## 20 Netherlands              3633.  1874856            516

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                313.             159833.            511
    ##  2 Jordan                        241.             120890.            501
    ##  3 Argentina                     238.             120017.            504
    ##  4 Israel                        236.             120685.            512
    ##  5 Sweden                        224.             115408.            516
    ##  6 Netherlands                   218.             112638.            516
    ##  7 United States                 214.             113222.            529
    ##  8 Belgium                       210.             108905.            519
    ##  9 Colombia                      199.             100606.            505
    ## 10 Serbia                        195.              98507.            504
    ## 11 Brazil                        195.              99381.            510
    ## 12 Chile                         191.              96688.            507
    ## 13 Spain                         188.              97733.            521
    ## 14 United Kingdom                184.              95476.            520
    ## 15 Switzerland                   182.              94787.            520
    ## 16 Portugal                      179.              91552.            510
    ## 17 France                        179.              93692.            522
    ## 18 Hungary                       161.              81126.            503
    ## 19 Austria                       155.              80006.            515
    ## 20 Turkey                        148.              74835.            505

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1380     7096
    ##  2 Peru                 9.29     196598  2116652
    ##  3 Mexico               8.40     241936  2880409
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1919    26044
    ##  6 Ecuador              6.48      31694   489089
    ##  7 Egypt                5.82      16550   284472
    ##  8 Somalia              5.31        832    15658
    ##  9 China                4.65       5639   121175
    ## 10 Afghanistan          4.60       6864   149361
    ## 11 Bulgaria             4.27      18229   426432
    ## 12 Bolivia              3.76      17882   475265
    ## 13 Hungary              3.71      30032   809803
    ## 14 Mali                 3.66        534    14606
    ## 15 Chad                 3.50        174     4974
    ## 16 Niger                3.46        196     5663
    ## 17 Myanmar              3.44      10988   319250
    ## 18 Tunisia              3.41      20550   602757
    ## 19 Paraguay             3.34      15135   453367
    ## 20 Zimbabwe             3.27       3676   112435

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6574.     196598   29.9 
    ##  2 Hungary                3009.      30032    9.98
    ##  3 Czech Republic         2899.      30372   10.5 
    ##  4 Brazil                 2777.     558432  201.  
    ##  5 Argentina              2575.     106447   41.3 
    ##  6 Bulgaria               2550.      18229    7.15
    ##  7 Colombia               2542.     121484   47.8 
    ##  8 Belgium                2428.      25258   10.4 
    ##  9 Paraguay               2374.      15135    6.38
    ## 10 Slovakia               2299.      12541    5.46
    ## 11 Mexico                 2151.     241936  112.  
    ## 12 Ecuador                2143.      31694   14.8 
    ## 13 Chile                  2130.      35671   16.7 
    ## 14 Italy                  2124.     128136   60.3 
    ## 15 United Kingdom         2085.     130000   62.3 
    ## 16 United States          1965.     609613  310.  
    ## 17 Poland                 1955.      75275   38.5 
    ## 18 Tunisia                1941.      20550   10.6 
    ## 19 Bolivia                1798.      17882    9.95
    ## 20 Spain                  1760.      81844   46.5

EOL
