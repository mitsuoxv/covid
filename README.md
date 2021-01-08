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

Updated: 2021-01-09

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
    ##  1 United States           67854. 21170475            312
    ##  2 India                   34711. 10413417            300
    ##  3 Brazil                  26072.  7873830            302
    ##  4 Russia                  11337.  3355794            296
    ##  5 United Kingdom           9290.  2889423            311
    ##  6 France                   8569.  2682250            313
    ##  7 Italy                    6938.  2220361            320
    ##  8 Spain                    6490.  2024904            312
    ##  9 Germany                  5945.  1866887            314
    ## 10 Colombia                 5810.  1719771            296
    ## 11 Argentina                5643.  1676171            297
    ## 12 Turkey                   5005.  1481764            296
    ## 13 Mexico                   4999.  1479835            296
    ## 14 Poland                   4552.  1365645            300
    ## 15 Iran                     3988.  1268263            318
    ## 16 Ukraine                  3811.  1105169            290
    ## 17 Peru                     3449.  1024432            297
    ## 18 Netherlands              2771.   850790            307
    ## 19 Czech Republic           2680.   809601            302
    ## 20 Indonesia                2659.   797723            300

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                256.              77282.            302
    ##  2 United States                 219.              68241.            312
    ##  3 Israel                        207.              62241.            301
    ##  4 Belgium                       204.              63314.            310
    ##  5 Switzerland                   200.              62312.            312
    ##  6 Netherlands                   166.              51114.            307
    ##  7 Sweden                        164.              50470.            307
    ##  8 Serbia                        163.              48184.            295
    ##  9 Jordan                        162.              47459.            292
    ## 10 United Kingdom                149.              46343.            311
    ## 11 Austria                       149.              45541.            306
    ## 12 Portugal                      142.              42763.            301
    ## 13 Spain                         140.              43541.            312
    ## 14 Argentina                     136.              40543.            297
    ## 15 France                        132.              41413.            313
    ## 16 Brazil                        130.              39153.            302
    ## 17 Chile                         126.              37571.            298
    ## 18 Slovakia                      125.              36877.            296
    ## 19 Colombia                      122.              35986.            296
    ## 20 Poland                        118.              35471.            300

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2108
    ##  2 Mexico               8.78     129987  1479835
    ##  3 Ecuador              6.48      14158   218385
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.25        755    12084
    ##  6 Bolivia              5.56       9287   166981
    ##  7 Egypt                5.47       8029   146809
    ##  8 China                4.93       4795    97306
    ##  9 Iran                 4.41      55933  1268263
    ## 10 Afghanistan          4.23       2257    53332
    ## 11 Bulgaria             3.87       8017   207259
    ## 12 Peru                 3.71      37991  1024432
    ## 13 Greece               3.60       5146   142777
    ## 14 Guatemala            3.49       4928   141074
    ## 15 Italy                3.48      77291  2220361
    ## 16 Nicaragua            3.41        166     4867
    ## 17 Tunisia              3.32       5052   152254
    ## 18 Australia            3.18        909    28547
    ## 19 Hungary              3.09      10440   337743
    ## 20 Belgium              3.03      19936   658655

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1916.      19936   10.4 
    ##  2 Italy                  1281.      77291   60.3 
    ##  3 Peru                   1270.      37991   29.9 
    ##  4 United Kingdom         1259.      78508   62.3 
    ##  5 Czech Republic         1222.      12800   10.5 
    ##  6 Mexico                 1156.     129987  112.  
    ##  7 United States          1154.     358111  310.  
    ##  8 Bulgaria               1121.       8017    7.15
    ##  9 Spain                  1111.      51675   46.5 
    ## 10 Argentina              1064.      43976   41.3 
    ## 11 Hungary                1046.      10440    9.98
    ## 12 France                 1026.      66460   64.8 
    ## 13 Chile                  1010.      16913   16.7 
    ## 14 Brazil                  989.     198974  201.  
    ## 15 Switzerland             986.       7474    7.58
    ## 16 Sweden                  969.       9262    9.56
    ## 17 Ecuador                 957.      14158   14.8 
    ## 18 Colombia                936.      44723   47.8 
    ## 19 Bolivia                 934.       9287    9.95
    ## 20 Poland                  794.      30574   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
