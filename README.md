WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2021-01-03

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           63981. 19578217            306
    ##  2 India                   35053. 10305788            294
    ##  3 Brazil                  25932.  7675973            296
    ##  4 Russia                  11078.  3212637            290
    ##  5 France                   8455.  2595661            307
    ##  6 United Kingdom           8334.  2542069            305
    ##  7 Italy                    6781.  2129376            314
    ##  8 Spain                    6188.  1893502            306
    ##  9 Germany                  5699.  1755351            308
    ## 10 Colombia                 5664.  1642775            290
    ## 11 Argentina                5586.  1625514            291
    ## 12 Mexico                   4917.  1426094            290
    ## 13 Turkey                   4849.  1406517            290
    ## 14 Poland                   4465.  1312780            294
    ## 15 Iran                     3946.  1231429            312
    ## 16 Ukraine                  3766.  1069517            284
    ## 17 Peru                     3488.  1015137            291
    ## 18 Netherlands              2668.   805731            302
    ## 19 Indonesia                2555.   751270            294
    ## 20 Czech Republic           2484.   735469            296

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                237.              70205.            296
    ##  2 United States                 206.              63108.            306
    ##  3 Belgium                       205.              62318.            304
    ##  4 Israel                        196.              57871.            295
    ##  5 Switzerland                   194.              59369.            306
    ##  6 Jordan                        161.              46162.            286
    ##  7 Netherlands                   160.              48407.            302
    ##  8 Serbia                        160.              46291.            289
    ##  9 Sweden                        152.              45771.            301
    ## 10 Austria                       147.              44055.            300
    ## 11 Argentina                     135.              39318.            291
    ## 12 United Kingdom                134.              40772.            305
    ## 13 Portugal                      134.              39399.            295
    ## 14 Spain                         133.              40715.            306
    ## 15 France                        131.              40076.            307
    ## 16 Brazil                        129.              38169.            296
    ## 17 Chile                         125.              36579.            292
    ## 18 Colombia                      119.              34375.            290
    ## 19 Slovakia                      118.              34142.            290
    ## 20 Peru                          117.              33943.            291

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2105
    ##  2 Mexico               8.82     125807  1426094
    ##  3 Ecuador              6.59      14051   213378
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.22        717    11526
    ##  6 Bolivia              5.72       9165   160124
    ##  7 Egypt                5.51       7687   139471
    ##  8 China                4.95       4790    96829
    ##  9 Iran                 4.49      55337  1231429
    ## 10 Afghanistan          4.20       2211    52586
    ## 11 Bulgaria             3.75       7604   202540
    ## 12 Peru                 3.71      37680  1015137
    ## 13 Italy                3.50      74621  2129376
    ## 14 Greece               3.50       4881   139447
    ## 15 Guatemala            3.49       4820   138236
    ## 16 Nicaragua            3.42        165     4829
    ## 17 Tunisia              3.37       4730   140557
    ## 18 Australia            3.20        909    28427
    ## 19 Belgium              3.02      19581   648289
    ## 20 Hungary              2.99       9781   326688

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1882.      19581   10.4 
    ##  2 Peru                   1260.      37680   29.9 
    ##  3 Italy                  1237.      74621   60.3 
    ##  4 United Kingdom         1189.      74125   62.3 
    ##  5 Czech Republic         1129.      11827   10.5 
    ##  6 Mexico                 1119.     125807  112.  
    ##  7 United States          1095.     339550  310.  
    ##  8 Spain                  1085.      50442   46.5 
    ##  9 Bulgaria               1064.       7604    7.15
    ## 10 Argentina              1046.      43245   41.3 
    ## 11 Chile                   995.      16660   16.7 
    ## 12 France                  994.      64387   64.8 
    ## 13 Hungary                 980.       9781    9.98
    ## 14 Brazil                  969.     194949  201.  
    ## 15 Ecuador                 950.      14051   14.8 
    ## 16 Switzerland             930.       7049    7.58
    ## 17 Bolivia                 921.       9165    9.95
    ## 18 Sweden                  913.       8727    9.56
    ## 19 Colombia                904.      43213   47.8 
    ## 20 Poland                  755.      29058   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
