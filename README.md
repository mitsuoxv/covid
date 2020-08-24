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

Updated: 2020-08-25

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
    ##  1 United States           32069.  5612163            175
    ##  2 Brazil                  21711.  3582362            165
    ##  3 India                   19057.  3106348            163
    ##  4 Russia                   6008.   961493            160
    ##  5 South Africa             3810.   609773            160
    ##  6 Peru                     3657.   585236            160
    ##  7 Mexico                   3497.   556216            159
    ##  8 Colombia                 3352.   533103            159
    ##  9 Chile                    2469.   397665            161
    ## 10 Spain                    2205.   386054            175
    ## 11 Argentina                2104.   336802            160
    ## 12 Bangladesh               2088.   294598            141
    ## 13 Iran                     1982.   358905            181
    ## 14 Saudi Arabia             1874.   307479            164
    ## 15 United Kingdom           1871.   325646            174
    ## 16 Pakistan                 1820.   293261            161
    ## 17 Turkey                   1613.   258249            160
    ## 18 Italy                    1409.   259345            184
    ## 19 Germany                  1319.   233575            177
    ## 20 France                   1282.   228224            178

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            147.               23746.            161
    ##  2 Peru                             122.               19569.            160
    ##  3 Brazil                           108.               17814.            165
    ##  4 United States                    103.               18090.            175
    ##  5 Israel                            84.0              13875.            165
    ##  6 South Africa                      77.8              12444.            160
    ##  7 Bolivia                           74.6              10900.            146
    ##  8 Saudi Arabia                      72.8              11949.            164
    ##  9 Colombia                          70.1              11155.            159
    ## 10 Dominican Republic                60.1               9280.            154
    ## 11 Kazakhstan                        54.6               8309.            152
    ## 12 Kyrgyzstan                        53.1               7829.            147
    ## 13 Sweden                            52.3               9007.            172
    ## 14 Argentina                         50.9               8146.            160
    ## 15 Belarus                           49.1               7276.            148
    ## 16 Spain                             47.4               8301.            175
    ## 17 Honduras                          45.6               6757.            148
    ## 18 Ecuador                           45.5               7286.            160
    ## 19 Belgium                           45.4               7867.            173
    ## 20 Russia                            42.7               6834.            160

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         553     1915
    ##  2 Italy                  13.7       35437   259345
    ##  3 France                 13.3       30377   228224
    ##  4 United Kingdom         12.7       41429   325646
    ##  5 Belgium                12.2        9992    81842
    ##  6 Hungary                11.9         613     5155
    ##  7 Mexico                 10.8       60254   556216
    ##  8 Netherlands             9.31       6191    66490
    ##  9 Chad                    7.71         76      986
    ## 10 Spain                   7.47      28838   386054
    ## 11 Canada                  7.28       9071   124629
    ## 12 Sweden                  6.75       5810    86068
    ## 13 Sudan                   6.35        815    12836
    ## 14 Niger                   5.89         69     1172
    ## 15 Ecuador                 5.86       6310   107769
    ## 16 Iran                    5.75      20643   358905
    ## 17 Egypt                   5.41       5262    97340
    ## 18 China                   5.23       4718    90182
    ## 19 Peru                    4.69      27453   585236
    ## 20 Mali                    4.62        125     2705

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 960.       9992   10.4 
    ##  2 Peru                    918.      27453   29.9 
    ##  3 United Kingdom          664.      41429   62.3 
    ##  4 Chile                   648.      10852   16.7 
    ##  5 Spain                   620.      28838   46.5 
    ##  6 Sweden                  608.       5810    9.56
    ##  7 Italy                   587.      35437   60.3 
    ##  8 Brazil                  568.     114250  201.  
    ##  9 United States           565.     175243  310.  
    ## 10 Mexico                  536.      60254  112.  
    ## 11 France                  469.      30377   64.8 
    ## 12 Bolivia                 447.       4442    9.95
    ## 13 Ecuador                 427.       6310   14.8 
    ## 14 Netherlands             372.       6191   16.6 
    ## 15 Colombia                355.      16968   47.8 
    ## 16 Canada                  269.       9071   33.7 
    ## 17 Iran                    268.      20643   76.9 
    ## 18 South Africa            267.      13059   49   
    ## 19 Switzerland             227.       1719    7.58
    ## 20 Iraq                    217.       6428   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
