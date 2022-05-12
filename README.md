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

Updated: 2022-05-13

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
    ##  1 United States          101594. 81275614            800
    ##  2 India                   54643. 43113413            789
    ##  3 Brazil                  38825. 30594388            788
    ##  4 France                  35178. 28213067            802
    ##  5 Germany                 31832. 25592839            804
    ##  6 United Kingdom          27681. 22145161            800
    ##  7 Russia                  23242. 18245394            785
    ##  8 South Korea             21747. 17658794            812
    ##  9 Italy                   20909. 16915301            809
    ## 10 Turkey                  19170. 15048449            785
    ## 11 Spain                   15087. 12085127            801
    ## 12 Vietnam                 13676. 10681214            781
    ## 13 Argentina               11506.  9101319            791
    ## 14 Netherlands             10131.  8064424            796
    ## 15 Japan                   10077.  8172238            811
    ## 16 Iran                     8955.  7226672            807
    ## 17 Australia                7990.  6328508            792
    ## 18 Colombia                 7772.  6093645            784
    ## 19 Indonesia                7668.  6049876            789
    ## 20 Poland                   7607.  6002394            789

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       718.             569976.            794
    ##  2 Israel                        704.             557648.            792
    ##  3 Austria                       650.             516328.            794
    ##  4 Netherlands                   609.             484495.            796
    ##  5 Switzerland                   599.             479077.            800
    ##  6 France                        543.             435599.            802
    ##  7 Belgium                       493.             394317.            799
    ##  8 Portugal                      476.             376118.            790
    ##  9 Czech Republic                472.             373683.            791
    ## 10 South Korea                   449.             364680.            812
    ## 11 United Kingdom                444.             355184.            800
    ## 12 Slovakia                      417.             327466.            785
    ## 13 Germany                       389.             312862.            804
    ## 14 Greece                        388.             306892             791
    ## 15 Australia                     371.             294134.            792
    ## 16 Norway                        357.             285259.            798
    ## 17 Serbia                        349.             273852.            784
    ## 18 Italy                         347.             280332.            809
    ## 19 Jordan                        339.             264715.            781
    ## 20 Sweden                        329.             261942.            796

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4936    62161
    ##  3 Peru                  5.96     212968  3570339
    ##  4 Mexico                5.65     324465  5745652
    ##  5 Syria                 5.64       3150    55865
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.80      24669   513846
    ##  8 Afghanistan           4.29       7686   179131
    ##  9 Ecuador               4.09      35602   871046
    ## 10 Niger                 3.43        309     9005
    ## 11 Bulgaria              3.19      37019  1160706
    ## 12 Myanmar               3.17      19434   613088
    ## 13 Malawi                3.07       2635    85842
    ## 14 Paraguay              2.90      18872   649718
    ## 15 Tunisia               2.74      28575  1041197
    ## 16 Haiti                 2.72        835    30707
    ## 17 South Africa          2.60     100609  3862165
    ## 18 Chad                  2.60        193     7414
    ## 19 Algeria               2.59       6875   265806
    ## 20 Indonesia             2.59     156438  6049876

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7121.     212968   29.9 
    ##  2 Bulgaria               5178.      37019    7.15
    ##  3 Hungary                4643.      46343    9.98
    ##  4 Czech Republic         3841.      40237   10.5 
    ##  5 Slovakia               3668.      20011    5.46
    ##  6 Chile                  3444.      57667   16.7 
    ##  7 Brazil                 3304.     664390  201.  
    ##  8 United States          3194.     990973  310.  
    ##  9 Argentina              3114.     128729   41.3 
    ## 10 Belgium                3036.      31580   10.4 
    ## 11 Poland                 3018.     116175   38.5 
    ## 12 Romania                2987.      65589   22.0 
    ## 13 Paraguay               2960.      18872    6.38
    ## 14 Colombia               2925.     139809   47.8 
    ## 15 Mexico                 2885.     324465  112.  
    ## 16 United Kingdom         2836.     176835   62.3 
    ## 17 Italy                  2732.     164846   60.3 
    ## 18 Tunisia                2699.      28575   10.6 
    ## 19 Russia                 2682.     377359  141.  
    ## 20 Greece                 2679.      29471   11

EOL
