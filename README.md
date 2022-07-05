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

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-07-06

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
    ##  1 United States          101542. 86717355            854
    ##  2 India                   51639. 43531650            843
    ##  3 Brazil                  38587. 32490422            842
    ##  4 France                  35651. 30517757            856
    ##  5 Germany                 33266. 28542484            858
    ##  6 United Kingdom          26629. 22741517            854
    ##  7 Russia                  21985. 18445301            839
    ##  8 Italy                   21791. 18805756            863
    ##  9 South Korea             21263. 18413997            866
    ## 10 Turkey                  18093. 15180444            839
    ## 11 Spain                   14992. 12818184            855
    ## 12 Vietnam                 12873. 10749324            835
    ## 13 Argentina               11085.  9367172            845
    ## 14 Japan                   10889.  9418900            865
    ## 15 Australia                9753.  8250740            846
    ## 16 Netherlands              9652.  8203996            850
    ## 17 Iran                     8409.  7240564            861
    ## 18 Colombia                 7369.  6175181            838
    ## 19 Indonesia                7233.  6097928            843
    ## 20 Mexico                   7206.  6089600            845

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        707.             597908.            846
    ##  2 Denmark                       683.             579411.            848
    ##  3 Austria                       648.             549297.            848
    ##  4 Netherlands                   580.             492881.            850
    ##  5 Switzerland                   578.             493586.            854
    ##  6 Portugal                      578.             487206.            843
    ##  7 France                        550.             471183.            856
    ##  8 Belgium                       481.             410006.            853
    ##  9 Australia                     453.             383474.            846
    ## 10 Czech Republic                445.             375799.            845
    ## 11 South Korea                   439.             380277.            866
    ## 12 United Kingdom                427.             364749.            854
    ## 13 Germany                       407.             348920.            858
    ## 14 Greece                        401.             339018.            845
    ## 15 Slovakia                      393.             329630.            839
    ## 16 Italy                         361.             311661.            863
    ## 17 Norway                        339.             289117.            852
    ## 18 Serbia                        330.             276817.            838
    ## 19 United States                 327.             279523.            854
    ## 20 Spain                         322.             275625.            855

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11832
    ##  2 Sudan                7.90       4952    62704
    ##  3 Peru                 5.87     213551  3637529
    ##  4 Syria                5.63       3150    55934
    ##  5 Mexico               5.35     325788  6089600
    ##  6 Somalia              5.08       1361    26803
    ##  7 Egypt                4.81      24724   514133
    ##  8 Afghanistan          4.23       7725   182793
    ##  9 Ecuador              3.93      35725   909882
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.17      37260  1174216
    ## 12 Myanmar              3.17      19434   613672
    ## 13 Malawi               3.06       2646    86576
    ## 14 Paraguay             2.89      18963   655532
    ## 15 Tunisia              2.73      28691  1052180
    ## 16 Haiti                2.65        837    31603
    ## 17 Chad                 2.60        193     7426
    ## 18 Algeria              2.58       6875   266173
    ## 19 Indonesia            2.57     156766  6097928
    ## 20 Honduras             2.55      10906   427718

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7141.     213551   29.9 
    ##  2 Bulgaria               5212.      37260    7.15
    ##  3 Hungary                4673.      46647    9.98
    ##  4 Czech Republic         3849.      40324   10.5 
    ##  5 Slovakia               3694.      20152    5.46
    ##  6 Chile                  3500.      58617   16.7 
    ##  7 Brazil                 3341.     671911  201.  
    ##  8 United States          3251.    1008640  310.  
    ##  9 Argentina              3123.     129109   41.3 
    ## 10 Belgium                3071.      31952   10.4 
    ## 11 Poland                 3024.     116437   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2974.      18963    6.38
    ## 14 Colombia               2931.     140070   47.8 
    ## 15 Mexico                 2897.     325788  112.  
    ## 16 United Kingdom         2894.     180417   62.3 
    ## 17 Italy                  2794.     168604   60.3 
    ## 18 Greece                 2757       30327   11   
    ## 19 Russia                 2710.     381354  141.  
    ## 20 Tunisia                2710.      28691   10.6

EOL
