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

Updated: 2020-12-18

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
    ##  1 United States           56713. 16446844            290
    ##  2 India                   35815.  9956557            278
    ##  3 Brazil                  24893.  6970034            280
    ##  4 Russia                  10082.  2762668            274
    ##  5 France                   8136.  2367648            291
    ##  6 United Kingdom           6620.  1913281            289
    ##  7 Italy                    6336.  1888144            298
    ##  8 Spain                    6114.  1773290            290
    ##  9 Argentina                5491.  1510203            275
    ## 10 Colombia                 5272.  1444646            274
    ## 11 Germany                  4815.  1406161            292
    ## 12 Mexico                   4624.  1267202            274
    ## 13 Poland                   4215.  1171854            278
    ## 14 Turkey                   4064.  1113827            274
    ## 15 Iran                     3821.  1131077            296
    ## 16 Peru                     3591.   987675            275
    ## 17 Ukraine                  3476.   931751            268
    ## 18 South Africa             3213.   883687            275
    ## 19 Indonesia                2288.   636154            278
    ## 20 Netherlands              2235.   639456            286

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                205.              57503.            280
    ##  2 Belgium                       205.              59123.            288
    ##  3 United States                 183.              53015.            290
    ##  4 Switzerland                   179.              51813.            290
    ##  5 Israel                        177.              49342.            279
    ##  6 Jordan                        155.              41764.            270
    ##  7 Serbia                        141.              38476.            273
    ##  8 Austria                       141.              40009.            284
    ##  9 Netherlands                   134.              38417.            286
    ## 10 Argentina                     133.              36528.            275
    ## 11 Spain                         131.              38130.            290
    ## 12 Sweden                        128.              36479.            285
    ## 13 France                        126.              36556.            291
    ## 14 Chile                         125.              34439.            276
    ## 15 Brazil                        124.              34659.            280
    ## 16 Portugal                      120.              33561.            279
    ## 17 Peru                          120.              33025.            275
    ## 18 Colombia                      110.              30229.            274
    ## 19 Poland                        109.              30438.            278
    ## 20 Hungary                       107.              29207.            272

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         607     2089
    ##  2 Mexico                  9.08     115099  1267202
    ##  3 Ecuador                 6.84      13915   203461
    ##  4 Sudan                   6.27       1384    22082
    ##  5 Bolivia                 6.11       9026   147716
    ##  6 Syria                   5.77        554     9603
    ##  7 Chad                    5.72        102     1784
    ##  8 Egypt                   5.68       6990   123153
    ##  9 China                   5.00       4764    95375
    ## 10 Iran                    4.68      52883  1131077
    ## 11 Tanzania                4.13         21      509
    ## 12 Afghanistan             4.04       2017    49927
    ## 13 Peru                    3.73      36817   987675
    ## 14 Niger                   3.71         77     2078
    ## 15 Italy                   3.52      66537  1888144
    ## 16 Mali                    3.50        209     5969
    ## 17 Tunisia                 3.49       3997   114547
    ## 18 Guatemala               3.45       4510   130828
    ## 19 Nicaragua               3.43        163     4748
    ## 20 United Kingdom          3.42      65520  1913281

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1757.      18278   10.4 
    ##  2 Peru                   1231.      36817   29.9 
    ##  3 Italy                  1103.      66537   60.3 
    ##  4 United Kingdom         1051.      65520   62.3 
    ##  5 Spain                  1045.      48596   46.5 
    ##  6 Mexico                 1023.     115099  112.  
    ##  7 Argentina               997.      41204   41.3 
    ##  8 United States           972.     301536  310.  
    ##  9 Czech Republic          958.      10036   10.5 
    ## 10 Chile                   953.      15959   16.7 
    ## 11 Ecuador                 941.      13915   14.8 
    ## 12 France                  911.      58989   64.8 
    ## 13 Brazil                  909.     182799  201.  
    ## 14 Bolivia                 907.       9026    9.95
    ## 15 Bulgaria                867.       6196    7.15
    ## 16 Colombia                824.      39356   47.8 
    ## 17 Sweden                  816.       7802    9.56
    ## 18 Switzerland             760.       5760    7.58
    ## 19 Hungary                 755.       7538    9.98
    ## 20 Iran                    687.      52883   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
