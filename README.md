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

Updated: 2022-06-24

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
    ##  1 United States          101594. 85542508            842
    ##  2 India                   52144. 43331645            831
    ##  3 Brazil                  38336. 31818827            830
    ##  4 France                  34759. 29336888            844
    ##  5 Germany                 32593. 27573585            846
    ##  6 United Kingdom          26766. 22537276            842
    ##  7 Russia                  22261. 18409651            827
    ##  8 South Korea             21435. 18305783            854
    ##  9 Italy                   21168. 18014202            851
    ## 10 Turkey                  18241. 15085742            827
    ## 11 Spain                   14963. 12613634            843
    ## 12 Vietnam                 13048. 10738909            823
    ## 13 Argentina               11214.  9341492            833
    ## 14 Japan                   10775.  9191098            853
    ## 15 Netherlands              9716.  8142105            838
    ## 16 Australia                9452.  7883197            834
    ## 17 Iran                     8522.  7235440            849
    ## 18 Colombia                 7423.  6131657            826
    ## 19 Indonesia                7308.  6072918            831
    ## 20 Poland                   7235.  6012289            831

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        696.             580647.            834
    ##  2 Denmark                       689.             575844.            836
    ##  3 Austria                       640.             535180.            836
    ##  4 Netherlands                   584.             489162.            838
    ##  5 Switzerland                   581.             489236.            842
    ##  6 Portugal                      574.             477175.            831
    ##  7 France                        537.             452951.            844
    ##  8 Belgium                       480.             403474.            841
    ##  9 Czech Republic                450.             374882.            833
    ## 10 South Korea                   443.             378042.            854
    ## 11 Australia                     439.             366392.            834
    ## 12 United Kingdom                429.             361473.            842
    ## 13 Germany                       398.             337076.            846
    ## 14 Slovakia                      398.             328757.            827
    ## 15 Greece                        390.             324823.            833
    ## 16 Italy                         351.             298543.            851
    ## 17 Norway                        342.             287706.            840
    ## 18 Serbia                        334.             275552.            826
    ## 19 United States                 327.             275736.            842
    ## 20 Jordan                        322.             265068.            823

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.92       4951    62551
    ##  3 Peru                 5.92     213405  3603127
    ##  4 Syria                5.63       3150    55918
    ##  5 Mexico               5.52     325458  5891589
    ##  6 Somalia              5.09       1361    26748
    ##  7 Egypt                4.81      24722   514047
    ##  8 Afghanistan          4.24       7715   181934
    ##  9 Ecuador              3.97      35695   898667
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.18      37235  1169154
    ## 12 Myanmar              3.17      19434   613521
    ## 13 Malawi               3.07       2644    86204
    ## 14 Paraguay             2.90      18947   653428
    ## 15 Tunisia              2.74      28670  1046703
    ## 16 Haiti                2.68        837    31226
    ## 17 Chad                 2.60        193     7424
    ## 18 Algeria              2.58       6875   266006
    ## 19 Indonesia            2.58     156702  6072918
    ## 20 Honduras             2.56      10903   425930

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7136.     213405   29.9 
    ##  2 Bulgaria               5209.      37235    7.15
    ##  3 Hungary                4671.      46626    9.98
    ##  4 Czech Republic         3848.      40310   10.5 
    ##  5 Slovakia               3692.      20142    5.46
    ##  6 Chile                  3481.      58296   16.7 
    ##  7 Brazil                 3329.     669390  201.  
    ##  8 United States          3238.    1004390  310.  
    ##  9 Argentina              3121.     129016   41.3 
    ## 10 Belgium                3063.      31868   10.4 
    ## 11 Poland                 3024.     116405   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2972.      18947    6.38
    ## 14 Colombia               2928.     139918   47.8 
    ## 15 Mexico                 2894.     325458  112.  
    ## 16 United Kingdom         2882.     179713   62.3 
    ## 17 Italy                  2782.     167892   60.3 
    ## 18 Greece                 2739.      30124   11   
    ## 19 Tunisia                2708.      28670   10.6 
    ## 20 Russia                 2706.     380711  141.

EOL
