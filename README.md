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

Updated: 2023-01-12

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
    ##  1 United States           95679. 99888608           1044
    ##  2 India                   43253. 44680386           1033
    ##  3 France                  36638. 38323809           1046
    ##  4 Germany                 35842. 37562191           1048
    ##  5 Brazil                  35379. 36511286           1032
    ##  6 Japan                   29050. 30647859           1055
    ##  7 South Korea             28081. 29654090           1056
    ##  8 Italy                   24007. 25279682           1053
    ##  9 United Kingdom          23190. 24210131           1044
    ## 10 Russia                  21221. 21836969           1029
    ## 11 Turkey                  16525. 17004677           1029
    ## 12 Spain                   13104. 13693478           1045
    ## 13 Vietnam                 11245. 11525911           1025
    ## 14 Australia               10663. 11047174           1036
    ## 15 China                    9920. 10803226           1089
    ## 16 Argentina                9666. 10004679           1035
    ## 17 Netherlands              8247.  8576523           1040
    ## 18 Iran                     7195.  7562169           1051
    ## 19 Mexico                   7037.  7283849           1035
    ## 20 Indonesia                6510.  6724683           1033

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       673.             698496.           1038
    ##  2 Israel                        627.             649104.           1036
    ##  3 Denmark                       597.             619183.           1037
    ##  4 South Korea                   580.             612401.           1056
    ##  5 France                        566.             591705.           1046
    ##  6 Switzerland                   554.             578242.           1044
    ##  7 Portugal                      504.             520601.           1033
    ##  8 Australia                     496.             513446.           1036
    ##  9 Netherlands                   495.             515261.           1040
    ## 10 Greece                        487.             504408.           1035
    ## 11 Germany                       438.             459183.           1048
    ## 12 Belgium                       432.             450085.           1042
    ## 13 Czech Republic                423.             437574.           1035
    ## 14 Italy                         398.             418952.           1053
    ## 15 United Kingdom                372.             388304.           1044
    ## 16 Slovakia                      331.             340955.           1029
    ## 17 Serbia                        325.             334280.           1028
    ## 18 United States                 308.             321979.           1044
    ## 19 Chile                         294.             302812.           1031
    ## 20 Norway                        283.             294769.           1043

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4995    63702
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27310
    ##  5 Peru                  4.89     218413  4470192
    ##  6 Egypt                 4.81      24803   515556
    ##  7 Mexico                4.55     331324  7283849
    ##  8 Afghanistan           3.78       7854   207866
    ##  9 Ecuador               3.45      35934  1040463
    ## 10 Niger                 3.31        315     9506
    ## 11 Myanmar               3.08      19490   633730
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38130  1293684
    ## 14 Paraguay              2.71      19716   728605
    ## 15 Tunisia               2.55      29288  1147729
    ## 16 Algeria               2.54       6881   271255
    ## 17 Chad                  2.54        194     7651
    ## 18 South Africa          2.53     102568  4050288
    ## 19 Haiti                 2.53        860    33969
    ## 20 Sri Lanka             2.50      16820   671942

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7303.     218413   29.9 
    ##  2 Bulgaria               5334.      38130    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4031.      42229   10.5 
    ##  5 Slovakia               3824.      20859    5.46
    ##  6 Chile                  3785.      63381   16.7 
    ##  7 United States          3497.    1084932  310.  
    ##  8 Brazil                 3456.     694917  201.  
    ##  9 United Kingdom         3224.     201028   62.3 
    ## 10 Belgium                3210.      33395   10.4 
    ## 11 Greece                 3185       35035   11   
    ## 12 Argentina              3150.     130249   41.3 
    ## 13 Paraguay               3092.      19716    6.38
    ## 14 Poland                 3081.     118615   38.5 
    ## 15 Italy                  3073.     185417   60.3 
    ## 16 Romania                3072.      67460   22.0 
    ## 17 Colombia               2977.     142259   47.8 
    ## 18 Mexico                 2946.     331324  112.  
    ## 19 Russia                 2802.     394214  141.  
    ## 20 Tunisia                2766.      29288   10.6

EOL
