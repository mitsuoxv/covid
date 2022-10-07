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

Updated: 2022-10-08

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
    ##  1 United States          100486. 95260865            948
    ##  2 India                   47605. 44606460            937
    ##  3 Brazil                  37071. 34699017            936
    ##  4 France                  36489. 34665044            950
    ##  5 Germany                 35532. 33826367            952
    ##  6 South Korea             25972. 24933756            960
    ##  7 United Kingdom          25037. 23735277            948
    ##  8 Italy                   23712. 22692912            957
    ##  9 Russia                  22684. 21163942            933
    ## 10 Japan                   22378. 21460295            959
    ## 11 Turkey                  18085. 16873793            933
    ## 12 Spain                   14153. 13431098            949
    ## 13 Vietnam                 12361. 11483529            929
    ## 14 Australia               10842. 10191312            940
    ## 15 Argentina               10342.  9711355            939
    ## 16 Netherlands              8942.  8441351            944
    ## 17 China                    7999.  7942654            993
    ## 18 Iran                     7906.  7550691            955
    ## 19 Mexico                   7551.  7090965            939
    ## 20 Indonesia                6876.  6442624            937

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        675.             634633.            940
    ##  2 Austria                       674.             635013.            942
    ##  3 Denmark                       640.             603061.            942
    ##  4 Switzerland                   572.             542035.            948
    ##  5 France                        563.             535215.            950
    ##  6 Portugal                      549.             514569.            937
    ##  7 Netherlands                   537.             507140.            944
    ##  8 South Korea                   536.             514919.            960
    ##  9 Australia                     504.             473667.            940
    ## 10 Greece                        482.             452279.            939
    ## 11 Belgium                       463.             438932.            947
    ## 12 Germany                       434.             413514.            952
    ## 13 Czech Republic                419.             393612.            939
    ## 14 United Kingdom                402.             380688.            948
    ## 15 Italy                         393.             376082.            957
    ## 16 Slovakia                      363.             338502.            933
    ## 17 Serbia                        347.             323131.            932
    ## 18 United States                 324.             307062.            948
    ## 19 Norway                        309.             292012.            946
    ## 20 Spain                         304.             288804.            949

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
    ##  4 Peru                  5.22     216637  4146858
    ##  5 Somalia               5.00       1361    27216
    ##  6 Egypt                 4.81      24797   515381
    ##  7 Mexico                4.66     330139  7090965
    ##  8 Afghanistan           3.90       7804   199882
    ##  9 Ecuador               3.57      35900  1005877
    ## 10 Niger                 3.34        314     9412
    ## 11 Myanmar               3.11      19464   625497
    ## 12 Malawi                3.05       2682    88030
    ## 13 Bulgaria              2.99      37741  1263630
    ## 14 Paraguay              2.73      19591   716543
    ## 15 Tunisia               2.55      29254  1145829
    ## 16 Chad                  2.55        193     7581
    ## 17 Haiti                 2.54        857    33702
    ## 18 South Africa          2.54     102185  4020142
    ## 19 Algeria               2.54       6879   270685
    ## 20 Sri Lanka             2.50      16766   670838

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7244.     216637   29.9 
    ##  2 Bulgaria               5279.      37741    7.15
    ##  3 Hungary                4766.      47576    9.98
    ##  4 Czech Republic         3933.      41200   10.5 
    ##  5 Slovakia               3753.      20472    5.46
    ##  6 Chile                  3659.      61268   16.7 
    ##  7 Brazil                 3414.     686573  201.  
    ##  8 United States          3385.    1050195  310.  
    ##  9 Belgium                3145.      32716   10.4 
    ## 10 Argentina              3143.     129937   41.3 
    ## 11 Paraguay               3073.      19591    6.38
    ## 12 United Kingdom         3062.     190888   62.3 
    ## 13 Poland                 3058.     117743   38.5 
    ## 14 Romania                3054.      67069   22.0 
    ## 15 Greece                 3018.      33200   11   
    ## 16 Colombia               2967.     141794   47.8 
    ## 17 Italy                  2939.     177356   60.3 
    ## 18 Mexico                 2935.     330139  112.  
    ## 19 Tunisia                2763.      29254   10.6 
    ## 20 Russia                 2758.     387991  141.

EOL
