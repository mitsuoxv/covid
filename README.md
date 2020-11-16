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

Updated: 2020-11-17

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
    ##  1 United States           41685. 10796432            259
    ##  2 India                   35810.  8845127            247
    ##  3 Brazil                  23489.  5848959            249
    ##  4 Russia                   8018.  1948603            243
    ##  5 France                   7482.  1945468            260
    ##  6 Spain                    5631.  1458591            259
    ##  7 Argentina                5347.  1304846            244
    ##  8 United Kingdom           5307.  1369322            258
    ##  9 Colombia                 4901.  1191004            243
    ## 10 Italy                    4413.  1178529            267
    ## 11 Mexico                   4128.  1003253            243
    ## 12 Peru                     3831.   934899            244
    ## 13 South Africa             3077.   751024            244
    ## 14 Germany                  3070.   801327            261
    ## 15 Poland                   2886.   712972            247
    ## 16 Iran                     2875.   762068            265
    ## 17 Ukraine                  2302.   545689            237
    ## 18 Chile                    2168.   531273            245
    ## 19 Iraq                     2101.   519152            247
    ## 20 Belgium                  2085.   535843            257

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      200.               51509.            257
    ##  2 Czech Republic               176.               43921.            249
    ##  3 Israel                       176.               43836.            249
    ##  4 United States                134.               34801.            259
    ##  5 Switzerland                  130.               33793.            259
    ##  6 Chile                        129.               31724.            245
    ##  7 Argentina                    129.               31561.            244
    ##  8 Peru                         128.               31260.            244
    ##  9 Spain                        121.               31364.            259
    ## 10 Brazil                       117.               29084.            249
    ## 11 France                       116.               30037.            260
    ## 12 Netherlands                  105.               26875.            255
    ## 13 Colombia                     103.               24922.            243
    ## 14 Austria                       98.0              24801.            253
    ## 15 Jordan                        93.8              22425.            239
    ## 16 United Kingdom                85.1              21962.            258
    ## 17 Portugal                      82.0              20354.            248
    ## 18 Poland                        75.0              18519.            247
    ## 19 Italy                         73.1              19531.            267
    ## 20 Sweden                        72.7              18560.            255

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         604     2072
    ##  2 Mexico                  9.79      98259  1003253
    ##  3 Sudan                   7.63       1116    14626
    ##  4 Ecuador                 7.21      13008   180295
    ##  5 Chad                    6.32        101     1597
    ##  6 Bolivia                 6.17       8841   143181
    ##  7 Egypt                   5.83       6453   110767
    ##  8 Iran                    5.44      41493   762068
    ##  9 Niger                   5.36         70     1307
    ## 10 Syria                   5.16        345     6684
    ## 11 China                   5.14       4749    92452
    ## 12 Tanzania                4.13         21      509
    ## 13 Italy                   3.84      45229  1178529
    ## 14 United Kingdom          3.79      51934  1369322
    ## 15 Peru                    3.76      35177   934899
    ## 16 Afghanistan             3.74       1617    43240
    ## 17 Canada                  3.73      10891   291931
    ## 18 Mali                    3.62        141     3900
    ## 19 Nicaragua               3.49        158     4533
    ## 20 Sweden                  3.48       6164   177355

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1386.      14421   10.4 
    ##  2 Peru                   1176.      35177   29.9 
    ##  3 Bolivia                 889.       8841    9.95
    ##  4 Chile                   885.      14819   16.7 
    ##  5 Ecuador                 879.      13008   14.8 
    ##  6 Spain                   877.      40769   46.5 
    ##  7 Mexico                  874.      98259  112.  
    ##  8 Argentina               854.      35307   41.3 
    ##  9 United Kingdom          833.      51934   62.3 
    ## 10 Brazil                  824.     165658  201.  
    ## 11 United States           786.     243758  310.  
    ## 12 Italy                   750.      45229   60.3 
    ## 13 Colombia                708.      33829   47.8 
    ## 14 France                  683.      44215   64.8 
    ## 15 Sweden                  645.       6164    9.56
    ## 16 Czech Republic          593.       6208   10.5 
    ## 17 Iran                    539.      41493   76.9 
    ## 18 Netherlands             509.       8475   16.6 
    ## 19 South Africa            413.      20241   49   
    ## 20 Romania                 406.       8926   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
