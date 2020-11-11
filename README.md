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

Updated: 2020-11-12

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
    ##  1 United States           39333.  9990620            254
    ##  2 India                   35686.  8636011            242
    ##  3 Brazil                  23258.  5675032            244
    ##  4 Russia                   7718.  1836960            238
    ##  5 France                   7038.  1794717            255
    ##  6 Spain                    5506.  1398613            254
    ##  7 Argentina                5232.  1250499            239
    ##  8 United Kingdom           4876.  1233779            253
    ##  9 Colombia                 4828.  1149063            238
    ## 10 Mexico                   4087.   972785            238
    ## 11 Peru                     3864.   923527            239
    ## 12 Italy                    3799.   995463            262
    ## 13 South Africa             3097.   740254            239
    ## 14 Germany                  2756.   705687            256
    ## 15 Iran                     2704.   703288            260
    ## 16 Poland                   2452.   593592            242
    ## 17 Chile                    2182.   523907            240
    ## 18 Ukraine                  2111.   489808            232
    ## 19 Iraq                     2088.   505310            242
    ## 20 Belgium                  2013.   507380            252

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      193.               48772.            252
    ##  2 Israel                       178.               43432.            244
    ##  3 Czech Republic               168.               41035.            244
    ##  4 Chile                        130.               31285.            240
    ##  5 Peru                         129.               30880.            239
    ##  6 United States                127.               32204.            254
    ##  7 Argentina                    127.               30247.            239
    ##  8 Switzerland                  122.               30911.            254
    ##  9 Spain                        118.               30074.            254
    ## 10 Brazil                       116.               28219.            244
    ## 11 France                       109.               27710.            255
    ## 12 Colombia                     101.               24044.            238
    ## 13 Netherlands                  101.               25167.            250
    ## 14 Jordan                        80.6              18883.            234
    ## 15 Austria                       79.6              19750.            248
    ## 16 United Kingdom                78.2              19788.            253
    ## 17 Portugal                      72.1              17538.            243
    ## 18 Iraq                          70.4              17030.            242
    ## 19 Sweden                        67.9              16978.            250
    ## 20 Libya                         64.8              10835.            167

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2070
    ##  2 Mexico                  9.79      95225   972785
    ##  3 Sudan                   7.88       1116    14155
    ##  4 Ecuador                 7.31      12849   175711
    ##  5 Chad                    6.34         99     1561
    ##  6 Bolivia                 6.17       8802   142561
    ##  7 Egypt                   5.83       6394   109654
    ##  8 Iran                    5.57      39202   703288
    ##  9 Niger                   5.49         69     1256
    ## 10 China                   5.15       4749    92299
    ## 11 Syria                   5.12        325     6352
    ## 12 Italy                   4.25      42330   995463
    ## 13 Tanzania                4.13         21      509
    ## 14 United Kingdom          4.03      49770  1233779
    ## 15 Canada                  3.93      10564   268735
    ## 16 Peru                    3.78      34943   923527
    ## 17 Sweden                  3.73       6057   162240
    ## 18 Afghanistan             3.71       1577    42463
    ## 19 Mali                    3.66        137     3745
    ## 20 Nicaragua               3.49        158     4533

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1304.      13561   10.4 
    ##  2 Peru                   1168.      34943   29.9 
    ##  3 Bolivia                 885.       8802    9.95
    ##  4 Chile                   872.      14611   16.7 
    ##  5 Ecuador                 869.      12849   14.8 
    ##  6 Spain                   855.      39756   46.5 
    ##  7 Mexico                  847.      95225  112.  
    ##  8 Argentina               820.      33907   41.3 
    ##  9 Brazil                  809.     162628  201.  
    ## 10 United Kingdom          798.      49770   62.3 
    ## 11 United States           763.     236727  310.  
    ## 12 Italy                   702.      42330   60.3 
    ## 13 Colombia                690.      32974   47.8 
    ## 14 France                  647.      41885   64.8 
    ## 15 Sweden                  634.       6057    9.56
    ## 16 Iran                    510.      39202   76.9 
    ## 17 Czech Republic          508.       5323   10.5 
    ## 18 Netherlands             488.       8131   16.6 
    ## 19 South Africa            407.      19951   49   
    ## 20 Iraq                    385.      11432   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
