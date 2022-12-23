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

Updated: 2022-12-24

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
    ##  1 United States           96612. 99027628           1025
    ##  2 India                   44060. 44676678           1014
    ##  3 France                  36989. 37988187           1027
    ##  4 Germany                 36130. 37177845           1029
    ##  5 Brazil                  35582. 36044441           1013
    ##  6 South Korea             27516. 28534558           1037
    ##  7 Japan                   26801. 27765782           1036
    ##  8 Italy                   24066. 24884034           1034
    ##  9 United Kingdom          23546. 24135084           1025
    ## 10 Russia                  21535. 21750711           1010
    ## 11 Turkey                  16836. 17004677           1010
    ## 12 Spain                   13305. 13651239           1026
    ## 13 Vietnam                 11455. 11523567           1006
    ## 14 Australia               10755. 10938096           1017
    ## 15 Argentina                9674.  9829236           1016
    ## 16 China                    9502. 10167676           1070
    ## 17 Netherlands              8383.  8559116           1021
    ## 18 Iran                     7326.  7560629           1032
    ## 19 Mexico                   7083.  7196485           1016
    ## 20 Indonesia                6621.  6713879           1014

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       678.             690817.           1019
    ##  2 Israel                        636.             646579.           1017
    ##  3 Denmark                       605.             616195.           1018
    ##  4 France                        571.             586524.           1027
    ##  5 South Korea                   568.             589281.           1037
    ##  6 Switzerland                   562.             575859.           1024
    ##  7 Portugal                      513.             520238.           1014
    ##  8 Netherlands                   504.             514215.           1021
    ##  9 Australia                     500.             508376.           1017
    ## 10 Greece                        496.             504408.           1016
    ## 11 Germany                       442.             454484.           1029
    ## 12 Belgium                       439.             448741.           1023
    ## 13 Czech Republic                430.             436874.           1016
    ## 14 Italy                         399.             412395.           1034
    ## 15 United Kingdom                378.             387100.           1025
    ## 16 Slovakia                      337.             340702.           1010
    ## 17 Serbia                        329.             331951.           1009
    ## 18 United States                 311.             319204.           1025
    ## 19 Chile                         295.             298394.           1012
    ## 20 Norway                        287.             294162.           1024

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4994    63686
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.99       1361    27300
    ##  5 Peru                  4.92     217960  4430160
    ##  6 Egypt                 4.81      24801   515493
    ##  7 Mexico                4.60     330834  7196485
    ##  8 Afghanistan           3.79       7845   207214
    ##  9 Ecuador               3.48      35913  1031449
    ## 10 Niger                 3.31        314     9473
    ## 11 Myanmar               3.08      19489   633590
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38089  1290967
    ## 14 Paraguay              2.73      19655   720204
    ## 15 Tunisia               2.55      29279  1147477
    ## 16 Algeria               2.54       6881   271179
    ## 17 Haiti                 2.54        860    33893
    ## 18 Chad                  2.54        194     7649
    ## 19 South Africa          2.53     102550  4046603
    ## 20 Sri Lanka             2.50      16814   671838

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7288.     217960   29.9 
    ##  2 Bulgaria               5328.      38089    7.15
    ##  3 Hungary                4853.      48439    9.98
    ##  4 Czech Republic         4015.      42063   10.5 
    ##  5 Slovakia               3812.      20797    5.46
    ##  6 Chile                  3760.      62963   16.7 
    ##  7 United States          3481.    1080010  310.  
    ##  8 Brazil                 3443.     692461  201.  
    ##  9 Belgium                3194.      33228   10.4 
    ## 10 United Kingdom         3191.     198937   62.3 
    ## 11 Greece                 3162.      34779   11   
    ## 12 Argentina              3146.     130080   41.3 
    ## 13 Paraguay               3083.      19655    6.38
    ## 14 Poland                 3077.     118467   38.5 
    ## 15 Romania                3067.      67341   22.0 
    ## 16 Italy                  3035.     183138   60.3 
    ## 17 Colombia               2971.     141996   47.8 
    ## 18 Mexico                 2942.     330834  112.  
    ## 19 Russia                 2795.     393277  141.  
    ## 20 Tunisia                2765.      29279   10.6

EOL
