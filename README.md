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

Updated: 2021-08-05

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
    ##  1 United States           66307. 35010407            528
    ##  2 India                   62537. 31769132            508
    ##  3 Brazil                  39201. 19953501            509
    ##  4 Russia                  12612.  6356784            504
    ##  5 France                  11592.  6039483            521
    ##  6 Turkey                  11499.  5795665            504
    ##  7 United Kingdom          11414.  5923824            519
    ##  8 Argentina                9835.  4947030            503
    ##  9 Colombia                 9526.  4801050            504
    ## 10 Spain                    8698.  4523310            520
    ## 11 Italy                    8264.  4363374            528
    ## 12 Iran                     7566.  3979727            526
    ## 13 Germany                  7236.  3777446            522
    ## 14 Indonesia                6954.  3532567            508
    ## 15 Mexico                   5677.  2861498            504
    ## 16 Poland                   5676.  2883448            508
    ## 17 South Africa             4902.  2470746            504
    ## 18 Ukraine                  4529.  2255345            498
    ## 19 Peru                     4187.  2114445            505
    ## 20 Netherlands              3635.  1872093            515

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                313.             159811.            510
    ##  2 Jordan                        241.             120750.            500
    ##  3 Argentina                     238.             119658.            503
    ##  4 Israel                        235.             120334.            511
    ##  5 Sweden                        224.             115311.            515
    ##  6 Netherlands                   218.             112472.            515
    ##  7 United States                 214.             112852.            528
    ##  8 Belgium                       210.             108695.            518
    ##  9 Colombia                      199.             100461.            504
    ## 10 Serbia                        196.              98441.            503
    ## 11 Brazil                        195.              99220.            509
    ## 12 Chile                         191.              96645.            506
    ## 13 Spain                         187.              97263.            520
    ## 14 United Kingdom                183.              95012.            519
    ## 15 Switzerland                   182.              94651.            519
    ## 16 Portugal                      179.              91252.            509
    ## 17 France                        179.              93247.            521
    ## 18 Hungary                       162.              81119.            502
    ## 19 Austria                       155.              79933.            514
    ## 20 Turkey                        148.              74490.            504

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1380     7086
    ##  2 Peru                 9.29     196518  2114445
    ##  3 Mexico               8.43     241279  2861498
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1918    26026
    ##  6 Ecuador              6.49      31644   487702
    ##  7 Egypt                5.82      16540   284415
    ##  8 Somalia              5.31        828    15594
    ##  9 China                4.66       5639   121067
    ## 10 Afghanistan          4.59       6836   148933
    ## 11 Bulgaria             4.28      18225   426003
    ## 12 Bolivia              3.76      17859   474538
    ## 13 Hungary              3.71      30032   809731
    ## 14 Mali                 3.66        534    14596
    ## 15 Chad                 3.50        174     4973
    ## 16 Niger                3.46        196     5658
    ## 17 Myanmar              3.39      10695   315118
    ## 18 Tunisia              3.39      20226   596775
    ## 19 Paraguay             3.33      15086   453031
    ## 20 Zimbabwe             3.27       3676   112435

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6571.     196518   29.9 
    ##  2 Hungary                3009.      30032    9.98
    ##  3 Czech Republic         2899.      30372   10.5 
    ##  4 Brazil                 2771.     557223  201.  
    ##  5 Argentina              2565.     106045   41.3 
    ##  6 Bulgaria               2549.      18225    7.15
    ##  7 Colombia               2536.     121216   47.8 
    ##  8 Belgium                2427.      25251   10.4 
    ##  9 Paraguay               2366.      15086    6.38
    ## 10 Slovakia               2299.      12541    5.46
    ## 11 Mexico                 2145.     241279  112.  
    ## 12 Ecuador                2139.      31644   14.8 
    ## 13 Chile                  2128.      35640   16.7 
    ## 14 Italy                  2123.     128115   60.3 
    ## 15 United Kingdom         2083.     129881   62.3 
    ## 16 United States          1963.     609022  310.  
    ## 17 Poland                 1955.      75269   38.5 
    ## 18 Tunisia                1910.      20226   10.6 
    ## 19 Bolivia                1795.      17859    9.95
    ## 20 Spain                  1758.      81773   46.5

EOL
