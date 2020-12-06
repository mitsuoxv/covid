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

Updated: 2020-12-07

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
    ##  1 United States           50864. 14191298            279
    ##  2 India                   36120.  9644222            267
    ##  3 Brazil                  24289.  6533968            269
    ##  4 Russia                   9356.  2460770            263
    ##  5 France                   8006.  2241830            280
    ##  6 United Kingdom           6136.  1705975            278
    ##  7 Spain                    6038.  1684647            279
    ##  8 Italy                    5958.  1709991            287
    ##  9 Argentina                5510.  1454631            264
    ## 10 Colombia                 5143.  1352607            263
    ## 11 Mexico                   4398.  1156770            263
    ## 12 Germany                  4168.  1171322            281
    ## 13 Poland                   3948.  1054273            267
    ## 14 Peru                     3677.   970860            264
    ## 15 Iran                     3610.  1028986            285
    ## 16 Ukraine                  3164.   813306            257
    ## 17 South Africa             3069.   810449            264
    ## 18 Indonesia                2133.   569707            267
    ## 19 Belgium                  2129.   589942            277
    ## 20 Chile                    2108.   558668            265

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      205.               56709.            277
    ##  2 Czech Republic               193.               51945.            269
    ##  3 Israel                       174.               46632.            268
    ##  4 United States                164.               45744.            279
    ##  5 Switzerland                  162.               45258.            279
    ##  6 Jordan                       143.               37070.            259
    ##  7 Argentina                    133.               35184.            264
    ##  8 Austria                      133.               36347.            273
    ##  9 Spain                        130.               36224.            279
    ## 10 Chile                        126.               33360.            265
    ## 11 France                       124.               34613.            280
    ## 12 Peru                         123.               32463.            264
    ## 13 Brazil                       121.               32491.            269
    ## 14 Netherlands                  120.               33030.            275
    ## 15 Portugal                     111.               29846.            268
    ## 16 Serbia                       111.               29115.            262
    ## 17 Colombia                     108.               28303.            263
    ## 18 Sweden                       106.               29187.            274
    ## 19 Poland                       103.               27384.            267
    ## 20 Italy                         98.7              28339.            287

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         607     2081
    ##  2 Mexico                  9.41     108863  1156770
    ##  3 Ecuador                 6.97      13756   197391
    ##  4 Sudan                   6.72       1290    19196
    ##  5 Bolivia                 6.18       8987   145325
    ##  6 Chad                    5.92        102     1722
    ##  7 Egypt                   5.72       6750   118014
    ##  8 Syria                   5.31        442     8320
    ##  9 China                   5.05       4753    94160
    ## 10 Iran                    4.86      50016  1028986
    ## 11 Niger                   4.30         77     1789
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.91       1865    47641
    ## 14 Peru                    3.73      36195   970860
    ## 15 United Kingdom          3.58      61014  1705975
    ## 16 Italy                   3.48      59514  1709991
    ## 17 Nicaragua               3.45        161     4671
    ## 18 Tunisia                 3.42       3526   102991
    ## 19 Guatemala               3.38       4239   125352
    ## 20 Australia               3.25        908    27956

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1659.      17254   10.4 
    ##  2 Peru                   1210.      36195   29.9 
    ##  3 Spain                   995.      46252   46.5 
    ##  4 Italy                   986.      59514   60.3 
    ##  5 United Kingdom          979.      61014   62.3 
    ##  6 Mexico                  968.     108863  112.  
    ##  7 Argentina               956.      39512   41.3 
    ##  8 Chile                   931.      15592   16.7 
    ##  9 Ecuador                 930.      13756   14.8 
    ## 10 Bolivia                 903.       8987    9.95
    ## 11 United States           891.     276503  310.  
    ## 12 Brazil                  875.     175964  201.  
    ## 13 France                  843.      54618   64.8 
    ## 14 Czech Republic          841.       8815   10.5 
    ## 15 Colombia                784.      37467   47.8 
    ## 16 Sweden                  740.       7067    9.56
    ## 17 Bulgaria                662.       4729    7.15
    ## 18 Iran                    650.      50016   76.9 
    ## 19 Switzerland             637.       4832    7.58
    ## 20 Hungary                 588.       5868    9.98

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
