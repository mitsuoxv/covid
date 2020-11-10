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

Updated: 2020-11-11

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
    ##  1 United States           39005.  9868389            253
    ##  2 India                   35650.  8591730            241
    ##  3 Brazil                  23309.  5664115            243
    ##  4 Russia                   7667.  1817109            237
    ##  5 France                   6978.  1772551            254
    ##  6 Spain                    5252.  1328832            253
    ##  7 Argentina                5219.  1242182            238
    ##  8 Colombia                 4826.  1143887            237
    ##  9 United Kingdom           4815.  1213367            252
    ## 10 Mexico                   4083.   967825            237
    ## 11 Peru                     3875.   922333            238
    ## 12 Italy                    3679.   960373            261
    ## 13 South Africa             3103.   738525            238
    ## 14 Germany                  2694.   687200            255
    ## 15 Iran                     2675.   692949            259
    ## 16 Poland                   2357.   568138            241
    ## 17 Chile                    2187.   522879            239
    ## 18 Iraq                     2081.   501733            241
    ## 19 Ukraine                  2074.   479197            231
    ## 20 Belgium                  2004.   503087            251

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      193.               48360.            251
    ##  2 Israel                       179.               43432.            243
    ##  3 Czech Republic               165.               40175.            243
    ##  4 Chile                        131.               31223.            239
    ##  5 Peru                         130.               30840.            238
    ##  6 Argentina                    126.               30046.            238
    ##  7 United States                126.               31810.            253
    ##  8 Switzerland                  119.               30129.            253
    ##  9 Brazil                       116.               28165.            243
    ## 10 Spain                        113.               28573.            253
    ## 11 France                       108.               27368.            254
    ## 12 Colombia                     101.               23936.            237
    ## 13 Netherlands                   99.9              24887.            249
    ## 14 Austria                       78.0              19282.            247
    ## 15 United Kingdom                77.2              19461.            252
    ## 16 Jordan                        76.9              17947.            233
    ## 17 Portugal                      71.0              17181.            242
    ## 18 Iraq                          70.1              16910.            241
    ## 19 Libya                         64.3              10685.            166
    ## 20 Bolivia                       63.9              14323.            224

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2070
    ##  2 Mexico                  9.82      95027   967825
    ##  3 Sudan                   7.88       1116    14155
    ##  4 Ecuador                 7.33      12839   175269
    ##  5 Chad                    6.38         99     1551
    ##  6 Bolivia                 6.17       8795   142475
    ##  7 Egypt                   5.83       6380   109422
    ##  8 Iran                    5.59      38749   692949
    ##  9 Niger                   5.55         69     1243
    ## 10 China                   5.15       4748    92271
    ## 11 Syria                   5.11        321     6284
    ## 12 Italy                   4.35      41750   960373
    ## 13 Tanzania                4.13         21      509
    ## 14 Sweden                  4.11       6022   146461
    ## 15 United Kingdom          4.06      49238  1213367
    ## 16 Canada                  3.98      10522   264113
    ## 17 Peru                    3.78      34879   922333
    ## 18 Afghanistan             3.72       1574    42297
    ## 19 Mali                    3.70        137     3706
    ## 20 Nicaragua               3.50        157     4480

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1270.      13216   10.4 
    ##  2 Peru                   1166.      34879   29.9 
    ##  3 Bolivia                 884.       8795    9.95
    ##  4 Chile                   871.      14588   16.7 
    ##  5 Ecuador                 868.      12839   14.8 
    ##  6 Mexico                  845.      95027  112.  
    ##  7 Spain                   835.      38833   46.5 
    ##  8 Argentina               812.      33560   41.3 
    ##  9 Brazil                  808.     162397  201.  
    ## 10 United Kingdom          790.      49238   62.3 
    ## 11 United States           761.     236042  310.  
    ## 12 Italy                   692.      41750   60.3 
    ## 13 Colombia                686.      32791   47.8 
    ## 14 Sweden                  630.       6022    9.56
    ## 15 France                  628.      40665   64.8 
    ## 16 Iran                    504.      38749   76.9 
    ## 17 Czech Republic          484.       5074   10.5 
    ## 18 Netherlands             483.       8033   16.6 
    ## 19 South Africa            405       19845   49   
    ## 20 Iraq                    384.      11380   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
