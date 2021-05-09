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

Updated: 2021-05-10

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
    ##  1 United States           74770. 32300609            432
    ##  2 India                   52960. 22296414            421
    ##  3 Brazil                  35740. 15082449            422
    ##  4 France                  13079.  5676293            434
    ##  5 Turkey                  12029.  5016141            417
    ##  6 Russia                  11703.  4880262            417
    ##  7 United Kingdom          10262.  4433094            432
    ##  8 Italy                    9303.  4102921            441
    ##  9 Spain                    8220.  3559222            433
    ## 10 Germany                  8092.  3520329            435
    ## 11 Argentina                7495.  3118134            416
    ## 12 Colombia                 7119.  2968626            417
    ## 13 Poland                   6729.  2833052            421
    ## 14 Iran                     6015.  2640670            439
    ## 15 Mexico                   5664.  2361874            417
    ## 16 Ukraine                  5157.  2119510            411
    ## 17 Peru                     4400.  1839465            418
    ## 18 Indonesia                4071.  1709762            420
    ## 19 Czech Republic           3889.  1645061            423
    ## 20 South Africa             3824.  1594817            417

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                371.             157031.            423
    ##  2 Jordan                        272.             112256.            413
    ##  3 Israel                        270.             114072.            422
    ##  4 Sweden                        246.             105463.            428
    ##  5 United States                 241.             104117.            432
    ##  6 Serbia                        229.              95247.            416
    ##  7 Belgium                       226.              97506.            431
    ##  8 Netherlands                   218.              93329.            428
    ##  9 Switzerland                   204.              88057.            432
    ## 10 France                        202.              87640.            434
    ## 11 Hungary                       191.              79314.            415
    ## 12 Portugal                      186.              78612.            422
    ## 13 Argentina                     181.              75421.            416
    ## 14 Austria                       179.              76303.            427
    ## 15 Brazil                        178.              74999.            422
    ## 16 Spain                         177.              76533.            433
    ## 17 Chile                         176.              73793.            419
    ## 18 Poland                        175.              73586.            421
    ## 19 Slovakia                      170.              70665.            416
    ## 20 United Kingdom                165.              71102.            432

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1271     6466
    ##  2 Mexico                9.26     218657  2361874
    ##  3 Syria                 7.07       1648    23319
    ##  4 Sudan                 6.86       2365    34461
    ##  5 Egypt                 5.86      13845   236272
    ##  6 Somalia               5.18        747    14415
    ##  7 Ecuador               4.80      19137   398921
    ##  8 China                 4.68       4858   103796
    ##  9 Afghanistan           4.34       2686    61842
    ## 10 Bolivia               4.17      13182   316153
    ## 11 Tanzania              4.13         21      509
    ## 12 Bulgaria              4.12      16902   409961
    ## 13 Zimbabwe              4.10       1576    38414
    ## 14 Hungary               3.61      28602   791709
    ## 15 Niger                 3.61        192     5319
    ## 16 Tunisia               3.55      11350   319512
    ## 17 Mali                  3.54        499    14082
    ## 18 Chad                  3.51        171     4874
    ## 19 Peru                  3.45      63519  1839465
    ## 20 South Africa          3.43      54724  1594817

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2865.      28602    9.98
    ##  2 Czech Republic         2832.      29667   10.5 
    ##  3 Bulgaria               2364.      16902    7.15
    ##  4 Belgium                2356.      24511   10.4 
    ##  5 Slovakia               2203.      12019    5.46
    ##  6 Peru                   2124.      63519   29.9 
    ##  7 Brazil                 2084.     419114  201.  
    ##  8 United Kingdom         2047.     127603   62.3 
    ##  9 Italy                  2033.     122694   60.3 
    ## 10 Mexico                 1944.     218657  112.  
    ## 11 United States          1854.     575322  310.  
    ## 12 Poland                 1818.      70012   38.5 
    ## 13 Spain                  1693.      78726   46.5 
    ## 14 France                 1630.     105544   64.8 
    ## 15 Argentina              1617.      66872   41.3 
    ## 16 Chile                  1614.      27021   16.7 
    ## 17 Colombia               1608.      76867   47.8 
    ## 18 Portugal               1592.      16991   10.7 
    ## 19 Sweden                 1483.      14173    9.56
    ## 20 Jordan                 1417.       9076    6.41

EOL
