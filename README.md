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

Updated: 2021-08-03

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
    ##  1 United States           66097. 34766907            526
    ##  2 India                   62640. 31695958            506
    ##  3 Brazil                  39285. 19917855            507
    ##  4 Russia                  12574.  6312185            502
    ##  5 France                  11584.  6012006            519
    ##  6 Turkey                  11450.  5747935            502
    ##  7 United Kingdom          11374.  5880671            517
    ##  8 Argentina                9840.  4929764            501
    ##  9 Colombia                 9532.  4785320            502
    ## 10 Spain                    8537.  4422291            518
    ## 11 Italy                    8280.  4355348            526
    ## 12 Iran                     7449.  3903519            524
    ## 13 Germany                  7254.  3772109            520
    ## 14 Indonesia                6843.  3462800            506
    ## 15 Poland                   5698.  2883120            506
    ## 16 Mexico                   5674.  2848252            502
    ## 17 South Africa             4892.  2456184            502
    ## 18 Ukraine                  4543.  2253534            496
    ## 19 Peru                     4197.  2111393            503
    ## 20 Netherlands              3641.  1867815            513

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                314.             159772.            508
    ##  2 Jordan                        242.             120453.            498
    ##  3 Argentina                     238.             119240.            501
    ##  4 Israel                        234.             119298.            509
    ##  5 Sweden                        224.             115116.            513
    ##  6 Netherlands                   219.             112215.            513
    ##  7 United States                 213.             112067.            526
    ##  8 Belgium                       210.             108114.            516
    ##  9 Colombia                      199.             100132.            502
    ## 10 Serbia                        196.              98330.            501
    ## 11 Brazil                        195.              99043.            507
    ## 12 Chile                         192.              96554.            504
    ## 13 Spain                         184.              95091.            518
    ## 14 United Kingdom                182.              94319.            517
    ## 15 Switzerland                   182.              94246.            517
    ## 16 Portugal                      180.              91057.            507
    ## 17 France                        179.              92823.            519
    ## 18 Hungary                       162.              81111.            500
    ## 19 Austria                       156.              79847.            512
    ## 20 Poland                        148.              74886.            506

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1377     7070
    ##  2 Peru                 9.30     196353  2111393
    ##  3 Mexico               8.46     240906  2848252
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1916    25983
    ##  6 Ecuador              6.49      31631   487372
    ##  7 Egypt                5.81      16528   284311
    ##  8 Somalia              5.26        813    15456
    ##  9 China                4.66       5637   120837
    ## 10 Afghanistan          4.58       6774   147985
    ## 11 Bulgaria             4.28      18215   425148
    ## 12 Bolivia              3.76      17821   473506
    ## 13 Hungary              3.71      30027   809646
    ## 14 Mali                 3.65        533    14588
    ## 15 Chad                 3.50        174     4973
    ## 16 Niger                3.47        195     5616
    ## 17 Tunisia              3.37      20067   595532
    ## 18 Paraguay             3.31      14981   452388
    ## 19 Myanmar              3.28      10061   306354
    ## 20 Zimbabwe             3.27       3583   109546

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6565.     196353   29.9 
    ##  2 Hungary                3008.      30027    9.98
    ##  3 Czech Republic         2899.      30374   10.5 
    ##  4 Brazil                 2767.     556370  201.  
    ##  5 Argentina              2557.     105721   41.3 
    ##  6 Bulgaria               2548.      18215    7.15
    ##  7 Colombia               2526.     120723   47.8 
    ##  8 Belgium                2426.      25241   10.4 
    ##  9 Paraguay               2350.      14981    6.38
    ## 10 Slovakia               2299.      12540    5.46
    ## 11 Mexico                 2142.     240906  112.  
    ## 12 Ecuador                2139.      31631   14.8 
    ## 13 Italy                  2122.     128068   60.3 
    ## 14 Chile                  2122.      35528   16.7 
    ## 15 United Kingdom         2081.     129719   62.3 
    ## 16 United States          1960.     608111  310.  
    ## 17 Poland                 1955.      75261   38.5 
    ## 18 Tunisia                1895.      20067   10.6 
    ## 19 Bolivia                1792.      17821    9.95
    ## 20 Spain                  1751.      81442   46.5

EOL
