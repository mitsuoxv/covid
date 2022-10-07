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

Updated: 2022-10-07

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
    ##  1 United States          100528. 95199679            947
    ##  2 India                   47654. 44604463            936
    ##  3 Brazil                  37104. 34691896            935
    ##  4 France                  36459. 34599922            949
    ##  5 Germany                 35386. 33652255            951
    ##  6 South Korea             25976. 24911497            959
    ##  7 United Kingdom          24998. 23672855            947
    ##  8 Italy                   23690. 22648063            956
    ##  9 Russia                  22684. 21141674            932
    ## 10 Japan                   22366. 21426855            958
    ## 11 Turkey                  18105. 16873793            932
    ## 12 Spain                   14168. 13431098            948
    ## 13 Vietnam                 12374. 11483529            928
    ## 14 Australia               10853. 10191312            939
    ## 15 Argentina               10353.  9711355            938
    ## 16 Netherlands              8951.  8441351            943
    ## 17 China                    7958.  7894563            992
    ## 18 Iran                     7915.  7550691            954
    ## 19 Mexico                   7560.  7090965            938
    ## 20 Indonesia                6879.  6439292            936

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        676.             634516.            939
    ##  2 Austria                       673.             633200.            941
    ##  3 Denmark                       641.             602780.            941
    ##  4 Switzerland                   572.             542035.            947
    ##  5 France                        563.             534210.            949
    ##  6 Portugal                      550.             514569.            936
    ##  7 Netherlands                   538.             507140.            943
    ##  8 South Korea                   536.             514460.            959
    ##  9 Australia                     504.             473667.            939
    ## 10 Greece                        482.             452279.            938
    ## 11 Belgium                       463.             437694.            946
    ## 12 Germany                       433.             411385.            951
    ## 13 Czech Republic                419.             393342.            938
    ## 14 United Kingdom                401.             379686.            947
    ## 15 Italy                         393.             375339.            956
    ## 16 Slovakia                      363.             338420.            932
    ## 17 Serbia                        347.             322876.            931
    ## 18 United States                 324.             306865.            947
    ## 19 Norway                        309.             291994.            945
    ## 20 Spain                         305.             288804.            948

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4962    63339
    ##  3 Syria                 5.52       3163    57319
    ##  4 Peru                  5.22     216626  4146000
    ##  5 Somalia               5.00       1361    27216
    ##  6 Egypt                 4.81      24797   515381
    ##  7 Mexico                4.66     330139  7090965
    ##  8 Afghanistan           3.90       7804   199882
    ##  9 Ecuador               3.57      35899  1005521
    ## 10 Niger                 3.34        314     9412
    ## 11 Myanmar               3.11      19463   625147
    ## 12 Malawi                3.05       2682    88030
    ## 13 Bulgaria              2.99      37737  1262945
    ## 14 Paraguay              2.73      19591   716543
    ## 15 Tunisia               2.55      29254  1145829
    ## 16 Chad                  2.55        193     7581
    ## 17 Haiti                 2.54        857    33702
    ## 18 South Africa          2.54     102185  4019800
    ## 19 Algeria               2.54       6879   270685
    ## 20 Sri Lanka             2.50      16766   670820

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7243.     216626   29.9 
    ##  2 Bulgaria               5279.      37737    7.15
    ##  3 Hungary                4766.      47576    9.98
    ##  4 Czech Republic         3931.      41185   10.5 
    ##  5 Slovakia               3753.      20470    5.46
    ##  6 Chile                  3656.      61233   16.7 
    ##  7 Brazil                 3413.     686464  201.  
    ##  8 United States          3383.    1049469  310.  
    ##  9 Argentina              3143.     129937   41.3 
    ## 10 Belgium                3142.      32690   10.4 
    ## 11 Paraguay               3073.      19591    6.38
    ## 12 Poland                 3057.     117702   38.5 
    ## 13 Romania                3054.      67066   22.0 
    ## 14 United Kingdom         3052.     190317   62.3 
    ## 15 Greece                 3018.      33200   11   
    ## 16 Colombia               2967.     141794   47.8 
    ## 17 Italy                  2938.     177300   60.3 
    ## 18 Mexico                 2935.     330139  112.  
    ## 19 Tunisia                2763.      29254   10.6 
    ## 20 Russia                 2757.     387887  141.

EOL
