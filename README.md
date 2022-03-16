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

Updated: 2022-03-17

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          106144. 78865157            743
    ##  2 India                   58742. 42998938            732
    ##  3 Brazil                  40082. 29380063            733
    ##  4 France                  30790. 22938532            745
    ##  5 United Kingdom          26676. 19820185            743
    ##  6 Russia                  23969. 17449438            728
    ##  7 Germany                 23720. 17695210            746
    ##  8 Turkey                  20054. 14599792            728
    ##  9 Italy                   17938. 13489319            752
    ## 10 Spain                   15134. 11260125            744
    ## 11 Argentina               12354.  8981155            727
    ## 12 South Korea             10105.  7629275            755
    ## 13 Netherlands              9833.  7266972            739
    ## 14 Iran                     9507.  7130129            750
    ## 15 Vietnam                  9051.  6552918            724
    ## 16 Colombia                 8348.  6077288            728
    ## 17 Indonesia                8098.  5927550            732
    ## 18 Poland                   7993.  5851147            732
    ## 19 Japan                    7703.  5808242            754
    ## 20 Mexico                   7640.  5607845            734

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       734.             541292.            737
    ##  2 Israel                        691.             507659.            735
    ##  3 Netherlands                   591.             436586.            739
    ##  4 Switzerland                   560.             416358.            743
    ##  5 Austria                       539.             396914.            737
    ##  6 Czech Republic                482.             353913.            734
    ##  7 Belgium                       475.             352779.            742
    ##  8 France                        475.             354162.            745
    ##  9 Portugal                      436.             319690.            733
    ## 10 United Kingdom                428.             317894.            743
    ## 11 Slovakia                      402.             292881.            728
    ## 12 Norway                        366.             270959.            741
    ## 13 Serbia                        364.             264831.            727
    ## 14 Jordan                        362.             262238.            724
    ## 15 Sweden                        350.             258506.            739
    ## 16 United States                 342.             254213.            743
    ## 17 Greece                        333.             244083.            734
    ## 18 Spain                         325.             242122.            744
    ## 19 Argentina                     299.             217234.            727
    ## 20 Italy                         297.             223554.            752

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2139    11793
    ##  2 Sudan                 7.90       4874    61715
    ##  3 Peru                  5.98     211579  3536842
    ##  4 Mexico                5.73     321115  5607845
    ##  5 Syria                 5.63       3118    55431
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.90      24277   495373
    ##  8 Afghanistan           4.33       7646   176571
    ##  9 Ecuador               4.16      35347   849386
    ## 10 Niger                 3.51        308     8781
    ## 11 Bulgaria              3.24      36196  1117525
    ## 12 Myanmar               3.20      19414   606910
    ## 13 Malawi                3.07       2624    85515
    ## 14 Paraguay              2.87      18548   646054
    ## 15 Tunisia               2.73      28065  1029762
    ## 16 Haiti                 2.71        827    30473
    ## 17 South Africa          2.70      99727  3696823
    ## 18 El Salvador           2.62       4101   156364
    ## 19 Chad                  2.61        190     7269
    ## 20 Honduras              2.60      10842   417201

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7075.     211579   29.9 
    ##  2 Bulgaria               5063.      36196    7.15
    ##  3 Hungary                4491.      44831    9.98
    ##  4 Czech Republic         3746.      39248   10.5 
    ##  5 Slovakia               3485.      19009    5.46
    ##  6 Brazil                 3258.     655249  201.  
    ##  7 United States          3090.     958609  310.  
    ##  8 Argentina              3079.     127295   41.3 
    ##  9 Poland                 2955.     113773   38.5 
    ## 10 Romania                2935.      64450   22.0 
    ## 11 Belgium                2929.      30472   10.4 
    ## 12 Colombia               2915.     139315   47.8 
    ## 13 Paraguay               2909.      18548    6.38
    ## 14 Mexico                 2855.     321115  112.  
    ## 15 Tunisia                2650.      28065   10.6 
    ## 16 Chile                  2630.      44039   16.7 
    ## 17 United Kingdom         2616.     163095   62.3 
    ## 18 Italy                  2605.     157177   60.3 
    ## 19 Russia                 2576.     362478  141.  
    ## 20 Greece                 2426       26686   11

EOL
