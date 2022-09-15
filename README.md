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

Updated: 2022-09-16

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
    ##  1 United States          101676. 94152573            926
    ##  2 India                   48652. 44516479            915
    ##  3 Brazil                  37795. 34544377            914
    ##  4 France                  36386. 33766090            928
    ##  5 Germany                 35059. 32604993            930
    ##  6 South Korea             25868. 24264470            938
    ##  7 United Kingdom          25437. 23554971            926
    ##  8 Italy                   23632. 22096450            935
    ##  9 Russia                  22245. 20265004            911
    ## 10 Japan                   21771. 20399933            937
    ## 11 Turkey                  18499. 16852382            911
    ## 12 Spain                   14427. 13374116            927
    ## 13 Vietnam                 12622. 11448034            907
    ## 14 Australia               11015. 10112229            918
    ## 15 Argentina               10575.  9697763            917
    ## 16 Netherlands              9112.  8401272            922
    ## 17 Iran                     8082.  7540962            933
    ## 18 Mexico                   7699.  7059936            917
    ## 19 China                    7187.  6978307            971
    ## 20 Indonesia                6997.  6402686            915

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        688.             631885.            918
    ##  2 Austria                       663.             609732.            920
    ##  3 Denmark                       651.             598779.            920
    ##  4 Switzerland                   577.             534758.            926
    ##  5 France                        562.             521336.            928
    ##  6 Portugal                      558.             510628.            915
    ##  7 Netherlands                   547.             504732.            922
    ##  8 South Korea                   534.             501098.            938
    ##  9 Australia                     512.             469992.            918
    ## 10 Greece                        480.             439892.            917
    ## 11 Belgium                       468.             432962.            925
    ## 12 Germany                       429.             398583.            930
    ## 13 Czech Republic                423.             388355.            917
    ## 14 United Kingdom                408.             377796.            926
    ## 15 Italy                         392.             366197.            935
    ## 16 Slovakia                      370.             337011.            911
    ## 17 Serbia                        348.             316510.            910
    ## 18 United States                 328.             303490.            926
    ## 19 Norway                        316.             291706.            924
    ## 20 Spain                         310.             287579.            927

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11932
    ##  2 Sudan                 7.84       4961    63275
    ##  3 Syria                 5.53       3163    57197
    ##  4 Peru                  5.24     216173  4127612
    ##  5 Somalia               5.00       1361    27197
    ##  6 Egypt                 4.81      24796   515348
    ##  7 Mexico                4.67     329767  7059936
    ##  8 Afghanistan           3.96       7791   196663
    ##  9 Ecuador               3.59      35884   999837
    ## 10 Niger                 3.32        312     9388
    ## 11 Myanmar               3.15      19444   617739
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.01      37663  1250250
    ## 14 Paraguay              2.73      19530   715806
    ## 15 Tunisia               2.55      29243  1145163
    ## 16 Chad                  2.55        193     7558
    ## 17 South Africa          2.54     102129  4014986
    ## 18 Haiti                 2.54        857    33702
    ## 19 Algeria               2.54       6879   270570
    ## 20 Sri Lanka             2.50      16737   670519

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7228.     216173   29.9 
    ##  2 Bulgaria               5268.      37663    7.15
    ##  3 Hungary                4749.      47409    9.98
    ##  4 Czech Republic         3907.      40932   10.5 
    ##  5 Slovakia               3744.      20426    5.46
    ##  6 Chile                  3632.      60830   16.7 
    ##  7 Brazil                 3406.     685002  201.  
    ##  8 United States          3354.    1040506  310.  
    ##  9 Argentina              3140.     129830   41.3 
    ## 10 Belgium                3134.      32605   10.4 
    ## 11 Paraguay               3063.      19530    6.38
    ## 12 Poland                 3047.     117316   38.5 
    ## 13 Romania                3046.      66882   22.0 
    ## 14 United Kingdom         3032.     189026   62.3 
    ## 15 Greece                 2990.      32894   11   
    ## 16 Colombia               2965.     141708   47.8 
    ## 17 Mexico                 2932.     329767  112.  
    ## 18 Italy                  2923.     176404   60.3 
    ## 19 Tunisia                2762.      29243   10.6 
    ## 20 Russia                 2741.     385727  141.

EOL
