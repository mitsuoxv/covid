WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-10-04

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
    ##  1 United States          100599. 94965623            944
    ##  2 India                   47800. 44597498            933
    ##  3 Brazil                  37182. 34654190            932
    ##  4 France                  36353. 34390313            946
    ##  5 Germany                 35217. 33386229            948
    ##  6 South Korea             25974. 24831761            956
    ##  7 United Kingdom          25077. 23672855            944
    ##  8 Italy                   23640. 22529252            953
    ##  9 Russia                  22684. 21073185            929
    ## 10 Japan                   22336. 21330772            955
    ## 11 Turkey                  18163. 16873793            929
    ## 12 Spain                   14204. 13422984            945
    ## 13 Vietnam                 12411. 11480518            925
    ## 14 Australia               10888. 10191312            936
    ## 15 Argentina               10383.  9708420            935
    ## 16 Netherlands              8969.  8430861            940
    ## 17 Iran                     7938.  7549586            951
    ## 18 China                    7838.  7752253            989
    ## 19 Mexico                   7574.  7082034            935
    ## 20 Indonesia                6897.  6434585            933

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        678.             634265.            936
    ##  2 Austria                       670.             628208.            938
    ##  3 Denmark                       641.             601666.            938
    ##  4 Switzerland                   571.             538757.            944
    ##  5 France                        561.             530974.            946
    ##  6 Portugal                      550.             513382.            933
    ##  7 Netherlands                   539.             506510.            940
    ##  8 South Korea                   536.             512813.            956
    ##  9 Australia                     506.             473667.            936
    ## 10 Greece                        478.             447290.            935
    ## 11 Belgium                       463.             436846.            943
    ## 12 Germany                       431.             408133.            948
    ## 13 Czech Republic                419.             392237.            935
    ## 14 United Kingdom                402.             379686.            944
    ## 15 Italy                         392.             373370.            953
    ## 16 Slovakia                      364.             338122.            929
    ## 17 Serbia                        347.             321969.            928
    ## 18 United States                 324.             306111.            944
    ## 19 Norway                        310.             291928.            942
    ## 20 Spain                         305.             288629.            945

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2157    11935
    ##  2 Sudan                 7.84       4961    63280
    ##  3 Syria                 5.52       3163    57309
    ##  4 Peru                  5.23     216539  4143085
    ##  5 Somalia               5.00       1361    27207
    ##  6 Egypt                 4.81      24797   515381
    ##  7 Mexico                4.66     330046  7082034
    ##  8 Afghanistan           3.91       7799   199272
    ##  9 Ecuador               3.58      35894  1003778
    ## 10 Niger                 3.33        313     9411
    ## 11 Myanmar               3.12      19459   623914
    ## 12 Malawi                3.05       2680    88005
    ## 13 Bulgaria              2.99      37718  1259948
    ## 14 Paraguay              2.73      19583   716059
    ## 15 Tunisia               2.55      29249  1145686
    ## 16 Chad                  2.55        193     7581
    ## 17 Haiti                 2.54        857    33702
    ## 18 South Africa          2.54     102185  4018768
    ## 19 Algeria               2.54       6879   270668
    ## 20 Sri Lanka             2.50      16762   670790

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7240.     216539   29.9 
    ##  2 Bulgaria               5276.      37718    7.15
    ##  3 Hungary                4759.      47503    9.98
    ##  4 Czech Republic         3925.      41118   10.5 
    ##  5 Slovakia               3751.      20462    5.46
    ##  6 Chile                  3651.      61141   16.7 
    ##  7 Brazil                 3411.     685927  201.  
    ##  8 United States          3376.    1047392  310.  
    ##  9 Argentina              3142.     129897   41.3 
    ## 10 Belgium                3141.      32673   10.4 
    ## 11 Paraguay               3071.      19583    6.38
    ## 12 Poland                 3054.     117598   38.5 
    ## 13 Romania                3053.      67031   22.0 
    ## 14 United Kingdom         3052.     190317   62.3 
    ## 15 Greece                 3010.      33111   11   
    ## 16 Colombia               2966.     141769   47.8 
    ## 17 Italy                  2936.     177150   60.3 
    ## 18 Mexico                 2935.     330046  112.  
    ## 19 Tunisia                2762.      29249   10.6 
    ## 20 Russia                 2754.     387559  141.

EOL
