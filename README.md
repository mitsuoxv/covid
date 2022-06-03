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

Updated: 2022-06-04

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
    ##  1 United States          101644. 83551386            822
    ##  2 India                   53229. 43168585            811
    ##  3 Brazil                  38346. 31060017            810
    ##  4 France                  34815. 28687573            824
    ##  5 Germany                 32024. 26452148            826
    ##  6 United Kingdom          27136. 22305897            822
    ##  7 Russia                  22731. 18343964            807
    ##  8 South Korea             21753. 18141835            834
    ##  9 Italy                   21008. 17457950            831
    ## 10 Turkey                  18678. 15073722            807
    ## 11 Spain                   15058. 12392538            823
    ## 12 Vietnam                 13353. 10722634            803
    ## 13 Argentina               11354.  9230573            813
    ## 14 Japan                   10676.  8893475            833
    ## 15 Netherlands              9888.  8088777            818
    ## 16 Australia                9019.  7341978            814
    ## 17 Iran                     8724.  7232268            829
    ## 18 Colombia                 7572.  6103455            806
    ## 19 Indonesia                7467.  6056017            811
    ## 20 Poland                   7408.  6008295            811

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       701.             572234.            816
    ##  2 Israel                        693.             563801.            814
    ##  3 Austria                       642.             523561.            816
    ##  4 Netherlands                   594.             485958.            818
    ##  5 Switzerland                   587.             482463.            822
    ##  6 Portugal                      552.             447314.            811
    ##  7 France                        538.             442926.            824
    ##  8 Belgium                       487.             399765.            821
    ##  9 Czech Republic                460.             374258.            813
    ## 10 South Korea                   449.             374656.            834
    ## 11 United Kingdom                435.             357762.            822
    ## 12 Australia                     419.             341237.            814
    ## 13 Slovakia                      407.             328142.            807
    ## 14 Germany                       391.             323367.            826
    ## 15 Greece                        387.             314639.            813
    ## 16 Norway                        349.             286273.            820
    ## 17 Italy                         348.             289325.            831
    ## 18 Serbia                        341.             274743.            806
    ## 19 Jordan                        330.             264853.            803
    ## 20 United States                 328.             269318.            822

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4942    62374
    ##  3 Peru                 5.95     213205  3581524
    ##  4 Syria                5.64       3150    55894
    ##  5 Mexico               5.62     324951  5779027
    ##  6 Somalia              5.12       1361    26565
    ##  7 Egypt                4.81      24718   513944
    ##  8 Afghanistan          4.27       7707   180419
    ##  9 Ecuador              4.06      35645   878196
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37153  1165538
    ## 12 Myanmar              3.17      19434   613355
    ## 13 Malawi               3.07       2641    85991
    ## 14 Paraguay             2.90      18894   650661
    ## 15 Tunisia              2.75      28641  1042872
    ## 16 Haiti                2.71        835    30818
    ## 17 Chad                 2.60        193     7417
    ## 18 Indonesia            2.59     156604  6056017
    ## 19 Algeria              2.59       6875   265889
    ## 20 Honduras             2.56      10899   425371

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7129.     213205   29.9 
    ##  2 Bulgaria               5197.      37153    7.15
    ##  3 Hungary                4663.      46547    9.98
    ##  4 Czech Republic         3846.      40290   10.5 
    ##  5 Slovakia               3685.      20103    5.46
    ##  6 Chile                  3459.      57920   16.7 
    ##  7 Brazil                 3316.     666801  201.  
    ##  8 United States          3217.     998070  310.  
    ##  9 Argentina              3118.     128889   41.3 
    ## 10 Belgium                3054.      31768   10.4 
    ## 11 Poland                 3022.     116338   38.5 
    ## 12 Romania                2991.      65686   22.0 
    ## 13 Paraguay               2963.      18894    6.38
    ## 14 Colombia               2926.     139854   47.8 
    ## 15 Mexico                 2889.     324951  112.  
    ## 16 United Kingdom         2867.     178749   62.3 
    ## 17 Italy                  2765.     166835   60.3 
    ## 18 Greece                 2715.      29869   11   
    ## 19 Tunisia                2705.      28641   10.6 
    ## 20 Russia                 2696.     379363  141.

EOL
