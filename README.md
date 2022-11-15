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

Updated: 2022-11-16

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
    ##  1 United States           98225. 96752266            985
    ##  2 India                   45765. 44666924            976
    ##  3 France                  36485. 36083816            989
    ##  4 Germany                 36408. 36080574            991
    ##  5 Brazil                  35808. 34912931            975
    ##  6 South Korea             26317. 26290877            999
    ##  7 United Kingdom          24270. 23954196            987
    ##  8 Italy                   23919. 23823192            996
    ##  9 Japan                   23263. 23216265            998
    ## 10 Russia                  22128. 21508961            972
    ## 11 Turkey                  17407. 16919638            972
    ## 12 Spain                   13716. 13551539            988
    ## 13 Vietnam                 11889. 11508893            968
    ## 14 Australia               10681. 10456663            979
    ## 15 Argentina                9940.  9721718            978
    ## 16 China                    9057.  9346777           1032
    ## 17 Netherlands              8676.  8528515            983
    ## 18 Iran                     7604.  7559001            994
    ## 19 Mexico                   7279.  7118933            978
    ## 20 Indonesia                6735.  6573805            976

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       682.             669527.            981
    ##  2 Israel                        652.             638781.            979
    ##  3 Denmark                       621.             609623.            981
    ##  4 Switzerland                   569.             561418.            987
    ##  5 France                        563.             557121.            989
    ##  6 South Korea                   543.             542946.            999
    ##  7 Portugal                      531.             517982.            976
    ##  8 Netherlands                   521.             512377.            983
    ##  9 Australia                     496.             486000.            979
    ## 10 Greece                        488.             477299.            978
    ## 11 Belgium                       451.             444511.            986
    ## 12 Germany                       445.             441071.            991
    ## 13 Czech Republic                407.             397682.            978
    ## 14 Italy                         396.             394814.            996
    ## 15 United Kingdom                389.             384199.            987
    ## 16 Slovakia                      350.             339967.            972
    ## 17 Serbia                        338.             328657.            971
    ## 18 United States                 317.             311870.            985
    ## 19 Norway                        297.             292809.            985
    ## 20 Chile                         297.             289173.            974

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.83       4981    63595
    ##  3 Syria                 5.51       3163    57382
    ##  4 Peru                  5.21     217192  4172486
    ##  5 Somalia               4.99       1361    27254
    ##  6 Egypt                 4.81      24798   515420
    ##  7 Mexico                4.64     330444  7118933
    ##  8 Afghanistan           3.83       7829   204610
    ##  9 Ecuador               3.56      35935  1009388
    ## 10 Niger                 3.33        314     9432
    ## 11 Myanmar               3.08      19486   632711
    ## 12 Malawi                3.05       2685    88009
    ## 13 Bulgaria              2.96      37965  1284051
    ## 14 Paraguay              2.73      19608   718049
    ## 15 Tunisia               2.55      29263  1146702
    ## 16 Chad                  2.54        194     7631
    ## 17 Haiti                 2.54        860    33832
    ## 18 Algeria               2.54       6881   270847
    ## 19 South Africa          2.54     102371  4033182
    ## 20 Sri Lanka             2.50      16784   671431

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7262.     217192   29.9 
    ##  2 Bulgaria               5311.      37965    7.15
    ##  3 Hungary                4820.      48111    9.98
    ##  4 Czech Republic         3984.      41732   10.5 
    ##  5 Slovakia               3793.      20689    5.46
    ##  6 Chile                  3704.      62032   16.7 
    ##  7 United States          3433.    1064975  310.  
    ##  8 Brazil                 3424.     688658  201.  
    ##  9 Belgium                3172.      33000   10.4 
    ## 10 Argentina              3145.     130011   41.3 
    ## 11 United Kingdom         3136.     195530   62.3 
    ## 12 Greece                 3081.      33888   11   
    ## 13 Paraguay               3075.      19608    6.38
    ## 14 Poland                 3071.     118227   38.5 
    ## 15 Romania                3062.      67237   22.0 
    ## 16 Italy                  2983.     179985   60.3 
    ## 17 Colombia               2968.     141862   47.8 
    ## 18 Mexico                 2938.     330444  112.  
    ## 19 Russia                 2780.     391149  141.  
    ## 20 Tunisia                2764.      29263   10.6

EOL
