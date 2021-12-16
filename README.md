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

Updated: 2021-12-17

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
    ##  1 United States           76314. 49833416            653
    ##  2 India                   54079. 34718602            642
    ##  3 Brazil                  34519. 22195775            643
    ##  4 United Kingdom          16861. 11010290            653
    ##  5 Russia                  15880. 10131646            638
    ##  6 Turkey                  14264.  9100324            638
    ##  7 France                  12453.  8156841            655
    ##  8 Germany                 10168.  6670407            656
    ##  9 Argentina                8424.  5366522            637
    ## 10 Spain                    8246.  5393268            654
    ## 11 Colombia                 7990.  5097680            638
    ## 12 Italy                    7979.  5282076            662
    ## 13 Indonesia                6635.  4259857            642
    ## 14 Mexico                   6089.  3921682            644
    ## 15 Poland                   6080.  3903445            642
    ## 16 Ukraine                  5677.  3588147            632
    ## 17 South Africa             5064.  3231031            638
    ## 18 Netherlands              4500.  2920438            649
    ## 19 Philippines              4419.  2836915            642
    ## 20 Malaysia                 4178.  2703140            647

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                353.             227065.            644
    ##  2 Belgium                       292.             190341.            652
    ##  3 Israel                        286.             183952.            644
    ##  4 Serbia                        273.             174016.            637
    ##  5 United Kingdom                270.             176593.            653
    ##  6 Netherlands                   270.             175454.            649
    ##  7 United States                 246.             160632.            653
    ##  8 Austria                       233.             150641.            647
    ##  9 Switzerland                   232.             151577.            653
    ## 10 Slovakia                      228.             145585.            638
    ## 11 Argentina                     204.             129804.            637
    ## 12 Sweden                        200.             130049.            649
    ## 13 France                        192.             125939.            655
    ## 14 Hungary                       191.             121551.            636
    ## 15 Turkey                        183.             116965.            638
    ## 16 Spain                         177.             115969.            654
    ## 17 Portugal                      176.             112963.            643
    ## 18 Brazil                        172.             110370.            643
    ## 19 Colombia                      167.             106668.            638
    ## 20 Chile                         167.             106660.            640

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Peru                  8.95     201902  2256796
    ##  2 Mexico                7.57     296984  3921682
    ##  3 Ecuador               6.28      33570   534176
    ##  4 China                 4.41       5698   129332
    ##  5 Bulgaria              4.14      29847   720376
    ##  6 Niger                 3.76        270     7176
    ##  7 Malawi                3.67       2310    62933
    ##  8 Myanmar               3.64      19197   527503
    ##  9 Paraguay              3.56      16516   463926
    ## 10 Bolivia               3.48      19355   556765
    ## 11 Indonesia             3.38     143979  4259857
    ## 12 Mali                  3.36        634    18856
    ## 13 Romania               3.23      57935  1795418
    ## 14 Chad                  3.17        181     5703
    ## 15 El Salvador           3.13       3800   121267
    ## 16 Hungary               3.08      37376  1213318
    ## 17 Haiti                 2.94        762    25879
    ## 18 Russia                2.90     294024 10131646
    ## 19 Algeria               2.89       6165   213533
    ## 20 South Africa          2.79      90226  3231031

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6751.     201902   29.9 
    ##  2 Bulgaria               4175.      29847    7.15
    ##  3 Hungary                3744.      37376    9.98
    ##  4 Czech Republic         3334.      34923   10.5 
    ##  5 Brazil                 3068.     616970  201.  
    ##  6 Slovakia               2884.      15730    5.46
    ##  7 Argentina              2826.     116826   41.3 
    ##  8 Colombia               2704.     129205   47.8 
    ##  9 Belgium                2665.      27729   10.4 
    ## 10 Mexico                 2641.     296984  112.  
    ## 11 Romania                2638.      57935   22.0 
    ## 12 Paraguay               2590.      16516    6.38
    ## 13 United States          2554.     792371  310.  
    ## 14 United Kingdom         2354.     146791   62.3 
    ## 15 Poland                 2346.      90306   38.5 
    ## 16 Chile                  2313.      38727   16.7 
    ## 17 Ecuador                2270.      33570   14.8 
    ## 18 Italy                  2240.     135178   60.3 
    ## 19 Russia                 2090.     294024  141.  
    ## 20 Ukraine                2033.      92313   45.4

EOL
