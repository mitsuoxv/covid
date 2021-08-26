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

Updated: 2021-08-27

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
    ##  1 United States           69035. 37969371            550
    ##  2 India                   61431. 32558530            530
    ##  3 Brazil                  38822. 20614866            531
    ##  4 Russia                  12974.  6824540            526
    ##  5 United Kingdom          12182.  6590751            541
    ##  6 France                  11959.  6493798            543
    ##  7 Turkey                  11927.  6273681            526
    ##  8 Argentina                9806.  5148085            525
    ##  9 Colombia                 9305.  4894702            526
    ## 10 Spain                    8884.  4815205            542
    ## 11 Iran                     8752.  4796377            548
    ## 12 Italy                    8186.  4502396            550
    ## 13 Indonesia                7598.  4026837            530
    ## 14 Germany                  7172.  3901799            544
    ## 15 Mexico                   6178.  3249878            526
    ## 16 Poland                   5448.  2887485            530
    ## 17 South Africa             5175.  2722202            526
    ## 18 Ukraine                  4381.  2278171            520
    ## 19 Peru                     4067.  2143691            527
    ## 20 Netherlands              3587.  1926424            537

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                301.             160207.            532
    ##  2 Israel                        262.             139258.            532
    ##  3 Argentina                     237.             124521.            525
    ##  4 Jordan                        237.             123657.            522
    ##  5 United States                 223.             122390.            550
    ##  6 Sweden                        218.             117271.            537
    ##  7 Netherlands                   216.             115736.            537
    ##  8 Belgium                       209.             112766.            540
    ##  9 United Kingdom                195.             105708.            541
    ## 10 Colombia                      195.             102421.            526
    ## 11 Serbia                        194.             101934.            525
    ## 12 Brazil                        193.             102509.            531
    ## 13 Spain                         191.             103540.            542
    ## 14 Switzerland                   186.             100492.            541
    ## 15 Chile                         185.              97643.            528
    ## 16 France                        185.             100262.            543
    ## 17 Portugal                      181.              96091.            531
    ## 18 Hungary                       155.              81298.            524
    ## 19 Austria                       154.              82357.            536
    ## 20 Turkey                        153.              80634.            526

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1438     7625
    ##  2 Peru                 9.23     197944  2143691
    ##  3 Mexico               7.83     254466  3249878
    ##  4 Sudan                7.40       2791    37698
    ##  5 Syria                7.29       1985    27221
    ##  6 Ecuador              6.43      32104   499196
    ##  7 Egypt                5.82      16691   286938
    ##  8 Somalia              5.51        938    17016
    ##  9 Afghanistan          4.64       7093   152822
    ## 10 China                4.62       5678   122809
    ## 11 Bulgaria             4.17      18613   446698
    ## 12 Myanmar              3.87      14737   380879
    ## 13 Bolivia              3.76      18330   487721
    ## 14 Hungary              3.70      30056   811517
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.63        537    14796
    ## 17 Tunisia              3.53      22860   647483
    ## 18 Malawi               3.52       2111    59954
    ## 19 Zimbabwe             3.51       4338   123711
    ## 20 Chad                 3.49        174     4987

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6619.     197944   29.9 
    ##  2 Hungary                3011.      30056    9.98
    ##  3 Czech Republic         2901.      30393   10.5 
    ##  4 Brazil                 2863.     575742  201.  
    ##  5 Argentina              2680.     110806   41.3 
    ##  6 Bulgaria               2604.      18613    7.15
    ##  7 Colombia               2603.     124388   47.8 
    ##  8 Paraguay               2449.      15613    6.38
    ##  9 Belgium                2437.      25348   10.4 
    ## 10 Slovakia               2300.      12547    5.46
    ## 11 Mexico                 2263.     254466  112.  
    ## 12 Chile                  2193.      36718   16.7 
    ## 13 Ecuador                2171.      32104   14.8 
    ## 14 Tunisia                2159.      22860   10.6 
    ## 15 Italy                  2136.     128914   60.3 
    ## 16 United Kingdom         2117.     132003   62.3 
    ## 17 United States          2018.     626163  310.  
    ## 18 Poland                 1957.      75332   38.5 
    ## 19 Bolivia                1843.      18330    9.95
    ## 20 Spain                  1800.      83690   46.5

EOL
