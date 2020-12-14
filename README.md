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

Updated: 2020-12-15

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
    ##  1 United States           55263. 15860675            287
    ##  2 India                   35942.  9884100            275
    ##  3 Brazil                  24838.  6880127            277
    ##  4 Russia                   9893.  2681256            271
    ##  5 France                   8111.  2336136            288
    ##  6 United Kingdom           6466.  1849407            286
    ##  7 Italy                    6249.  1843712            295
    ##  8 Spain                    6029.  1730575            287
    ##  9 Argentina                5494.  1494602            272
    ## 10 Colombia                 5229.  1417072            271
    ## 11 Germany                  4626.  1337078            289
    ## 12 Mexico                   4581.  1241436            271
    ## 13 Poland                   4129.  1135676            275
    ## 14 Iran                     3782   1108269            293
    ## 15 Turkey                   3772.  1022390            271
    ## 16 Peru                     3614.   983045            272
    ## 17 Ukraine                  3398.   900666            265
    ## 18 South Africa             3165.   860964            272
    ## 19 Indonesia                2246.   617820            275
    ## 20 Netherlands              2166.   613064            283

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       205.              58458.            285
    ##  2 Czech Republic                200.              55468.            277
    ##  3 United States                 178.              51125.            287
    ##  4 Israel                        173.              47698.            276
    ##  5 Switzerland                   171.              49113.            287
    ##  6 Jordan                        152.              40520.            267
    ##  7 Austria                       139.              39005.            281
    ##  8 Serbia                        134.              36275.            270
    ##  9 Argentina                     133.              36151.            272
    ## 10 Netherlands                   130.              36832.            283
    ## 11 Spain                         130.              37212.            287
    ## 12 France                        125.              36069.            288
    ## 13 Chile                         125.              34152.            273
    ## 14 Brazil                        124.              34212.            277
    ## 15 Peru                          121.              32870.            272
    ## 16 Sweden                        119.              33497.            282
    ## 17 Portugal                      118.              32666.            276
    ## 18 Colombia                      109.              29652.            271
    ## 19 Poland                        107.              29498.            275
    ## 20 Hungary                       106.              28438.            269

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         607     2087
    ##  2 Mexico                  9.16     113704  1241436
    ##  3 Ecuador                 6.87      13875   202110
    ##  4 Sudan                   6.30       1347    21386
    ##  5 Bolivia                 6.13       9014   147030
    ##  6 Chad                    5.76        102     1770
    ##  7 Egypt                   5.69       6920   121575
    ##  8 Syria                   5.65        518     9166
    ##  9 China                   5.01       4758    95064
    ## 10 Iran                    4.71      52196  1108269
    ## 11 Tanzania                4.13         21      509
    ## 12 Afghanistan             4.00       1971    49273
    ## 13 Peru                    3.72      36609   983045
    ## 14 Niger                   3.71         77     2078
    ## 15 Italy                   3.50      64520  1843712
    ## 16 Tunisia                 3.50       3894   111361
    ## 17 United Kingdom          3.47      64170  1849407
    ## 18 Nicaragua               3.44        162     4709
    ## 19 Guatemala               3.42       4423   129282
    ## 20 Mali                    3.34        194     5814

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1726.      17951   10.4 
    ##  2 Peru                   1224.      36609   29.9 
    ##  3 Italy                  1069.      64520   60.3 
    ##  4 United Kingdom         1029.      64170   62.3 
    ##  5 Spain                  1024.      47624   46.5 
    ##  6 Mexico                 1011.     113704  112.  
    ##  7 Argentina               984.      40668   41.3 
    ##  8 United States           952.     295406  310.  
    ##  9 Chile                   949.      15886   16.7 
    ## 10 Ecuador                 938.      13875   14.8 
    ## 11 Czech Republic          917.       9609   10.5 
    ## 12 Bolivia                 906.       9014    9.95
    ## 13 Brazil                  901.     181123  201.  
    ## 14 France                  888.      57542   64.8 
    ## 15 Colombia                813.      38866   47.8 
    ## 16 Bulgaria                796.       5688    7.15
    ## 17 Sweden                  786.       7514    9.56
    ## 18 Hungary                 714.       7130    9.98
    ## 19 Switzerland             709.       5378    7.58
    ## 20 Iran                    679.      52196   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
