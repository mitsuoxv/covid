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

Updated: 2022-11-15

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
    ##  1 United States           98043. 96474411            984
    ##  2 India                   45812. 44666924            975
    ##  3 France                  36517. 36078916            988
    ##  4 Germany                 36397. 36033395            990
    ##  5 Brazil                  35808. 34877559            974
    ##  6 South Korea             26270. 26217994            998
    ##  7 United Kingdom          24294. 23954196            986
    ##  8 Italy                   23943. 23823192            995
    ##  9 Japan                   23248. 23178710            997
    ## 10 Russia                  22147. 21504530            971
    ## 11 Turkey                  17425. 16919638            971
    ## 12 Spain                   13730. 13551539            987
    ## 13 Vietnam                 11901. 11508689            967
    ## 14 Australia               10692. 10456663            978
    ## 15 Argentina                9949.  9720232            977
    ## 16 China                    9046.  9326774           1031
    ## 17 Netherlands              8685.  8528515            982
    ## 18 Iran                     7612.  7558950            993
    ## 19 Mexico                   7283.  7115360            977
    ## 20 Indonesia                6734.  6565912            975

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       683.             669257.            980
    ##  2 Israel                        653.             638781.            978
    ##  3 Denmark                       622.             609354.            980
    ##  4 Switzerland                   569.             561418.            986
    ##  5 France                        564.             557045.            988
    ##  6 South Korea                   543.             541441.            998
    ##  7 Portugal                      531.             517982.            975
    ##  8 Netherlands                   522.             512377.            982
    ##  9 Australia                     497.             486000.            978
    ## 10 Greece                        489.             477299.            977
    ## 11 Belgium                       451.             444364.            985
    ## 12 Germany                       445.             440494.            990
    ## 13 Czech Republic                407.             397606.            977
    ## 14 Italy                         397.             394814.            995
    ## 15 United Kingdom                390.             384199.            986
    ## 16 Slovakia                      350.             339943.            971
    ## 17 Serbia                        339.             328549.            970
    ## 18 United States                 316.             310974.            984
    ## 19 Norway                        297.             292725.            984
    ## 20 Chile                         296.             287762.            973

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.83       4981    63595
    ##  3 Syria                 5.51       3163    57381
    ##  4 Peru                  5.21     217129  4165187
    ##  5 Somalia               4.99       1361    27254
    ##  6 Egypt                 4.81      24798   515420
    ##  7 Mexico                4.64     330418  7115360
    ##  8 Afghanistan           3.83       7829   204512
    ##  9 Ecuador               3.56      35935  1009388
    ## 10 Niger                 3.33        314     9432
    ## 11 Myanmar               3.08      19486   632679
    ## 12 Malawi                3.05       2685    88009
    ## 13 Bulgaria              2.96      37954  1283572
    ## 14 Paraguay              2.73      19606   717980
    ## 15 Tunisia               2.55      29263  1146702
    ## 16 Haiti                 2.54        860    33828
    ## 17 Chad                  2.54        194     7631
    ## 18 Algeria               2.54       6881   270847
    ## 19 South Africa          2.54     102371  4033182
    ## 20 Sri Lanka             2.50      16784   671417

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7260.     217129   29.9 
    ##  2 Bulgaria               5309.      37954    7.15
    ##  3 Hungary                4820.      48111    9.98
    ##  4 Czech Republic         3982.      41717   10.5 
    ##  5 Slovakia               3792.      20684    5.46
    ##  6 Chile                  3698.      61923   16.7 
    ##  7 United States          3426.    1062721  310.  
    ##  8 Brazil                 3424.     688567  201.  
    ##  9 Belgium                3170.      32976   10.4 
    ## 10 Argentina              3144.     130003   41.3 
    ## 11 United Kingdom         3136.     195530   62.3 
    ## 12 Greece                 3081.      33888   11   
    ## 13 Paraguay               3075.      19606    6.38
    ## 14 Poland                 3070.     118210   38.5 
    ## 15 Romania                3062.      67236   22.0 
    ## 16 Italy                  2983.     179985   60.3 
    ## 17 Colombia               2968.     141850   47.8 
    ## 18 Mexico                 2938.     330418  112.  
    ## 19 Russia                 2780.     391085  141.  
    ## 20 Tunisia                2764.      29263   10.6

EOL
