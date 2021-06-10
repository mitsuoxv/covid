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

Updated: 2021-06-11

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

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           69921. 33072912            473
    ##  2 India                   64422. 29183121            453
    ##  3 Brazil                  37526. 17037129            454
    ##  4 France                  12063.  5621275            466
    ##  5 Turkey                  11818.  5306690            449
    ##  6 Russia                  11510.  5167949            449
    ##  7 United Kingdom           9775.  4535758            464
    ##  8 Italy                    8959.  4237790            473
    ##  9 Argentina                8948.  4008771            448
    ## 10 Colombia                 8043.  3611602            449
    ## 11 Spain                    7990.  3715454            465
    ## 12 Germany                  7942.  3709129            467
    ## 13 Poland                   6350.  2876667            453
    ## 14 Iran                     6349.  2990714            471
    ## 15 Mexico                   5430.  2438011            449
    ## 16 Ukraine                  5011.  2219824            443
    ## 17 Peru                     4417.  1987933            450
    ## 18 Indonesia                4152.  1877050            452
    ## 19 South Africa             3815.  1712939            449
    ## 20 Czech Republic           3658.  1664649            455

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                349.             158901.            455
    ##  2 Jordan                        260.             115762.            445
    ##  3 Israel                        251.             114173.            454
    ##  4 Sweden                        246.             113218.            460
    ##  5 United States                 225.             106607.            473
    ##  6 Belgium                       223.             103178.            463
    ##  7 Netherlands                   218.             100184.            460
    ##  8 Serbia                        217.              97245.            448
    ##  9 Argentina                     216.              96963.            448
    ## 10 Switzerland                   198.              91838.            464
    ## 11 Chile                         191.              86333.            451
    ## 12 Brazil                        187.              84718.            454
    ## 13 France                        186.              86790.            466
    ## 14 Hungary                       181.              80784.            447
    ## 15 Portugal                      176.              80041.            454
    ## 16 Spain                         172.              79892.            465
    ## 17 Austria                       171.              78446.            459
    ## 18 Colombia                      168.              75572.            449
    ## 19 Poland                        165.              74719.            453
    ## 20 Slovakia                      160.              71642.            448

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1337     6832
    ##  2 Peru                 9.41     187157  1987933
    ##  3 Mexico               9.40     229100  2438011
    ##  4 Sudan                7.51       2719    36203
    ##  5 Syria                7.28       1801    24723
    ##  6 Egypt                5.72      15471   270292
    ##  7 Somalia              5.24        774    14779
    ##  8 Ecuador              4.82      20903   433870
    ##  9 China                4.49       5179   115229
    ## 10 Bulgaria             4.26      17872   419990
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.11       1622    39432
    ## 13 Afghanistan          3.91       3356    85892
    ## 14 Bolivia              3.86      15177   392975
    ## 15 Hungary              3.70      29805   806385
    ## 16 Tunisia              3.67      13229   360285
    ## 17 Mali                 3.64        521    14328
    ## 18 Niger                3.53        192     5442
    ## 19 Chad                 3.52        174     4942
    ## 20 Malawi               3.36       1158    34432

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6258.     187157   29.9 
    ##  2 Hungary                2986.      29805    9.98
    ##  3 Czech Republic         2884.      30211   10.5 
    ##  4 Bulgaria               2500.      17872    7.15
    ##  5 Belgium                2409.      25061   10.4 
    ##  6 Brazil                 2371.     476792  201.  
    ##  7 Slovakia               2279.      12433    5.46
    ##  8 Italy                  2101.     126767   60.3 
    ##  9 United Kingdom         2051.     127860   62.3 
    ## 10 Mexico                 2037.     229100  112.  
    ## 11 Argentina              2000.      82667   41.3 
    ## 12 Colombia               1944.      92923   47.8 
    ## 13 Poland                 1934.      74447   38.5 
    ## 14 United States          1911.     592932  310.  
    ## 15 Chile                  1800.      30141   16.7 
    ## 16 Spain                  1727.      80332   46.5 
    ## 17 France                 1688.     109336   64.8 
    ## 18 Portugal               1596.      17037   10.7 
    ## 19 Paraguay               1591.      10145    6.38
    ## 20 Bolivia                1526.      15177    9.95

EOL
