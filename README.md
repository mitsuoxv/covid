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

Updated: 2022-12-10

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
    ##  1 United States           97005. 98072469           1011
    ##  2 India                   44674. 44674439           1000
    ##  3 France                  36774. 37252086           1013
    ##  4 Germany                 36183. 36726061           1015
    ##  5 Brazil                  35533. 35497781            999
    ##  6 South Korea             26991. 27611555           1023
    ##  7 Japan                   25135. 25687798           1022
    ##  8 Italy                   24008. 24488080           1020
    ##  9 United Kingdom          23792. 24053576           1011
    ## 10 Russia                  21737. 21650659            996
    ## 11 Turkey                  16987. 16919638            996
    ## 12 Spain                   13453. 13614807           1012
    ## 13 Vietnam                 11612. 11519011            992
    ## 14 Australia               10685. 10717637           1003
    ## 15 Argentina                9720.  9739856           1002
    ## 16 China                    9339.  9862129           1056
    ## 17 Netherlands              8488.  8547416           1007
    ## 18 Iran                     7426.  7559999           1018
    ## 19 Mexico                   7138.  7152852           1002
    ## 20 Indonesia                6695.  6695010           1000

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       679.             682580.           1005
    ##  2 Israel                        642.             643913.           1003
    ##  3 Denmark                       610.             613351.           1005
    ##  4 France                        568.             575158.           1013
    ##  5 Switzerland                   566.             571893.           1010
    ##  6 South Korea                   557.             570220.           1023
    ##  7 Portugal                      519.             518589.           1000
    ##  8 Netherlands                   510.             513513.           1007
    ##  9 Australia                     497.             498130.           1003
    ## 10 Greece                        494.             495336.           1002
    ## 11 Belgium                       443.             446798.           1009
    ## 12 Germany                       442.             448961.           1015
    ## 13 Czech Republic                435.             435874.           1002
    ## 14 Italy                         398.             405833.           1020
    ## 15 United Kingdom                382.             385793.           1011
    ## 16 Slovakia                      342.             340418.            996
    ## 17 Serbia                        332.             330612.            995
    ## 18 United States                 313.             316125.           1011
    ## 19 Chile                         296.             295564.            998
    ## 20 Norway                        291.             293549.           1010

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4992    63660
    ##  3 Syria                 5.51       3163    57410
    ##  4 Peru                  5.02     217566  4330521
    ##  5 Somalia               4.99       1361    27286
    ##  6 Egypt                 4.81      24799   515456
    ##  7 Mexico                4.62     330633  7152852
    ##  8 Afghanistan           3.80       7837   206414
    ##  9 Ecuador               3.53      35907  1018179
    ## 10 Niger                 3.32        314     9457
    ## 11 Myanmar               3.08      19488   633381
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38056  1288586
    ## 14 Paraguay              2.73      19646   718502
    ## 15 Tunisia               2.55      29269  1147145
    ## 16 Haiti                 2.54        860    33862
    ## 17 Algeria               2.54       6881   271113
    ## 18 Chad                  2.54        194     7647
    ## 19 South Africa          2.53     102428  4042912
    ## 20 Sri Lanka             2.50      16807   671742

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7275.     217566   29.9 
    ##  2 Bulgaria               5323.      38056    7.15
    ##  3 Hungary                4842.      48337    9.98
    ##  4 Czech Republic         4004.      41949   10.5 
    ##  5 Slovakia               3804.      20752    5.46
    ##  6 Chile                  3742.      62659   16.7 
    ##  7 United States          3463.    1074367  310.  
    ##  8 Brazil                 3434.     690577  201.  
    ##  9 Belgium                3182.      33100   10.4 
    ## 10 United Kingdom         3171.     197723   62.3 
    ## 11 Argentina              3145.     130034   41.3 
    ## 12 Greece                 3135.      34482   11   
    ## 13 Paraguay               3081.      19646    6.38
    ## 14 Poland                 3075.     118371   38.5 
    ## 15 Romania                3064.      67289   22.0 
    ## 16 Italy                  3012.     181733   60.3 
    ## 17 Colombia               2970.     141943   47.8 
    ## 18 Mexico                 2940.     330633  112.  
    ## 19 Russia                 2790.     392506  141.  
    ## 20 Tunisia                2764.      29269   10.6

EOL
