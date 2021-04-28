WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2021-04-29

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
    ##  1 United States           75495. 31783375            421
    ##  2 India                   43896. 17997267            410
    ##  3 Brazil                  34962. 14369423            411
    ##  4 France                  12879.  5447883            423
    ##  5 Russia                  11791.  4787273            406
    ##  6 Turkey                  11602.  4710582            406
    ##  7 United Kingdom          10474.  4409635            421
    ##  8 Italy                    9259.  3981512            430
    ##  9 Spain                    8284.  3496134            422
    ## 10 Germany                  7859.  3332532            424
    ## 11 Argentina                7110.  2879677            405
    ## 12 Colombia                 6865.  2787303            406
    ## 13 Poland                   6773.  2776927            410
    ## 14 Mexico                   5737.  2329534            406
    ## 15 Iran                     5696.  2438193            428
    ## 16 Ukraine                  5119.  2047838            400
    ## 17 Peru                     4344.  1768186            407
    ## 18 Indonesia                4038.  1651794            409
    ## 19 Czech Republic           3946.  1626033            412
    ## 20 South Africa             3884.  1577200            406

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                377.             155215.            412
    ##  2 Israel                        277.             113991.            411
    ##  3 Jordan                        274.             110246.            402
    ##  4 United States                 243.             102450.            421
    ##  5 Sweden                        239.              99756.            417
    ##  6 Serbia                        230.              93099.            405
    ##  7 Belgium                       224.              94111.            420
    ##  8 Netherlands                   212.              88475.            417
    ##  9 Switzerland                   204.              85868.            421
    ## 10 France                        199.              84113.            423
    ## 11 Hungary                       192.              77580.            404
    ## 12 Portugal                      190.              78212.            411
    ## 13 Austria                       178.              74156.            416
    ## 14 Spain                         178.              75176.            422
    ## 15 Poland                        176.              72128.            410
    ## 16 Brazil                        174.              71453.            411
    ## 17 Chile                         173.              70449.            408
    ## 18 Slovakia                      172.              69877.            405
    ## 19 Argentina                     172.              69653.            405
    ## 20 United Kingdom                168.              70726.            421

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1208     6224
    ##  2 Mexico                9.23     215113  2329534
    ##  3 Syria                 6.96       1559    22389
    ##  4 Sudan                 6.92       2349    33944
    ##  5 Egypt                 5.87      13168   224517
    ##  6 Somalia               5.12        713    13915
    ##  7 Ecuador               4.90      18389   375329
    ##  8 China                 4.69       4857   103529
    ##  9 Afghanistan           4.40       2611    59370
    ## 10 Bolivia               4.30      12861   298778
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1565    38164
    ## 13 Bulgaria              4.03      16182   401109
    ## 14 Niger                 3.67        191     5204
    ## 15 Chad                  3.56        170     4779
    ## 16 Hungary               3.51      27172   774399
    ## 17 Mali                  3.47        476    13722
    ## 18 Tunisia               3.44      10444   303584
    ## 19 South Africa          3.44      54237  1577200
    ## 20 Peru                  3.39      60013  1768186

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2782.      29141   10.5 
    ##  2 Hungary                2722.      27172    9.98
    ##  3 Belgium                2317.      24104   10.4 
    ##  4 Bulgaria               2264.      16182    7.15
    ##  5 Slovakia               2129.      11611    5.46
    ##  6 United Kingdom         2044.     127451   62.3 
    ##  7 Peru                   2007.      60013   29.9 
    ##  8 Italy                  1987.     119912   60.3 
    ##  9 Brazil                 1949.     391936  201.  
    ## 10 Mexico                 1913.     215113  112.  
    ## 11 United States          1829.     567327  310.  
    ## 12 Poland                 1728.      66533   38.5 
    ## 13 Spain                  1674.      77855   46.5 
    ## 14 Portugal               1590.      16970   10.7 
    ## 15 France                 1589.     102890   64.8 
    ## 16 Chile                  1554.      26020   16.7 
    ## 17 Colombia               1502.      71799   47.8 
    ## 18 Argentina              1502.      62087   41.3 
    ## 19 Sweden                 1462.      13968    9.56
    ## 20 Jordan                 1359.       8707    6.41

EOL
