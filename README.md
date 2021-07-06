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

Updated: 2021-07-07

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
    ##  1 United States           66890. 33378240            499
    ##  2 India                   63924. 30619932            479
    ##  3 Brazil                  39104. 18769808            480
    ##  4 Russia                  11913.  5658672            475
    ##  5 France                  11536.  5675702            492
    ##  6 Turkey                  11472.  5449464            475
    ##  7 United Kingdom          10062.  4930538            490
    ##  8 Argentina                9568.  4535473            474
    ##  9 Colombia                 9159.  4350495            475
    ## 10 Italy                    8544.  4263797            499
    ## 11 Spain                    7874.  3866475            491
    ## 12 Germany                  7569.  3731564            493
    ## 13 Iran                     6581.  3270843            497
    ## 14 Poland                   6013.  2880403            479
    ## 15 Mexico                   5347.  2540068            475
    ## 16 Indonesia                4895.  2345018            479
    ## 17 Ukraine                  4772.  2238364            469
    ## 18 South Africa             4369.  2075409            475
    ## 19 Peru                     4338.  2065113            476
    ## 20 Netherlands              3478.  1690625            486

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                331.             159237.            481
    ##  2 Jordan                        250.             117647.            471
    ##  3 Israel                        238.             114715.            482
    ##  4 Sweden                        235.             114158.            486
    ##  5 Argentina                     231.             109703.            474
    ##  6 United States                 216.             107591.            499
    ##  7 Belgium                       214.             104620.            489
    ##  8 Netherlands                   209.             101570.            486
    ##  9 Serbia                        206.              97617.            474
    ## 10 Chile                         197.              93907.            477
    ## 11 Brazil                        194.              93334.            480
    ## 12 Colombia                      192.              91034.            475
    ## 13 Switzerland                   189.              92421.            490
    ## 14 France                        178.              87631.            492
    ## 15 Portugal                      174.              83418.            480
    ## 16 Hungary                       171.              80975.            473
    ## 17 Spain                         169.              83139.            491
    ## 18 Austria                       162.              78824.            485
    ## 19 United Kingdom                161.              79080.            490
    ## 20 Poland                        156.              74816.            479

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1362     6929
    ##  2 Peru                 9.36     193230  2065113
    ##  3 Mexico               9.20     233622  2540068
    ##  4 Sudan                7.50       2760    36799
    ##  5 Syria                7.35       1889    25686
    ##  6 Egypt                5.77      16284   282257
    ##  7 Somalia              5.17        775    14977
    ##  8 Ecuador              4.69      21695   462649
    ##  9 China                4.65       5537   118951
    ## 10 Bulgaria             4.29      18125   422151
    ## 11 Afghanistan          4.21       5360   127464
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.81      16951   444968
    ## 14 Hungary              3.71      29998   808294
    ## 15 Mali                 3.65        527    14452
    ## 16 Niger                3.52        194     5515
    ## 17 Chad                 3.51        174     4952
    ## 18 Tunisia              3.46      15482   447161
    ## 19 Zimbabwe             3.41       1911    56014
    ## 20 Malawi               3.28       1215    37057

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6461.     193230   29.9 
    ##  2 Hungary                3005.      29998    9.98
    ##  3 Czech Republic         2893.      30312   10.5 
    ##  4 Brazil                 2608.     524417  201.  
    ##  5 Bulgaria               2535.      18125    7.15
    ##  6 Belgium                2421.      25190   10.4 
    ##  7 Argentina              2320.      95904   41.3 
    ##  8 Slovakia               2294.      12513    5.46
    ##  9 Colombia               2279.     108896   47.8 
    ## 10 Italy                  2116.     127680   60.3 
    ## 11 Paraguay               2093.      13346    6.38
    ## 12 Mexico                 2077.     233622  112.  
    ## 13 United Kingdom         2057.     128231   62.3 
    ## 14 Chile                  1985.      33249   16.7 
    ## 15 Poland                 1951.      75095   38.5 
    ## 16 United States          1935.     600294  310.  
    ## 17 Spain                  1740.      80934   46.5 
    ## 18 Bolivia                1704.      16951    9.95
    ## 19 France                 1702.     110262   64.8 
    ## 20 Portugal               1603.      17117   10.7

EOL
