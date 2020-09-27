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

Updated: 2020-09-28

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
    ##  1 United States           33302.  6960152            209
    ##  2 India                   30418.  5992532            197
    ##  3 Brazil                  23565.  4689613            199
    ##  4 Russia                   5934.  1151438            194
    ##  5 Colombia                 4136.   798317            193
    ##  6 Peru                     4095.   794584            194
    ##  7 Mexico                   3734.   720858            193
    ##  8 Argentina                3563.   691235            194
    ##  9 South Africa             3450.   669498            194
    ## 10 Spain                    3428.   716481            209
    ## 11 France                   2375.   503658            212
    ## 12 Chile                    2338.   455979            195
    ## 13 United Kingdom           2063.   429281            208
    ## 14 Iran                     2060.   443086            215
    ## 15 Bangladesh               2044.   357873            175
    ## 16 Iraq                     1756.   345969            197
    ## 17 Saudi Arabia             1680.   332790            198
    ## 18 Turkey                   1612.   312966            194
    ## 19 Pakistan                 1590.   310275            195
    ## 20 Philippines              1528.   301256            197

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           145.               29110.            200
    ##  2 Chile                            140.               27228.            195
    ##  3 Peru                             137.               26568.            194
    ##  4 Brazil                           117.               23319.            199
    ##  5 United States                    107.               22435.            209
    ##  6 Colombia                          86.5              16705.            193
    ##  7 Argentina                         86.2              16719.            194
    ##  8 Bolivia                           74.3              13393.            180
    ##  9 Spain                             73.7              15406.            209
    ## 10 South Africa                      70.4              13663.            194
    ## 11 Saudi Arabia                      65.3              12933.            198
    ## 12 Dominican Republic                59.9              11295.            188
    ## 13 Iraq                              59.2              11660.            197
    ## 14 Belgium                           52.3              10834.            207
    ## 15 Honduras                          50.7               9242.            182
    ## 16 Kazakhstan                        49.1               9138.            186
    ## 17 Sweden                            46.8               9515.            203
    ## 18 Ecuador                           46.6               9059.            194
    ## 19 Kyrgyzstan                        46.3               8396.            181
    ## 20 Belarus                           43.8               7980.            182

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         588     2034
    ##  2 Italy                  11.6       35818   308104
    ##  3 Mexico                 10.5       75844   720858
    ##  4 United Kingdom          9.78      41971   429281
    ##  5 Belgium                 8.85       9974   112709
    ##  6 Ecuador                 8.41      11273   133981
    ##  7 Chad                    7.05         83     1177
    ##  8 Sweden                  6.47       5880    90923
    ##  9 France                  6.26      31514   503658
    ## 10 Canada                  6.15       9255   150456
    ## 11 Sudan                   6.14        836    13606
    ## 12 Netherlands             5.86       6357   108521
    ## 13 Bolivia                 5.85       7800   133222
    ## 14 Niger                   5.78         69     1194
    ## 15 Iran                    5.73      25394   443086
    ## 16 Egypt                   5.71       5869   102736
    ## 17 China                   5.22       4746    90966
    ## 18 Syria                   4.66        188     4038
    ## 19 Spain                   4.36      31232   716481
    ## 20 Mali                    4.22        130     3080

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1071.      32037   29.9 
    ##  2 Belgium                 959.       9974   10.4 
    ##  3 Bolivia                 784.       7800    9.95
    ##  4 Ecuador                 762.      11273   14.8 
    ##  5 Chile                   752.      12591   16.7 
    ##  6 Brazil                  699.     140537  201.  
    ##  7 Mexico                  674.      75844  112.  
    ##  8 United Kingdom          673.      41971   62.3 
    ##  9 Spain                   672.      31232   46.5 
    ## 10 United States           653.     202478  310.  
    ## 11 Sweden                  615.       5880    9.56
    ## 12 Italy                   594.      35818   60.3 
    ## 13 Colombia                525.      25103   47.8 
    ## 14 France                  487.      31514   64.8 
    ## 15 Netherlands             382.       6357   16.6 
    ## 16 Argentina               368.      15208   41.3 
    ## 17 South Africa            334.      16376   49   
    ## 18 Iran                    330.      25394   76.9 
    ## 19 Iraq                    301.       8935   29.7 
    ## 20 Honduras                284.       2271    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
