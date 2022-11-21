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

Updated: 2022-11-22

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
    ##  1 United States           97631. 96752266            991
    ##  2 India                   45488. 44669421            982
    ##  3 France                  36419. 36237398            995
    ##  4 Germany                 36314. 36205405            997
    ##  5 Brazil                  35615. 34938073            981
    ##  6 South Korea             26449. 26581856           1005
    ##  7 United Kingdom          24147. 23977637            993
    ##  8 Italy                   23983. 24031538           1002
    ##  9 Japan                   23677. 23771785           1004
    ## 10 Russia                  22025. 21540891            978
    ## 11 Turkey                  17300. 16919638            978
    ## 12 Spain                   13656. 13573721            994
    ## 13 Vietnam                 11819. 11511452            974
    ## 14 Australia               10693. 10532366            985
    ## 15 Argentina                9880.  9721718            984
    ## 16 China                    9137.  9483981           1038
    ## 17 Netherlands              8629.  8534144            989
    ## 18 Iran                     7559.  7559296           1000
    ## 19 Mexico                   7235.  7118933            984
    ## 20 Indonesia                6734.  6612673            982

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       681.             672504.            987
    ##  2 Israel                        650.             640017.            985
    ##  3 Denmark                       618.             610063.            987
    ##  4 Switzerland                   568.             564152.            993
    ##  5 France                        562.             559492.            995
    ##  6 South Korea                   546.             548955.           1005
    ##  7 Portugal                      528.             518589.            982
    ##  8 Netherlands                   518.             512715.            989
    ##  9 Australia                     497.             489519.            985
    ## 10 Greece                        490.             482407.            984
    ## 11 Belgium                       448.             444793.            992
    ## 12 Germany                       444.             442597.            997
    ## 13 Czech Republic                404.             397863.            984
    ## 14 Italy                         397.             398267.           1002
    ## 15 United Kingdom                387.             384575.            993
    ## 16 Slovakia                      348.             340062.            978
    ## 17 Serbia                        337.             329160.            977
    ## 18 United States                 315.             311870.            991
    ## 19 Chile                         296.             290165.            980
    ## 20 Norway                        295.             292955.            992

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4986    63617
    ##  3 Syria                 5.51       3163    57388
    ##  4 Peru                  5.20     217212  4177786
    ##  5 Somalia               4.99       1361    27254
    ##  6 Egypt                 4.81      24798   515431
    ##  7 Mexico                4.64     330444  7118933
    ##  8 Afghanistan           3.82       7831   205067
    ##  9 Ecuador               3.56      35935  1009388
    ## 10 Niger                 3.33        314     9434
    ## 11 Malawi                3.29       2896    88029
    ## 12 Myanmar               3.08      19487   633005
    ## 13 Bulgaria              2.96      37997  1285248
    ## 14 Paraguay              2.73      19608   718049
    ## 15 Tunisia               2.55      29266  1146799
    ## 16 Haiti                 2.54        860    33832
    ## 17 Chad                  2.54        194     7637
    ## 18 Algeria               2.54       6881   270952
    ## 19 South Africa          2.54     102395  4037221
    ## 20 Sri Lanka             2.50      16793   671522

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7263.     217212   29.9 
    ##  2 Bulgaria               5315.      37997    7.15
    ##  3 Hungary                4827.      48184    9.98
    ##  4 Czech Republic         3986.      41759   10.5 
    ##  5 Slovakia               3797.      20712    5.46
    ##  6 Chile                  3708.      62102   16.7 
    ##  7 United States          3433.    1064975  310.  
    ##  8 Brazil                 3425.     688764  201.  
    ##  9 Belgium                3174.      33021   10.4 
    ## 10 United Kingdom         3147.     196241   62.3 
    ## 11 Argentina              3145.     130011   41.3 
    ## 12 Greece                 3093.      34024   11   
    ## 13 Paraguay               3075.      19608    6.38
    ## 14 Poland                 3072.     118274   38.5 
    ## 15 Romania                3063.      67253   22.0 
    ## 16 Italy                  2992.     180518   60.3 
    ## 17 Colombia               2969.     141881   47.8 
    ## 18 Mexico                 2938.     330444  112.  
    ## 19 Russia                 2783.     391509  141.  
    ## 20 Tunisia                2764.      29266   10.6

EOL
