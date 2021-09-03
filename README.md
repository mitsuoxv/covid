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

Updated: 2021-09-04

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
    ##  1 United States           70430. 39300270            558
    ##  2 India                   61158. 32903289            538
    ##  3 Brazil                  38598. 20804215            539
    ##  4 Russia                  13062.  6975174            534
    ##  5 United Kingdom          12501.  6862908            549
    ##  6 Turkey                  12052.  6435773            534
    ##  7 France                  11988.  6605354            551
    ##  8 Argentina                9739.  5190948            533
    ##  9 Colombia                 9197.  4911082            534
    ## 10 Iran                     9092.  5055512            556
    ## 11 Spain                    8857.  4871444            550
    ## 12 Italy                    8160.  4553241            558
    ## 13 Indonesia                7652.  4116890            538
    ## 14 Germany                  7218.  3984353            552
    ## 15 Mexico                   6310.  3369747            534
    ## 16 Poland                   5371.  2889773            538
    ## 17 South Africa             5236.  2796405            534
    ## 18 Ukraine                  4344.  2293541            528
    ## 19 Peru                     4020.  2151010            535
    ## 20 Philippines              3755.  2020484            538

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                297.             160371.            540
    ##  2 Israel                        277.             149406.            540
    ##  3 Argentina                     236.             125557.            533
    ##  4 Jordan                        235.             124564.            530
    ##  5 United States                 227.             126680.            558
    ##  6 Sweden                        217.             118161.            545
    ##  7 Netherlands                   215.             116951.            545
    ##  8 Belgium                       209.             114362.            548
    ##  9 United Kingdom                200.             110073.            549
    ## 10 Serbia                        197.             104809.            533
    ## 11 Colombia                      192.             102764.            534
    ## 12 Brazil                        192.             103450.            539
    ## 13 Spain                         190.             104749.            550
    ## 14 Switzerland                   188.             103191.            549
    ## 15 France                        185.             101984.            551
    ## 16 Chile                         183.              97913.            536
    ## 17 Portugal                      181.              97632.            539
    ## 18 Turkey                        155.              82718.            534
    ## 19 Austria                       154.              83759.            544
    ## 20 Hungary                       153.              81451.            532

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.7        1486     7951
    ##  2 Peru                 9.22     198329  2151010
    ##  3 Mexico               7.73     260503  3369747
    ##  4 Sudan                7.41       2809    37886
    ##  5 Syria                7.20       2018    28045
    ##  6 Ecuador              6.43      32296   502146
    ##  7 Egypt                5.80      16743   288732
    ##  8 Somalia              5.59        977    17466
    ##  9 Afghanistan          4.65       7127   153375
    ## 10 China                4.62       5685   123136
    ## 11 Bulgaria             4.14      19001   459051
    ## 12 Myanmar              3.83      15693   409509
    ## 13 Bolivia              3.76      18473   491340
    ## 14 Hungary              3.70      30061   813040
    ## 15 Tanzania             3.66         50     1367
    ## 16 Malawi               3.62       2195    60663
    ## 17 Mali                 3.62        539    14910
    ## 18 Zimbabwe             3.56       4449   125118
    ## 19 Tunisia              3.54      23647   668051
    ## 20 Chad                 3.48        174     4996

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6632.     198329   29.9 
    ##  2 Hungary                3012.      30061    9.98
    ##  3 Czech Republic         2902.      30405   10.5 
    ##  4 Brazil                 2890.     581150  201.  
    ##  5 Argentina              2709.     112005   41.3 
    ##  6 Bulgaria               2658.      19001    7.15
    ##  7 Colombia               2616.     125016   47.8 
    ##  8 Paraguay               2476.      15785    6.38
    ##  9 Belgium                2441.      25392   10.4 
    ## 10 Mexico                 2316.     260503  112.  
    ## 11 Slovakia               2300.      12549    5.46
    ## 12 Tunisia                2233.      23647   10.6 
    ## 13 Chile                  2209.      36995   16.7 
    ## 14 Ecuador                2184.      32296   14.8 
    ## 15 Italy                  2144.     129352   60.3 
    ## 16 United Kingdom         2132.     132920   62.3 
    ## 17 United States          2059.     638632  310.  
    ## 18 Poland                 1958.      75372   38.5 
    ## 19 Bolivia                1857.      18473    9.95
    ## 20 Spain                  1820.      84640   46.5

EOL
