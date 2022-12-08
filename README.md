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

Updated: 2022-12-09

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
    ##  1 United States           96652. 97618392           1010
    ##  2 India                   44719. 44674190            999
    ##  3 France                  36739. 37180489           1012
    ##  4 Germany                 36184. 36690235           1014
    ##  5 Brazil                  35523. 35452099            998
    ##  6 South Korea             26956. 27548821           1022
    ##  7 Japan                   25029. 25554733           1021
    ##  8 Italy                   24031. 24488080           1019
    ##  9 United Kingdom          23787. 24024746           1010
    ## 10 Russia                  21752. 21643194            995
    ## 11 Turkey                  17004. 16919638            995
    ## 12 Spain                   13467. 13614807           1011
    ## 13 Vietnam                 11623. 11518511            991
    ## 14 Australia               10696. 10717637           1002
    ## 15 Argentina                9730.  9739856           1001
    ## 16 China                    9326.  9839556           1055
    ## 17 Netherlands              8496.  8547416           1006
    ## 18 Iran                     7433.  7559999           1017
    ## 19 Mexico                   7142.  7148886           1001
    ## 20 Indonesia                6699.  6692509            999

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       679.             681936.           1004
    ##  2 Israel                        642.             643692.           1002
    ##  3 Denmark                       610.             612720.           1004
    ##  4 France                        567.             574053.           1012
    ##  5 Switzerland                   567.             571893.           1009
    ##  6 South Korea                   557.             568924.           1022
    ##  7 Portugal                      519.             518589.            999
    ##  8 Netherlands                   510.             513513.           1006
    ##  9 Australia                     497.             498130.           1002
    ## 10 Greece                        495.             495336.           1001
    ## 11 Belgium                       442.             446456.           1009
    ## 12 Germany                       442.             448524.           1014
    ## 13 Czech Republic                435.             435780.           1001
    ## 14 Italy                         398.             405833.           1019
    ## 15 United Kingdom                382.             385330.           1010
    ## 16 Slovakia                      342.             340395.            995
    ## 17 Serbia                        332.             330517.            994
    ## 18 United States                 312.             314662.           1010
    ## 19 Chile                         296.             295311.            997
    ## 20 Norway                        291.             293503.           1009

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
    ##  4 Peru                  5.04     217542  4316167
    ##  5 Somalia               4.99       1361    27286
    ##  6 Egypt                 4.81      24799   515456
    ##  7 Mexico                4.62     330602  7148886
    ##  8 Afghanistan           3.80       7837   206414
    ##  9 Ecuador               3.53      35907  1018179
    ## 10 Niger                 3.32        314     9457
    ## 11 Myanmar               3.08      19488   633369
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38054  1288400
    ## 14 Paraguay              2.73      19630   718502
    ## 15 Tunisia               2.55      29269  1147145
    ## 16 Haiti                 2.54        860    33862
    ## 17 Algeria               2.54       6881   271113
    ## 18 Chad                  2.54        194     7647
    ## 19 South Africa          2.53     102428  4042912
    ## 20 Sri Lanka             2.50      16806   671722

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7274.     217542   29.9 
    ##  2 Bulgaria               5323.      38054    7.15
    ##  3 Hungary                4842.      48337    9.98
    ##  4 Czech Republic         4003.      41937   10.5 
    ##  5 Slovakia               3804.      20750    5.46
    ##  6 Chile                  3738.      62605   16.7 
    ##  7 United States          3453.    1071245  310.  
    ##  8 Brazil                 3433.     690409  201.  
    ##  9 Belgium                3180.      33086   10.4 
    ## 10 United Kingdom         3164.     197253   62.3 
    ## 11 Argentina              3145.     130034   41.3 
    ## 12 Greece                 3135.      34482   11   
    ## 13 Paraguay               3079.      19630    6.38
    ## 14 Poland                 3074.     118365   38.5 
    ## 15 Romania                3064.      67289   22.0 
    ## 16 Italy                  3012.     181733   60.3 
    ## 17 Colombia               2969.     141911   47.8 
    ## 18 Mexico                 2939.     330602  112.  
    ## 19 Russia                 2789.     392454  141.  
    ## 20 Tunisia                2764.      29269   10.6

EOL
