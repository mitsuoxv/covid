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

Updated: 2020-12-02

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
    ##  1 United States           48301. 13234551            274
    ##  2 India                   36117.  9462809            262
    ##  3 Brazil                  23919.  6314740            264
    ##  4 Russia                   9000.  2322056            258
    ##  5 France                   7939.  2183275            275
    ##  6 Spain                    6015.  1648187            274
    ##  7 United Kingdom           5969.  1629661            273
    ##  8 Italy                    5679.  1601554            282
    ##  9 Argentina                5478.  1418807            259
    ## 10 Colombia                 5071.  1308376            258
    ## 11 Mexico                   4291.  1107071            258
    ## 12 Germany                  3867.  1067473            276
    ## 13 Poland                   3781.   990811            262
    ## 14 Peru                     3716.   962530            259
    ## 15 Iran                     3435.   962070            280
    ## 16 South Africa             3050.   790004            259
    ## 17 Ukraine                  2956.   745123            252
    ## 18 Belgium                  2122.   577249            272
    ## 19 Chile                    2121.   551743            260
    ## 20 Iraq                     2108.   552549            262

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      204.               55489.            272
    ##  2 Czech Republic               189.               49952.            264
    ##  3 Israel                       174.               45678.            263
    ##  4 Switzerland                  157.               42972.            274
    ##  5 United States                156.               42660.            274
    ##  6 Jordan                       135.               34248.            254
    ##  7 Argentina                    132.               34318.            259
    ##  8 Spain                        129.               35440.            274
    ##  9 Austria                      128.               34190.            268
    ## 10 Chile                        127.               32947.            260
    ## 11 Peru                         124.               32184.            259
    ## 12 France                       123.               33709.            275
    ## 13 Brazil                       119.               31400.            264
    ## 14 Netherlands                  116.               31411.            270
    ## 15 Portugal                     106.               27919.            263
    ## 16 Colombia                     106.               27378.            258
    ## 17 Poland                        98.2              25735.            262
    ## 18 United Kingdom                95.7              26138.            273
    ## 19 Sweden                        94.2              25443.            270
    ## 20 Italy                         94.1              26542.            282

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         606     2081
    ##  2 Mexico                  9.54     105655  1107071
    ##  3 Sudan                   7.01       1249    17810
    ##  4 Ecuador                 6.99      13461   192685
    ##  5 Bolivia                 6.19       8952   144622
    ##  6 Chad                    5.98        101     1688
    ##  7 Egypt                   5.74       6650   115911
    ##  8 Syria                   5.29        417     7887
    ##  9 China                   5.08       4750    93577
    ## 10 Iran                    5.01      48246   962070
    ## 11 Niger                   4.65         72     1548
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.82       1774    46498
    ## 14 Peru                    3.73      35923   962530
    ## 15 United Kingdom          3.59      58448  1629661
    ## 16 Italy                   3.47      55576  1601554
    ## 17 Nicaragua               3.46        160     4629
    ## 18 Guatemala               3.42       4171   122062
    ## 19 Tunisia                 3.37       3260    96769
    ## 20 Australia               3.25        908    27904

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1600.      16645   10.4 
    ##  2 Peru                   1201.      35923   29.9 
    ##  3 Spain                   969.      45069   46.5 
    ##  4 Mexico                  939.     105655  112.  
    ##  5 United Kingdom          937.      58448   62.3 
    ##  6 Argentina               931.      38473   41.3 
    ##  7 Italy                   921.      55576   60.3 
    ##  8 Chile                   920.      15410   16.7 
    ##  9 Ecuador                 910.      13461   14.8 
    ## 10 Bolivia                 900.       8952    9.95
    ## 11 Brazil                  859.     172833  201.  
    ## 12 United States           854.     264808  310.  
    ## 13 France                  809.      52371   64.8 
    ## 14 Czech Republic          792.       8295   10.5 
    ## 15 Colombia                766.      36584   47.8 
    ## 16 Sweden                  699.       6681    9.56
    ## 17 Iran                    627.      48246   76.9 
    ## 18 Switzerland             584.       4430    7.58
    ## 19 Bulgaria                564.       4035    7.15
    ## 20 Netherlands             563.       9363   16.6

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
