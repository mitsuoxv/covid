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

Updated: 2022-06-08

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
    ##  1 United States          101515. 83851879            826
    ##  2 India                   52988. 43185049            815
    ##  3 Brazil                  38279. 31159335            814
    ##  4 France                  34700. 28731486            828
    ##  5 Germany                 31926. 26498346            830
    ##  6 United Kingdom          27045. 22338950            826
    ##  7 Russia                  22637. 18358459            811
    ##  8 South Korea             21688. 18174880            838
    ##  9 Italy                   20975. 17514589            835
    ## 10 Turkey                  18586. 15073722            811
    ## 11 Spain                   14998. 12403245            827
    ## 12 Vietnam                 13291. 10726045            807
    ## 13 Argentina               11354.  9276618            817
    ## 14 Japan                   10701.  8957135            837
    ## 15 Netherlands              9842.  8090237            822
    ## 16 Australia                9078.  7425829            818
    ## 17 Iran                     8683.  7232790            833
    ## 18 Colombia                 7542.  6109105            810
    ## 19 Indonesia                7432.  6057142            815
    ## 20 Poland                   7373.  6009003            815

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       698.             572334.            820
    ##  2 Israel                        691.             565305.            818
    ##  3 Austria                       640.             524864.            820
    ##  4 Netherlands                   591.             486046.            822
    ##  5 Switzerland                   584.             482463.            826
    ##  6 Portugal                      557.             453937.            815
    ##  7 France                        536.             443604.            828
    ##  8 Belgium                       485.             399765.            825
    ##  9 Czech Republic                458.             374335.            817
    ## 10 South Korea                   448.             375338.            838
    ## 11 United Kingdom                434.             358292.            826
    ## 12 Australia                     422.             345135.            818
    ## 13 Slovakia                      405.             328217.            811
    ## 14 Germany                       390.             323932.            830
    ## 15 Greece                        386.             315740.            817
    ## 16 Italy                         348.             290263.            835
    ## 17 Norway                        348.             286435.            824
    ## 18 Serbia                        339.             274872.            810
    ## 19 Jordan                        328.             264905.            807
    ## 20 United States                 327.             270287.            826

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4942    62399
    ##  3 Peru                 5.95     213259  3585381
    ##  4 Syria                5.64       3150    55899
    ##  5 Mexico               5.61     325017  5791282
    ##  6 Somalia              5.12       1361    26565
    ##  7 Egypt                4.81      24719   513975
    ##  8 Afghanistan          4.27       7709   180741
    ##  9 Ecuador              4.03      35649   885112
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37182  1166148
    ## 12 Myanmar              3.17      19434   613387
    ## 13 Malawi               3.07       2642    86001
    ## 14 Paraguay             2.90      18911   651268
    ## 15 Tunisia              2.75      28641  1042872
    ## 16 Haiti                2.70        835    30892
    ## 17 Chad                 2.60        193     7417
    ## 18 Indonesia            2.59     156622  6057142
    ## 19 Algeria              2.59       6875   265897
    ## 20 Honduras             2.56      10900   425471

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7131.     213259   29.9 
    ##  2 Bulgaria               5201.      37182    7.15
    ##  3 Hungary                4663.      46547    9.98
    ##  4 Czech Republic         3846.      40294   10.5 
    ##  5 Slovakia               3686.      20105    5.46
    ##  6 Chile                  3463.      57991   16.7 
    ##  7 Brazil                 3317.     667005  201.  
    ##  8 United States          3220.     998977  310.  
    ##  9 Argentina              3120.     128973   41.3 
    ## 10 Belgium                3054.      31768   10.4 
    ## 11 Poland                 3022.     116355   38.5 
    ## 12 Romania                2992.      65693   22.0 
    ## 13 Paraguay               2966.      18911    6.38
    ## 14 Colombia               2927.     139867   47.8 
    ## 15 Mexico                 2890.     325017  112.  
    ## 16 United Kingdom         2869.     178866   62.3 
    ## 17 Italy                  2768.     167019   60.3 
    ## 18 Greece                 2721.      29927   11   
    ## 19 Tunisia                2705.      28641   10.6 
    ## 20 Russia                 2698.     379657  141.

EOL
