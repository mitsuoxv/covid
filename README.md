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

Updated: 2020-11-15

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
    ##  1 United States           40701. 10460365            257
    ##  2 India                   35810.  8773479            245
    ##  3 Brazil                  23407.  5781582            247
    ##  4 Russia                   7897.  1903253            241
    ##  5 France                   7311.  1886286            258
    ##  6 Spain                    5675.  1458591            257
    ##  7 Argentina                5308.  1284519            242
    ##  8 United Kingdom           5146.  1317500            256
    ##  9 Colombia                 4871.  1174012            241
    ## 10 Italy                    4178.  1107303            265
    ## 11 Mexico                   4115.   991835            241
    ## 12 Peru                     3843.   930237            242
    ## 13 South Africa             3086.   746945            242
    ## 14 Germany                  2986.   773556            259
    ## 15 Iran                     2807.   738322            263
    ## 16 Poland                   2716.   665547            245
    ## 17 Ukraine                  2234.   525176            235
    ## 18 Chile                    2172.   528030            243
    ## 19 Iraq                     2099.   514496            245
    ## 20 Belgium                  2058.   524916            255

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      198.               50458.            255
    ##  2 Israel                       177.               43836.            247
    ##  3 Czech Republic               175.               43340.            247
    ##  4 Switzerland                  131.               33793.            257
    ##  5 United States                131.               33718.            257
    ##  6 Chile                        130.               31531.            243
    ##  7 Peru                         129.               31104.            242
    ##  8 Argentina                    128.               31070.            242
    ##  9 Spain                        122.               31364.            257
    ## 10 Brazil                       116.               28749.            247
    ## 11 France                       113.               29124.            258
    ## 12 Netherlands                  104.               26195.            253
    ## 13 Colombia                     102.               24566.            241
    ## 14 Austria                       92.7              23281.            251
    ## 15 Jordan                        89.9              21313.            237
    ## 16 United Kingdom                82.5              21131.            256
    ## 17 Portugal                      77.9              19170.            246
    ## 18 Sweden                        73.3              18560.            253
    ## 19 Iraq                          70.8              17340.            245
    ## 20 Poland                        70.5              17287.            245

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         603     2072
    ##  2 Mexico                  9.79      97056   991835
    ##  3 Sudan                   7.75       1116    14401
    ##  4 Ecuador                 7.26      12977   178674
    ##  5 Chad                    6.29        100     1589
    ##  6 Bolivia                 6.18       8825   142889
    ##  7 Egypt                   5.83       6429   110319
    ##  8 Iran                    5.50      40582   738322
    ##  9 Niger                   5.38         69     1282
    ## 10 Syria                   5.14        337     6552
    ## 11 China                   5.14       4749    92404
    ## 12 Tanzania                4.13         21      509
    ## 13 Italy                   3.99      44139  1107303
    ## 14 United Kingdom          3.89      51304  1317500
    ## 15 Canada                  3.81      10768   282577
    ## 16 Peru                    3.77      35067   930237
    ## 17 Afghanistan             3.71       1595    42969
    ## 18 Mali                    3.65        139     3806
    ## 19 Nicaragua               3.49        158     4533
    ## 20 Sweden                  3.48       6164   177355

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1356.      14106   10.4 
    ##  2 Peru                   1173.      35067   29.9 
    ##  3 Bolivia                 887.       8825    9.95
    ##  4 Chile                   880.      14738   16.7 
    ##  5 Ecuador                 877.      12977   14.8 
    ##  6 Spain                   877.      40769   46.5 
    ##  7 Mexico                  863.      97056  112.  
    ##  8 Argentina               841.      34782   41.3 
    ##  9 United Kingdom          823.      51304   62.3 
    ## 10 Brazil                  817.     164281  201.  
    ## 11 United States           777.     241186  310.  
    ## 12 Italy                   732.      44139   60.3 
    ## 13 Colombia                701.      33491   47.8 
    ## 14 France                  673.      43559   64.8 
    ## 15 Sweden                  645.       6164    9.56
    ## 16 Czech Republic          566.       5926   10.5 
    ## 17 Iran                    528.      40582   76.9 
    ## 18 Netherlands             501.       8347   16.6 
    ## 19 South Africa            411.      20153   49   
    ## 20 Romania                 395.       8684   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
