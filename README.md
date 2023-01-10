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

Updated: 2023-01-11

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
    ##  1 United States           95770. 99888608           1043
    ##  2 India                   43295. 44680215           1032
    ##  3 France                  36662. 38312094           1045
    ##  4 Germany                 35855. 37540072           1047
    ##  5 Brazil                  35393. 36490050           1031
    ##  6 Japan                   29003. 30568877           1054
    ##  7 South Korea             28056. 29599747           1055
    ##  8 Italy                   24030. 25279682           1052
    ##  9 United Kingdom          23212. 24210131           1043
    ## 10 Russia                  21238. 21832768           1028
    ## 11 Turkey                  16541. 17004677           1028
    ## 12 Spain                   13116. 13693478           1044
    ## 13 Vietnam                 11255. 11525571           1024
    ## 14 Australia               10673. 11047174           1035
    ## 15 China                    9905. 10776430           1088
    ## 16 Argentina                9676. 10004679           1034
    ## 17 Netherlands              8261.  8574631           1038
    ## 18 Iran                     7202.  7562060           1050
    ## 19 Mexico                   7044.  7283849           1034
    ## 20 Indonesia                6516.  6724281           1032

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       673.             698128.           1037
    ##  2 Israel                        627.             648983.           1035
    ##  3 Denmark                       598.             619093.           1036
    ##  4 South Korea                   579.             611279.           1055
    ##  5 France                        566.             591525.           1045
    ##  6 Switzerland                   554.             578072.           1043
    ##  7 Portugal                      504.             520601.           1032
    ##  8 Netherlands                   496.             515148.           1038
    ##  9 Australia                     496.             513446.           1035
    ## 10 Greece                        488.             504408.           1034
    ## 11 Germany                       438.             458912.           1047
    ## 12 Belgium                       432.             450085.           1041
    ## 13 Czech Republic                423.             437538.           1034
    ## 14 Italy                         398.             418952.           1052
    ## 15 United Kingdom                372.             388304.           1043
    ## 16 Slovakia                      332.             340933.           1028
    ## 17 Serbia                        325.             334122.           1027
    ## 18 United States                 309.             321979.           1043
    ## 19 Chile                         294.             302693.           1030
    ## 20 Norway                        283.             294741.           1042

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
    ##  5 Peru                  4.89     218387  4469601
    ##  6 Egypt                 4.81      24803   515556
    ##  7 Mexico                4.55     331324  7283849
    ##  8 Afghanistan           3.78       7854   207841
    ##  9 Ecuador               3.45      35934  1040463
    ## 10 Niger                 3.31        315     9504
    ## 11 Myanmar               3.08      19490   633726
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38127  1293491
    ## 14 Paraguay              2.71      19716   728605
    ## 15 Tunisia               2.55      29285  1147645
    ## 16 Algeria               2.54       6881   271229
    ## 17 Haiti                 2.54        860    33912
    ## 18 Chad                  2.54        194     7651
    ## 19 South Africa          2.53     102568  4050050
    ## 20 Sri Lanka             2.50      16820   671937

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7302.     218387   29.9 
    ##  2 Bulgaria               5333.      38127    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4030.      42220   10.5 
    ##  5 Slovakia               3823.      20855    5.46
    ##  6 Chile                  3784.      63373   16.7 
    ##  7 United States          3497.    1084932  310.  
    ##  8 Brazil                 3455.     694817  201.  
    ##  9 United Kingdom         3224.     201028   62.3 
    ## 10 Belgium                3210.      33395   10.4 
    ## 11 Greece                 3162.      34779   11   
    ## 12 Argentina              3150.     130249   41.3 
    ## 13 Paraguay               3092.      19716    6.38
    ## 14 Poland                 3081.     118601   38.5 
    ## 15 Italy                  3073.     185417   60.3 
    ## 16 Romania                3072.      67460   22.0 
    ## 17 Colombia               2977.     142259   47.8 
    ## 18 Mexico                 2946.     331324  112.  
    ## 19 Russia                 2801.     394168  141.  
    ## 20 Tunisia                2766.      29285   10.6

EOL
