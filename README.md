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

Updated: 2021-07-21

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
    ##  1 United States           65773. 33741532            513
    ##  2 India                   63234. 31174322            493
    ##  3 Brazil                  39224. 19376574            494
    ##  4 Russia                  12283.  6006536            489
    ##  5 France                  11370.  5753579            506
    ##  6 Turkey                  11324.  5537386            489
    ##  7 United Kingdom          10860.  5473481            504
    ##  8 Argentina                9746.  4756378            488
    ##  9 Colombia                 9487.  4639466            489
    ## 10 Italy                    8361.  4289528            513
    ## 11 Spain                    8241.  4161850            505
    ## 12 Germany                  7389.  3746410            507
    ## 13 Iran                     6944.  3548704            511
    ## 14 Indonesia                5984.  2950058            493
    ## 15 Poland                   5845.  2881594            493
    ## 16 Mexico                   5438.  2659137            489
    ## 17 South Africa             4708.  2302304            489
    ## 18 Ukraine                  4648.  2245275            483
    ## 19 Peru                     4273.  2093754            490
    ## 20 Netherlands              3615.  1807444            500

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                322.             159543.            495
    ##  2 Jordan                        245.             118810.            485
    ##  3 Argentina                     236.             115046.            488
    ##  4 Israel                        234.             116057.            496
    ##  5 Sweden                        229.             114514.            500
    ##  6 Netherlands                   217.             108588.            500
    ##  7 United States                 212.             108762.            513
    ##  8 Belgium                       212.             106432.            503
    ##  9 Serbia                        201.              97867.            488
    ## 10 Colombia                      199.              97080.            489
    ## 11 Brazil                        195.              96351.            494
    ## 12 Chile                         195.              95595.            491
    ## 13 Switzerland                   185.              93176.            504
    ## 14 Spain                         177.              89491.            505
    ## 15 Portugal                      177.              87349.            494
    ## 16 France                        176.              88833.            506
    ## 17 United Kingdom                174.              87789.            504
    ## 18 Hungary                       166.              81035.            487
    ## 19 Austria                       159.              79172.            499
    ## 20 Poland                        152.              74847.            493

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1370     6987
    ##  2 Peru                 9.32     195146  2093754
    ##  3 Mexico               8.89     236331  2659137
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1905    25834
    ##  6 Egypt                5.80      16446   283703
    ##  7 Somalia              5.16        781    15123
    ##  8 China                4.69       5617   119784
    ##  9 Ecuador              4.61      21953   476065
    ## 10 Afghanistan          4.40       6266   142414
    ## 11 Bulgaria             4.30      18177   423078
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.78      17458   462154
    ## 14 Hungary              3.71      30019   808889
    ## 15 Mali                 3.65        530    14514
    ## 16 Chad                 3.51        174     4964
    ## 17 Niger                3.47        194     5590
    ## 18 Paraguay             3.21      14288   444992
    ## 19 Tunisia              3.21      17527   546233
    ## 20 Slovakia             3.20      12531   392139

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6525.     195146   29.9 
    ##  2 Hungary                3007.      30019    9.98
    ##  3 Czech Republic         2896.      30341   10.5 
    ##  4 Brazil                 2696.     542214  201.  
    ##  5 Bulgaria               2543.      18177    7.15
    ##  6 Argentina              2456.     101549   41.3 
    ##  7 Colombia               2434.     116307   47.8 
    ##  8 Belgium                2424.      25213   10.4 
    ##  9 Slovakia               2297.      12531    5.46
    ## 10 Paraguay               2241.      14288    6.38
    ## 11 Italy                  2119.     127874   60.3 
    ## 12 Mexico                 2101.     236331  112.  
    ## 13 United Kingdom         2065.     128727   62.3 
    ## 14 Chile                  2062.      34539   16.7 
    ## 15 Poland                 1954.      75219   38.5 
    ## 16 United States          1947.     603880  310.  
    ## 17 Bolivia                1755.      17458    9.95
    ## 18 Spain                  1744.      81119   46.5 
    ## 19 France                 1706.     110513   64.8 
    ## 20 Tunisia                1655.      17527   10.6

EOL
