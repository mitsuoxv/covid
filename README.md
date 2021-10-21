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

Updated: 2021-10-22

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
    ##  1 United States           71779. 44862573            625
    ##  2 India                   58238. 34127450            586
    ##  3 Brazil                  36908. 21664879            587
    ##  4 United Kingdom          14388.  8589741            597
    ##  5 Russia                  13971.  8131164            582
    ##  6 Turkey                  13306.  7744139            582
    ##  7 France                  11488.  6881479            599
    ##  8 Iran                     9638.  5821737            604
    ##  9 Argentina                9079.  5274766            581
    ## 10 Colombia                 8563.  4983527            582
    ## 11 Spain                    8350.  4993295            598
    ## 12 Italy                    7798.  4725887            606
    ## 13 Germany                  7363.  4417708            600
    ## 14 Indonesia                7232.  4237834            586
    ## 15 Mexico                   6465.  3762689            582
    ## 16 Poland                   5045.  2956207            586
    ## 17 South Africa             5013.  2917846            582
    ## 18 Ukraine                  4690.  2701600            576
    ## 19 Philippines              4668.  2735369            586
    ## 20 Malaysia                 4073.  2407382            591

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        305.             179533.            588
    ##  2 Czech Republic                279.             164071.            588
    ##  3 Serbia                        251.             145776.            581
    ##  4 United States                 231.             144609.            625
    ##  5 United Kingdom                231.             137770.            597
    ##  6 Jordan                        228.             132046.            578
    ##  7 Argentina                     220.             127585.            581
    ##  8 Belgium                       210.             124910.            596
    ##  9 Netherlands                   209.             123733.            593
    ## 10 Sweden                        205.             121852.            593
    ## 11 Switzerland                   189.             112917.            597
    ## 12 Brazil                        184.             107730.            587
    ## 13 Spain                         180.             107369.            598
    ## 14 Colombia                      179.             104280.            582
    ## 15 France                        177.             106247.            599
    ## 16 Portugal                      173.             101335.            587
    ## 17 Chile                         171.              99975.            584
    ## 18 Turkey                        171.              99534.            582
    ## 19 Austria                       161.              95138.            591
    ## 20 Hungary                       145.              84279.            580

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1821     9596
    ##  2 Peru                 9.12     199928  2191171
    ##  3 Mexico               7.57     284925  3762689
    ##  4 Sudan                7.46       2990    40084
    ##  5 Ecuador              6.41      32937   514087
    ##  6 Syria                6.10       2457    40294
    ##  7 Egypt                5.64      18105   321084
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7247   155859
    ## 10 China                4.54       5695   125351
    ## 11 Bulgaria             4.09      22719   555077
    ## 12 Myanmar              3.76      18465   491584
    ## 13 Bolivia              3.72      18883   507683
    ## 14 Malawi               3.72       2296    61738
    ## 15 Hungary              3.62      30468   841277
    ## 16 Mali                 3.55        558    15698
    ## 17 Tunisia              3.53      25121   711164
    ## 18 Paraguay             3.52      16228   460582
    ## 19 Zimbabwe             3.52       4660   132487
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6685.     199928   29.9 
    ##  2 Bulgaria               3178.      22719    7.15
    ##  3 Hungary                3052.      30468    9.98
    ##  4 Brazil                 3003.     603855  201.  
    ##  5 Czech Republic         2920.      30587   10.5 
    ##  6 Argentina              2799.     115737   41.3 
    ##  7 Colombia               2656.     126910   47.8 
    ##  8 Paraguay               2545.      16228    6.38
    ##  9 Mexico                 2533.     284925  112.  
    ## 10 Belgium                2482.      25816   10.4 
    ## 11 Tunisia                2372.      25121   10.6 
    ## 12 Slovakia               2362.      12883    5.46
    ## 13 United States          2336.     724605  310.  
    ## 14 Chile                  2247.      37628   16.7 
    ## 15 United Kingdom         2230.     139031   62.3 
    ## 16 Ecuador                2227.      32937   14.8 
    ## 17 Italy                  2182.     131688   60.3 
    ## 18 Poland                 1982.      76300   38.5 
    ## 19 Romania                1980.      43487   22.0 
    ## 20 Bolivia                1898.      18883    9.95

EOL
