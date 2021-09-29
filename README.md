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

Updated: 2021-09-30

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
    ##  1 United States           73371. 42849008            584
    ##  2 India                   59781. 33716451            564
    ##  3 Brazil                  37816. 21366395            565
    ##  4 United Kingdom          13454.  7736239            575
    ##  5 Russia                  13370.  7487138            560
    ##  6 Turkey                  12670.  7095580            560
    ##  7 France                  11765.  6788617            577
    ##  8 Iran                     9552.  5559691            582
    ##  9 Argentina                9395.  5251940            559
    ## 10 Colombia                 8844.  4952690            560
    ## 11 Spain                    8600.  4953930            576
    ## 12 Italy                    7988.  4665049            584
    ## 13 Indonesia                7467.  4211460            564
    ## 14 Germany                  7293.  4215351            578
    ## 15 Mexico                   6492.  3635807            560
    ## 16 South Africa             5176.  2898888            560
    ## 17 Poland                   5152.  2905866            564
    ## 18 Philippines              4473.  2522965            564
    ## 19 Ukraine                  4353.  2411622            554
    ## 20 Malaysia                 3902.  2220526            569

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        306.             173372.            566
    ##  2 Czech Republic                285.             161393.            566
    ##  3 United States                 237.             138119.            584
    ##  4 Jordan                        231.             128271.            556
    ##  5 Argentina                     227.             127033.            559
    ##  6 Serbia                        226.             126111.            559
    ##  7 United Kingdom                216.             124081.            575
    ##  8 Sweden                        211.             120467.            571
    ##  9 Netherlands                   210.             120132.            571
    ## 10 Belgium                       208.             119219.            574
    ## 11 Switzerland                   191.             110040.            575
    ## 12 Brazil                        188.             106246.            565
    ## 13 Colombia                      185.             103634.            560
    ## 14 Spain                         185.             106522.            576
    ## 15 France                        182.             104814.            577
    ## 16 Portugal                      177.             100016.            565
    ## 17 Chile                         176.              98695.            562
    ## 18 Turkey                        163.              91198.            560
    ## 19 Austria                       157.              89563.            569
    ## 20 Hungary                       148.              82355.            558

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1709     9016
    ##  2 Peru                 9.17     199314  2173354
    ##  3 Mexico               7.58     275676  3635807
    ##  4 Sudan                7.43       2842    38245
    ##  5 Syria                6.62       2227    33640
    ##  6 Ecuador              6.44      32747   508655
    ##  7 Egypt                5.70      17263   303045
    ##  8 Somalia              5.56       1111    19980
    ##  9 Afghanistan          4.64       7204   155128
    ## 10 China                4.57       5691   124591
    ## 11 Bulgaria             4.16      20725   497970
    ## 12 Myanmar              3.82      17631   461066
    ## 13 Bolivia              3.75      18707   499202
    ## 14 Malawi               3.70       2279    61528
    ## 15 Hungary              3.67      30185   822072
    ## 16 Mali                 3.61        548    15184
    ## 17 Zimbabwe             3.54       4615   130272
    ## 18 Paraguay             3.52      16191   459855
    ## 19 Tunisia              3.51      24794   705474
    ## 20 Chad                 3.45        174     5038

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6664.     199314   29.9 
    ##  2 Hungary                3024.      30185    9.98
    ##  3 Brazil                 2957.     594653  201.  
    ##  4 Czech Republic         2907.      30455   10.5 
    ##  5 Bulgaria               2899.      20725    7.15
    ##  6 Argentina              2780.     114954   41.3 
    ##  7 Colombia               2640.     126178   47.8 
    ##  8 Paraguay               2539.      16191    6.38
    ##  9 Belgium                2459.      25581   10.4 
    ## 10 Mexico                 2451.     275676  112.  
    ## 11 Tunisia                2341.      24794   10.6 
    ## 12 Slovakia               2313.      12620    5.46
    ## 13 Chile                  2236.      37449   16.7 
    ## 14 Ecuador                2214.      32747   14.8 
    ## 15 United States          2212.     686125  310.  
    ## 16 United Kingdom         2187.     136375   62.3 
    ## 17 Italy                  2168.     130807   60.3 
    ## 18 Poland                 1964.      75623   38.5 
    ## 19 Bolivia                1881.      18707    9.95
    ## 20 Spain                  1857.      86358   46.5

EOL
