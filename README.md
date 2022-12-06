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

Updated: 2022-12-07

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
    ##  1 United States           96844. 97618392           1008
    ##  2 India                   44808. 44673783            997
    ##  3 France                  36633. 36999245           1010
    ##  4 Germany                 36170. 36604648           1012
    ##  5 Brazil                  35511. 35369105            996
    ##  6 South Korea             26871. 27408854           1020
    ##  7 Japan                   24797. 25268073           1019
    ##  8 Italy                   24079. 24488080           1017
    ##  9 United Kingdom          23834. 24024746           1008
    ## 10 Russia                  21781. 21628829            993
    ## 11 Turkey                  17039. 16919638            993
    ## 12 Spain                   13493. 13614807           1009
    ## 13 Vietnam                 11646. 11517722            989
    ## 14 Australia               10718. 10717637           1000
    ## 15 Argentina                9750.  9739856            999
    ## 16 China                    9299.  9791478           1053
    ## 17 Netherlands              8511.  8544770           1004
    ## 18 Iran                     7448.  7559924           1015
    ## 19 Mexico                   7152.  7145408            999
    ## 20 Indonesia                6706.  6686181            997

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       679.             680558.           1002
    ##  2 Israel                        643.             643237.           1000
    ##  3 Denmark                       611.             612459.           1002
    ##  4 France                        566.             571255.           1010
    ##  5 Switzerland                   565.             569456.           1008
    ##  6 South Korea                   555.             566034.           1020
    ##  7 Portugal                      520.             518589.            997
    ##  8 Netherlands                   511.             513354.           1004
    ##  9 Australia                     498.             498130.           1000
    ## 10 Greece                        492.             491335.            999
    ## 11 Belgium                       443.             446456.           1007
    ## 12 Germany                       442.             447477.           1012
    ## 13 Czech Republic                436.             435556.            999
    ## 14 Italy                         399.             405833.           1017
    ## 15 United Kingdom                382.             385330.           1008
    ## 16 Slovakia                      343.             340340.            993
    ## 17 Serbia                        333.             330324.            992
    ## 18 United States                 312.             314662.           1008
    ## 19 Chile                         296.             294946.            995
    ## 20 Norway                        291.             293419.           1007

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4991    63655
    ##  3 Syria                 5.51       3163    57407
    ##  4 Peru                  5.06     217496  4300576
    ##  5 Somalia               4.99       1361    27286
    ##  6 Egypt                 4.81      24799   515456
    ##  7 Mexico                4.63     330592  7145408
    ##  8 Afghanistan           3.80       7835   206273
    ##  9 Ecuador               3.54      35940  1013912
    ## 10 Niger                 3.32        314     9445
    ## 11 Myanmar               3.08      19488   633324
    ## 12 Malawi                3.05       2685    88083
    ## 13 Bulgaria              2.95      38053  1287988
    ## 14 Paraguay              2.73      19630   718502
    ## 15 Tunisia               2.55      29268  1147072
    ## 16 Haiti                 2.54        860    33862
    ## 17 Algeria               2.54       6881   271100
    ## 18 Chad                  2.54        194     7646
    ## 19 South Africa          2.53     102428  4040980
    ## 20 Sri Lanka             2.50      16805   671714

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7272.     217496   29.9 
    ##  2 Bulgaria               5323.      38053    7.15
    ##  3 Hungary                4837.      48287    9.98
    ##  4 Czech Republic         4002.      41923   10.5 
    ##  5 Slovakia               3803.      20745    5.46
    ##  6 Chile                  3737.      62587   16.7 
    ##  7 United States          3453.    1071245  310.  
    ##  8 Brazil                 3432.     690124  201.  
    ##  9 Belgium                3180.      33086   10.4 
    ## 10 United Kingdom         3164.     197253   62.3 
    ## 11 Argentina              3145.     130034   41.3 
    ## 12 Greece                 3119       34309   11   
    ## 13 Paraguay               3079.      19630    6.38
    ## 14 Poland                 3074.     118347   38.5 
    ## 15 Romania                3064.      67289   22.0 
    ## 16 Italy                  3012.     181733   60.3 
    ## 17 Colombia               2969.     141911   47.8 
    ## 18 Mexico                 2939.     330592  112.  
    ## 19 Russia                 2788.     392342  141.  
    ## 20 Tunisia                2764.      29268   10.6

EOL
