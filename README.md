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

Updated: 2021-08-17

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
    ##  1 United States           67380. 36385257            540
    ##  2 India                   61972. 32225513            520
    ##  3 Brazil                  39060. 20350142            521
    ##  4 Russia                  12832.  6621601            516
    ##  5 France                  11841.  6311301            533
    ##  6 United Kingdom          11803.  6267441            531
    ##  7 Turkey                  11780.  6078653            516
    ##  8 Argentina                9866.  5080908            515
    ##  9 Colombia                 9427.  4864629            516
    ## 10 Spain                    8853.  4710009            532
    ## 11 Iran                     8226.  4425821            538
    ## 12 Italy                    8223.  4440669            540
    ## 13 Indonesia                7445.  3871738            520
    ## 14 Germany                  7159.  3823139            534
    ## 15 Mexico                   5992.  3091971            516
    ## 16 Poland                   5549.  2885461            520
    ## 17 South Africa             5049.  2605586            516
    ## 18 Ukraine                  4444.  2266329            510
    ## 19 Peru                     4125.  2132834            517
    ## 20 Netherlands              3609.  1901900            527

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                307.             160013.            522
    ##  2 Israel                        245.             128287.            523
    ##  3 Jordan                        239.             122278.            512
    ##  4 Argentina                     239.             122896.            515
    ##  5 Sweden                        220.             116174.            527
    ##  6 United States                 217.             117284.            540
    ##  7 Netherlands                   217.             114263.            527
    ##  8 Belgium                       209.             110532.            530
    ##  9 Colombia                      197.             101792.            516
    ## 10 Brazil                        194.             101192.            521
    ## 11 Serbia                        193.              99668.            515
    ## 12 Spain                         190.             101278.            532
    ## 13 United Kingdom                189.             100523.            531
    ## 14 Chile                         188.              97286.            518
    ## 15 France                        183.              97444.            533
    ## 16 Switzerland                   182.              96574.            531
    ## 17 Portugal                      180.              93980.            521
    ## 18 Hungary                       158.              81197.            514
    ## 19 Austria                       154.              80961.            526
    ## 20 Turkey                        151.              78128.            516

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.2        1403     7293
    ##  2 Peru                 9.25     197340  2132834
    ##  3 Mexico               8.03     248167  3091971
    ##  4 Sudan                7.40       2780    37556
    ##  5 Syria                7.35       1937    26342
    ##  6 Ecuador              6.45      31870   493767
    ##  7 Egypt                5.82      16619   285358
    ##  8 Somalia              5.41        883    16319
    ##  9 China                4.63       5669   122378
    ## 10 Afghanistan          4.62       7025   152142
    ## 11 Bulgaria             4.23      18344   433234
    ## 12 Myanmar              3.77      13445   356985
    ## 13 Bolivia              3.76      18152   482131
    ## 14 Hungary              3.71      30041   810504
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.64        535    14696
    ## 17 Tunisia              3.50      21827   623940
    ## 18 Chad                 3.49        174     4982
    ## 19 Niger                3.42        196     5724
    ## 20 Zimbabwe             3.42       4109   120088

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6598.     197340   29.9 
    ##  2 Hungary                3010.      30041    9.98
    ##  3 Czech Republic         2899.      30375   10.5 
    ##  4 Brazil                 2828.     568788  201.  
    ##  5 Argentina              2635.     108936   41.3 
    ##  6 Colombia               2581.     123356   47.8 
    ##  7 Bulgaria               2566.      18344    7.15
    ##  8 Belgium                2431.      25287   10.4 
    ##  9 Paraguay               2419.      15420    6.38
    ## 10 Slovakia               2300.      12544    5.46
    ## 11 Mexico                 2207.     248167  112.  
    ## 12 Chile                  2172.      36380   16.7 
    ## 13 Ecuador                2155.      31870   14.8 
    ## 14 Italy                  2128.     128432   60.3 
    ## 15 United Kingdom         2100.     130953   62.3 
    ## 16 Tunisia                2061.      21827   10.6 
    ## 17 United States          1985.     615747  310.  
    ## 18 Poland                 1956.      75299   38.5 
    ## 19 Bolivia                1825.      18152    9.95
    ## 20 Spain                  1775.      82538   46.5

EOL
