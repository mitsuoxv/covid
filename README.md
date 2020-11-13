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

Updated: 2020-11-14

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
    ##  1 United States           40104. 10266631            256
    ##  2 India                   35773.  8728795            244
    ##  3 Brazil                  23367.  5748375            246
    ##  4 Russia                   7835.  1880551            240
    ##  5 France                   7247.  1862666            257
    ##  6 Spain                    5614.  1437220            256
    ##  7 Argentina                5283.  1273356            241
    ##  8 United Kingdom           5059.  1290199            255
    ##  9 Colombia                 4855.  1165326            240
    ## 10 Mexico                   4109.   986177            240
    ## 11 Italy                    4039.  1066401            264
    ## 12 Peru                     3850.   928006            241
    ## 13 South Africa             3090.   744732            241
    ## 14 Germany                  2911.   751095            258
    ## 15 Iran                     2773.   726585            262
    ## 16 Poland                   2629.   641496            244
    ## 17 Ukraine                  2190.   512652            234
    ## 18 Chile                    2175.   526438            242
    ## 19 Iraq                     2097.   511806            244
    ## 20 Belgium                  2048.   520297            254

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      197.               50014.            254
    ##  2 Israel                       177.               43625.            246
    ##  3 Czech Republic               173.               42638.            246
    ##  4 Chile                        130.               31436.            242
    ##  5 United States                129.               33093.            256
    ##  6 Peru                         129.               31030.            241
    ##  7 Switzerland                  128.               32907.            256
    ##  8 Argentina                    128.               30800.            241
    ##  9 Spain                        121.               30904.            256
    ## 10 Brazil                       116.               28584.            246
    ## 11 France                       112.               28759.            257
    ## 12 Netherlands                  102.               25830.            252
    ## 13 Colombia                     102.               24384.            240
    ## 14 Austria                       88.7              22189.            250
    ## 15 Jordan                        87.3              20616.            236
    ## 16 United Kingdom                81.1              20693.            255
    ## 17 Portugal                      75.7              18547.            245
    ## 18 Sweden                        71.1              17933.            252
    ## 19 Iraq                          70.7              17249.            244
    ## 20 Poland                        68.3              16662.            244

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         603     2072
    ##  2 Mexico                  9.78      96430   986177
    ##  3 Sudan                   7.75       1116    14401
    ##  4 Ecuador                 7.29      12946   177513
    ##  5 Chad                    6.34        100     1578
    ##  6 Bolivia                 6.18       8818   142776
    ##  7 Egypt                   5.83       6417   110095
    ##  8 Iran                    5.52      40121   726585
    ##  9 Niger                   5.46         69     1263
    ## 10 China                   5.14       4749    92372
    ## 11 Syria                   5.13        333     6486
    ## 12 Tanzania                4.13         21      509
    ## 13 Italy                   4.09      43589  1066401
    ## 14 United Kingdom          3.95      50928  1290199
    ## 15 Canada                  3.86      10685   277061
    ## 16 Peru                    3.80      35301   928006
    ## 17 Afghanistan             3.72       1591    42795
    ## 18 Mali                    3.64        138     3792
    ## 19 Sweden                  3.57       6122   171365
    ## 20 Nicaragua               3.49        158     4533

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1335.      13891   10.4 
    ##  2 Peru                   1180.      35301   29.9 
    ##  3 Bolivia                 886.       8818    9.95
    ##  4 Chile                   878.      14699   16.7 
    ##  5 Ecuador                 875.      12946   14.8 
    ##  6 Spain                   870.      40461   46.5 
    ##  7 Mexico                  857.      96430  112.  
    ##  8 Argentina               835.      34531   41.3 
    ##  9 United Kingdom          817.      50928   62.3 
    ## 10 Brazil                  812.     163373  201.  
    ## 11 United States           774.     240044  310.  
    ## 12 Italy                   722.      43589   60.3 
    ## 13 Colombia                697.      33312   47.8 
    ## 14 France                  658.      42628   64.8 
    ## 15 Sweden                  641.       6122    9.56
    ## 16 Czech Republic          549.       5755   10.5 
    ## 17 Iran                    522.      40121   76.9 
    ## 18 Netherlands             498.       8294   16.6 
    ## 19 South Africa            410.      20076   49   
    ## 20 Iraq                    389.      11532   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
