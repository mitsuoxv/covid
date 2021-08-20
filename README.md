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

Updated: 2021-08-21

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
    ##  1 United States           68171. 37085214            544
    ##  2 India                   61753. 32358829            524
    ##  3 Brazil                  38967. 20457897            525
    ##  4 Russia                  12895.  6705523            520
    ##  5 United Kingdom          11948.  6392164            535
    ##  6 France                  11889.  6384773            537
    ##  7 Turkey                  11842.  6157772            520
    ##  8 Argentina                9838.  5106207            519
    ##  9 Colombia                 9379.  4877323            520
    ## 10 Spain                    8877.  4758003            536
    ## 11 Iran                     8464.  4587683            542
    ## 12 Italy                    8206.  4464005            544
    ## 13 Indonesia                7500.  3930300            524
    ## 14 Germany                  7162.  3853055            538
    ## 15 Mexico                   6062.  3152205            520
    ## 16 Poland                   5508.  2886291            524
    ## 17 South Africa             5101.  2652652            520
    ## 18 Ukraine                  4420.  2271826            514
    ## 19 Peru                     4102.  2137295            521
    ## 20 Netherlands              3600.  1911699            531

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                304.             160100.            526
    ##  2 Israel                        252.             132655.            527
    ##  3 Argentina                     238.             123508.            519
    ##  4 Jordan                        238.             122768.            516
    ##  5 Sweden                        220.             116741.            531
    ##  6 United States                 220.             119540.            544
    ##  7 Netherlands                   216.             114851.            531
    ##  8 Belgium                       209.             111656.            534
    ##  9 Colombia                      196.             102057.            520
    ## 10 Brazil                        194.             101728.            525
    ## 11 Serbia                        194.             100474.            519
    ## 12 United Kingdom                192.             102523.            535
    ## 13 Spain                         191.             102310.            536
    ## 14 Chile                         187.              97435.            522
    ## 15 Switzerland                   184.              98519.            535
    ## 16 France                        184.              98579.            537
    ## 17 Portugal                      181.              94804.            525
    ## 18 Hungary                       157.              81224.            518
    ## 19 Austria                       154.              81454.            530
    ## 20 Turkey                        152.              79145.            520

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.1        1414     7407
    ##  2 Peru                 9.25     197659  2137295
    ##  3 Mexico               7.95     250469  3152205
    ##  4 Sudan                7.40       2784    37620
    ##  5 Syria                7.33       1947    26554
    ##  6 Ecuador              6.46      31985   495115
    ##  7 Egypt                5.82      16638   285700
    ##  8 Somalia              5.42        897    16535
    ##  9 China                4.63       5674   122586
    ## 10 Afghanistan          4.63       7054   152448
    ## 11 Bulgaria             4.20      18438   438698
    ## 12 Myanmar              3.81      13945   365759
    ## 13 Bolivia              3.76      18236   484446
    ## 14 Hungary              3.71      30046   810781
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.63        535    14736
    ## 17 Tunisia              3.53      22304   632328
    ## 18 Chad                 3.49        174     4984
    ## 19 Zimbabwe             3.44       4198   121902
    ## 20 Malawi               3.43       2028    59048

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6609.     197659   29.9 
    ##  2 Hungary                3010.      30046    9.98
    ##  3 Czech Republic         2900.      30384   10.5 
    ##  4 Brazil                 2843.     571662  201.  
    ##  5 Argentina              2652.     109652   41.3 
    ##  6 Colombia               2590.     123781   47.8 
    ##  7 Bulgaria               2579.      18438    7.15
    ##  8 Belgium                2433.      25312   10.4 
    ##  9 Paraguay               2430.      15492    6.38
    ## 10 Slovakia               2300.      12547    5.46
    ## 11 Mexico                 2227.     250469  112.  
    ## 12 Chile                  2181.      36524   16.7 
    ## 13 Ecuador                2163.      31985   14.8 
    ## 14 Italy                  2132.     128634   60.3 
    ## 15 United Kingdom         2107.     131373   62.3 
    ## 16 Tunisia                2106.      22304   10.6 
    ## 17 United States          2000.     620355  310.  
    ## 18 Poland                 1956.      75315   38.5 
    ## 19 Bolivia                1833.      18236    9.95
    ## 20 Spain                  1785.      83004   46.5

EOL
