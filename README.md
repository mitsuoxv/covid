WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

- <a href="#summary" id="toc-summary">Summary</a>
- <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
  WHO</a>
- <a href="#newly-confirmed-cases-by-region"
  id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
  region</a>
- <a href="#fastest-spreading-areas"
  id="toc-fastest-spreading-areas">Fastest spreading areas</a>
- <a href="#highest-fatality-rate-areas"
  id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
- <a href="#highest-deaths-per-population-areas"
  id="toc-highest-deaths-per-population-areas">Highest deaths per
  population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-11-30

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
    ##  1 United States           97232. 97329491           1001
    ##  2 India                   45123. 44672068            990
    ##  3 France                  36500. 36609941           1003
    ##  4 Germany                 36238. 36419717           1005
    ##  5 Brazil                  35580. 35188586            989
    ##  6 South Korea             26684. 27031319           1013
    ##  7 Japan                   24229. 24519674           1012
    ##  8 Italy                   24020. 24260660           1010
    ##  9 United Kingdom          23976. 24000101           1001
    ## 10 Russia                  21891. 21584740            986
    ## 11 Turkey                  17160. 16919638            986
    ## 12 Spain                   13568. 13595504           1002
    ## 13 Vietnam                 11726. 11514865            982
    ## 14 Australia               10606. 10532366            993
    ## 15 Argentina                9806.  9727247            992
    ## 16 China                    9219.  9643020           1046
    ## 17 Netherlands              8565.  8539297            997
    ## 18 Iran                     7499.  7559634           1008
    ## 19 Mexico                   7183.  7125176            992
    ## 20 Indonesia                6726.  6659235            990

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       680.             676487.            995
    ##  2 Israel                        646.             641608.            993
    ##  3 Denmark                       614.             611141.            995
    ##  4 Switzerland                   566.             566947.           1001
    ##  5 France                        564.             565244.           1003
    ##  6 South Korea                   551.             558237.           1013
    ##  7 Portugal                      524.             518589.            990
    ##  8 Netherlands                   515.             513025.            997
    ##  9 Australia                     493.             489519.            993
    ## 10 Greece                        491.             487319.            992
    ## 11 Belgium                       446.             445666.           1000
    ## 12 Germany                       443.             445217.           1005
    ## 13 Czech Republic                401.             398255.            992
    ## 14 Italy                         398.             402064.           1010
    ## 15 United Kingdom                385.             384935.           1001
    ## 16 Slovakia                      345.             340207.            986
    ## 17 Serbia                        335.             329780.            985
    ## 18 United States                 313.             313730.           1001
    ## 19 Chile                         297.             293363.            988
    ## 20 Norway                        293.             293196.           1000

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4990    63637
    ##  3 Syria                 5.51       3163    57396
    ##  4 Peru                  5.14     217370  4227446
    ##  5 Somalia               4.99       1361    27286
    ##  6 Egypt                 4.81      24798   515453
    ##  7 Mexico                4.64     330495  7125176
    ##  8 Afghanistan           3.81       7833   205780
    ##  9 Ecuador               3.55      35940  1011132
    ## 10 Niger                 3.33        314     9434
    ## 11 Myanmar               3.08      19488   633217
    ## 12 Malawi                3.05       2685    88064
    ## 13 Bulgaria              2.96      38033  1286872
    ## 14 Paraguay              2.73      19621   718164
    ## 15 Tunisia               2.55      29268  1147072
    ## 16 Haiti                 2.54        860    33837
    ## 17 Chad                  2.54        194     7641
    ## 18 Algeria               2.54       6881   271028
    ## 19 South Africa          2.53     102395  4039858
    ## 20 Sri Lanka             2.50      16802   671651

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7268.     217370   29.9 
    ##  2 Bulgaria               5320.      38033    7.15
    ##  3 Hungary                4833.      48245    9.98
    ##  4 Czech Republic         3991.      41814   10.5 
    ##  5 Slovakia               3801.      20732    5.46
    ##  6 Chile                  3727.      62407   16.7 
    ##  7 United States          3448.    1069757  310.  
    ##  8 Brazil                 3429.     689536  201.  
    ##  9 Belgium                3178.      33057   10.4 
    ## 10 United Kingdom         3157.     196821   62.3 
    ## 11 Argentina              3145.     130025   41.3 
    ## 12 Greece                 3107.      34178   11   
    ## 13 Paraguay               3077.      19621    6.38
    ## 14 Poland                 3073.     118313   38.5 
    ## 15 Romania                3064.      67276   22.0 
    ## 16 Italy                  3001.     181098   60.3 
    ## 17 Colombia               2969.     141895   47.8 
    ## 18 Mexico                 2939.     330495  112.  
    ## 19 Russia                 2786.     391943  141.  
    ## 20 Tunisia                2764.      29268   10.6

EOL
