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

Updated: 2020-11-13

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
    ##  1 United States           39704. 10124555            255
    ##  2 India                   35736.  8683916            243
    ##  3 Brazil                  23265.  5700044            245
    ##  4 Russia                   7776.  1858568            239
    ##  5 France                   7147.  1829688            256
    ##  6 Spain                    5559.  1417709            255
    ##  7 Argentina                5260.  1262476            240
    ##  8 United Kingdom           4947.  1256729            254
    ##  9 Colombia                 4839.  1156675            239
    ## 10 Mexico                   4094.   978531            239
    ## 11 Italy                    3910.  1028424            263
    ## 12 Peru                     3855.   925431            240
    ## 13 South Africa             3093.   742394            240
    ## 14 Germany                  2831.   727553            257
    ## 15 Iran                     2739.   715068            261
    ## 16 Poland                   2546.   618813            243
    ## 17 Chile                    2177.   524804            241
    ## 18 Ukraine                  2149.   500865            233
    ## 19 Iraq                     2092.   508508            243
    ## 20 Belgium                  2036.   515296            253

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      196.               49533.            253
    ##  2 Israel                       178.               43625.            245
    ##  3 Czech Republic               171.               41887.            245
    ##  4 Chile                        130.               31338.            241
    ##  5 Peru                         129.               30944.            240
    ##  6 United States                128.               32635.            255
    ##  7 Argentina                    127.               30536.            240
    ##  8 Switzerland                  125.               31998.            255
    ##  9 Spain                        120.               30484.            255
    ## 10 Brazil                       116.               28344.            245
    ## 11 France                       110.               28250.            256
    ## 12 Netherlands                  102.               25492.            251
    ## 13 Colombia                     101.               24203.            239
    ## 14 Austria                       84.0              20926.            249
    ## 15 Jordan                        83.9              19728.            235
    ## 16 United Kingdom                79.3              20157.            254
    ## 17 Portugal                      73.7              18000.            244
    ## 18 Iraq                          70.5              17138.            243
    ## 19 Sweden                        69.4              17445.            251
    ## 20 Poland                        66.1              16073.            243

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2070
    ##  2 Mexico                  9.79      95842   978531
    ##  3 Sudan                   7.78       1116    14346
    ##  4 Ecuador                 7.31      12920   176630
    ##  5 Chad                    6.33         99     1565
    ##  6 Bolivia                 6.17       8808   142664
    ##  7 Egypt                   5.83       6405   109881
    ##  8 Iran                    5.55      39664   715068
    ##  9 Niger                   5.49         69     1256
    ## 10 China                   5.14       4749    92336
    ## 11 Syria                   5.12        329     6421
    ## 12 Italy                   4.18      42953  1028424
    ## 13 Tanzania                4.13         21      509
    ## 14 United Kingdom          4.01      50365  1256729
    ## 15 Canada                  3.89      10632   273037
    ## 16 Peru                    3.78      34992   925431
    ## 17 Afghanistan             3.71       1581    42609
    ## 18 Mali                    3.68        138     3753
    ## 19 Sweden                  3.65       6082   166707
    ## 20 Nicaragua               3.49        158     4533

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1323.      13758   10.4 
    ##  2 Peru                   1170.      34992   29.9 
    ##  3 Bolivia                 885.       8808    9.95
    ##  4 Chile                   874.      14633   16.7 
    ##  5 Ecuador                 874.      12920   14.8 
    ##  6 Spain                   862.      40105   46.5 
    ##  7 Mexico                  852.      95842  112.  
    ##  8 Argentina               827.      34183   41.3 
    ##  9 Brazil                  810.     162829  201.  
    ## 10 United Kingdom          808.      50365   62.3 
    ## 11 United States           769.     238573  310.  
    ## 12 Italy                   712.      42953   60.3 
    ## 13 Colombia                694.      33148   47.8 
    ## 14 France                  652.      42203   64.8 
    ## 15 Sweden                  636.       6082    9.56
    ## 16 Czech Republic          532.       5570   10.5 
    ## 17 Iran                    516.      39664   76.9 
    ## 18 Netherlands             493.       8205   16.6 
    ## 19 South Africa            408.      20011   49   
    ## 20 Iraq                    387.      11482   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
