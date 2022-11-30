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

Updated: 2022-12-01

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
    ##  1 United States           97135. 97329491           1002
    ##  2 India                   45078. 44672347            991
    ##  3 France                  36555. 36701755           1004
    ##  4 Germany                 36246. 36463485           1006
    ##  5 Brazil                  35544. 35188586            990
    ##  6 South Korea             26724. 27098734           1014
    ##  7 Japan                   24338. 24654770           1013
    ##  8 Italy                   23997. 24260660           1011
    ##  9 United Kingdom          23952. 24000101           1002
    ## 10 Russia                  21875. 21590828            987
    ## 11 Turkey                  17142. 16919638            987
    ## 12 Spain                   13555. 13595504           1003
    ## 13 Vietnam                 11714. 11515423            983
    ## 14 Australia               10681. 10616693            994
    ## 15 Argentina                9796.  9727247            993
    ## 16 China                    9233.  9666687           1047
    ## 17 Netherlands              8559.  8541997            998
    ## 18 Iran                     7492.  7559664           1009
    ## 19 Mexico                   7175.  7125176            993
    ## 20 Indonesia                6725.  6664844            991

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       680.             677023.            996
    ##  2 Israel                        646.             641858.            994
    ##  3 Denmark                       614.             611343.            996
    ##  4 Switzerland                   568.             569456.           1002
    ##  5 France                        564.             566662.           1004
    ##  6 South Korea                   552.             559629.           1014
    ##  7 Portugal                      523.             518589.            991
    ##  8 Netherlands                   514.             513187.            998
    ##  9 Australia                     496.             493438.            994
    ## 10 Greece                        495.             491335.            993
    ## 11 Belgium                       445.             445666.           1001
    ## 12 Germany                       443.             445752.           1006
    ## 13 Czech Republic                438.             435109.            993
    ## 14 Italy                         398.             402064.           1011
    ## 15 United Kingdom                384.             384935.           1002
    ## 16 Slovakia                      345.             340230.            987
    ## 17 Serbia                        335.             329866.            986
    ## 18 United States                 313.             313730.           1002
    ## 19 Chile                         297.             293502.            989
    ## 20 Norway                        293.             293239.           1001

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4990    63637
    ##  3 Syria                 5.51       3163    57397
    ##  4 Peru                  5.14     217386  4229179
    ##  5 Somalia               4.99       1361    27286
    ##  6 Egypt                 4.81      24798   515453
    ##  7 Mexico                4.64     330495  7125176
    ##  8 Afghanistan           3.81       7833   205830
    ##  9 Ecuador               3.55      35940  1011132
    ## 10 Niger                 3.33        314     9443
    ## 11 Myanmar               3.08      19488   633245
    ## 12 Malawi                3.05       2685    88083
    ## 13 Bulgaria              2.96      38039  1287035
    ## 14 Paraguay              2.73      19621   718164
    ## 15 Tunisia               2.55      29268  1147072
    ## 16 Haiti                 2.54        860    33837
    ## 17 Chad                  2.54        194     7641
    ## 18 Algeria               2.54       6881   271079
    ## 19 South Africa          2.53     102428  4040980
    ## 20 Sri Lanka             2.50      16802   671671

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7269.     217386   29.9 
    ##  2 Bulgaria               5321.      38039    7.15
    ##  3 Hungary                4837.      48287    9.98
    ##  4 Czech Republic         3998.      41882   10.5 
    ##  5 Slovakia               3801.      20733    5.46
    ##  6 Chile                  3727.      62417   16.7 
    ##  7 United States          3448.    1069757  310.  
    ##  8 Brazil                 3429.     689536  201.  
    ##  9 Belgium                3178.      33057   10.4 
    ## 10 United Kingdom         3157.     196821   62.3 
    ## 11 Argentina              3145.     130025   41.3 
    ## 12 Greece                 3119       34309   11   
    ## 13 Paraguay               3077.      19621    6.38
    ## 14 Poland                 3073.     118319   38.5 
    ## 15 Romania                3064.      67276   22.0 
    ## 16 Italy                  3001.     181098   60.3 
    ## 17 Colombia               2969.     141895   47.8 
    ## 18 Mexico                 2939.     330495  112.  
    ## 19 Russia                 2786.     392002  141.  
    ## 20 Tunisia                2764.      29268   10.6

EOL
