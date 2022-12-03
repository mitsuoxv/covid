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

Updated: 2022-12-03

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
    ##  1 United States           97229. 97618392           1004
    ##  2 India                   44988. 44672913            993
    ##  3 France                  36617. 36837205           1006
    ##  4 Germany                 36240. 36530020           1008
    ##  5 Brazil                  35550. 35266159            992
    ##  6 South Korea             26780. 27208800           1016
    ##  7 Japan                   24543. 24911367           1015
    ##  8 Italy                   23949. 24260660           1013
    ##  9 United Kingdom          23929. 24024746           1004
    ## 10 Russia                  21844. 21604334            989
    ## 11 Turkey                  17108. 16919638            989
    ## 12 Spain                   13528. 13595504           1005
    ## 13 Vietnam                 11692. 11516489            985
    ## 14 Australia               10761. 10717637            996
    ## 15 Argentina                9776.  9727247            995
    ## 16 China                    9260.  9713510           1049
    ## 17 Netherlands              8542.  8541997           1000
    ## 18 Iran                     7477.  7559706           1011
    ## 19 Mexico                   7161.  7125176            995
    ## 20 Indonesia                6721.  6674000            993

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       680.             678482.            998
    ##  2 Israel                        645.             642427.            996
    ##  3 Denmark                       613.             611763.            998
    ##  4 Switzerland                   567.             569456.           1004
    ##  5 France                        565.             568753.           1006
    ##  6 South Korea                   553.             561902.           1016
    ##  7 Portugal                      522.             518589.            993
    ##  8 Netherlands                   513.             513187.           1000
    ##  9 Australia                     500.             498130.            996
    ## 10 Greece                        494.             491335.            995
    ## 11 Belgium                       445.             445969.           1003
    ## 12 Germany                       443.             446565.           1008
    ## 13 Czech Republic                437.             435291.            995
    ## 14 Italy                         397.             402064.           1013
    ## 15 United Kingdom                384.             385330.           1004
    ## 16 Slovakia                      344.             340276.            989
    ## 17 Serbia                        334.             330034.            988
    ## 18 United States                 313.             314662.           1004
    ## 19 Chile                         297.             294095.            991
    ## 20 Norway                        292.             293310.           1003

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4990    63637
    ##  3 Syria                 5.51       3163    57399
    ##  4 Peru                  5.11     217414  4252383
    ##  5 Somalia               4.99       1361    27286
    ##  6 Egypt                 4.81      24798   515453
    ##  7 Mexico                4.64     330495  7125176
    ##  8 Afghanistan           3.80       7833   205957
    ##  9 Ecuador               3.55      35940  1011132
    ## 10 Niger                 3.33        314     9443
    ## 11 Myanmar               3.08      19488   633261
    ## 12 Malawi                3.05       2685    88083
    ## 13 Bulgaria              2.96      38044  1287409
    ## 14 Paraguay              2.73      19621   718164
    ## 15 Tunisia               2.55      29268  1147072
    ## 16 Haiti                 2.54        860    33862
    ## 17 Chad                  2.54        194     7641
    ## 18 Algeria               2.54       6881   271079
    ## 19 South Africa          2.53     102428  4040980
    ## 20 Sri Lanka             2.50      16805   671687

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7270.     217414   29.9 
    ##  2 Bulgaria               5322.      38044    7.15
    ##  3 Hungary                4837.      48287    9.98
    ##  4 Czech Republic         3999.      41897   10.5 
    ##  5 Slovakia               3801.      20737    5.46
    ##  6 Chile                  3731.      62484   16.7 
    ##  7 United States          3453.    1071245  310.  
    ##  8 Brazil                 3430.     689801  201.  
    ##  9 Belgium                3178.      33061   10.4 
    ## 10 United Kingdom         3164.     197253   62.3 
    ## 11 Argentina              3145.     130025   41.3 
    ## 12 Greece                 3119       34309   11   
    ## 13 Paraguay               3077.      19621    6.38
    ## 14 Poland                 3074.     118332   38.5 
    ## 15 Romania                3064.      67276   22.0 
    ## 16 Italy                  3001.     181098   60.3 
    ## 17 Colombia               2969.     141911   47.8 
    ## 18 Mexico                 2939.     330495  112.  
    ## 19 Russia                 2787.     392117  141.  
    ## 20 Tunisia                2764.      29268   10.6

EOL
