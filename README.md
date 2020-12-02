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

Updated: 2020-12-03

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
    ##  1 United States           48675. 13385755            275
    ##  2 India                   36119.  9499413            263
    ##  3 Brazil                  23909.  6335878            265
    ##  4 Russia                   9063.  2347401            259
    ##  5 France                   7939.  2191274            276
    ##  6 Spain                    6023.  1656444            275
    ##  7 United Kingdom           5996.  1643090            274
    ##  8 Italy                    5727.  1620901            283
    ##  9 Argentina                5479.  1424533            260
    ## 10 Colombia                 5084.  1316806            259
    ## 11 Mexico                   4299.  1113543            259
    ## 12 Germany                  3916.  1084743            277
    ## 13 Poland                   3802.   999924            263
    ## 14 Peru                     3706.   963605            260
    ## 15 Iran                     3473.   975951            281
    ## 16 South Africa             3047.   792299            260
    ## 17 Ukraine                  2997.   758264            253
    ## 18 Belgium                  2121.   579116            273
    ## 19 Chile                    2118.   552864            261
    ## 20 Iraq                     2109.   554767            263

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      204.               55668.            273
    ##  2 Czech Republic               190.               50446.            265
    ##  3 Israel                       173.               45678.            264
    ##  4 Switzerland                  158.               43468.            275
    ##  5 United States                157.               43147.            275
    ##  6 Jordan                       137.               34902.            255
    ##  7 Argentina                    133.               34456.            260
    ##  8 Spain                        130.               35618.            275
    ##  9 Austria                      129.               34612.            269
    ## 10 Chile                        126.               33014.            261
    ## 11 Peru                         124.               32220.            260
    ## 12 France                       123.               33832.            276
    ## 13 Brazil                       119.               31506.            265
    ## 14 Netherlands                  117.               31654.            271
    ## 15 Portugal                     107.               28144.            264
    ## 16 Colombia                     106.               27554.            259
    ## 17 Sweden                       101.               27288.            270
    ## 18 Poland                        98.7              25972.            263
    ## 19 Serbia                        96.7              24975.            258
    ## 20 United Kingdom                96.2              26353.            274

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         606     2081
    ##  2 Mexico                  9.51     105940  1113543
    ##  3 Ecuador                 6.97      13501   193673
    ##  4 Sudan                   6.93       1265    18254
    ##  5 Bolivia                 6.19       8957   144708
    ##  6 Chad                    6           102     1700
    ##  7 Egypt                   5.73       6666   116303
    ##  8 Syria                   5.29        422     7973
    ##  9 China                   5.07       4750    93668
    ## 10 Iran                    4.98      48628   975951
    ## 11 Niger                   4.65         72     1548
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.84       1795    46717
    ## 14 Peru                    3.73      35966   963605
    ## 15 United Kingdom          3.59      59051  1643090
    ## 16 Italy                   3.48      56361  1620901
    ## 17 Nicaragua               3.45        161     4671
    ## 18 Guatemala               3.40       4178   122774
    ## 19 Tunisia                 3.37       3260    96769
    ## 20 Mali                    3.36        160     4762

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1614.      16786   10.4 
    ##  2 Peru                   1203.      35966   29.9 
    ##  3 Spain                   979.      45511   46.5 
    ##  4 United Kingdom          947.      59051   62.3 
    ##  5 Mexico                  942.     105940  112.  
    ##  6 Argentina               937.      38730   41.3 
    ##  7 Italy                   934.      56361   60.3 
    ##  8 Chile                   921.      15430   16.7 
    ##  9 Ecuador                 913.      13501   14.8 
    ## 10 Bolivia                 900.       8957    9.95
    ## 11 Brazil                  861.     173120  201.  
    ## 12 United States           858.     266043  310.  
    ## 13 France                  821.      53146   64.8 
    ## 14 Czech Republic          803.       8407   10.5 
    ## 15 Colombia                769.      36766   47.8 
    ## 16 Sweden                  711.       6798    9.56
    ## 17 Iran                    632.      48628   76.9 
    ## 18 Switzerland             598.       4537    7.58
    ## 19 Bulgaria                586.       4188    7.15
    ## 20 Netherlands             566.       9425   16.6

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
