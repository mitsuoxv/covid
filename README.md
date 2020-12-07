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

Updated: 2020-12-08

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
    ##  1 United States           51418. 14397135            280
    ##  2 India                   36109.  9677203            268
    ##  3 Brazil                  24360.  6577177            270
    ##  4 Russia                   9427.  2488912            264
    ##  5 France                   8017.  2252852            281
    ##  6 United Kingdom           6176.  1723246            279
    ##  7 Spain                    6016.  1684647            280
    ##  8 Italy                    6003.  1728878            288
    ##  9 Argentina                5508.  1459832            265
    ## 10 Colombia                 5160.  1362249            264
    ## 11 Mexico                   4425.  1168395            264
    ## 12 Germany                  4197.  1183654            282
    ## 13 Poland                   3968.  1063449            268
    ## 14 Peru                     3670.   972688            265
    ## 15 Iran                     3638.  1040547            286
    ## 16 Ukraine                  3185.   821947            258
    ## 17 South Africa             3073.   814565            265
    ## 18 Indonesia                2148.   575796            268
    ## 19 Belgium                  2128.   591756            278
    ## 20 Chile                    2106.   560382            266

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      205.               56883.            278
    ##  2 Czech Republic               193.               52199.            270
    ##  3 Israel                       173.               46632.            269
    ##  4 United States                166.               46408.            280
    ##  5 Switzerland                  162.               45258.            280
    ##  6 Jordan                       144.               37472.            260
    ##  7 Austria                      134.               36682.            274
    ##  8 Argentina                    133.               35310.            265
    ##  9 Spain                        129.               36224.            280
    ## 10 Chile                        126.               33463.            266
    ## 11 France                       124.               34783.            281
    ## 12 Peru                         123.               32524.            265
    ## 13 Brazil                       121.               32705.            270
    ## 14 Netherlands                  121.               33437.            276
    ## 15 Serbia                       114.               29906.            263
    ## 16 Portugal                     112.               30206.            269
    ## 17 Colombia                     108.               28505.            264
    ## 18 Sweden                       106.               29187.            275
    ## 19 Poland                       103.               27622.            268
    ## 20 Italy                         99.5              28652.            288

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         607     2082
    ##  2 Mexico                  9.37     109456  1168395
    ##  3 Ecuador                 6.96      13778   197998
    ##  4 Sudan                   6.65       1295    19468
    ##  5 Bolivia                 6.18       8992   145492
    ##  6 Chad                    5.91        102     1725
    ##  7 Egypt                   5.72       6771   118432
    ##  8 Syria                   5.32        447     8403
    ##  9 China                   5.04       4753    94293
    ## 10 Iran                    4.83      50310  1040547
    ## 11 Niger                   4.30         77     1789
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.91       1875    47901
    ## 14 Peru                    3.72      36231   972688
    ## 15 United Kingdom          3.55      61245  1723246
    ## 16 Italy                   3.47      60078  1728878
    ## 17 Nicaragua               3.45        161     4671
    ## 18 Tunisia                 3.42       3561   104002
    ## 19 Guatemala               3.39       4250   125550
    ## 20 Mali                    3.27        168     5135

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1665.      17320   10.4 
    ##  2 Peru                   1211.      36231   29.9 
    ##  3 Italy                   996.      60078   60.3 
    ##  4 Spain                   995.      46252   46.5 
    ##  5 United Kingdom          982.      61245   62.3 
    ##  6 Mexico                  973.     109456  112.  
    ##  7 Argentina               959.      39632   41.3 
    ##  8 Chile                   933.      15628   16.7 
    ##  9 Ecuador                 932.      13778   14.8 
    ## 10 Bolivia                 904.       8992    9.95
    ## 11 United States           899.     278806  310.  
    ## 12 Brazil                  878.     176628  201.  
    ## 13 Czech Republic          850.       8902   10.5 
    ## 14 France                  846.      54792   64.8 
    ## 15 Colombia                787.      37633   47.8 
    ## 16 Sweden                  740.       7067    9.56
    ## 17 Bulgaria                671.       4797    7.15
    ## 18 Iran                    654.      50310   76.9 
    ## 19 Switzerland             637.       4832    7.58
    ## 20 Hungary                 599.       5984    9.98

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
