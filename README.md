WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-09-15

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
    ##  1 United States          101704. 94076111            925
    ##  2 India                   48698. 44510057            914
    ##  3 Brazil                  37825. 34533957            913
    ##  4 France                  36389. 33732515            927
    ##  5 Germany                 35047. 32558479            929
    ##  6 South Korea             25719. 24099134            937
    ##  7 United Kingdom          25465. 23554971            925
    ##  8 Italy                   23638. 22077601            934
    ##  9 Russia                  22207. 20208878            910
    ## 10 Japan                   21688. 20300387            936
    ## 11 Turkey                  18519. 16852382            910
    ## 12 Spain                   14443. 13374116            926
    ## 13 Vietnam                 12632. 11444927            906
    ## 14 Australia               11027. 10112229            917
    ## 15 Argentina               10587.  9697763            916
    ## 16 Netherlands              9122.  8401272            921
    ## 17 Iran                     8090.  7540316            932
    ## 18 Mexico                   7707.  7059936            916
    ## 19 China                    7140.  6926201            970
    ## 20 Indonesia                7002.  6400035            914

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        689.             631732.            917
    ##  2 Austria                       663.             608966.            919
    ##  3 Denmark                       651.             598621.            919
    ##  4 Switzerland                   578.             534758.            925
    ##  5 France                        562.             520818.            927
    ##  6 Portugal                      558.             510356.            914
    ##  7 Netherlands                   548.             504732.            921
    ##  8 South Korea                   531.             497683.            937
    ##  9 Australia                     513.             469992.            917
    ## 10 Greece                        480.             439892.            916
    ## 11 Belgium                       469.             432962.            924
    ## 12 Germany                       428.             398014.            929
    ## 13 Czech Republic                424.             388104.            916
    ## 14 United Kingdom                408.             377796.            925
    ## 15 Italy                         392.             365885.            934
    ## 16 Slovakia                      370.             336947.            910
    ## 17 Serbia                        348.             316119.            909
    ## 18 United States                 328.             303244.            925
    ## 19 Norway                        316.             291697.            923
    ## 20 Spain                         311.             287579.            926

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11932
    ##  2 Sudan                 7.84       4961    63275
    ##  3 Syria                 5.53       3163    57189
    ##  4 Peru                  5.24     216151  4126462
    ##  5 Somalia               5.00       1361    27197
    ##  6 Egypt                 4.81      24796   515348
    ##  7 Mexico                4.67     329767  7059936
    ##  8 Afghanistan           3.97       7791   196404
    ##  9 Ecuador               3.59      35876   998202
    ## 10 Niger                 3.32        312     9388
    ## 11 Myanmar               3.15      19444   617739
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.01      37658  1249706
    ## 14 Paraguay              2.73      19530   715806
    ## 15 Tunisia               2.55      29243  1145163
    ## 16 Chad                  2.55        193     7558
    ## 17 South Africa          2.54     102129  4014724
    ## 18 Haiti                 2.54        857    33702
    ## 19 Algeria               2.54       6879   270561
    ## 20 Sri Lanka             2.50      16737   670519

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7227.     216151   29.9 
    ##  2 Bulgaria               5268.      37658    7.15
    ##  3 Hungary                4749.      47409    9.98
    ##  4 Czech Republic         3906.      40924   10.5 
    ##  5 Slovakia               3744.      20421    5.46
    ##  6 Chile                  3632.      60822   16.7 
    ##  7 Brazil                 3406.     684898  201.  
    ##  8 United States          3352.    1039882  310.  
    ##  9 Argentina              3140.     129830   41.3 
    ## 10 Belgium                3134.      32605   10.4 
    ## 11 Paraguay               3063.      19530    6.38
    ## 12 Poland                 3047.     117299   38.5 
    ## 13 Romania                3045.      66874   22.0 
    ## 14 United Kingdom         3032.     189026   62.3 
    ## 15 Greece                 2990.      32894   11   
    ## 16 Colombia               2965.     141708   47.8 
    ## 17 Mexico                 2932.     329767  112.  
    ## 18 Italy                  2922.     176335   60.3 
    ## 19 Tunisia                2762.      29243   10.6 
    ## 20 Russia                 2741.     385628  141.

EOL
