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

Updated: 2022-05-25

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
    ##  1 United States          101501. 82418967            812
    ##  2 India                   53858. 43140068            801
    ##  3 Brazil                  38489. 30791220            800
    ##  4 France                  35000. 28490162            814
    ##  5 Germany                 31997. 26109965            816
    ##  6 United Kingdom          27419. 22264684            812
    ##  7 Russia                  22963. 18301393            797
    ##  8 South Korea             21837. 17993985            824
    ##  9 Italy                   21020. 17257573            821
    ## 10 Turkey                  18901. 15064220            797
    ## 11 Spain                   15105. 12280345            813
    ## 12 Vietnam                 13506. 10710066            793
    ## 13 Argentina               11431.  9178795            803
    ## 14 Japan                   10500.  8641599            823
    ## 15 Netherlands              9997.  8077873            808
    ## 16 Iran                     8828.  7230321            819
    ## 17 Australia                8681.  6979827            804
    ## 18 Colombia                 7662.  6099111            796
    ## 19 Indonesia                7557.  6053109            801
    ## 20 Poland                   7498.  6006015            801

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       708.             570925.            806
    ##  2 Israel                        698.             561025.            804
    ##  3 Austria                       646.             520913.            806
    ##  4 Netherlands                   601.             485303.            808
    ##  5 Switzerland                   592.             480491.            812
    ##  6 France                        540.             439878.            814
    ##  7 Portugal                      527.             422332.            801
    ##  8 Belgium                       491.             398290.            811
    ##  9 Czech Republic                466.             374049.            803
    ## 10 South Korea                   451.             371603.            824
    ## 11 United Kingdom                440.             357101.            812
    ## 12 Slovakia                      411.             327898.            797
    ## 13 Australia                     403.             324405.            804
    ## 14 Germany                       391.             319184.            816
    ## 15 Greece                        387.             311112.            803
    ## 16 Norway                        353.             285774.            810
    ## 17 Italy                         348.             286004.            821
    ## 18 Serbia                        345.             274394.            796
    ## 19 Jordan                        334.             264811.            793
    ## 20 United States                 327.             265668.            812

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4941    62240
    ##  3 Peru                  5.96     213106  3576042
    ##  4 Mexico                5.64     324768  5759773
    ##  5 Syria                 5.64       3150    55880
    ##  6 Somalia               5.13       1361    26521
    ##  7 Egypt                 4.81      24704   513916
    ##  8 Afghanistan           4.28       7698   179771
    ##  9 Ecuador               4.07      35617   874599
    ## 10 Niger                 3.43        310     9031
    ## 11 Bulgaria              3.19      37106  1163706
    ## 12 Myanmar               3.17      19434   613227
    ## 13 Malawi                3.07       2638    85933
    ## 14 Paraguay              2.90      18885   650283
    ## 15 Tunisia               2.75      28628  1041789
    ## 16 Haiti                 2.72        835    30746
    ## 17 Chad                  2.60        193     7417
    ## 18 Indonesia             2.59     156548  6053109
    ## 19 Algeria               2.59       6875   265855
    ## 20 South Africa          2.57     100952  3931534

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7126.     213106   29.9 
    ##  2 Bulgaria               5191.      37106    7.15
    ##  3 Hungary                4653.      46446    9.98
    ##  4 Czech Republic         3844.      40270   10.5 
    ##  5 Slovakia               3682.      20083    5.46
    ##  6 Chile                  3452.      57810   16.7 
    ##  7 Brazil                 3310.     665627  201.  
    ##  8 United States          3206.     994530  310.  
    ##  9 Argentina              3116.     128825   41.3 
    ## 10 Belgium                3048.      31710   10.4 
    ## 11 Poland                 3020.     116284   38.5 
    ## 12 Romania                2990.      65654   22.0 
    ## 13 Paraguay               2962.      18885    6.38
    ## 14 Colombia               2926.     139833   47.8 
    ## 15 Mexico                 2888.     324768  112.  
    ## 16 United Kingdom         2856.     178085   62.3 
    ## 17 Italy                  2752.     166032   60.3 
    ## 18 Tunisia                2704.      28628   10.6 
    ## 19 Greece                 2701       29711   11   
    ## 20 Russia                 2690.     378516  141.

EOL
