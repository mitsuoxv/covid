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

Updated: 2021-09-02

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
    ##  1 United States           70005. 38923013            556
    ##  2 India                   61214. 32810845            536
    ##  3 Brazil                  38645. 20752281            537
    ##  4 Russia                  13040.  6937333            532
    ##  5 United Kingdom          12412.  6789585            547
    ##  6 Turkey                  12008.  6388331            532
    ##  7 France                  11975.  6574138            549
    ##  8 Argentina                9753.  5178889            531
    ##  9 Colombia                 9224.  4907264            532
    ## 10 Iran                     9011.  4992063            554
    ## 11 Spain                    8859.  4855065            548
    ## 12 Italy                    8165.  4539991            556
    ## 13 Indonesia                7649.  4100138            536
    ## 14 Germany                  7193.  3956387            550
    ## 15 Mexico                   6280.  3341264            532
    ## 16 Poland                   5390.  2889036            536
    ## 17 South Africa             5221.  2777659            532
    ## 18 Ukraine                  4350.  2288371            526
    ## 19 Peru                     4033.  2149591            533
    ## 20 Philippines              3712.  1989857            536

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                298.             160317.            538
    ##  2 Israel                        269.             144774.            538
    ##  3 Argentina                     236.             125266.            531
    ##  4 Jordan                        236.             124413.            528
    ##  5 United States                 226.             125464.            556
    ##  6 Sweden                        217.             117918.            543
    ##  7 Netherlands                   215.             116615.            543
    ##  8 Belgium                       209.             113877.            546
    ##  9 United Kingdom                199.             108897.            547
    ## 10 Serbia                        196.             103873.            531
    ## 11 Colombia                      193.             102684.            532
    ## 12 Brazil                        192.             103192.            537
    ## 13 Spain                         190.             104397.            548
    ## 14 Switzerland                   187.             102398.            547
    ## 15 France                        185.             101502.            549
    ## 16 Chile                         183.              97852.            534
    ## 17 Portugal                      181.              97221.            537
    ## 18 Turkey                        154.              82108.            532
    ## 19 Austria                       154.              83348.            542
    ## 20 Hungary                       154.              81400.            530

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.7        1472     7869
    ##  2 Peru                 9.22     198263  2149591
    ##  3 Mexico               7.74     258491  3341264
    ##  4 Sudan                7.40       2791    37709
    ##  5 Syria                7.21       2013    27915
    ##  6 Ecuador              6.43      32244   501201
    ##  7 Egypt                5.80      16736   288441
    ##  8 Somalia              5.59        977    17466
    ##  9 Afghanistan          4.65       7123   153260
    ## 10 China                4.62       5683   123068
    ## 11 Bulgaria             4.15      18896   455742
    ## 12 Myanmar              3.85      15389   399282
    ## 13 Bolivia              3.76      18429   490467
    ## 14 Hungary              3.70      30059   812531
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.62        539    14874
    ## 17 Malawi               3.60       2177    60494
    ## 18 Zimbabwe             3.54       4419   124773
    ## 19 Tunisia              3.53      23451   664034
    ## 20 Chad                 3.48        174     4994

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6629.     198263   29.9 
    ##  2 Hungary                3011.      30059    9.98
    ##  3 Czech Republic         2902.      30404   10.5 
    ##  4 Brazil                 2882.     579574  201.  
    ##  5 Argentina              2700.     111607   41.3 
    ##  6 Bulgaria               2643.      18896    7.15
    ##  7 Colombia               2613.     124883   47.8 
    ##  8 Paraguay               2469.      15742    6.38
    ##  9 Belgium                2440.      25380   10.4 
    ## 10 Slovakia               2300.      12548    5.46
    ## 11 Mexico                 2298.     258491  112.  
    ## 12 Tunisia                2215.      23451   10.6 
    ## 13 Chile                  2206.      36937   16.7 
    ## 14 Ecuador                2180.      32244   14.8 
    ## 15 Italy                  2142.     129221   60.3 
    ## 16 United Kingdom         2126.     132535   62.3 
    ## 17 United States          2045.     634320  310.  
    ## 18 Poland                 1957.      75358   38.5 
    ## 19 Bolivia                1853.      18429    9.95
    ## 20 Spain                  1814.      84340   46.5

EOL
