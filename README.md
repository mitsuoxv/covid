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

Updated: 2021-06-08

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
    ##  1 United States           70270. 33027212            470
    ##  2 India                   64244. 28909975            450
    ##  3 Brazil                  37488. 16907425            451
    ##  4 France                  12117.  5610271            463
    ##  5 Turkey                  11856.  5287980            446
    ##  6 Russia                  11515.  5135866            446
    ##  7 United Kingdom           9798.  4516896            461
    ##  8 Italy                    9005.  4232428            470
    ##  9 Argentina                8851.  3939024            445
    ## 10 Spain                    7993.  3693012            462
    ## 11 Germany                  7977.  3701484            464
    ## 12 Colombia                 7953.  3547017            446
    ## 13 Poland                   6389.  2875328            450
    ## 14 Iran                     6338.  2966363            468
    ## 15 Mexico                   5453.  2432280            446
    ## 16 Ukraine                  5034.  2215052            440
    ## 17 Peru                     4430.  1980391            447
    ## 18 Indonesia                4133.  1856038            449
    ## 19 South Africa             3804.  1696564            446
    ## 20 Czech Republic           3680.  1663607            452

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                351.             158802.            452
    ##  2 Jordan                        261.             115473.            442
    ##  3 Israel                        253.             114166.            451
    ##  4 Sweden                        247.             112816.            457
    ##  5 United States                 227.             106459.            470
    ##  6 Belgium                       224.             102932.            460
    ##  7 Netherlands                   219.              99913.            457
    ##  8 Serbia                        218.              97167.            445
    ##  9 Argentina                     214.              95276.            445
    ## 10 Switzerland                   199.              91569.            461
    ## 11 Chile                         190.              85269.            448
    ## 12 France                        187.              86621.            463
    ## 13 Brazil                        186.              84073.            451
    ## 14 Hungary                       182.              80754.            444
    ## 15 Portugal                      177.              79866.            451
    ## 16 Spain                         172.              79409.            462
    ## 17 Austria                       172.              78341.            456
    ## 18 Colombia                      166.              74221.            446
    ## 19 Poland                        166.              74684.            450
    ## 20 Slovakia                      161.              71577.            445

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1329     6787
    ##  2 Mexico               9.40     228754  2432280
    ##  3 Peru                 9.40     186073  1980391
    ##  4 Sudan                7.49       2697    36004
    ##  5 Syria                7.27       1793    24659
    ##  6 Egypt                5.73      15352   267972
    ##  7 Somalia              5.24        773    14748
    ##  8 Ecuador              4.81      20809   432353
    ##  9 China                4.46       5106   114474
    ## 10 Bulgaria             4.25      17820   419473
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.10       1606    39189
    ## 13 Afghanistan          3.94       3187    80841
    ## 14 Bolivia              3.88      14981   385734
    ## 15 Hungary              3.69      29782   806089
    ## 16 Tunisia              3.65      12980   355732
    ## 17 Mali                 3.63        519    14298
    ## 18 Niger                3.53        192     5439
    ## 19 Chad                 3.52        174     4939
    ## 20 Malawi               3.36       1157    34390

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6222.     186073   29.9 
    ##  2 Hungary                2984.      29782    9.98
    ##  3 Czech Republic         2879.      30164   10.5 
    ##  4 Bulgaria               2493.      17820    7.15
    ##  5 Belgium                2406.      25033   10.4 
    ##  6 Brazil                 2350.     472531  201.  
    ##  7 Slovakia               2276.      12414    5.46
    ##  8 Italy                  2097.     126523   60.3 
    ##  9 United Kingdom         2050.     127840   62.3 
    ## 10 Mexico                 2034.     228754  112.  
    ## 11 Argentina              1956.      80867   41.3 
    ## 12 Poland                 1926.      74160   38.5 
    ## 13 Colombia               1913.      91422   47.8 
    ## 14 United States          1907.     591696  310.  
    ## 15 Chile                  1788.      29937   16.7 
    ## 16 Spain                  1722.      80099   46.5 
    ## 17 France                 1685.     109121   64.8 
    ## 18 Portugal               1596.      17034   10.7 
    ## 19 Paraguay               1527.       9739    6.38
    ## 20 Sweden                 1520.      14523    9.56

EOL
