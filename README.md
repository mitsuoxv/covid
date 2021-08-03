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

Updated: 2021-08-04

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
    ##  1 United States           66056. 34811492            527
    ##  2 India                   62577. 31726507            507
    ##  3 Brazil                  39248. 19938358            508
    ##  4 Russia                  12593.  6334195            503
    ##  5 France                  11565.  6014002            520
    ##  6 Turkey                  11472.  5770833            503
    ##  7 United Kingdom          11394.  5902358            518
    ##  8 Argentina                9832.  4935847            502
    ##  9 Colombia                 9531.  4794414            503
    ## 10 Spain                    8676.  4502983            519
    ## 11 Italy                    8270.  4358533            527
    ## 12 Iran                     7506.  3940708            525
    ## 13 Germany                  7243.  3773875            521
    ## 14 Indonesia                6897.  3496700            507
    ## 15 Poland                   5687.  2883284            507
    ## 16 Mexico                   5676.  2854992            503
    ## 17 South Africa             4894.  2461758            503
    ## 18 Ukraine                  4536.  2254361            497
    ## 19 Peru                     4193.  2113201            504
    ## 20 Netherlands              3638.  1869909            514

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                314.             159787.            509
    ##  2 Jordan                        242.             120608.            499
    ##  3 Argentina                     238.             119387.            502
    ##  4 Israel                        235.             119889.            510
    ##  5 Sweden                        224.             115116.            514
    ##  6 Netherlands                   219.             112341.            514
    ##  7 United States                 213.             112211.            527
    ##  8 Belgium                       210.             108528.            517
    ##  9 Colombia                      199.             100323.            503
    ## 10 Serbia                        196.              98383.            502
    ## 11 Brazil                        195.              99145.            508
    ## 12 Chile                         191.              96608.            505
    ## 13 Spain                         187.              96826.            519
    ## 14 United Kingdom                183.              94667.            518
    ## 15 Switzerland                   182.              94512.            518
    ## 16 Portugal                      179.              91057.            508
    ## 17 France                        179.              92854.            520
    ## 18 Hungary                       162.              81113.            501
    ## 19 Austria                       156.              79888.            513
    ## 20 Poland                        148.              74890.            507

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1378     7081
    ##  2 Peru                 9.30     196438  2113201
    ##  3 Mexico               8.44     241034  2854992
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1917    26005
    ##  6 Ecuador              6.49      31634   487598
    ##  7 Egypt                5.81      16535   284362
    ##  8 Somalia              5.28        819    15497
    ##  9 China                4.66       5637   120944
    ## 10 Afghanistan          4.58       6804   148572
    ## 11 Bulgaria             4.28      18222   425541
    ## 12 Bolivia              3.76      17839   473899
    ## 13 Hungary              3.71      30029   809672
    ## 14 Mali                 3.66        534    14590
    ## 15 Chad                 3.50        174     4973
    ## 16 Niger                3.47        196     5653
    ## 17 Tunisia              3.39      20226   596775
    ## 18 Myanmar              3.33      10373   311067
    ## 19 Paraguay             3.32      15042   452698
    ## 20 Zimbabwe             3.28       3635   110855

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6568.     196438   29.9 
    ##  2 Hungary                3008.      30029    9.98
    ##  3 Czech Republic         2900.      30378   10.5 
    ##  4 Brazil                 2769.     556834  201.  
    ##  5 Argentina              2558.     105772   41.3 
    ##  6 Bulgaria               2549.      18222    7.15
    ##  7 Colombia               2532.     120998   47.8 
    ##  8 Belgium                2427.      25247   10.4 
    ##  9 Paraguay               2359.      15042    6.38
    ## 10 Slovakia               2299.      12541    5.46
    ## 11 Mexico                 2143.     241034  112.  
    ## 12 Ecuador                2139.      31634   14.8 
    ## 13 Chile                  2127.      35616   16.7 
    ## 14 Italy                  2123.     128088   60.3 
    ## 15 United Kingdom         2081.     129743   62.3 
    ## 16 United States          1961.     608288  310.  
    ## 17 Poland                 1955.      75265   38.5 
    ## 18 Tunisia                1910.      20226   10.6 
    ## 19 Bolivia                1793.      17839    9.95
    ## 20 Spain                  1756.      81643   46.5

EOL
