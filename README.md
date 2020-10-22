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

Updated: 2020-10-23

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
    ##  1 United States           34977.  8184788            234
    ##  2 India                   34715.  7706946            222
    ##  3 Brazil                  23544.  5273954            224
    ##  4 Russia                   6712.  1463306            218
    ##  5 Argentina                4663.  1021397            219
    ##  6 Colombia                 4468.   974139            218
    ##  7 Spain                    4296.  1005295            234
    ##  8 Peru                     3991.   874118            219
    ##  9 Mexico                   3948.   860714            218
    ## 10 France                   3912.   927193            237
    ## 11 United Kingdom           3387.   789233            233
    ## 12 South Africa             3234.   708359            219
    ## 13 Iran                     2271.   545286            240
    ## 14 Chile                    2252.   495637            220
    ## 15 Iraq                     1974.   438265            222
    ## 16 Bangladesh               1965.   393131            200
    ## 17 Italy                    1858.   449648            242
    ## 18 Indonesia                1680.   373109            222
    ## 19 Germany                  1661.   392049            236
    ## 20 Philippines              1631.   362243            222

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           187.               41671.            223
    ##  2 Chile                            134.               29596.            220
    ##  3 Peru                             133.               29228.            219
    ##  4 Brazil                           117.               26225.            224
    ##  5 Argentina                        113.               24705.            219
    ##  6 United States                    113.               26383.            234
    ##  7 Belgium                          105.               24348.            232
    ##  8 Colombia                          93.5              20384.            218
    ##  9 Spain                             92.4              21616.            234
    ## 10 Czech Republic                    89.0              19942.            224
    ## 11 Bolivia                           68.6              14078.            205
    ## 12 Iraq                              66.5              14771.            222
    ## 13 Netherlands                       66.0              15190.            230
    ## 14 South Africa                      66.0              14456.            219
    ## 15 France                            60.4              14316.            237
    ## 16 Saudi Arabia                      59.8              13344.            223
    ## 17 Dominican Republic                58.3              12459.            213
    ## 18 Honduras                          54.5              11294.            207
    ## 19 United Kingdom                    54.3              12658.            233
    ## 20 Libya                             54.2               7990.            147

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         599     2061
    ##  2 Mexico                 10.1       86893   860714
    ##  3 Italy                   8.19      36832   449648
    ##  4 Ecuador                 8.05      12404   154115
    ##  5 Chad                    6.84         96     1404
    ##  6 Sudan                   6.09        836    13724
    ##  7 Bolivia                 6.09       8526   140037
    ##  8 Egypt                   5.81       6155   105883
    ##  9 Iran                    5.75      31346   545286
    ## 10 Niger                   5.68         69     1214
    ## 11 United Kingdom          5.60      44158   789233
    ## 12 Sweden                  5.52       5929   107355
    ## 13 China                   5.18       4746    91588
    ## 14 Syria                   4.92        257     5224
    ## 15 Canada                  4.81       9794   203688
    ## 16 Belgium                 4.16      10539   253293
    ## 17 Tanzania                4.13         21      509
    ## 18 Peru                    3.88      33875   874118
    ## 19 Mali                    3.85        132     3428
    ## 20 Afghanistan             3.71       1501    40510

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1133.      33875   29.9 
    ##  2 Belgium                1013.      10539   10.4 
    ##  3 Bolivia                 857.       8526    9.95
    ##  4 Ecuador                 839.      12404   14.8 
    ##  5 Chile                   819.      13719   16.7 
    ##  6 Mexico                  773.      86893  112.  
    ##  7 Brazil                  770.     154837  201.  
    ##  8 Spain                   739.      34366   46.5 
    ##  9 United Kingdom          708.      44158   62.3 
    ## 10 United States           708.     219497  310.  
    ## 11 Argentina               657.      27175   41.3 
    ## 12 Sweden                  620.       5929    9.56
    ## 13 Colombia                613.      29272   47.8 
    ## 14 Italy                   610.      36832   60.3 
    ## 15 France                  521.      33766   64.8 
    ## 16 Netherlands             412.       6863   16.6 
    ## 17 Iran                    407.      31346   76.9 
    ## 18 South Africa            382.      18741   49   
    ## 19 Iraq                    351.      10418   29.7 
    ## 20 Honduras                323.       2582    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
