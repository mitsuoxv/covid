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

Updated: 2020-10-09

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
    ##  1 United States           33723.  7419230            220
    ##  2 India                   32863.  6835655            208
    ##  3 Brazil                  23662.  4969141            210
    ##  4 Russia                   6176.  1260112            204
    ##  5 Colombia                 4263.   869808            204
    ##  6 Peru                     4062.   832929            205
    ##  7 Argentina                4021.   824468            205
    ##  8 Spain                    3799.   835901            220
    ##  9 Mexico                   3772.   769558            204
    ## 10 South Africa             3332.   683242            205
    ## 11 France                   2809.   626502            223
    ## 12 United Kingdom           2485.   544279            219
    ## 13 Chile                    2302.   474440            206
    ## 14 Iran                     2140.   483844            226
    ## 15 Bangladesh               2006.   373151            186
    ## 16 Iraq                     1879.   391044            208
    ## 17 Saudi Arabia             1615.   337711            209
    ## 18 Turkey                   1612.   329138            204
    ## 19 Philippines              1584.   329637            208
    ## 20 Pakistan                 1538.   316934            206

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           178.               37185.            209
    ##  2 Chile                            137.               28331.            206
    ##  3 Peru                             136.               27851.            205
    ##  4 Brazil                           118.               24709.            210
    ##  5 United States                    109.               23915.            220
    ##  6 Argentina                         97.3              19942.            205
    ##  7 Colombia                          89.2              18201.            204
    ##  8 Spain                             81.7              17974.            220
    ##  9 Bolivia                           72.3              13819.            191
    ## 10 South Africa                      68.0              13944.            205
    ## 11 Iraq                              63.3              13179.            208
    ## 12 Saudi Arabia                      62.8              13124.            209
    ## 13 Belgium                           60.7              13244.            218
    ## 14 Dominican Republic                59.3              11823.            199
    ## 15 Honduras                          52.2              10096.            193
    ## 16 Ecuador                           47.3               9704.            205
    ## 17 Kazakhstan                        47.0               9272.            197
    ## 18 Sweden                            46.8              10117.            216
    ## 19 Libya                             45.9               6115.            133
    ## 20 Kyrgyzstan                        45.6               8776.            192

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         594     2053
    ##  2 Italy                  10.8       36061   333940
    ##  3 Mexico                 10.4       79714   769558
    ##  4 Ecuador                 8.18      11743   143531
    ##  5 United Kingdom          7.81      42515   544279
    ##  6 Belgium                 7.34      10108   137774
    ##  7 Chad                    7.11         89     1251
    ##  8 Sudan                   6.12        836    13668
    ##  9 Sweden                  6.09       5892    96677
    ## 10 Bolivia                 5.93       8156   137468
    ## 11 Egypt                   5.78       6010   104035
    ## 12 Niger                   5.75         69     1200
    ## 13 Iran                    5.72      27658   483844
    ## 14 Canada                  5.56       9530   171323
    ## 15 China                   5.20       4746    91212
    ## 16 France                  5.14      32211   626502
    ## 17 Syria                   4.71        212     4504
    ## 18 Netherlands             4.34       6509   149817
    ## 19 Tanzania                4.13         21      509
    ## 20 Mali                    4.08        131     3210

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1101.      32914   29.9 
    ##  2 Belgium                 972.      10108   10.4 
    ##  3 Bolivia                 820.       8156    9.95
    ##  4 Ecuador                 794.      11743   14.8 
    ##  5 Chile                   782.      13090   16.7 
    ##  6 Brazil                  733.     147494  201.  
    ##  7 Mexico                  709.      79714  112.  
    ##  8 Spain                   700.      32562   46.5 
    ##  9 United Kingdom          682.      42515   62.3 
    ## 10 United States           675.     209450  310.  
    ## 11 Sweden                  617.       5892    9.56
    ## 12 Italy                   598.      36061   60.3 
    ## 13 Colombia                565.      27017   47.8 
    ## 14 Argentina               528.      21827   41.3 
    ## 15 France                  497.      32211   64.8 
    ## 16 Netherlands             391.       6509   16.6 
    ## 17 Iran                    360.      27658   76.9 
    ## 18 South Africa            349.      17103   49   
    ## 19 Iraq                    324.       9604   29.7 
    ## 20 Honduras                306.       2447    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
