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

Updated: 2020-12-27

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
    ##  1 United States           61242. 18311405            299
    ##  2 India                   35432. 10169118            287
    ##  3 Brazil                  25694.  7425593            289
    ##  4 Russia                  10678.  3021964            283
    ##  5 France                   8350.  2505074            300
    ##  6 United Kingdom           7454.  2221316            298
    ##  7 Italy                    6607.  2028354            307
    ##  8 Spain                    6203.  1854951            299
    ##  9 Argentina                5534.  1571680            284
    ## 10 Colombia                 5511.  1559766            283
    ## 11 Germany                  5405.  1627103            301
    ## 12 Mexico                   4814.  1362564            283
    ## 13 Turkey                   4607.  1303917            283
    ## 14 Poland                   4369.  1253957            287
    ## 15 Iran                     3899.  1189203            305
    ## 16 Ukraine                  3681.  1019876            277
    ## 17 Peru                     3535.  1003982            284
    ## 18 South Africa             3462.   983359            284
    ## 19 Netherlands              2523.   744291            295
    ## 20 Indonesia                2439.   700097            287

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                220.              63724.            289
    ##  2 Belgium                       206.              61256.            297
    ##  3 United States                 197.              59025.            299
    ##  4 Switzerland                   188.              56219.            299
    ##  5 Israel                        181.              52178.            288
    ##  6 Jordan                        160.              44530.            279
    ##  7 Serbia                        155.              43591.            282
    ##  8 Netherlands                   152.              44716.            295
    ##  9 Austria                       144.              42304.            293
    ## 10 Sweden                        141.              41445.            294
    ## 11 Argentina                     134.              38015.            284
    ## 12 Spain                         133.              39886.            299
    ## 13 France                        129.              38677.            300
    ## 14 Brazil                        128.              36924.            289
    ## 15 Portugal                      127.              36697.            288
    ## 16 Chile                         125.              35579.            285
    ## 17 United Kingdom                120.              35627.            298
    ## 18 Peru                          118.              33570.            284
    ## 19 Colombia                      115.              32638.            283
    ## 20 Poland                        113.              32570.            287

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.0         607     2096
    ##  2 Mexico                                    8.89     121172  1362564
    ##  3 Ecuador                                   6.70      13984   208828
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.10        660    10821
    ##  6 Bolivia                                   5.93       9076   153121
    ##  7 Egypt                                     5.62       7309   130126
    ##  8 Chad                                      5.18        102     1971
    ##  9 China                                     4.96       4777    96240
    ## 10 Iran                                      4.58      54440  1189203
    ## 11 Afghanistan                               4.15       2148    51764
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Peru                                      3.72      37317  1003982
    ## 14 Bulgaria                                  3.59       7073   196915
    ## 15 Mali                                      3.58        225     6291
    ## 16 Guatemala                                 3.52       4757   135080
    ## 17 Italy                                     3.52      71359  2028354
    ## 18 Democratic Republic of the Congo          3.48        566    16280
    ## 19 Nicaragua                                 3.42        164     4790
    ## 20 Tunisia                                   3.41       4385   128578

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1835.      19089   10.4 
    ##  2 Peru                   1248.      37317   29.9 
    ##  3 Italy                  1183.      71359   60.3 
    ##  4 United Kingdom         1126.      70195   62.3 
    ##  5 Mexico                 1077.     121172  112.  
    ##  6 Spain                  1071.      49824   46.5 
    ##  7 Czech Republic         1045.      10950   10.5 
    ##  8 United States          1043.     323527  310.  
    ##  9 Argentina              1025.      42392   41.3 
    ## 10 Bulgaria                989.       7073    7.15
    ## 11 Chile                   977.      16358   16.7 
    ## 12 France                  958.      62051   64.8 
    ## 13 Ecuador                 945.      13984   14.8 
    ## 14 Brazil                  945.     190006  201.  
    ## 15 Bolivia                 912.       9076    9.95
    ## 16 Hungary                 897.       8951    9.98
    ## 17 Colombia                867.      41454   47.8 
    ## 18 Sweden                  866.       8279    9.56
    ## 19 Switzerland             858.       6508    7.58
    ## 20 Iran                    708.      54440   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
