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

Updated: 2020-11-08

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
    ##  1 United States           38019.  9504758            250
    ##  2 India                   35554.  8462080            238
    ##  3 Brazil                  23291.  5590025            240
    ##  4 Russia                   7494.  1753836            234
    ##  5 France                   6484.  1627567            251
    ##  6 Spain                    5225.  1306316            250
    ##  7 Argentina                5178.  1217028            235
    ##  8 Colombia                 4777.  1117977            234
    ##  9 United Kingdom           4604.  1146488            249
    ## 10 Mexico                   4056.   949197            234
    ## 11 Peru                     3892.   914722            235
    ## 12 Italy                    3343.   862681            258
    ## 13 South Africa             3124.   734175            235
    ## 14 Iran                     2592.   663800            256
    ## 15 Germany                  2549.   642488            252
    ## 16 Chile                    2196.   518390            236
    ## 17 Poland                   2074.   493765            238
    ## 18 Iraq                     2071.   493139            238
    ## 19 Ukraine                  1977.   450934            228
    ## 20 Belgium                  1967.   487949            248

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      189.               46905.            248
    ##  2 Israel                       180.               43252.            240
    ##  3 Czech Republic               160.               38516.            240
    ##  4 Chile                        131.               30955.            236
    ##  5 Peru                         130.               30586.            235
    ##  6 Argentina                    125.               29437.            235
    ##  7 United States                123.               30637.            250
    ##  8 Brazil                       116.               27797.            240
    ##  9 Spain                        112.               28089.            250
    ## 10 Switzerland                  111.               27854.            250
    ## 11 France                       100.               25129.            251
    ## 12 Colombia                     100.               23394.            234
    ## 13 Netherlands                   97.0              23866.            246
    ## 14 United Kingdom                73.8              18388.            249
    ## 15 Iraq                          69.8              16620.            238
    ## 16 Austria                       69.2              16893.            244
    ## 17 Jordan                        68.6              15803.            230
    ## 18 Portugal                      65.4              15633.            239
    ## 19 Bolivia                       64.6              14295.            221
    ## 20 South Africa                  63.7              14983.            235

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2070
    ##  2 Mexico                  9.88      93772   949197
    ##  3 Ecuador                 7.40      12761   172508
    ##  4 Chad                    6.44         99     1538
    ##  5 Bolivia                 6.17       8768   142201
    ##  6 Sudan                   6.00        837    13943
    ##  7 Egypt                   5.83       6343   108754
    ##  8 Niger                   5.65         69     1222
    ##  9 Iran                    5.64      37409   663800
    ## 10 China                   5.15       4748    92164
    ## 11 Syria                   5.06        309     6102
    ## 12 Italy                   4.71      40638   862681
    ## 13 United Kingdom          4.23      48475  1146488
    ## 14 Canada                  4.13      10381   251338
    ## 15 Tanzania                4.13         21      509
    ## 16 Sweden                  4.11       6022   146461
    ## 17 Peru                    3.80      34730   914722
    ## 18 Mali                    3.77        137     3633
    ## 19 Afghanistan             3.70       1554    41975
    ## 20 Nicaragua               3.50        157     4480

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1222.      12708   10.4 
    ##  2 Peru                   1161.      34730   29.9 
    ##  3 Bolivia                 881.       8768    9.95
    ##  4 Chile                   863.      14450   16.7 
    ##  5 Ecuador                 863.      12761   14.8 
    ##  6 Mexico                  834.      93772  112.  
    ##  7 Spain                   828.      38486   46.5 
    ##  8 Brazil                  801.     161106  201.  
    ##  9 Argentina               793.      32766   41.3 
    ## 10 United Kingdom          777.      48475   62.3 
    ## 11 United States           752.     233292  310.  
    ## 12 Colombia                674.      32209   47.8 
    ## 13 Italy                   673.      40638   60.3 
    ## 14 Sweden                  630.       6022    9.56
    ## 15 France                  611.      39545   64.8 
    ## 16 Iran                    486.      37409   76.9 
    ## 17 Netherlands             473.       7877   16.6 
    ## 18 Czech Republic          432.       4526   10.5 
    ## 19 South Africa            403.      19749   49   
    ## 20 Iraq                    379.      11244   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
