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

Updated: 2021-01-13

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
    ##  1 United States           70347. 22229803            316
    ##  2 India                   34471. 10479179            304
    ##  3 Brazil                  26489.  8105790            306
    ##  4 Russia                  11494.  3448203            300
    ##  5 United Kingdom           9900.  3118522            315
    ##  6 France                   8645.  2740656            317
    ##  7 Italy                    7064.  2289021            324
    ##  8 Spain                    6661.  2111782            317
    ##  9 Germany                  6081.  1933826            318
    ## 10 Colombia                 5956.  1786900            300
    ## 11 Argentina                5721.  1722217            301
    ## 12 Mexico                   5113.  1534039            300
    ## 13 Turkey                   5073.  1522138            300
    ## 14 Poland                   4573.  1390385            304
    ## 15 South Africa             4141.  1246643            301
    ## 16 Iran                     4014.  1292614            322
    ## 17 Ukraine                  3824.  1124430            294
    ## 18 Peru                     3439.  1035184            301
    ## 19 Netherlands              2824.   878263            311
    ## 20 Czech Republic           2760.   844799            306

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                263.              80641.            306
    ##  2 United States                 227.              71655.            316
    ##  3 Israel                        220.              67107.            305
    ##  4 Belgium                       204.              63945.            314
    ##  5 Switzerland                   201.              63592.            316
    ##  6 Netherlands                   170.              52764.            311
    ##  7 Serbia                        165.              49257.            299
    ##  8 Sweden                        165.              51222.            311
    ##  9 Jordan                        163.              48176.            296
    ## 10 United Kingdom                159.              50018.            315
    ## 11 Portugal                      150.              45831.            305
    ## 12 Austria                       150.              46439.            310
    ## 13 Spain                         143.              45409.            317
    ## 14 Argentina                     138.              41657.            301
    ## 15 France                        133.              42315.            317
    ## 16 Brazil                        132.              40307.            306
    ## 17 Slovakia                      129.              38768.            300
    ## 18 Chile                         128.              38569.            302
    ## 19 Colombia                      125.              37391.            300
    ## 20 Poland                        119.              36114.            304

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.1         613     2109
    ##  2 Mexico               8.72     133706  1534039
    ##  3 Ecuador              6.40      14184   221506
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.27        781    12462
    ##  6 Egypt                5.47       8249   150753
    ##  7 Bolivia              5.39       9376   173896
    ##  8 China                4.91       4800    97754
    ##  9 Iran                 4.35      56262  1292614
    ## 10 Afghanistan          4.29       2301    53584
    ## 11 Chad                 4.13        107     2589
    ## 12 Tanzania             4.13         21      509
    ## 13 Bulgaria             3.94       8232   209131
    ## 14 Mali                 3.90        299     7664
    ## 15 Peru                 3.70      38280  1035184
    ## 16 Greece               3.65       5302   145179
    ## 17 Guatemala            3.51       5025   143243
    ## 18 Italy                3.46      79203  2289021
    ## 19 Nicaragua            3.41        166     4867
    ## 20 Tunisia              3.25       5284   162350

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1934.      20122   10.4 
    ##  2 United Kingdom         1315.      81960   62.3 
    ##  3 Italy                  1313.      79203   60.3 
    ##  4 Czech Republic         1287.      13485   10.5 
    ##  5 Peru                   1280.      38280   29.9 
    ##  6 United States          1197.     371375  310.  
    ##  7 Mexico                 1189.     133706  112.  
    ##  8 Bulgaria               1152.       8232    7.15
    ##  9 Spain                  1124.      52275   46.5 
    ## 10 Hungary                1087.      10853    9.98
    ## 11 Argentina              1076.      44495   41.3 
    ## 12 France                 1040.      67368   64.8 
    ## 13 Chile                  1025.      17162   16.7 
    ## 14 Brazil                 1010.     203100  201.  
    ## 15 Switzerland            1010.       7655    7.58
    ## 16 Sweden                  987.       9433    9.56
    ## 17 Colombia                965.      46114   47.8 
    ## 18 Ecuador                 959.      14184   14.8 
    ## 19 Bolivia                 943.       9376    9.95
    ## 20 Austria                 817.       6702    8.20

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
