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

Updated: 2020-12-16

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
    ##  1 United States           55698. 16041095            288
    ##  2 India                   35892.  9906165            276
    ##  3 Brazil                  24827.  6901952            278
    ##  4 Russia                   9955.  2707945            272
    ##  5 France                   8092.  2338726            289
    ##  6 United Kingdom           6514.  1869670            287
    ##  7 Italy                    6269.  1855737            296
    ##  8 Spain                    6083.  1751884            288
    ##  9 Argentina                5487.  1498160            273
    ## 10 Colombia                 5241.  1425774            272
    ## 11 Germany                  4660.  1351510            290
    ## 12 Mexico                   4595.  1250044            272
    ## 13 Poland                   4157.  1147446            276
    ## 14 Turkey                   3867.  1052007            272
    ## 15 Iran                     3795.  1115770            294
    ## 16 Peru                     3607.   984973            273
    ## 17 Ukraine                  3417.   909082            266
    ## 18 South Africa             3172.   866127            273
    ## 19 Indonesia                2258.   623309            276
    ## 20 Netherlands              2188.   621560            284

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       205.              58561.            286
    ##  2 Czech Republic                201.              55961.            278
    ##  3 United States                 180.              51707.            288
    ##  4 Israel                        176.              48630.            277
    ##  5 Switzerland                   175.              50515.            288
    ##  6 Jordan                        153.              40967.            268
    ##  7 Austria                       139.              39312.            282
    ##  8 Serbia                        136.              36946.            271
    ##  9 Argentina                     133.              36237.            273
    ## 10 Netherlands                   131.              37342.            284
    ## 11 Spain                         131.              37670.            288
    ## 12 Chile                         125.              34266.            274
    ## 13 France                        125.              36109.            289
    ## 14 Brazil                        123.              34320.            278
    ## 15 Peru                          121.              32935.            273
    ## 16 Portugal                      119.              32872.            277
    ## 17 Sweden                        118.              33497.            283
    ## 18 Colombia                      110.              29834.            272
    ## 19 Poland                        108.              29804.            276
    ## 20 Hungary                       106.              28628.            270

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         607     2088
    ##  2 Mexico                  9.12     113953  1250044
    ##  3 Ecuador                 6.86      13875   202180
    ##  4 Sudan                   6.28       1355    21591
    ##  5 Bolivia                 6.13       9018   147150
    ##  6 Chad                    5.76        102     1771
    ##  7 Syria                   5.70        530     9302
    ##  8 Egypt                   5.69       6943   122086
    ##  9 China                   5.00       4761    95167
    ## 10 Iran                    4.70      52447  1115770
    ## 11 Tanzania                4.13         21      509
    ## 12 Afghanistan             3.99       1975    49484
    ## 13 Peru                    3.72      36677   984973
    ## 14 Niger                   3.71         77     2078
    ## 15 Italy                   3.50      65011  1855737
    ## 16 Tunisia                 3.50       3894   111361
    ## 17 United Kingdom          3.44      64402  1869670
    ## 18 Mali                    3.44        201     5836
    ## 19 Nicaragua               3.44        162     4709
    ## 20 Guatemala               3.43       4445   129405

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1735.      18054   10.4 
    ##  2 Peru                   1226.      36677   29.9 
    ##  3 Italy                  1077.      65011   60.3 
    ##  4 United Kingdom         1033.      64402   62.3 
    ##  5 Spain                  1032.      48013   46.5 
    ##  6 Mexico                 1013.     113953  112.  
    ##  7 Argentina               986.      40766   41.3 
    ##  8 United States           957.     296840  310.  
    ##  9 Chile                   951.      15931   16.7 
    ## 10 Ecuador                 938.      13875   14.8 
    ## 11 Czech Republic          930.       9743   10.5 
    ## 12 Bolivia                 907.       9018    9.95
    ## 13 Brazil                  902.     181402  201.  
    ## 14 France                  894.      57910   64.8 
    ## 15 Colombia                817.      39053   47.8 
    ## 16 Bulgaria                817.       5838    7.15
    ## 17 Sweden                  786.       7514    9.56
    ## 18 Switzerland             735.       5572    7.58
    ## 19 Hungary                 725.       7237    9.98
    ## 20 Iran                    682.      52447   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
