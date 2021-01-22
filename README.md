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

Updated: 2021-01-23

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
    ##  1 United States           74310. 24225155            326
    ##  2 India                   33839. 10625428            314
    ##  3 Brazil                  27336.  8638249            316
    ##  4 Russia                  11862.  3677352            310
    ##  5 United Kingdom          10903.  3543650            325
    ##  6 France                   8988.  2939128            327
    ##  7 Spain                    7512.  2456675            327
    ##  8 Italy                    7270.  2428221            334
    ##  9 Germany                  6421.  2106262            328
    ## 10 Colombia                 6312.  1956979            310
    ## 11 Argentina                5889.  1831681            311
    ## 12 Mexico                   5448.  1688944            310
    ## 13 Turkey                   5134.  1591878            310
    ## 14 Poland                   4664.  1464448            314
    ## 15 South Africa             4440.  1380807            311
    ## 16 Iran                     4079.  1354520            332
    ## 17 Ukraine                  3891.  1182969            304
    ## 18 Peru                     3468.  1078675            311
    ## 19 Indonesia                3030.   951651            314
    ## 20 Czech Republic           2926.   924847            316

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                279.              88282.            316
    ##  2 Israel                        246.              77394.            315
    ##  3 United States                 240.              78087.            326
    ##  4 Switzerland                   204.              66565.            326
    ##  5 Belgium                       204.              66022.            324
    ##  6 Sweden                        177.              56819.            321
    ##  7 Portugal                      177.              55746.            315
    ##  8 United Kingdom                175.              56836.            325
    ##  9 Netherlands                   175.              56046.            321
    ## 10 Serbia                        167.              51613.            309
    ## 11 Jordan                        162.              49661.            306
    ## 12 Spain                         162.              52825.            327
    ## 13 Austria                       151.              48368.            320
    ## 14 Argentina                     142.              44304.            311
    ## 15 France                        139.              45379.            327
    ## 16 Slovakia                      138.              42718.            310
    ## 17 Brazil                        136.              42954.            316
    ## 18 Colombia                      132.              40950.            310
    ## 19 Chile                         131.              40910.            312
    ## 20 Poland                        121.              38038.            314

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         615     2119
    ##  2 Mexico               8.55     144371  1688944
    ##  3 Syria                6.46        866    13398
    ##  4 Ecuador              6.15      14526   236189
    ##  5 Sudan                6.05       1707    28233
    ##  6 Egypt                5.51       8801   159715
    ##  7 Bolivia              5.04       9764   193745
    ##  8 China                4.83       4809    99589
    ##  9 Afghanistan          4.35       2370    54483
    ## 10 Iran                 4.22      57150  1354520
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.09       8741   213864
    ## 13 Mali                 4.05        320     7911
    ## 14 Chad                 3.72        114     3065
    ## 15 Greece               3.70       5570   150479
    ## 16 Peru                 3.63      39157  1078675
    ## 17 Guatemala            3.54       5389   152395
    ## 18 Italy                3.47      84202  2428221
    ## 19 Niger                3.45        147     4267
    ## 20 Nicaragua            3.39        168     4953

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1982.      20620   10.4 
    ##  2 United Kingdom         1517.      94580   62.3 
    ##  3 Czech Republic         1444.      15130   10.5 
    ##  4 Italy                  1395.      84202   60.3 
    ##  5 Peru                   1309.      39157   29.9 
    ##  6 United States          1298.     402803  310.  
    ##  7 Mexico                 1284.     144371  112.  
    ##  8 Bulgaria               1223.       8741    7.15
    ##  9 Spain                  1184.      55041   46.5 
    ## 10 Hungary                1183.      11811    9.98
    ## 11 Sweden                 1143.      10921    9.56
    ## 12 Argentina              1118.      46216   41.3 
    ## 13 France                 1106.      71607   64.8 
    ## 14 Switzerland            1087.       8238    7.58
    ## 15 Brazil                 1058.     212831  201.  
    ## 16 Chile                  1057.      17702   16.7 
    ## 17 Colombia               1042.      49792   47.8 
    ## 18 Ecuador                 982.      14526   14.8 
    ## 19 Bolivia                 982.       9764    9.95
    ## 20 Portugal                907.       9686   10.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
