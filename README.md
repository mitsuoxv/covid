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

Updated: 2021-10-13

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
    ##  1 India                   58901. 33985920            577
    ##  2 United Kingdom          13935.  8193773            588
    ##  3 Russia                  13670.  7832964            573
    ##  4 Turkey                  13045.  7475115            573
    ##  5 France                  11593.  6840163            590
    ##  6 Iran                     9607.  5716394            595
    ##  7 Spain                    8440.  4971311            589
    ##  8 Italy                    7876.  4701832            597
    ##  9 Indonesia                7330.  4229813            577
    ## 10 Germany                  7307.  4318355            591
    ## 11 South Africa             5082.  2912394            573
    ## 12 Poland                   5070.  2925425            577
    ## 13 Philippines              4636.  2674814            577
    ## 14 Ukraine                  4518.  2562085            567
    ## 15 Malaysia                 4031.  2346303            582
    ## 16 Iraq                     3509.  2024705            577
    ## 17 Netherlands              3470.  2026402            584
    ## 18 Thailand                 2999.  1730364            577
    ## 19 Czech Republic           2943.  1704003            579
    ## 20 Japan                    2857.  1711391            599

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             177909.            579
    ##  2 Czech Republic                281.             162658.            579
    ##  3 Serbia                        241.             137630.            572
    ##  4 Jordan                        229.             130289.            569
    ##  5 United Kingdom                223.             131419.            588
    ##  6 Netherlands                   208.             121742.            584
    ##  7 Sweden                        207.             121163.            584
    ##  8 Belgium                       207.             121750.            587
    ##  9 Switzerland                   190.             111741.            588
    ## 10 Spain                         181.             106896.            589
    ## 11 France                        179.             105610.            590
    ## 12 Portugal                      174.             100753.            578
    ## 13 Turkey                        168.              96076.            573
    ## 14 Austria                       159.              92479.            582
    ## 15 Hungary                       146.              83141.            571
    ## 16 Malaysia                      143.              82982.            582
    ## 17 Slovakia                      137.              78365.            572
    ## 18 Poland                        132.              75985.            577
    ## 19 Italy                         131.              77922.            597
    ## 20 Bulgaria                      128.              73346.            572

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.0        1782     9402
    ##  2 Sudan                 7.60       2955    38884
    ##  3 Syria                 6.31       2348    37229
    ##  4 Egypt                 5.66      17726   313259
    ##  5 Somalia               5.55       1180    21269
    ##  6 Afghanistan           4.65       7228   155540
    ##  7 China                 4.55       5695   125085
    ##  8 Bulgaria              4.16      21813   524333
    ##  9 Myanmar               3.78      18188   481230
    ## 10 Malawi                3.71       2290    61679
    ## 11 Hungary               3.65      30320   829911
    ## 12 Mali                  3.57        553    15491
    ## 13 Tunisia               3.53      25039   709866
    ## 14 Zimbabwe              3.52       4643   131875
    ## 15 Chad                  3.44        174     5061
    ## 16 Indonesia             3.38     142763  4229813
    ## 17 Niger                 3.34        204     6115
    ## 18 South Africa          3.03      88346  2912394
    ## 19 Slovakia              2.98      12752   427480
    ## 20 Romania               2.90      40071  1382531

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Bulgaria               3051.      21813    7.15
    ##  2 Hungary                3037.      30320    9.98
    ##  3 Czech Republic         2913.      30512   10.5 
    ##  4 Belgium                2470.      25695   10.4 
    ##  5 Tunisia                2365.      25039   10.6 
    ##  6 Slovakia               2338.      12752    5.46
    ##  7 United Kingdom         2210.     137763   62.3 
    ##  8 Italy                  2177.     131335   60.3 
    ##  9 Poland                 1972.      75918   38.5 
    ## 10 Spain                  1864.      86701   46.5 
    ## 11 Romania                1825.      40071   22.0 
    ## 12 South Africa           1803.      88346   49   
    ## 13 France                 1772.     114781   64.8 
    ## 14 Portugal               1691.      18048   10.7 
    ## 15 Jordan                 1688.      10818    6.41
    ## 16 Iran                   1597.     122868   76.9 
    ## 17 Sweden                 1560.      14905    9.56
    ## 18 Russia                 1552.     218345  141.  
    ## 19 Switzerland            1410.      10693    7.58
    ## 20 Greece                 1380.      15177   11

EOL
