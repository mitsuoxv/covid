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

Updated: 2020-12-14

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
    ##  1 United States           54713. 15648098            286
    ##  2 India                   35974.  9857029            274
    ##  3 Brazil                  24769.  6836227            276
    ##  4 Russia                   9829.  2653928            270
    ##  5 France                   8099.  2324603            287
    ##  6 United Kingdom           6424.  1830960            285
    ##  7 Italy                    6210.  1825775            294
    ##  8 Spain                    6051.  1730575            286
    ##  9 Argentina                5495.  1489328            271
    ## 10 Colombia                 5218.  1408909            270
    ## 11 Germany                  4585.  1320716            288
    ## 12 Mexico                   4553.  1229379            270
    ## 13 Poland                   4112.  1126700            274
    ## 14 Iran                     3769.  1100818            292
    ## 15 Turkey                   3686.   995471            270
    ## 16 Peru                     3619.   980943            271
    ## 17 Ukraine                  3352.   885039            264
    ## 18 South Africa             3147.   852965            271
    ## 19 Indonesia                2232.   611631            274
    ## 20 Netherlands              2138.   603140            282

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       205.              58236.            284
    ##  2 Czech Republic                200.              55277.            276
    ##  3 United States                 176.              50440.            286
    ##  4 Israel                        173.              47698.            275
    ##  5 Switzerland                   172.              49113.            286
    ##  6 Jordan                        151.              40155.            266
    ##  7 Austria                       138.              38639.            280
    ##  8 Argentina                     133.              36024.            271
    ##  9 Serbia                        132.              35595.            269
    ## 10 Spain                         130.              37212.            286
    ## 11 Netherlands                   128.              36236.            282
    ## 12 Chile                         125.              34024.            272
    ## 13 France                        125.              35891.            287
    ## 14 Brazil                        123.              33994.            276
    ## 15 Peru                          121.              32800.            271
    ## 16 Sweden                        119.              33497.            281
    ## 17 Portugal                      117.              32287.            275
    ## 18 Colombia                      109.              29481.            270
    ## 19 Poland                        107.              29265.            274
    ## 20 Hungary                       105.              28091.            268

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         607     2087
    ##  2 Mexico                  9.19     113019  1229379
    ##  3 Ecuador                 6.88      13874   201524
    ##  4 Sudan                   6.36       1344    21147
    ##  5 Bolivia                 6.14       9013   146697
    ##  6 Chad                    5.87        102     1739
    ##  7 Egypt                   5.70       6898   121089
    ##  8 Syria                   5.60        506     9041
    ##  9 China                   5.01       4756    94950
    ## 10 Iran                    4.72      51949  1100818
    ## 11 Niger                   4.15         77     1856
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             4.00       1960    48952
    ## 14 Peru                    3.73      36544   980943
    ## 15 Italy                   3.51      64036  1825775
    ## 16 United Kingdom          3.50      64026  1830960
    ## 17 Tunisia                 3.47       3836   110393
    ## 18 Nicaragua               3.44        162     4709
    ## 19 Guatemala               3.41       4405   129099
    ## 20 Mali                    3.34        191     5721

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1721.      17902   10.4 
    ##  2 Peru                   1222.      36544   29.9 
    ##  3 Italy                  1061.      64036   60.3 
    ##  4 United Kingdom         1027.      64026   62.3 
    ##  5 Spain                  1024.      47624   46.5 
    ##  6 Mexico                 1005.     113019  112.  
    ##  7 Argentina               982.      40606   41.3 
    ##  8 Chile                   946.      15846   16.7 
    ##  9 United States           945.     293129  310.  
    ## 10 Ecuador                 938.      13874   14.8 
    ## 11 Czech Republic          910.       9535   10.5 
    ## 12 Bolivia                 906.       9013    9.95
    ## 13 Brazil                  897.     180437  201.  
    ## 14 France                  886.      57392   64.8 
    ## 15 Colombia                809.      38669   47.8 
    ## 16 Bulgaria                787.       5626    7.15
    ## 17 Sweden                  786.       7514    9.56
    ## 18 Switzerland             709.       5378    7.58
    ## 19 Hungary                 698.       6965    9.98
    ## 20 Iran                    675.      51949   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
