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

Updated: 2021-08-10

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
    ##  1 United States           66607. 35501444            533
    ##  2 India                   62319. 31969954            513
    ##  3 Brazil                  39206. 20151779            514
    ##  4 Russia                  12711.  6469910            509
    ##  5 France                  11701.  6154798            526
    ##  6 United Kingdom          11583.  6069366            524
    ##  7 Turkey                  11580.  5894583            509
    ##  8 Argentina                9867.  5012754            508
    ##  9 Colombia                 9498.  4834634            509
    ## 10 Spain                    8698.  4566571            525
    ## 11 Italy                    8248.  4396417            533
    ## 12 Iran                     7832.  4158729            531
    ## 13 Germany                  7195.  3791949            527
    ## 14 Indonesia                7186.  3686740            513
    ## 15 Mexico                   5823.  2964244            509
    ## 16 Poland                   5622.  2884162            513
    ## 17 South Africa             4977.  2533466            509
    ## 18 Ukraine                  4492.  2259451            503
    ## 19 Peru                     4165.  2124128            510
    ## 20 Netherlands              3626.  1885805            520

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                310.             159890.            515
    ##  2 Jordan                        240.             121298.            505
    ##  3 Argentina                     239.             121247.            508
    ##  4 Israel                        238.             122675.            516
    ##  5 Sweden                        222.             115587.            520
    ##  6 Netherlands                   218.             113296.            520
    ##  7 United States                 215.             114435.            533
    ##  8 Belgium                       209.             109269.            523
    ##  9 Colombia                      199.             101164.            509
    ## 10 Brazil                        195.             100206.            514
    ## 11 Serbia                        194.              98804.            508
    ## 12 Chile                         190.              96938.            511
    ## 13 Spain                         187.              98193.            525
    ## 14 United Kingdom                186.              97346.            524
    ## 15 Switzerland                   181.              95075.            524
    ## 16 France                        181.              95028.            526
    ## 17 Portugal                      180.              92447.            514
    ## 18 Hungary                       160.              81147.            507
    ## 19 Austria                       155.              80286.            519
    ## 20 Turkey                        149.              75762.            509

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1386     7139
    ##  2 Peru                 9.27     196873  2124128
    ##  3 Mexico               8.24     244248  2964244
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.36       1920    26097
    ##  6 Ecuador              6.46      31788   491831
    ##  7 Egypt                5.82      16575   284706
    ##  8 Somalia              5.35        850    15875
    ##  9 China                4.65       5657   121684
    ## 10 Afghanistan          4.60       6936   150778
    ## 11 Bulgaria             4.26      18255   428049
    ## 12 Bolivia              3.76      17971   477696
    ## 13 Hungary              3.71      30037   810011
    ## 14 Mali                 3.65        534    14643
    ## 15 Myanmar              3.61      12014   333127
    ## 16 Chad                 3.50        174     4978
    ## 17 Niger                3.45        196     5682
    ## 18 Tunisia              3.43      20931   610660
    ## 19 Paraguay             3.36      15268   454865
    ## 20 Zimbabwe             3.35       3900   116322

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6583.     196873   29.9 
    ##  2 Hungary                3009.      30037    9.98
    ##  3 Czech Republic         2898.      30363   10.5 
    ##  4 Brazil                 2798.     562752  201.  
    ##  5 Argentina              2595.     107302   41.3 
    ##  6 Colombia               2559.     122277   47.8 
    ##  7 Bulgaria               2554.      18255    7.15
    ##  8 Belgium                2429.      25268   10.4 
    ##  9 Paraguay               2395.      15268    6.38
    ## 10 Slovakia               2299.      12541    5.46
    ## 11 Mexico                 2172.     244248  112.  
    ## 12 Chile                  2151.      36016   16.7 
    ## 13 Ecuador                2149.      31788   14.8 
    ## 14 Italy                  2125.     128220   60.3 
    ## 15 United Kingdom         2090.     130320   62.3 
    ## 16 Tunisia                1977.      20931   10.6 
    ## 17 United States          1971.     611504  310.  
    ## 18 Poland                 1955.      75285   38.5 
    ## 19 Bolivia                1807.      17971    9.95
    ## 20 Spain                  1762.      81931   46.5

EOL
