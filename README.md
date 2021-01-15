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

Updated: 2021-01-16

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
    ##  1 United States           71697. 22871330            319
    ##  2 India                   34292. 10527683            307
    ##  3 Brazil                  26720.  8256536            309
    ##  4 Russia                  11618.  3520531            303
    ##  5 United Kingdom          10252.  3260262            318
    ##  6 France                   8765.  2804780            320
    ##  7 Italy                    7144.  2336279            327
    ##  8 Spain                    6912.  2211967            320
    ##  9 Germany                  6233.  2000958            321
    ## 10 Colombia                 6046.  1831980            303
    ## 11 Argentina                5781.  1757429            304
    ## 12 Mexico                   5187.  1571901            303
    ## 13 Turkey                   5116.  1550463            303
    ## 14 Poland                   4633.  1422320            307
    ## 15 South Africa             4265.  1296806            304
    ## 16 Iran                     4036.  1311810            325
    ## 17 Ukraine                  3861.  1146963            297
    ## 18 Peru                     3433.  1043640            304
    ## 19 Netherlands              2852.   895687            314
    ## 20 Indonesia                2832.   869600            307

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                270.              83487.            309
    ##  2 United States                 231.              73723.            319
    ##  3 Israel                        230.              70974.            308
    ##  4 Belgium                       204.              64682.            317
    ##  5 Switzerland                   203.              64687.            319
    ##  6 Sweden                        173.              54289.            314
    ##  7 Netherlands                   171.              53811.            314
    ##  8 Serbia                        166.              50113.            302
    ##  9 United Kingdom                164.              52291.            318
    ## 10 Jordan                        163.              48703.            299
    ## 11 Portugal                      157.              48502.            308
    ## 12 Austria                       150.              47108.            313
    ## 13 Spain                         149.              47563.            320
    ## 14 Argentina                     140.              42508.            304
    ## 15 France                        135.              43305.            320
    ## 16 Slovakia                      133.              40460.            303
    ## 17 Brazil                        133.              41056.            309
    ## 18 Chile                         129.              39215.            305
    ## 19 Colombia                      127.              38334.            303
    ## 20 Poland                        120.              36943.            307

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         613     2114
    ##  2 Mexico               8.71     136917  1571901
    ##  3 Syria                6.34        809    12760
    ##  4 Ecuador              6.30      14246   226002
    ##  5 Sudan                6.13       1576    25730
    ##  6 Egypt                5.48       8421   153741
    ##  7 Bolivia              5.31       9493   178818
    ##  8 China                4.89       4803    98290
    ##  9 Afghanistan          4.32       2324    53831
    ## 10 Iran                 4.31      56538  1311810
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             3.98       8396   210951
    ## 13 Chad                 3.97        110     2773
    ## 14 Mali                 3.92        303     7738
    ## 15 Peru                 3.69      38473  1043640
    ## 16 Greece               3.66       5387   147283
    ## 17 Guatemala            3.51       5151   146937
    ## 18 Italy                3.46      80848  2336279
    ## 19 Nicaragua            3.40        167     4916
    ## 20 Niger                3.38        137     4058

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1951.      20294   10.4 
    ##  2 United Kingdom         1380.      86015   62.3 
    ##  3 Italy                  1340.      80848   60.3 
    ##  4 Czech Republic         1339.      14029   10.5 
    ##  5 Peru                   1286.      38473   29.9 
    ##  6 United States          1230.     381522  310.  
    ##  7 Mexico                 1217.     136917  112.  
    ##  8 Bulgaria               1174.       8396    7.15
    ##  9 Spain                  1141.      53079   46.5 
    ## 10 Hungary                1120.      11177    9.98
    ## 11 Argentina              1088.      44983   41.3 
    ## 12 Sweden                 1066.      10185    9.56
    ## 13 France                 1064.      68928   64.8 
    ## 14 Switzerland            1037.       7864    7.58
    ## 15 Chile                  1033.      17294   16.7 
    ## 16 Brazil                 1024.     205964  201.  
    ## 17 Colombia                986.      47124   47.8 
    ## 18 Ecuador                 963.      14246   14.8 
    ## 19 Bolivia                 954.       9493    9.95
    ## 20 Poland                  853.      32844   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
