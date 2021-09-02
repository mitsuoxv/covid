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

Updated: 2021-09-03

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
    ##  1 United States           70182. 39091213            557
    ##  2 India                   61188. 32857937            537
    ##  3 Brazil                  38618. 20776870            538
    ##  4 Russia                  13051.  6956318            533
    ##  5 United Kingdom          12454.  6825078            548
    ##  6 Turkey                  12030.  6412277            533
    ##  7 France                  11982.  6590001            550
    ##  8 Argentina                9747.  5185620            532
    ##  9 Colombia                 9210.  4909086            533
    ## 10 Iran                     9054.  5025233            555
    ## 11 Spain                    8856.  4861883            549
    ## 12 Italy                    8162.  4546487            557
    ## 13 Indonesia                7635.  4100138            537
    ## 14 Germany                  7205.  3970102            551
    ## 15 Mexico                   6289.  3352410            533
    ## 16 Poland                   5380.  2889412            537
    ## 17 Ukraine                  4347.  2290848            527
    ## 18 Peru                     4026.  2150006            534
    ## 19 Philippines              3732.  2003955            537
    ## 20 Netherlands              3573.  1943882            544

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                297.             160342.            539
    ##  2 Israel                        274.             147794.            539
    ##  3 Argentina                     236.             125429.            532
    ##  4 Jordan                        235.             124564.            529
    ##  5 United States                 226.             126006.            557
    ##  6 Sweden                        217.             118034.            544
    ##  7 Netherlands                   215.             116785.            544
    ##  8 Belgium                       209.             114150.            547
    ##  9 United Kingdom                200.             109467.            548
    ## 10 Serbia                        196.             104329.            532
    ## 11 Colombia                      193.             102722.            533
    ## 12 Brazil                        192.             103314.            538
    ## 13 Spain                         190.             104543.            549
    ## 14 Switzerland                   188.             102820.            548
    ## 15 France                        185.             101747.            550
    ## 16 Chile                         183.              97879.            535
    ## 17 Portugal                      181.              97367.            538
    ## 18 Turkey                        155.              82416.            533
    ## 19 Austria                       154.              83570.            543
    ## 20 Hungary                       153.              81426.            531

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.7        1480     7900
    ##  2 Peru                 9.22     198295  2150006
    ##  3 Mexico               7.74     259326  3352410
    ##  4 Sudan                7.40       2791    37711
    ##  5 Syria                7.21       2013    27915
    ##  6 Ecuador              6.43      32244   501201
    ##  7 Egypt                5.80      16743   288732
    ##  8 Somalia              5.59        977    17466
    ##  9 Afghanistan          4.65       7127   153306
    ## 10 China                4.62       5684   123103
    ## 11 Bulgaria             4.14      18950   457487
    ## 12 Myanmar              3.85      15490   402640
    ## 13 Bolivia              3.76      18452   490879
    ## 14 Hungary              3.70      30060   812793
    ## 15 Tunisia              3.53      23538   666168
    ## 16 Paraguay             3.44      15767   458528
    ## 17 Indonesia            3.26     133676  4100138
    ## 18 Slovakia             3.17      12548   395300
    ## 19 Romania              3.14      34617  1101678
    ## 20 El Salvador          3.05       2926    96067

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6630.     198295   29.9 
    ##  2 Hungary                3011.      30060    9.98
    ##  3 Czech Republic         2902.      30404   10.5 
    ##  4 Brazil                 2886.     580413  201.  
    ##  5 Argentina              2704.     111812   41.3 
    ##  6 Bulgaria               2651.      18950    7.15
    ##  7 Colombia               2614.     124945   47.8 
    ##  8 Paraguay               2473.      15767    6.38
    ##  9 Belgium                2440.      25382   10.4 
    ## 10 Mexico                 2306.     259326  112.  
    ## 11 Slovakia               2300.      12548    5.46
    ## 12 Tunisia                2223.      23538   10.6 
    ## 13 Chile                  2206.      36945   16.7 
    ## 14 Ecuador                2180.      32244   14.8 
    ## 15 Italy                  2143.     129290   60.3 
    ## 16 United Kingdom         2129.     132742   62.3 
    ## 17 United States          2049.     635606  310.  
    ## 18 Poland                 1958.      75367   38.5 
    ## 19 Bolivia                1855.      18452    9.95
    ## 20 Spain                  1816.      84472   46.5

EOL
