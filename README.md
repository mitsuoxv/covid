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

Updated: 2022-11-19

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
    ##  1 United States           97927. 96752266            988
    ##  2 India                   45626. 44667967            979
    ##  3 France                  36492. 36200221            992
    ##  4 Germany                 36398. 36180077            994
    ##  5 Brazil                  35724. 34938073            978
    ##  6 South Korea             26409. 26462319           1002
    ##  7 United Kingdom          24220. 23977637            990
    ##  8 Italy                   23847. 23823192            999
    ##  9 Japan                   23496. 23519801           1001
    ## 10 Russia                  22077. 21525567            975
    ## 11 Turkey                  17353. 16919638            975
    ## 12 Spain                   13674. 13551539            991
    ## 13 Vietnam                 11854. 11509975            971
    ## 14 Australia               10648. 10456663            982
    ## 15 Argentina                9910.  9721718            981
    ## 16 China                    9102.  9420476           1035
    ## 17 Netherlands              8652.  8531447            986
    ## 18 Iran                     7582.  7559001            997
    ## 19 Mexico                   7257.  7118933            981
    ## 20 Indonesia                6738.  6596812            979

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       682.             671139.            984
    ##  2 Israel                        651.             639551.            982
    ##  3 Denmark                       620.             609974.            984
    ##  4 Switzerland                   570.             564152.            990
    ##  5 France                        563.             558918.            992
    ##  6 South Korea                   545.             546486.           1002
    ##  7 Portugal                      529.             517982.            979
    ##  8 Netherlands                   520.             512553.            986
    ##  9 Australia                     495.             486000.            982
    ## 10 Greece                        492.             482407.            981
    ## 11 Belgium                       450.             444793.            989
    ## 12 Germany                       445.             442287.            994
    ## 13 Czech Republic                405.             397802.            981
    ## 14 Italy                         395.             394814.            999
    ## 15 United Kingdom                388.             384575.            990
    ## 16 Slovakia                      349.             340026.            975
    ## 17 Serbia                        338.             328953.            974
    ## 18 United States                 316.             311870.            988
    ## 19 Chile                         297.             290165.            977
    ## 20 Norway                        296.             292896.            989

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
    ##  4 Peru                  5.20     217212  4177786
    ##  5 Somalia               4.99       1361    27254
    ##  6 Egypt                 4.81      24798   515420
    ##  7 Mexico                4.64     330444  7118933
    ##  8 Afghanistan           3.83       7829   204610
    ##  9 Ecuador               3.56      35935  1009388
    ## 10 Niger                 3.33        314     9433
    ## 11 Malawi                3.29       2896    88029
    ## 12 Myanmar               3.08      19486   632910
    ## 13 Bulgaria              2.96      37988  1284838
    ## 14 Paraguay              2.73      19608   718049
    ## 15 Tunisia               2.55      29263  1146702
    ## 16 Haiti                 2.54        860    33832
    ## 17 Chad                  2.54        194     7637
    ## 18 Algeria               2.54       6881   270952
    ## 19 South Africa          2.54     102371  4036165
    ## 20 Sri Lanka             2.50      16788   671481

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7263.     217212   29.9 
    ##  2 Bulgaria               5314.      37988    7.15
    ##  3 Hungary                4827.      48184    9.98
    ##  4 Czech Republic         3985.      41746   10.5 
    ##  5 Slovakia               3796.      20705    5.46
    ##  6 Chile                  3708.      62102   16.7 
    ##  7 United States          3433.    1064975  310.  
    ##  8 Brazil                 3425.     688764  201.  
    ##  9 Belgium                3174.      33021   10.4 
    ## 10 United Kingdom         3147.     196241   62.3 
    ## 11 Argentina              3145.     130011   41.3 
    ## 12 Greece                 3093.      34024   11   
    ## 13 Paraguay               3075.      19608    6.38
    ## 14 Poland                 3072.     118267   38.5 
    ## 15 Romania                3062.      67249   22.0 
    ## 16 Italy                  2983.     179985   60.3 
    ## 17 Colombia               2969.     141881   47.8 
    ## 18 Mexico                 2938.     330444  112.  
    ## 19 Russia                 2781.     391333  141.  
    ## 20 Tunisia                2764.      29263   10.6

EOL
