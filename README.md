WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
-   [Save data](#save-data)

Updated: 2021-01-29

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
“Southern Europe”. “West Europe” is basically Europe other than “Eastern
Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           75900. 25198841            332
    ##  2 India                   33441. 10701193            320
    ##  3 Brazil                  27743.  8933356            322
    ##  4 Russia                  12005.  3793810            316
    ##  5 United Kingdom          11223.  3715058            331
    ##  6 France                   9177.  3056198            333
    ##  7 Spain                    8018.  2670102            333
    ##  8 Turkey                   7752.  2449839            316
    ##  9 Italy                    7356.  2501147            340
    ## 10 Germany                  6523.  2178828            334
    ## 11 Colombia                 6460.  2041352            316
    ## 12 Argentina                5947.  1885210            317
    ## 13 Mexico                   5661.  1788905            316
    ## 14 Poland                   4677.  1496665            320
    ## 15 South Africa             4513.  1430648            317
    ## 16 Iran                     4119.  1392314            338
    ## 17 Ukraine                  3891.  1206412            310
    ## 18 Peru                     3492.  1107239            317
    ## 19 Indonesia                3201.  1024298            320
    ## 20 Czech Republic           2995.   964660            322

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                286.              92083.            322
    ##  2 Israel                        261.              83754.            321
    ##  3 United States                 245.              81226.            332
    ##  4 Switzerland                   205.              67955.            332
    ##  5 Belgium                       204.              67256.            330
    ##  6 Portugal                      195.              62659.            321
    ##  7 United Kingdom                180.              59585.            331
    ##  8 Sweden                        179.              58652.            327
    ##  9 Netherlands                   177.              57771.            327
    ## 10 Spain                         172.              57414.            333
    ## 11 Serbia                        168.              52968.            315
    ## 12 Jordan                        162.              50430.            312
    ## 13 Austria                       152.              49425.            326
    ## 14 Argentina                     144.              45599.            317
    ## 15 France                        142.              47187.            333
    ## 16 Slovakia                      141.              44625.            316
    ## 17 Brazil                        138.              44422.            322
    ## 18 Colombia                      135.              42715.            316
    ## 19 Chile                         133.              42390.            318
    ## 20 Italy                         122.              41451.            340

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2124
    ##  2 Mexico               8.50     152016  1788905
    ##  3 Syria                6.51        900    13823
    ##  4 Ecuador              6.06      14668   242146
    ##  5 Sudan                6.06       1760    29066
    ##  6 Egypt                5.57       9115   163761
    ##  7 Bolivia              4.92      10105   205208
    ##  8 China                4.79       4818   100548
    ##  9 Afghanistan          4.37       2397    54891
    ## 10 Iran                 4.14      57651  1392314
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.12       8944   217014
    ## 13 Mali                 4.07        327     8037
    ## 14 Greece               3.71       5724   154083
    ## 15 Peru                 3.62      40107  1107239
    ## 16 Chad                 3.58        117     3269
    ## 17 Guatemala            3.53       5486   155459
    ## 18 Italy                3.47      86889  2501147
    ## 19 Zimbabwe             3.47       1122    32304
    ## 20 Niger                3.45        153     4433

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2012.      20933   10.4 
    ##  2 United Kingdom         1634.     101887   62.3 
    ##  3 Czech Republic         1522.      15944   10.5 
    ##  4 Italy                  1440.      86889   60.3 
    ##  5 United States          1359.     421570  310.  
    ##  6 Mexico                 1352.     152016  112.  
    ##  7 Peru                   1341.      40107   29.9 
    ##  8 Bulgaria               1251.       8944    7.15
    ##  9 Spain                  1232.      57291   46.5 
    ## 10 Hungary                1231.      12291    9.98
    ## 11 Sweden                 1196.      11425    9.56
    ## 12 France                 1143.      74062   64.8 
    ## 13 Argentina              1143.      47253   41.3 
    ## 14 Switzerland            1121.       8499    7.58
    ## 15 Colombia               1091.      52128   47.8 
    ## 16 Brazil                 1088.     218878  201.  
    ## 17 Chile                  1077.      18040   16.7 
    ## 18 Portugal               1059.      11305   10.7 
    ## 19 Bolivia                1016.      10105    9.95
    ## 20 Ecuador                 992.      14668   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
