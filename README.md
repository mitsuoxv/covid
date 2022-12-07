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

Updated: 2022-12-08

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
    ##  1 United States           96748. 97618392           1009
    ##  2 India                   44763. 44673949            998
    ##  3 France                  36701. 37104761           1011
    ##  4 Germany                 36180. 36649979           1013
    ##  5 Brazil                  35503. 35396191            997
    ##  6 South Korea             26918. 27483568           1021
    ##  7 Japan                   24907. 25405350           1020
    ##  8 Italy                   24055. 24488080           1018
    ##  9 United Kingdom          23810. 24024746           1009
    ## 10 Russia                  21766. 21635764            994
    ## 11 Turkey                  17022. 16919638            994
    ## 12 Spain                   13480. 13614807           1010
    ## 13 Vietnam                 11635. 11518511            990
    ## 14 Australia               10707. 10717637           1001
    ## 15 Argentina                9740.  9739856           1000
    ## 16 China                    9312.  9814905           1054
    ## 17 Netherlands              8505.  8547416           1005
    ## 18 Iran                     7441.  7559958           1016
    ## 19 Mexico                   7145.  7145409           1000
    ## 20 Indonesia                6703.  6689532            998

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       679.             681105.           1003
    ##  2 Israel                        643.             643458.           1001
    ##  3 Denmark                       611.             612720.           1003
    ##  4 Switzerland                   567.             571893.           1008
    ##  5 France                        567.             572884.           1011
    ##  6 South Korea                   556.             567577.           1021
    ##  7 Portugal                      520.             518589.            998
    ##  8 Netherlands                   511.             513513.           1005
    ##  9 Australia                     498.             498130.           1001
    ## 10 Greece                        495.             495336.           1000
    ## 11 Belgium                       443.             446456.           1008
    ## 12 Germany                       442.             448031.           1013
    ## 13 Czech Republic                436.             435677.           1000
    ## 14 Italy                         399.             405833.           1018
    ## 15 United Kingdom                382.             385330.           1009
    ## 16 Slovakia                      342.             340366.            994
    ## 17 Serbia                        333.             330415.            993
    ## 18 United States                 312.             314662.           1009
    ## 19 Chile                         296.             295060.            996
    ## 20 Norway                        291.             293460.           1008

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4991    63655
    ##  3 Syria                 5.51       3163    57409
    ##  4 Peru                  5.05     217519  4304745
    ##  5 Somalia               4.99       1361    27286
    ##  6 Egypt                 4.81      24799   515456
    ##  7 Mexico                4.63     330592  7145409
    ##  8 Afghanistan           3.80       7835   206331
    ##  9 Ecuador               3.54      35940  1013912
    ## 10 Niger                 3.32        314     9457
    ## 11 Myanmar               3.08      19488   633341
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38053  1288196
    ## 14 Paraguay              2.73      19630   718502
    ## 15 Tunisia               2.55      29269  1147145
    ## 16 Haiti                 2.54        860    33862
    ## 17 Algeria               2.54       6881   271113
    ## 18 Chad                  2.54        194     7647
    ## 19 South Africa          2.53     102428  4042912
    ## 20 Sri Lanka             2.50      16806   671719

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7273.     217519   29.9 
    ##  2 Bulgaria               5323.      38053    7.15
    ##  3 Hungary                4842.      48337    9.98
    ##  4 Czech Republic         4003.      41931   10.5 
    ##  5 Slovakia               3803.      20747    5.46
    ##  6 Chile                  3738.      62597   16.7 
    ##  7 United States          3453.    1071245  310.  
    ##  8 Brazil                 3432.     690229  201.  
    ##  9 Belgium                3180.      33086   10.4 
    ## 10 United Kingdom         3164.     197253   62.3 
    ## 11 Argentina              3145.     130034   41.3 
    ## 12 Greece                 3135.      34482   11   
    ## 13 Paraguay               3079.      19630    6.38
    ## 14 Poland                 3074.     118350   38.5 
    ## 15 Romania                3064.      67289   22.0 
    ## 16 Italy                  3012.     181733   60.3 
    ## 17 Colombia               2969.     141911   47.8 
    ## 18 Mexico                 2939.     330592  112.  
    ## 19 Russia                 2789.     392400  141.  
    ## 20 Tunisia                2764.      29269   10.6

EOL
