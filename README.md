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

Updated: 2022-06-15

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
    ##  1 United States          101552. 84593200            833
    ##  2 India                   52599. 43236695            822
    ##  3 Brazil                  38315. 31456865            821
    ##  4 France                  34663. 28943809            835
    ##  5 Germany                 32156. 26915085            837
    ##  6 United Kingdom          26903. 22410587            833
    ##  7 Russia                  22472. 18382380            818
    ##  8 South Korea             21584. 18239056            845
    ##  9 Italy                   20979. 17664043            842
    ## 10 Turkey                  18433. 15078186            818
    ## 11 Spain                   14963. 12478994            834
    ## 12 Vietnam                 13185. 10732429            814
    ## 13 Argentina               11303.  9313453            824
    ## 14 Japan                   10737.  9061936            844
    ## 15 Netherlands              9780.  8107944            829
    ## 16 Australia                9173.  7568100            825
    ## 17 Iran                     8612.  7233880            840
    ## 18 Colombia                 7488.  6117847            817
    ## 19 Indonesia                7375.  6062009            822
    ## 20 Poland                   7312.  6010411            822

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       694.             573636.            827
    ##  2 Israel                        691.             570302.            825
    ##  3 Austria                       638.             527808.            827
    ##  4 Netherlands                   588.             487110.            829
    ##  5 Switzerland                   581.             483808.            833
    ##  6 Portugal                      560.             460578.            822
    ##  7 France                        535.             446882.            835
    ##  8 Belgium                       483.             401561.            832
    ##  9 Czech Republic                455.             374522.            824
    ## 10 South Korea                   446.             376664.            845
    ## 11 United Kingdom                431.             359441.            833
    ## 12 Australia                     426.             351747.            825
    ## 13 Slovakia                      401.             328401.            818
    ## 14 Germany                       393.             329026.            837
    ## 15 Greece                        386.             318226.            824
    ## 16 Italy                         348.             292740.            842
    ## 17 Norway                        345.             286845.            831
    ## 18 Serbia                        337.             275104.            817
    ## 19 United States                 327.             272676.            833
    ## 20 Jordan                        325.             264968.            814

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4950    62475
    ##  3 Peru                 5.94     213324  3590882
    ##  4 Syria                5.63       3150    55907
    ##  5 Mexico               5.58     325194  5823844
    ##  6 Somalia              5.10       1361    26675
    ##  7 Egypt                4.81      24720   514008
    ##  8 Afghanistan          4.26       7710   181178
    ##  9 Ecuador              4.00      35658   890541
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37204  1167147
    ## 12 Myanmar              3.17      19434   613460
    ## 13 Malawi               3.07       2642    86107
    ## 14 Paraguay             2.90      18932   652044
    ## 15 Tunisia              2.75      28648  1043540
    ## 16 Haiti                2.70        837    31004
    ## 17 Chad                 2.60        193     7420
    ## 18 Algeria              2.59       6875   265937
    ## 19 Indonesia            2.58     156662  6062009
    ## 20 Honduras             2.56      10902   425655

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7133.     213324   29.9 
    ##  2 Bulgaria               5204.      37204    7.15
    ##  3 Hungary                4665.      46571    9.98
    ##  4 Czech Republic         3847.      40303   10.5 
    ##  5 Slovakia               3688.      20119    5.46
    ##  6 Chile                  3470.      58109   16.7 
    ##  7 Brazil                 3322.     668110  201.  
    ##  8 United States          3229.    1001598  310.  
    ##  9 Argentina              3120.     128994   41.3 
    ## 10 Belgium                3060.      31835   10.4 
    ## 11 Poland                 3023.     116380   38.5 
    ## 12 Romania                2993.      65714   22.0 
    ## 13 Paraguay               2969.      18932    6.38
    ## 14 Colombia               2927.     139894   47.8 
    ## 15 Mexico                 2891.     325194  112.  
    ## 16 United Kingdom         2875.     179274   62.3 
    ## 17 Italy                  2775.     167432   60.3 
    ## 18 Greece                 2729.      30020   11   
    ## 19 Tunisia                2705.      28648   10.6 
    ## 20 Russia                 2702.     380137  141.

EOL
