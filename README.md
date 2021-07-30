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

Updated: 2021-07-31

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
    ##  1 United States           66089. 34564448            523
    ##  2 India                   62768. 31572344            503
    ##  3 Brazil                  39280. 19797086            504
    ##  4 Russia                  12509.  6242066            499
    ##  5 France                  11537.  5953274            516
    ##  6 Turkey                  11388.  5682630            499
    ##  7 United Kingdom          11287.  5801565            514
    ##  8 Argentina                9823.  4891810            498
    ##  9 Colombia                 9533.  4757139            499
    ## 10 Spain                    8587.  4422291            515
    ## 11 Italy                    8292.  4336906            523
    ## 12 Iran                     7344.  3826447            521
    ## 13 Germany                  7286.  3766765            517
    ## 14 Indonesia                6704.  3372374            503
    ## 15 Poland                   5731.  2882786            503
    ## 16 Mexico                   5593.  2790874            499
    ## 17 South Africa             4854.  2422151            499
    ## 18 Ukraine                  4567.  2251869            493
    ## 19 Peru                     4216.  2107873            500
    ## 20 Netherlands              3645.  1859199            510

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                316.             159739.            505
    ##  2 Jordan                        242.             119927.            495
    ##  3 Argentina                     238.             118322.            498
    ##  4 Israel                        234.             118409.            506
    ##  5 Sweden                        226.             115051.            510
    ##  6 Netherlands                   219.             111697.            510
    ##  7 United States                 213.             111415.            523
    ##  8 Belgium                       210.             107945.            513
    ##  9 Colombia                      199.              99543.            499
    ## 10 Serbia                        197.              98200.            498
    ## 11 Brazil                        195.              98442.            504
    ## 12 Chile                         192.              96336.            501
    ## 13 Spain                         185.              95091.            515
    ## 14 Switzerland                   183.              94140.            514
    ## 15 United Kingdom                181.              93051.            514
    ## 16 Portugal                      179.              90244.            504
    ## 17 France                        178.              91916.            516
    ## 18 Hungary                       163.              81095.            497
    ## 19 Austria                       156.              79658.            509
    ## 20 Poland                        149.              74878.            503

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1374     7042
    ##  2 Peru                 9.31     196138  2107873
    ##  3 Mexico               8.59     239616  2790874
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1911    25930
    ##  6 Ecuador              6.50      31454   483733
    ##  7 Egypt                5.81      16507   284128
    ##  8 Somalia              5.27        809    15358
    ##  9 China                4.67       5635   120553
    ## 10 Afghanistan          4.56       6677   146523
    ## 11 Bulgaria             4.29      18208   424526
    ## 12 Bolivia              3.77      17754   470929
    ## 13 Hungary              3.71      30026   809491
    ## 14 Mali                 3.65        531    14564
    ## 15 Chad                 3.50        174     4972
    ## 16 Niger                3.48        195     5607
    ## 17 Tunisia              3.32      19336   582638
    ## 18 Paraguay             3.28      14820   451158
    ## 19 Zimbabwe             3.24       3421   105656
    ## 20 Slovakia             3.19      12536   392581

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6558.     196138   29.9 
    ##  2 Hungary                3008.      30026    9.98
    ##  3 Czech Republic         2898.      30363   10.5 
    ##  4 Brazil                 2751.     553179  201.  
    ##  5 Bulgaria               2547.      18208    7.15
    ##  6 Argentina              2535.     104822   41.3 
    ##  7 Colombia               2507.     119801   47.8 
    ##  8 Belgium                2426.      25235   10.4 
    ##  9 Paraguay               2324.      14820    6.38
    ## 10 Slovakia               2298.      12536    5.46
    ## 11 Mexico                 2131.     239616  112.  
    ## 12 Ecuador                2127.      31454   14.8 
    ## 13 Italy                  2122.     128029   60.3 
    ## 14 Chile                  2108.      35295   16.7 
    ## 15 United Kingdom         2077.     129515   62.3 
    ## 16 United States          1957.     607095  310.  
    ## 17 Poland                 1955.      75259   38.5 
    ## 18 Tunisia                1826.      19336   10.6 
    ## 19 Bolivia                1785.      17754    9.95
    ## 20 Spain                  1751.      81442   46.5

EOL
