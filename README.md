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

Updated: 2022-10-21

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
    ##  1 United States           99611. 95726462            961
    ##  2 India                   46986. 44636517            950
    ##  3 France                  36735. 35375956            963
    ##  4 Brazil                  36631. 34762873            949
    ##  5 Germany                 36275. 35005769            965
    ##  6 South Korea             25919. 25219546            973
    ##  7 United Kingdom          24764. 23798797            961
    ##  8 Italy                   23932. 23214073            970
    ##  9 Russia                  22563. 21345154            946
    ## 10 Japan                   22488. 21858528            972
    ## 11 Turkey                  17885. 16919638            946
    ## 12 Spain                   13994. 13462593            962
    ## 13 Vietnam                 12203. 11495231            942
    ## 14 Australia               10810. 10301894            953
    ## 15 Argentina               10205.  9715464            952
    ## 16 Netherlands              8869.  8487703            957
    ## 17 China                    8487.  8537773           1006
    ## 18 Iran                     7805.  7555355            968
    ## 19 Mexico                   7461.  7103339            952
    ## 20 Indonesia                6805.  6464962            950

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       685.             654465.            955
    ##  2 Israel                        667.             635758.            953
    ##  3 Denmark                       635.             606097.            955
    ##  4 Switzerland                   574.             551545.            961
    ##  5 France                        567.             546192.            963
    ##  6 Portugal                      543.             516002.            950
    ##  7 South Korea                   535.             520821.            973
    ##  8 Netherlands                   533.             509925.            957
    ##  9 Australia                     502.             478807.            953
    ## 10 Greece                        485.             461998.            952
    ## 11 Belgium                       460.             441636.            960
    ## 12 Germany                       443.             427932.            965
    ## 13 Czech Republic                416.             395927.            952
    ## 14 United Kingdom                397.             381706.            961
    ## 15 Italy                         397.             384719.            970
    ## 16 Slovakia                      359.             339265.            946
    ## 17 Serbia                        345.             325772.            945
    ## 18 United States                 321.             308563.            961
    ## 19 Norway                        305.             292197.            959
    ## 20 Spain                         301.             289481.            962

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4965    63424
    ##  3 Syria                 5.52       3163    57340
    ##  4 Peru                  5.22     216877  4151044
    ##  5 Somalia               5.00       1361    27225
    ##  6 Egypt                 4.81      24798   515397
    ##  7 Mexico                4.65     330279  7103339
    ##  8 Afghanistan           3.87       7813   201750
    ##  9 Ecuador               3.57      35904  1006922
    ## 10 Niger                 3.33        314     9417
    ## 11 Myanmar               3.09      19472   629653
    ## 12 Malawi                3.05       2682    88057
    ## 13 Bulgaria              2.97      37812  1272645
    ## 14 Paraguay              2.73      19596   717260
    ## 15 Tunisia               2.55      29257  1146044
    ## 16 Chad                  2.55        193     7581
    ## 17 Algeria               2.54       6881   270763
    ## 18 South Africa          2.54     102246  4024129
    ## 19 Haiti                 2.54        857    33761
    ## 20 Sri Lanka             2.50      16772   670952

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7252.     216877   29.9 
    ##  2 Bulgaria               5289.      37812    7.15
    ##  3 Hungary                4788.      47798    9.98
    ##  4 Czech Republic         3957.      41454   10.5 
    ##  5 Slovakia               3765.      20538    5.46
    ##  6 Chile                  3670.      61459   16.7 
    ##  7 Brazil                 3418.     687326  201.  
    ##  8 United States          3399.    1054617  310.  
    ##  9 Belgium                3154.      32810   10.4 
    ## 10 Argentina              3144.     129970   41.3 
    ## 11 United Kingdom         3074.     191681   62.3 
    ## 12 Paraguay               3073.      19596    6.38
    ## 13 Poland                 3065.     117991   38.5 
    ## 14 Romania                3058.      67145   22.0 
    ## 15 Greece                 3039.      33426   11   
    ## 16 Colombia               2968.     141820   47.8 
    ## 17 Italy                  2954.     178275   60.3 
    ## 18 Mexico                 2937.     330279  112.  
    ## 19 Russia                 2767.     389266  141.  
    ## 20 Tunisia                2763.      29257   10.6

EOL
