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

Updated: 2021-10-21

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
    ##  1 United States           71748. 44771558            624
    ##  2 India                   58306. 34108996            585
    ##  3 Brazil                  36948. 21651910            586
    ##  4 United Kingdom          14331.  8541196            596
    ##  5 Russia                  13932.  8094825            581
    ##  6 Turkey                  13277.  7714379            581
    ##  7 France                  11497.  6875557            598
    ##  8 Iran                     9635.  5809967            603
    ##  9 Argentina                9092.  5273463            580
    ## 10 Colombia                 8576.  4982575            581
    ## 11 Spain                    8360.  4990768            597
    ## 12 Italy                    7805.  4722188            605
    ## 13 Germany                  7348.  4401631            599
    ## 14 Indonesia                7243.  4237201            585
    ## 15 Mexico                   6469.  3758469            581
    ## 16 Poland                   5034.  2945056            585
    ## 17 South Africa             5021.  2917255            581
    ## 18 Philippines              4669.  2731735            585
    ## 19 Ukraine                  4659.  2679185            575
    ## 20 Malaysia                 4071.  2401866            590

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        306.             179392.            587
    ##  2 Czech Republic                279.             163757.            587
    ##  3 Serbia                        249.             144722.            580
    ##  4 United States                 231.             144316.            624
    ##  5 United Kingdom                230.             136991.            596
    ##  6 Jordan                        228.             131854.            577
    ##  7 Argentina                     220.             127553.            580
    ##  8 Belgium                       209.             124280.            595
    ##  9 Netherlands                   209.             123458.            592
    ## 10 Sweden                        206.             121767.            592
    ## 11 Switzerland                   189.             112728.            596
    ## 12 Brazil                        184.             107666.            586
    ## 13 Spain                         180.             107315.            597
    ## 14 Colombia                      179.             104260.            581
    ## 15 France                        178.             106156.            598
    ## 16 Portugal                      173.             101249.            586
    ## 17 Chile                         171.              99901.            583
    ## 18 Turkey                        171.              99151.            581
    ## 19 Austria                       160.              94667.            590
    ## 20 Hungary                       145.              84043.            579

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1813     9575
    ##  2 Peru                 9.13     199882  2190396
    ##  3 Mexico               7.57     284477  3758469
    ##  4 Sudan                7.48       2979    39839
    ##  5 Ecuador              6.41      32899   513026
    ##  6 Syria                6.13       2446    39902
    ##  7 Egypt                5.64      18058   320207
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7247   155801
    ## 10 China                4.54       5695   125322
    ## 11 Bulgaria             4.11      22612   550555
    ## 12 Myanmar              3.76      18444   490901
    ## 13 Bolivia              3.72      18877   507134
    ## 14 Malawi               3.72       2295    61732
    ## 15 Hungary              3.63      30448   838916
    ## 16 Mali                 3.56        558    15675
    ## 17 Tunisia              3.53      25103   711007
    ## 18 Paraguay             3.52      16228   460553
    ## 19 Zimbabwe             3.52       4659   132437
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6683.     199882   29.9 
    ##  2 Bulgaria               3163.      22612    7.15
    ##  3 Hungary                3050.      30448    9.98
    ##  4 Brazil                 3001.     603465  201.  
    ##  5 Czech Republic         2918.      30574   10.5 
    ##  6 Argentina              2799.     115704   41.3 
    ##  7 Colombia               2655.     126886   47.8 
    ##  8 Paraguay               2545.      16228    6.38
    ##  9 Mexico                 2529.     284477  112.  
    ## 10 Belgium                2480.      25797   10.4 
    ## 11 Tunisia                2371.      25103   10.6 
    ## 12 Slovakia               2360.      12872    5.46
    ## 13 United States          2330.     722690  310.  
    ## 14 Chile                  2247.      37623   16.7 
    ## 15 United Kingdom         2227.     138852   62.3 
    ## 16 Ecuador                2224.      32899   14.8 
    ## 17 Italy                  2182.     131655   60.3 
    ## 18 Poland                 1979.      76179   38.5 
    ## 19 Romania                1960.      43039   22.0 
    ## 20 Bolivia                1898.      18877    9.95

EOL
