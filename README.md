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

Updated: 2021-08-12

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
    ##  1 United States           66961. 35824366            535
    ##  2 India                   62207. 32036511            515
    ##  3 Brazil                  39104. 20177757            516
    ##  4 Russia                  12745.  6512859            511
    ##  5 France                  11715.  6185843            528
    ##  6 Turkey                  11680.  5968868            511
    ##  7 United Kingdom          11630.  6117544            526
    ##  8 Argentina                9861.  5029075            510
    ##  9 Colombia                 9477.  4843007            511
    ## 10 Spain                    8811.  4643450            527
    ## 11 Italy                    8236.  4406241            535
    ## 12 Iran                     7952.  4238676            533
    ## 13 Indonesia                7280.  3749446            515
    ## 14 Germany                  7182.  3799425            529
    ## 15 Mexico                   5828.  2978330            511
    ## 16 Poland                   5601.  2884557            515
    ## 17 South Africa             4984.  2546762            511
    ## 18 Ukraine                  4478.  2261354            505
    ## 19 Peru                     4152.  2125848            512
    ## 20 Netherlands              3620.  1889992            522

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                309.             159932.            517
    ##  2 Israel                        240.             124341.            518
    ##  3 Jordan                        240.             121587.            507
    ##  4 Argentina                     239.             121642.            510
    ##  5 Sweden                        222.             115826.            522
    ##  6 Netherlands                   218.             113547.            522
    ##  7 United States                 216.             115476.            535
    ##  8 Belgium                       209.             109884.            525
    ##  9 Colombia                      198.             101339.            511
    ## 10 Brazil                        194.             100335.            516
    ## 11 Serbia                        194.              99014.            510
    ## 12 Spain                         189.              99846.            527
    ## 13 Chile                         189.              97025.            513
    ## 14 United Kingdom                187.              98119.            526
    ## 15 Switzerland                   182.              95741.            526
    ## 16 France                        181.              95507.            528
    ## 17 Portugal                      180.              92759.            516
    ## 18 Hungary                       159.              81159.            509
    ## 19 Austria                       154.              80399.            521
    ## 20 Turkey                        150.              76717.            511

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1391     7198
    ##  2 Peru                 9.27     197029  2125848
    ##  3 Mexico               8.22     244690  2978330
    ##  4 Sudan                7.41       2780    37528
    ##  5 Syria                7.36       1924    26136
    ##  6 Ecuador              6.46      31788   491831
    ##  7 Egypt                5.82      16588   284875
    ##  8 Somalia              5.38        863    16039
    ##  9 China                4.64       5662   121960
    ## 10 Afghanistan          4.61       6978   151291
    ## 11 Bulgaria             4.26      18288   429628
    ## 12 Bolivia              3.76      18004   478671
    ## 13 Hungary              3.71      30037   810126
    ## 14 Tanzania             3.66         50     1367
    ## 15 Myanmar              3.65      12452   341300
    ## 16 Mali                 3.64        534    14653
    ## 17 Chad                 3.49        174     4981
    ## 18 Tunisia              3.44      21220   616764
    ## 19 Niger                3.44        196     5697
    ## 20 Zimbabwe             3.37       3950   117258

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6588.     197029   29.9 
    ##  2 Hungary                3009.      30037    9.98
    ##  3 Czech Republic         2899.      30371   10.5 
    ##  4 Brazil                 2802.     563562  201.  
    ##  5 Argentina              2611.     107961   41.3 
    ##  6 Colombia               2565.     122601   47.8 
    ##  7 Bulgaria               2558.      18288    7.15
    ##  8 Belgium                2430.      25279   10.4 
    ##  9 Paraguay               2402.      15315    6.38
    ## 10 Slovakia               2300.      12544    5.46
    ## 11 Mexico                 2176.     244690  112.  
    ## 12 Chile                  2158.      36138   16.7 
    ## 13 Ecuador                2149.      31788   14.8 
    ## 14 Italy                  2126.     128273   60.3 
    ## 15 United Kingdom         2093.     130503   62.3 
    ## 16 Tunisia                2004.      21220   10.6 
    ## 17 United States          1976.     612973  310.  
    ## 18 Poland                 1956.      75289   38.5 
    ## 19 Bolivia                1810.      18004    9.95
    ## 20 Spain                  1768.      82227   46.5

EOL
