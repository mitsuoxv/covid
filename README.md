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

Updated: 2020-11-04

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
    ##  1 United States           37025.  9108353            246
    ##  2 India                   35331.  8267623            234
    ##  3 Brazil                  23498.  5545705            236
    ##  4 Russia                   7276.  1673686            230
    ##  5 France                   5802.  1433254            247
    ##  6 Argentina                5080.  1173533            231
    ##  7 Spain                    4819.  1185678            246
    ##  8 Colombia                 4710.  1083321            230
    ##  9 United Kingdom           4301.  1053868            245
    ## 10 Mexico                   4040.   929392            230
    ## 11 Peru                     3917.   904911            231
    ## 12 South Africa             3149.   727595            231
    ## 13 Italy                    2880.   731588            254
    ## 14 Iran                     2495.   628780            252
    ## 15 Germany                  2259.   560379            248
    ## 16 Chile                    2211.   513188            232
    ## 17 Iraq                     2045.   478701            234
    ## 18 Bangladesh               1938.   410988            212
    ## 19 Ukraine                  1835.   411093            224
    ## 20 Belgium                  1833.   447260            244

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                       181.               42634.            235
    ##  2 Belgium                      176.               42993.            244
    ##  3 Czech Republic               142.               33495.            236
    ##  4 Chile                        132.               30645.            232
    ##  5 Peru                         131.               30257.            231
    ##  6 Argentina                    123.               28385.            231
    ##  7 United States                119.               29360.            246
    ##  8 Brazil                       117.               27576.            236
    ##  9 Spain                        104.               25495.            246
    ## 10 Colombia                      98.5              22668.            230
    ## 11 Switzerland                   94.1              23159.            246
    ## 12 Netherlands                   91.3              22092.            242
    ## 13 France                        89.6              22129.            247
    ## 14 United Kingdom                69.0              16903.            245
    ## 15 Iraq                          68.9              16133.            234
    ## 16 Bolivia                       65.7              14258.            217
    ## 17 South Africa                  64.3              14849.            231
    ## 18 Libya                         61.1               9736.            159
    ## 19 Portugal                      58.5              13755.            235
    ## 20 Austria                       58.0              13927.            240

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2067
    ##  2 Mexico                  9.89      91895   929392
    ##  3 Ecuador                 7.49      12692   169562
    ##  4 Chad                    6.54         98     1499
    ##  5 Bolivia                 6.16       8731   141833
    ##  6 Sudan                   6.04        837    13866
    ##  7 Egypt                   5.83       6291   107925
    ##  8 Iran                    5.68      35738   628780
    ##  9 Niger                   5.65         69     1221
    ## 10 Italy                   5.34      39059   731588
    ## 11 China                   5.16       4746    92015
    ## 12 Syria                   5.05        295     5843
    ## 13 Sweden                  4.78       5938   124355
    ## 14 United Kingdom          4.45      46853  1053868
    ## 15 Canada                  4.30      10179   236841
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.82      34529   904911
    ## 18 Mali                    3.81        136     3573
    ## 19 Afghanistan             3.70       1541    41633
    ## 20 Nicaragua               3.53        156     4424

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1155.      34529   29.9 
    ##  2 Belgium                1140.      11858   10.4 
    ##  3 Bolivia                 878.       8731    9.95
    ##  4 Ecuador                 858.      12692   14.8 
    ##  5 Chile                   854.      14302   16.7 
    ##  6 Mexico                  817.      91895  112.  
    ##  7 Brazil                  796.     160074  201.  
    ##  8 Spain                   771.      35878   46.5 
    ##  9 Argentina               753.      31140   41.3 
    ## 10 United Kingdom          751.      46853   62.3 
    ## 11 United States           740.     229442  310.  
    ## 12 Colombia                659.      31515   47.8 
    ## 13 Italy                   647.      39059   60.3 
    ## 14 Sweden                  621.       5938    9.56
    ## 15 France                  573.      37115   64.8 
    ## 16 Iran                    465.      35738   76.9 
    ## 17 Netherlands             448.       7453   16.6 
    ## 18 South Africa            397.      19465   49   
    ## 19 Iraq                    371.      11017   29.7 
    ## 20 Czech Republic          349.       3654   10.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
