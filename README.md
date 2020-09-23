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

Updated: 2020-09-24

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
    ##  1 United States           33071.  6779609            205
    ##  2 India                   29253.  5646010            193
    ##  3 Brazil                  23374.  4558068            195
    ##  4 Russia                   5906.  1122241            190
    ##  5 Colombia                 4076.   770435            189
    ##  6 Peru                     4067.   772896            190
    ##  7 Mexico                   3706.   700580            189
    ##  8 South Africa             3490.   663282            190
    ##  9 Argentina                3369.   640147            190
    ## 10 Spain                    3122.   640040            205
    ## 11 Chile                    2347.   448523            191
    ## 12 France                   2141.   445402            208
    ## 13 Bangladesh               2059.   352178            171
    ## 14 Iran                     2033.   429193            211
    ## 15 United Kingdom           1978.   403555            204
    ## 16 Saudi Arabia             1705.   330798            194
    ## 17 Iraq                     1697.   327580            193
    ## 18 Turkey                   1611.   306302            190
    ## 19 Pakistan                 1608.   307409            191
    ## 20 Philippines              1511.   291789            193

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            140.               26783.            191
    ##  2 Peru                             136.               25843.            190
    ##  3 Israel                           122.               23994.            196
    ##  4 Brazil                           116.               22665.            195
    ##  5 United States                    107.               21853.            205
    ##  6 Colombia                          85.3              16121.            189
    ##  7 Argentina                         81.5              15484.            190
    ##  8 Bolivia                           74.8              13168.            176
    ##  9 South Africa                      71.2              13536.            190
    ## 10 Spain                             67.1              13763.            205
    ## 11 Saudi Arabia                      66.2              12856.            194
    ## 12 Dominican Republic                60.3              11123.            184
    ## 13 Iraq                              57.2              11040.            193
    ## 14 Honduras                          50.6               9021.            178
    ## 15 Belgium                           49.7              10106.            203
    ## 16 Kazakhstan                        49.6               9031.            182
    ## 17 Kyrgyzstan                        46.7               8283.            177
    ## 18 Sweden                            46.5               9359.            201
    ## 19 Ecuador                           45.4               8630.            190
    ## 20 Belarus                           44.1               7858.            178

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         587     2032
    ##  2 Italy                  11.9       35738   300897
    ##  3 Mexico                 10.5       73697   700580
    ##  4 United Kingdom         10.4       41825   403555
    ##  5 Belgium                 9.47       9955   105132
    ##  6 Ecuador                 8.72      11126   127643
    ##  7 Chad                    7.01         81     1155
    ##  8 France                  7.01      31234   445402
    ##  9 Sweden                  6.56       5870    89436
    ## 10 Netherlands             6.40       6282    98142
    ## 11 Canada                  6.35       9228   145415
    ## 12 Sudan                   6.16        836    13578
    ## 13 Bolivia                 5.84       7654   130986
    ## 14 Niger                   5.80         69     1189
    ## 15 Iran                    5.74      24656   429193
    ## 16 Egypt                   5.68       5806   102254
    ## 17 China                   5.22       4744    90908
    ## 18 Spain                   4.76      30495   640040
    ## 19 Syria                   4.59        178     3877
    ## 20 Mali                    4.26        129     3030

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1052.      31474   29.9 
    ##  2 Belgium                 957.       9955   10.4 
    ##  3 Bolivia                 769.       7654    9.95
    ##  4 Ecuador                 752.      11126   14.8 
    ##  5 Chile                   736.      12321   16.7 
    ##  6 Brazil                  683.     137272  201.  
    ##  7 United Kingdom          671.      41825   62.3 
    ##  8 Spain                   656.      30495   46.5 
    ##  9 Mexico                  655.      73697  112.  
    ## 10 United States           641.     198793  310.  
    ## 11 Sweden                  614.       5870    9.56
    ## 12 Italy                   592.      35738   60.3 
    ## 13 Colombia                511.      24397   47.8 
    ## 14 France                  482.      31234   64.8 
    ## 15 Netherlands             377.       6282   16.6 
    ## 16 South Africa            329.      16118   49   
    ## 17 Argentina               326.      13482   41.3 
    ## 18 Iran                    321.      24656   76.9 
    ## 19 Iraq                    293.       8682   29.7 
    ## 20 Honduras                276.       2204    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
