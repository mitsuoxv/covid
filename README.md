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

Updated: 2020-09-17

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
    ##  1 United States           32809.  6496246            198
    ##  2 India                   26991.  5020359            186
    ##  3 Brazil                  23114.  4345610            188
    ##  4 Russia                   5898.  1079519            183
    ##  5 Peru                     4009.   733860            183
    ##  6 Colombia                 3966.   721892            182
    ##  7 Mexico                   3690.   671716            182
    ##  8 South Africa             3560.   651521            183
    ##  9 Argentina                3089.   565446            183
    ## 10 Spain                    3046.   603167            198
    ## 11 Chile                    2379.   437983            184
    ## 12 Bangladesh               2079.   341056            164
    ## 13 Iran                     1996.   407353            204
    ## 14 United Kingdom           1899.   374232            197
    ## 15 France                   1864.   374700            201
    ## 16 Saudi Arabia             1748.   326930            187
    ## 17 Pakistan                 1646.   303089            184
    ## 18 Turkey                   1609.   294620            183
    ## 19 Iraq                     1605.   298702            186
    ## 20 Philippines              1448.   269407            186

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            142.               26154.            184
    ##  2 Peru                             134.               24538.            183
    ##  3 Israel                           116.               21922.            189
    ##  4 Brazil                           115.               21609.            188
    ##  5 United States                    106.               20940.            198
    ##  6 Colombia                          83.0              15106.            182
    ##  7 Bolivia                           75.8              12829.            169
    ##  8 Argentina                         74.7              13677.            183
    ##  9 South Africa                      72.6              13296.            183
    ## 10 Saudi Arabia                      67.9              12705.            187
    ## 11 Spain                             65.5              12970.            198
    ## 12 Dominican Republic                60.1              10668.            177
    ## 13 Iraq                              54.1              10067.            186
    ## 14 Kazakhstan                        51.0               8935.            175
    ## 15 Honduras                          50.1               8589.            171
    ## 16 Kyrgyzstan                        48.0               8182.            170
    ## 17 Sweden                            47.3               9140.            193
    ## 18 Belgium                           46.4               9103.            196
    ## 19 Belarus                           44.9               7698.            171
    ## 20 Ecuador                           44.1               8083.            183

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         584     2020
    ##  2 Italy                  12.3       35633   289990
    ##  3 United Kingdom         11.1       41664   374232
    ##  4 Mexico                 10.6       71049   671716
    ##  5 Belgium                10.5        9930    94701
    ##  6 Ecuador                 9.17      10963   119553
    ##  7 France                  8.23      30837   374700
    ##  8 Chad                    7.45         81     1087
    ##  9 Netherlands             7.38       6249    84697
    ## 10 Sweden                  6.70       5851    87345
    ## 11 Canada                  6.65       9179   138010
    ## 12 Sudan                   6.18        836    13535
    ## 13 Niger                   5.85         69     1180
    ## 14 Bolivia                 5.79       7394   127619
    ## 15 Iran                    5.76      23453   407353
    ## 16 Egypt                   5.60       5679   101340
    ## 17 China                   5.23       4743    90734
    ## 18 Spain                   4.97      30004   603167
    ## 19 Hungary                 4.52        654    14460
    ## 20 Syria                   4.43        160     3614

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1030.      30812   29.9 
    ##  2 Belgium                 955.       9930   10.4 
    ##  3 Bolivia                 743.       7394    9.95
    ##  4 Ecuador                 741.      10963   14.8 
    ##  5 Chile                   719.      12040   16.7 
    ##  6 United Kingdom          668.      41664   62.3 
    ##  7 Brazil                  656.     132006  201.  
    ##  8 Spain                   645.      30004   46.5 
    ##  9 Mexico                  632.      71049  112.  
    ## 10 United States           624.     193494  310.  
    ## 11 Sweden                  612.       5851    9.56
    ## 12 Italy                   591.      35633   60.3 
    ## 13 Colombia                484.      23123   47.8 
    ## 14 France                  476.      30837   64.8 
    ## 15 Netherlands             375.       6249   16.6 
    ## 16 South Africa            319.      15641   49   
    ## 17 Iran                    305.      23453   76.9 
    ## 18 Argentina               283.      11710   41.3 
    ## 19 Iraq                    275.       8166   29.7 
    ## 20 Canada                  273.       9179   33.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
