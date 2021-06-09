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

Updated: 2021-06-10

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
    ##  1 United States           70034. 33056361            472
    ##  2 India                   64356. 29089069            452
    ##  3 Brazil                  37492. 16984218            453
    ##  4 France                  12077.  5615917            465
    ##  5 Turkey                  11830.  5300236            448
    ##  6 Russia                  11509.  5156250            448
    ##  7 United Kingdom           9780.  4528446            463
    ##  8 Italy                    8973.  4235592            472
    ##  9 Argentina                8898.  3977634            447
    ## 10 Colombia                 8020.  3593016            448
    ## 11 Spain                    7998.  3711027            464
    ## 12 Germany                  7952.  3705942            466
    ## 13 Poland                   6363.  2876289            452
    ## 14 Iran                     6340.  2980116            470
    ## 15 Mexico                   5434.  2434562            448
    ## 16 Ukraine                  5018.  2218039            442
    ## 17 Peru                     4421.  1984999            449
    ## 18 Indonesia                4145.  1869325            451
    ## 19 South Africa             3803.  1704058            448
    ## 20 Czech Republic           3666.  1664382            454

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                350.             158876.            454
    ##  2 Jordan                        260.             115669.            444
    ##  3 Israel                        252.             114167.            453
    ##  4 Sweden                        246.             113096.            459
    ##  5 United States                 226.             106553.            472
    ##  6 Belgium                       223.             103064.            462
    ##  7 Netherlands                   218.             100081.            459
    ##  8 Serbia                        217.              97218.            447
    ##  9 Argentina                     215.              96210.            447
    ## 10 Switzerland                   198.              91767.            463
    ## 11 Chile                         191.              86013.            450
    ## 12 France                        186.              86708.            465
    ## 13 Brazil                        186.              84455.            453
    ## 14 Hungary                       181.              80784.            446
    ## 15 Portugal                      176.              79958.            453
    ## 16 Spain                         172.              79797.            464
    ## 17 Austria                       171.              78406.            458
    ## 18 Colombia                      168.              75183.            448
    ## 19 Poland                        165.              74709.            452
    ## 20 Slovakia                      160.              71621.            447

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1336     6823
    ##  2 Peru                 9.41     186757  1984999
    ##  3 Mexico               9.40     228838  2434562
    ##  4 Sudan                7.51       2711    36122
    ##  5 Syria                7.29       1799    24690
    ##  6 Egypt                5.73      15437   269527
    ##  7 Somalia              5.23        773    14776
    ##  8 Ecuador              4.81      20814   432739
    ##  9 China                4.48       5154   114929
    ## 10 Bulgaria             4.25      17860   419859
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.11       1617    39321
    ## 13 Afghanistan          3.93       3305    84050
    ## 14 Bolivia              3.87      15082   389994
    ## 15 Hungary              3.70      29805   806385
    ## 16 Tunisia              3.66      13126   358183
    ## 17 Mali                 3.63        520    14324
    ## 18 Niger                3.53        192     5439
    ## 19 Chad                 3.52        174     4942
    ## 20 Malawi               3.37       1158    34410

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6245.     186757   29.9 
    ##  2 Hungary                2986.      29805    9.98
    ##  3 Czech Republic         2883.      30202   10.5 
    ##  4 Bulgaria               2498.      17860    7.15
    ##  5 Belgium                2408.      25051   10.4 
    ##  6 Brazil                 2359.     474414  201.  
    ##  7 Slovakia               2279.      12430    5.46
    ##  8 Italy                  2100.     126690   60.3 
    ##  9 United Kingdom         2051.     127854   62.3 
    ## 10 Mexico                 2035.     228838  112.  
    ## 11 Argentina              1982.      81946   41.3 
    ## 12 Colombia               1935.      92496   47.8 
    ## 13 Poland                 1932.      74363   38.5 
    ## 14 United States          1910.     592610  310.  
    ## 15 Chile                  1798.      30104   16.7 
    ## 16 Spain                  1727.      80309   46.5 
    ## 17 France                 1687.     109243   64.8 
    ## 18 Portugal               1596.      17037   10.7 
    ## 19 Paraguay               1569.      10005    6.38
    ## 20 Sweden                 1522.      14546    9.56

EOL
