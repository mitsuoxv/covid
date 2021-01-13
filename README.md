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

Updated: 2021-01-14

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
    ##  1 United States           70752. 22428591            317
    ##  2 India                   34410. 10495147            305
    ##  3 Brazil                  26487.  8131612            307
    ##  4 Russia                  11531.  3471053            301
    ##  5 United Kingdom          10012.  3164055            316
    ##  6 France                   8680.  2760259            318
    ##  7 Italy                    7087.  2303263            325
    ##  8 Spain                    6720.  2137220            318
    ##  9 Germany                  6123.  1953426            319
    ## 10 Colombia                 5986.  1801903            301
    ## 11 Argentina                5731.  1730921            302
    ## 12 Mexico                   5121.  1541633            301
    ## 13 Turkey                   5089.  1531947            301
    ## 14 Poland                   4606.  1404905            305
    ## 15 South Africa             4171.  1259748            302
    ## 16 Iran                     4021.  1299022            323
    ## 17 Ukraine                  3833.  1130839            295
    ## 18 Peru                     3434.  1037350            302
    ## 19 Netherlands              2830.   883135            312
    ## 20 Czech Republic           2787.   855600            307

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                266.              81672.            307
    ##  2 United States                 228.              72296.            317
    ##  3 Israel                        219.              67107.            306
    ##  4 Belgium                       204.              64147.            315
    ##  5 Switzerland                   202.              63966.            317
    ##  6 Netherlands                   170.              53057.            312
    ##  7 Sweden                        170.              53042.            312
    ##  8 Serbia                        165.              49548.            300
    ##  9 Jordan                        163.              48360.            297
    ## 10 United Kingdom                161.              50748.            316
    ## 11 Portugal                      152.              46511.            306
    ## 12 Austria                       150.              46650.            311
    ## 13 Spain                         145.              45956.            318
    ## 14 Argentina                     139.              41867.            302
    ## 15 France                        134.              42617.            318
    ## 16 Brazil                        132.              40435.            307
    ## 17 Slovakia                      131.              39423.            301
    ## 18 Chile                         128.              38762.            303
    ## 19 Colombia                      125.              37705.            301
    ## 20 Poland                        120.              36491.            305

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         613     2111
    ##  2 Mexico               8.72     134368  1541633
    ##  3 Ecuador              6.38      14196   222567
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.29        790    12558
    ##  6 Egypt                5.47       8304   151723
    ##  7 Bolivia              5.37       9415   175288
    ##  8 China                4.90       4801    97933
    ##  9 Iran                 4.34      56360  1299022
    ## 10 Afghanistan          4.29       2301    53584
    ## 11 Tanzania             4.13         21      509
    ## 12 Chad                 4.05        108     2668
    ## 13 Bulgaria             3.94       8279   209881
    ## 14 Mali                 3.94        303     7687
    ## 15 Peru                 3.70      38335  1037350
    ## 16 Greece               3.65       5329   146020
    ## 17 Guatemala            3.50       5080   144982
    ## 18 Italy                3.47      79819  2303263
    ## 19 Niger                3.40        135     3969
    ## 20 Nicaragua            3.40        167     4916

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1941.      20194   10.4 
    ##  2 United Kingdom         1334.      83203   62.3 
    ##  3 Italy                  1323.      79819   60.3 
    ##  4 Czech Republic         1304.      13656   10.5 
    ##  5 Peru                   1282.      38335   29.9 
    ##  6 United States          1203.     373329  310.  
    ##  7 Mexico                 1195.     134368  112.  
    ##  8 Bulgaria               1158.       8279    7.15
    ##  9 Spain                  1133.      52683   46.5 
    ## 10 Hungary                1097.      10948    9.98
    ## 11 Argentina              1080.      44654   41.3 
    ## 12 France                 1056.      68419   64.8 
    ## 13 Chile                  1026.      17182   16.7 
    ## 14 Switzerland            1023.       7753    7.58
    ## 15 Brazil                 1012.     203580  201.  
    ## 16 Sweden                 1012.       9667    9.56
    ## 17 Colombia                972.      46451   47.8 
    ## 18 Ecuador                 960.      14196   14.8 
    ## 19 Bolivia                 946.       9415    9.95
    ## 20 Poland                  833.      32074   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
